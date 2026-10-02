;;; ok-pomodoro.el --- Simple Pomodoro technique built on top of Org mode -*- lexical-binding: t -*-

;;; Commentary:

;; Work and break lengths follow `ok-pomodoro-pattern', a cycle of
;; (WORK . BREAK) pairs in minutes.  Every finished or cancelled
;; Pomodoro is logged as an Org heading with a CLOCK line into
;; `ok-pomodoro-file', grouped by day, each day having a clocktable.
;;
;; Commands:
;;
;; - `ok-pomodoro-start': Start the next Pomodoro.
;; - `ok-pomodoro-set-todo': Ask for a task, then start a Pomodoro on it.
;; - `ok-pomodoro-break': Take the break of the current pair.
;; - `ok-pomodoro-cancel': Cancel the running Pomodoro or break.
;; - `ok-pomodoro-reset': Restart the cycle at its first pair.
;; - `ok-pomodoro-stats': Open the log with refreshed clocktables.
;;
;; Breaks are not enforced.  The break actually taken (the gap
;; between the end of a Pomodoro and the start of the next one) is
;; logged as the BREAK property of the earlier Pomodoro.  A break at
;; least as long as the longest break in the pattern, or a new day,
;; restarts the cycle.
;;
;; A Pomodoro running when Emacs exits is logged as interrupted.  If
;; Emacs did not exit cleanly, the next start closes the leftover entry
;; as interrupted, without counting its time.

;;; Code:

