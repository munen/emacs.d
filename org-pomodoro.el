;;; package --- Simple implementation the pomodoro technique - built
;;; on top of org-mode
;;; Commentary:
;;; Code:

(add-to-list 'org-modules 'org-timer)

(defun set-break-timer ()
  "When the timer is over, go back to work."

  (shell-command "say 'Break is over'")
  (message-box "Break is over"))

(defun set-start-timer ()
  "When the timer is over, let the user take a break!"
  (shell-command "say 'Time to take a break'")
  (message-box "Time to take a break"))

(defun pomodoro-break ()
  "."
  (interactive)
  (remove-hook 'org-timer-done-hook 'set-start-timer)
  (add-hook 'org-timer-done-hook 'set-break-timer)
  (org-timer-set-timer 5))

(defun pomodoro-cancel ()
  "Cancel the current pomodoro timer."
  (interactive)
  (org-timer-stop))

(defun pomodoro-start ()
  "."
  (interactive)
  (let* ((starting-buffer-name (buffer-name (current-buffer)))
         (switchp (not (string-equal starting-buffer-name ok-pomodoro-buffer))))
    ;; If the current buffer is not the primary org pomodoro buffer,
    ;; switch to the primary org buffer, so that the timer is attached
    ;; there.
    (when switchp
        (switch-to-buffer ok-pomodoro-buffer))
    (remove-hook 'org-timer-done-hook 'set-break-timer)
    (add-hook 'org-timer-done-hook 'set-start-timer)
    (org-timer-set-timer 25)
    (when switchp
        (switch-to-buffer (other-buffer)))))

(defvar pomodoro-auto-clock-in t
  "When set to non-nil, a pomodoro will automatically be started when clocking in on any task in 'org-mode'.")

;; Modify the org-clock-in so that a pomodoro timer is started except
;; if a timer is already started already.
(add-hook 'org-clock-in-hook (lambda ()
                               (remove-hook 'org-timer-done-hook 'set-break-timer)
                               ;; If configured and currently no timer is running
                               (if (and pomodoro-auto-clock-in
                                        (or
                                         (fboundp 'org-timer-countdown-timer)
                                         (not org-timer-countdown-timer)))
                                   (pomodoro-start))))

;;; org-pomodoro.el ends here
