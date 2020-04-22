;;; package --- Simple implementation the pomodoro technique - built
;;; on top of org-mode
;;; Commentary:
;;; Code:

(require 'org)
(require 'org-timer)

(defvar ok-pomodoro-buffer)
(defvar ok-pomodoro-completed 0)
(defvar ok-pomodoro-cancelled 0)
(defvar ok-pomodoro-auto-clock-in t
  "When set to non-nil, a pomodoro will automatically be started when clocking in on any task in 'org-mode'.")

(defun ok-pomodoro-reset ()
  "Reset the completed and cancelled counters."
  (interactive)
  (setq ok-pomodoro-completed 0)
  (setq ok-pomodoro-cancelled 0))

(defun set-break-timer ()
  "When the timer is over, go back to work."
  (shell-command "notify-send -u critical 'Break is over.'")
  (shell-command "say 'Break is over.'")
  ;; Overwrite the result from `shell-command`.
  (message "Break is over."))

(defun set-start-timer ()
  "When the timer is over, let the user take a break!"
  (setq ok-pomodoro-completed (+ 1 ok-pomodoro-completed))
  (shell-command "notify-send 'Time to take a break.'")
  (shell-command "say 'Time to take a break.'")
  ;; Overwrite the result from `shell-command`.
  (message "Time to take a break."))

(defun should-switch-buffer ()
  "Check if the current buffer is the primary pomodoro buffer."
  (let ((starting-buffer-name (buffer-name (current-buffer))))
    (not (string-equal starting-buffer-name ok-pomodoro-buffer))))

(defun ok-pomodoro-break ()
  "."
  (interactive)
  (let ((switchp (should-switch-buffer)))
    ;; If the current buffer is not the primary org pomodoro
    ;; buffer,switch to the primary org buffer, so that the timer is
    ;; attached there.
    (when switchp
      (switch-to-buffer ok-pomodoro-buffer))
    (remove-hook 'org-timer-done-hook 'set-start-timer)
    (add-hook 'org-timer-done-hook 'set-break-timer)
    (org-timer-set-timer 5)
    (when switchp
      (switch-to-buffer (other-buffer)))))

(defun ok-pomodoro-cancel ()
  "Cancel the current pomodoro timer."
  (interactive)
  (setq ok-pomodoro-cancelled (+ 1 ok-pomodoro-cancelled))
  (org-timer-stop))

(defun ok-pomodoro-start ()
  "."
  (interactive)
  (let ((switchp (should-switch-buffer)))
    (when switchp
        (switch-to-buffer ok-pomodoro-buffer))
    (remove-hook 'org-timer-done-hook 'set-break-timer)
    (add-hook 'org-timer-done-hook 'set-start-timer)
    (org-timer-set-timer 25)
    (when switchp
        (switch-to-buffer (other-buffer)))))


;; Modify the org-clock-in so that a pomodoro timer is started except
;; if a timer is already started already.
(add-hook 'org-clock-in-hook (lambda ()
                               (remove-hook 'org-timer-done-hook 'set-break-timer)
                               ;; If configured and currently no timer is running
                               (if (and ok-pomodoro-auto-clock-in
                                        (or
                                         (fboundp 'org-timer-countdown-timer)
                                         (not org-timer-countdown-timer)))
                                   (ok-pomodoro-start))))

;;; org-pomodoro.el ends here