(require 'org)
(require 'org-clock)
(require 'notifications)

(defgroup ok-pomodoro nil
  "Simple Pomodoro technique built on top of Org mode."
  :group 'org)

(defcustom ok-pomodoro-pattern
  '((25 . 5) (25 . 5) (25 . 5) (25 . 15))
  "Cycle of (WORK . BREAK) lengths in minutes.
After the last pair, the cycle starts again from the first."
  :type '(repeat (cons (number :tag "Work") (number :tag "Break"))))

(defcustom ok-pomodoro-file
  (expand-file-name "pomodoro.org" org-directory)
  "Org file where Pomodoros are logged."
  :type 'file)

(defcustom ok-pomodoro-auto-clock-in nil
  "When non-nil, clocking in on an Org task starts a Pomodoro."
  :type 'boolean)

(defcustom ok-pomodoro-speak-command "espeak"
  "Program used to speak notifications aloud, or nil for silence."
  :type '(choice string (const :tag "Silent" nil)))

(defvar ok-pomodoro-current nil
  "The current Pomodoro task.")
(defvar ok-pomodoro--last-task nil
  "The task of the last Pomodoro, kept across breaks.")
(defvar ok-pomodoro--task-history nil
  "Minibuffer history of Pomodoro tasks.")

(defvar ok-pomodoro--phase nil
  "One of nil, `work', `break' or `break-over'.")
(defvar ok-pomodoro--timer nil)
(defvar ok-pomodoro--start-time nil
  "When the running phase started.")
(defvar ok-pomodoro--end-time nil
  "When the running phase is (or was) planned to end.")
(defvar ok-pomodoro--position 0
  "Index of the current pair in `ok-pomodoro-pattern'.")
(defvar ok-pomodoro--advance nil
  "Non-nil when the current pair is done and the next start moves on.")
(defvar ok-pomodoro--day nil
  "Day (YYYY-MM-DD) the cycle position belongs to.")

;;; Helpers

(defun ok-pomodoro--today (&optional time)
  "Return TIME (default now) as YYYY-MM-DD."
  (format-time-string "%Y-%m-%d" time))

(defun ok-pomodoro--pair ()
  "Return the current (WORK . BREAK) pair."
  (nth (mod ok-pomodoro--position (length ok-pomodoro-pattern))
       ok-pomodoro-pattern))

(defun ok-pomodoro--notify (text &optional urgency)
  "Show TEXT as desktop notification with URGENCY and speak it."
  (message "%s" text)
  (ignore-errors
    (notifications-notify :title "Pomodoro" :body text
                          :urgency (or urgency 'normal)))
  (when (and ok-pomodoro-speak-command
             (executable-find ok-pomodoro-speak-command))
    (call-process ok-pomodoro-speak-command nil 0 nil text)))

(defun ok-pomodoro--clean-task (task)
  "Return TASK on a single trimmed line, or nil if it is empty."
  (when task
    (let ((clean (string-trim (replace-regexp-in-string "[\n\r]+" " " task))))
      (unless (string-empty-p clean)
        clean))))

(defun ok-pomodoro--format-duration (seconds)
  "Format SECONDS as H:MM."
  (let ((minutes (round seconds 60)))
    (format "%d:%02d" (/ minutes 60) (% minutes 60))))

(defun ok-pomodoro--format-clock (seconds)
  "Format SECONDS as MM:SS."
  (let ((s (max 0 (floor seconds))))
    (format "%02d:%02d" (/ s 60) (% s 60))))

(defun ok-pomodoro--run-timer (minutes callback)
  "Run CALLBACK after MINUTES, replacing any running phase timer."
  (when (timerp ok-pomodoro--timer)
    (cancel-timer ok-pomodoro--timer))
  (setq ok-pomodoro--start-time (current-time)
        ok-pomodoro--end-time (time-add nil (* 60 minutes))
        ok-pomodoro--timer (run-at-time (* 60 minutes) nil callback)))

(defun ok-pomodoro--stop-timer ()
  "Stop the phase timer and clear the phase."
  (when (timerp ok-pomodoro--timer)
    (cancel-timer ok-pomodoro--timer))
  (setq ok-pomodoro--timer nil
        ok-pomodoro--phase nil))

;;; Log file

(defmacro ok-pomodoro--with-log (&rest body)
  "Run BODY in the buffer of `ok-pomodoro-file', widened, then save."
  (declare (indent 0))
  `(with-current-buffer (find-file-noselect ok-pomodoro-file)
     (prog1 (save-excursion
              (save-restriction
                (widen)
                ,@body))
       (let ((inhibit-message t))
         (save-buffer)))))

(defun ok-pomodoro--goto-day (day)
  "Move to the heading of DAY, creating it at the end if needed."
  (goto-char (point-min))
  (unless (re-search-forward
           (format "^\\* %s[ \t]*$" (regexp-quote day)) nil t)
    (goto-char (point-max))
    (when (= (point-min) (point-max))
      (insert "#+TITLE: Pomodoro log\n"))
    (unless (bolp) (insert "\n"))
    (insert "* " day "\n"
            "#+BEGIN: clocktable :scope tree1 :maxlevel 2"
            " :properties (\"OUTCOME\" \"BREAK\")\n"
            "#+END:\n")
    (forward-line -3))
  (org-back-to-heading t))

(defun ok-pomodoro--refresh-day (day)
  "Update the clocktable under the heading of DAY."
  (ok-pomodoro--goto-day day)
  (let ((end (save-excursion (org-end-of-subtree t t) (point)))
        (inhibit-message t))
    (when (re-search-forward "^[ \t]*#\\+BEGIN: clocktable" end t)
      (beginning-of-line)
      (org-update-dblock))))

(defun ok-pomodoro--timestamp (time)
  "Format TIME as inactive Org timestamp."
  (format-time-string (org-time-stamp-format t t) time))

(defun ok-pomodoro--log-start (task start)
  "Log TASK as running Pomodoro started at START."
  (let ((day (ok-pomodoro--today start)))
    (ok-pomodoro--with-log
      (ok-pomodoro--goto-day day)
      (org-end-of-subtree t)
      (insert "\n** " (or task "Pomodoro") "\n"
              ":PROPERTIES:\n"
              ":OUTCOME:  running\n"
              ":END:\n"
              "CLOCK: " (ok-pomodoro--timestamp start))
      (ok-pomodoro--refresh-day day))))

(defun ok-pomodoro--log-end (task start end outcome)
  "Close the log entry of TASK started at START with END and OUTCOME.
If the running entry cannot be found, log a complete entry instead."
  (let ((day (ok-pomodoro--today start))
        (closing (format "--%s => %8s"
                         (ok-pomodoro--timestamp end)
                         (ok-pomodoro--format-duration
                          (float-time (time-subtract end start))))))
    (ok-pomodoro--with-log
      (goto-char (point-min))
      (if (re-search-forward
           (concat "^[ \t]*CLOCK: "
                   (regexp-quote (ok-pomodoro--timestamp start))
                   "[ \t]*$")
           nil t)
          (progn
            (skip-chars-backward " \t")
            (delete-region (point) (line-end-position))
            (insert closing))
        (ok-pomodoro--goto-day day)
        (org-end-of-subtree t)
        (insert "\n** " (or task "Pomodoro") "\n"
                ":PROPERTIES:\n"
                ":END:\n"
                "CLOCK: " (ok-pomodoro--timestamp start) closing))
      (org-entry-put nil "OUTCOME" (symbol-name outcome))
      (ok-pomodoro--refresh-day day))))

(defun ok-pomodoro--record-break ()
  "Log the break since today's last Pomodoro and return its seconds.
Return nil when there was no Pomodoro earlier today."
  (when (file-exists-p ok-pomodoro-file)
    (ok-pomodoro--with-log
      (goto-char (point-min))
      (when (re-search-forward
             (format "^\\* %s[ \t]*$" (regexp-quote (ok-pomodoro--today)))
             nil t)
        (let ((day-end (save-excursion (org-end-of-subtree t t) (point)))
              last-end)
          (while (re-search-forward
                  "^[ \t]*CLOCK: \\[[^]]+\\]--\\[\\([^]]+\\)\\]" day-end t)
            (setq last-end (org-time-string-to-time (match-string 1))))
          (when last-end
            (let ((gap (float-time (time-subtract nil last-end))))
              (when (and (>= gap 60)
                         (not (equal (org-entry-get nil "OUTCOME") "interrupted")))
                (org-entry-put nil "BREAK" (ok-pomodoro--format-duration gap)))
              gap)))))))

(defun ok-pomodoro--close-stale-entries ()
  "Close running entries that cannot be running anymore.
An entry is stale when its start plus the longest work length in
`ok-pomodoro-pattern' is in the past.  It is closed at its start, so
no time is counted, and marked as interrupted.  Younger running
entries may belong to a Pomodoro on another machine and are kept."
  (when (file-exists-p ok-pomodoro-file)
    (let ((longest-work (* 60 (apply #'max (mapcar #'car ok-pomodoro-pattern)))))
      (ok-pomodoro--with-log
        (goto-char (point-min))
        (while (re-search-forward "^[ \t]*CLOCK: \\(\\[[^]]+\\]\\)[ \t]*$" nil t)
          (let ((start (match-string 1))
                (start-end (match-end 1)))
            (when (time-less-p (time-add (org-time-string-to-time start) longest-work)
                               nil)
              (goto-char start-end)
              (delete-region (point) (line-end-position))
              (insert (format "--%s => %8s" start "0:00"))
              (org-entry-put nil "OUTCOME" "interrupted"))))))))

;;; Phases

(defun ok-pomodoro--work-done ()
  "Finish the running Pomodoro as completed."
  (ok-pomodoro--log-end ok-pomodoro-current ok-pomodoro--start-time
                        (current-time) 'completed)
  (setq ok-pomodoro--advance t
        ok-pomodoro--phase nil
        ok-pomodoro--timer nil)
  (ok-pomodoro--notify
   (format "Time to take a break (%s min)." (cdr (ok-pomodoro--pair)))))

(defun ok-pomodoro--break-done ()
  "Mark the break as over."
  (setq ok-pomodoro--phase 'break-over
        ok-pomodoro--timer nil)
  (ok-pomodoro--notify "Break is over." 'critical))

(defun ok-pomodoro--advance-cycle (break-seconds)
  "Move to the pair for the next Pomodoro.
BREAK-SECONDS is the break just taken, or nil."
  (let ((longest-break (apply #'max (mapcar #'cdr ok-pomodoro-pattern))))
    (cond
     ((or (not (equal ok-pomodoro--day (ok-pomodoro--today)))
          (and break-seconds (>= break-seconds (* 60 longest-break))))
      (setq ok-pomodoro--position 0))
     (ok-pomodoro--advance
      (setq ok-pomodoro--position
            (mod (1+ ok-pomodoro--position) (length ok-pomodoro-pattern)))))
    (setq ok-pomodoro--advance nil
          ok-pomodoro--day (ok-pomodoro--today))))

;;; Commands

(defun ok-pomodoro-start (&optional task)
  "Start the next Pomodoro, on TASK when given."
  (interactive)
  (when (and (eq ok-pomodoro--phase 'work)
             (not (y-or-n-p "A Pomodoro is running.  Cancel it and start a new one? ")))
    (user-error "Pomodoro still running"))
  (let ((task (or (ok-pomodoro--clean-task task) ok-pomodoro-current)))
    (when (eq ok-pomodoro--phase 'work)
      (ok-pomodoro-cancel))
    (setq ok-pomodoro-current task
          ok-pomodoro--last-task (or task ok-pomodoro--last-task)))
  (ok-pomodoro--close-stale-entries)
  (ok-pomodoro--advance-cycle (ok-pomodoro--record-break))
  (setq ok-pomodoro--phase 'work)
  (ok-pomodoro--run-timer (car (ok-pomodoro--pair)) #'ok-pomodoro--work-done)
  (ok-pomodoro--log-start ok-pomodoro-current ok-pomodoro--start-time)
  (message "Pomodoro started (%s min)." (car (ok-pomodoro--pair))))

(defun ok-pomodoro-set-todo ()
  "Ask for the next Pomodoro task and start a Pomodoro on it.
Empty input continues the current or last task."
  (interactive)
  (let* ((default (or ok-pomodoro-current ok-pomodoro--last-task))
         (input (read-string (format-prompt "Next Pomodoro" default)
                             nil 'ok-pomodoro--task-history default)))
    (ok-pomodoro-start (or (ok-pomodoro--clean-task input) default))))

(defun ok-pomodoro-break ()
  "Take the break of the current pair in `ok-pomodoro-pattern'."
  (interactive)
  (when (eq ok-pomodoro--phase 'work)
    (if (y-or-n-p "A Pomodoro is running.  Cancel it and take a break? ")
        (ok-pomodoro-cancel)
      (user-error "Pomodoro still running")))
  (setq ok-pomodoro-current nil
        ok-pomodoro--phase 'break)
  (ok-pomodoro--run-timer (cdr (ok-pomodoro--pair)) #'ok-pomodoro--break-done)
  (message "Break started (%s min)." (cdr (ok-pomodoro--pair))))

(defun ok-pomodoro-cancel ()
  "Cancel the running Pomodoro or break.
A cancelled Pomodoro is logged with the time actually worked.  Its
task is kept, so `ok-pomodoro-start' retries it."
  (interactive)
  (pcase ok-pomodoro--phase
    ('work
     (ok-pomodoro--log-end ok-pomodoro-current ok-pomodoro--start-time
                           (current-time) 'cancelled)
     (message "Pomodoro cancelled."))
    ((or 'break 'break-over)
     (message "Break cancelled."))
    (_ (message "Nothing to cancel.")))
  (ok-pomodoro--stop-timer))

(defun ok-pomodoro-reset ()
  "Restart the cycle at its first pair."
  (interactive)
  (setq ok-pomodoro--position 0
        ok-pomodoro--advance nil))

(defun ok-pomodoro-stats ()
  "Open `ok-pomodoro-file' with refreshed clocktables at today's entry."
  (interactive)
  (find-file ok-pomodoro-file)
  (widen)
  (org-update-all-dblocks)
  (save-buffer)
  (ok-pomodoro--goto-today))

(defun ok-pomodoro--goto-today ()
  "Show today's log entries at the top of the selected window."
  (goto-char (point-min))
  (when (re-search-forward
         (format "^\\* %s[ \t]*$" (regexp-quote (ok-pomodoro--today))) nil t)
    (org-back-to-heading t)
    (org-fold-show-subtree)
    (recenter 0)))

(defun ok-pomodoro-notify-dunst ()
  "Display the current Pomodoro task as a desktop notification."
  (interactive)
  (ignore-errors
    (notifications-notify :title "Pomodoro"
                          :body (or ok-pomodoro-current "")
                          :urgency 'low
                          :timeout (* (car (ok-pomodoro--pair)) 60 1000))))

;;; Display

(defun ok-pomodoro-remaining-time ()
  "Return the time left in the running phase as MM:SS, or nil.
Seconds are shown in 15s steps, except during the last 15 seconds."
  (when (memq ok-pomodoro--phase '(work break))
    (let* ((left (max 0 (floor (float-time
                                (time-subtract ok-pomodoro--end-time nil)))))
           (mins (/ left 60))
           (secs (% left 60)))
      (format "%02d:%02d" mins (if (> mins 0) (* 15 (/ secs 15)) secs)))))

(defun ok-current-pomodoro ()
  "Return a status line for the current Pomodoro, e.g. for Polybar."
  (pcase ok-pomodoro--phase
    ('work
     (concat (ok-pomodoro-remaining-time) " - " (or ok-pomodoro-current "Pomodoro")
             (when (> (length ok-pomodoro-pattern) 1)
               (format " (%d/%d)" (1+ ok-pomodoro--position)
                       (length ok-pomodoro-pattern)))))
    ('break
     (concat (ok-pomodoro-remaining-time) " - Break"))
    ('break-over
     (if (equal (ok-pomodoro--today ok-pomodoro--end-time) (ok-pomodoro--today))
         (concat "Break +" (ok-pomodoro--format-clock
                            (float-time (time-subtract nil ok-pomodoro--end-time))))
       ""))
    (_ "")))

;;; Org clock integration

(defun ok-pomodoro--on-clock-in ()
  "Start a Pomodoro on the clocked task if `ok-pomodoro-auto-clock-in'."
  (when (and ok-pomodoro-auto-clock-in
             (not (eq ok-pomodoro--phase 'work)))
    (ok-pomodoro-start org-clock-current-task)))

(add-hook 'org-clock-in-hook #'ok-pomodoro--on-clock-in)

;;; Emacs exit

(defun ok-pomodoro--on-kill-emacs ()
  "Log a running Pomodoro as interrupted when Emacs exits."
  (when (eq ok-pomodoro--phase 'work)
    (with-demoted-errors "ok-pomodoro: %S"
      (ok-pomodoro--log-end ok-pomodoro-current ok-pomodoro--start-time
                            (current-time) 'interrupted))))

(add-hook 'kill-emacs-hook #'ok-pomodoro--on-kill-emacs)

(provide 'ok-pomodoro)
;;; ok-pomodoro.el ends here
