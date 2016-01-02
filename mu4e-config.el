;;; package --- Munen Mail config
;;; Commentary:
;;; Code:

;; * TODOs
;; ** Use Quoted printable text for outgoing messages to enable automatic line breaks
;; *** If this is successfull, send upstream PR to MU4E
;; https://mathiasbynens.be/notes/gmail-plain-text
;; https://mothereff.in/quoted-printable
;; https://www.gnu.org/software/emacs/manual/html_node/emacs-mime/qp.html

(require 'mu4e)

(require 'org-mu4e)

;; Default account on startup
(setq user-full-name  "Munen Alain M. Lafon"
      mu4e-sent-folder "/200ok/INBOX.Sent"
      mu4e-drafts-folder "/200ok/INBOX.Drafts"
      mu4e-trash-folder "/200ok/INBOX.Trash")

(setq mu4e-maildir "~/Maildir"
      smtpmail-debug-info t
      message-kill-buffer-on-exit t
      mu4e-get-mail-command "offlineimap"
      mu4e-attachment-dir "~/switchdrive/org/files/inbox")

;; (setq mu4e-html2text-command "w3m -dump -T text/html")
(setq mu4e-html2text-command
  "textutil -stdin -format html -convert txt -stdout")

(defvar my-mu4e-account-alist
  '(("200ok"
     (mu4e-sent-folder "/200ok/INBOX.Sent")
     (mu4e-drafts-folder "/200ok/INBOX.Drafts")
     (mu4e-trash-folder "/200ok/INBOX.Trash")
     (user-mail-address "munen@200ok.ch")
     (smtpmail-default-smtp-server "mail.your-server.de")
     (smtpmail-local-domain "200ok.ch")
     (smtpmail-smtp-user "munen@200ok.ch")
     (smtpmail-smtp-server "mail.your-server.de")
     (smtpmail-stream-type starttls)
     (smtpmail-smtp-service 25))
    ("zhaw"
     (mu4e-sent-folder "/zhaw/INBOX.Sent Messages")
     (mu4e-drafts-folder "/zhaw/INBOX.Drafts")
     (mu4e-trash-folder "/zhaw/INBOX.Trash")
     (user-mail-address "lafo@zhaw.ch")
     (smtpmail-default-smtp-server "mail.your-server.de")
     (smtpmail-local-domain "zhaw.ch")
     (smtpmail-smtp-user "zhaw@dispatched.ch")
     (smtpmail-smtp-server "mail.your-server.de")
     (smtpmail-stream-type starttls)
     (smtpmail-smtp-service 25))
    ("voicerepublic"
     (mu4e-sent-folder "/voicerepublic/INBOX.Sent")
     (mu4e-drafts-folder "/voicerepublic/INBOX.Drafts")
     (mu4e-trash-folder "/voicerepublic/INBOX.Trash")
     (user-mail-address "munen@voicerepublic.com")
     (smtpmail-default-smtp-server "smtp-voicerepublic.atmailcloud.com")
     (smtpmail-local-domain "voicerepublic.com")
     (smtpmail-smtp-user "munen@voicerepublic.com")
     (smtpmail-smtp-server "smtp-voicerepublic.atmailcloud.com")
     (smtpmail-stream-type starttls)
     (smtpmail-smtp-service 25))
    ("dispatched"
     (mu4e-sent-folder "/dispatched/INBOX.Sent")
     (mu4e-drafts-folder "/dispatched/INBOX.Drafts")
     (mu4e-trash-folder "/dispatched/INBOX.Trash")
     (user-mail-address "munen@dispatched.ch")
     (smtpmail-default-smtp-server "mail.your-server.de")
     (smtpmail-local-domain "dispatched.ch")
     (smtpmail-smtp-user "munen@dispatched.ch")
     (smtpmail-smtp-server "mail.your-server.de")
     (smtpmail-stream-type starttls)
     (smtpmail-smtp-service 25))))

;; Whenever a new mail is to be composed, change all relevant
;; configuration variables to the respective account. This method is
;; taken from the MU4E documentation:
;; http://www.djcbsoftware.nl/code/mu/mu4e/Multiple-accounts.html#Multiple-accounts
(defun my-mu4e-set-account ()
  "Set the account for composing a message."
  (let* ((account
          (if mu4e-compose-parent-message
              (let ((maildir (mu4e-message-field mu4e-compose-parent-message :maildir)))
                (string-match "/\\(.*?\\)/" maildir)
                (match-string 1 maildir))
            (completing-read (format "Compose with account: (%s) "
                                     (mapconcat #'(lambda (var) (car var))
                                                my-mu4e-account-alist "/"))
                             (mapcar #'(lambda (var) (car var)) my-mu4e-account-alist)
                             nil t nil nil (caar my-mu4e-account-alist))))
         (account-vars (cdr (assoc account my-mu4e-account-alist))))
    (if account-vars
        (mapc #'(lambda (var)
                  (set (car var) (cadr var)))
              account-vars)
      (error "No email account found"))))

(add-hook 'mu4e-compose-pre-hook 'my-mu4e-set-account)
(add-hook 'mu4e-compose-mode-hook 'flyspell-mode)

;; gpg
(add-hook 'mu4e-compose-mode-hook 'epa-mail-mode)
(add-hook 'mu4e-view-mode-hook 'epa-mail-mode)

;; Automatic line breaks when reading mail
(add-hook 'mu4e-view-mode-hook 'visual-line-mode)

(setq mu4e-refile-folder
  (lambda (msg)
    (cond
      ((string-match "^/dispatched.*"
        (mu4e-message-field msg :maildir))
        "/dispatched/INBOX.Archive")
      ((string-match "^/200ok.*"
        (mu4e-message-field msg :maildir))
        "/200ok/INBOX.Archive")
      ((string-match "^/voicerepublic.*"
        (mu4e-message-field msg :maildir))
        "/voicerepublic/INBOX.Archive")
      ((string-match "^/zhaw.*"
        (mu4e-message-field msg :maildir))
        "/zhaw/INBOX.Archive")
      ;; everything else goes to /archive
      (t  "/archive"))))

;; Re-define all standard bookmarks to not include the spam folders
;; for searches

;; Empty the initial bookmark list
(setq mu4e-bookmarks '())

(defvar d-spam "NOT maildir:/dispatched/INBOX.spambucket")

(add-to-list 'mu4e-bookmarks
             '((concat d-spam " AND flag:unread AND NOT flag:trashed") "Unread messages"      ?u))
(add-to-list 'mu4e-bookmarks
             '((concat d-spam " AND date:today..now")                  "Today's messages"     ?t))
(add-to-list 'mu4e-bookmarks
             '((concat d-spam " AND date:7d..now")                     "Last 7 days"          ?w))
(add-to-list 'mu4e-bookmarks
             '((concat d-spam " AND mime:image/*")                     "Messages with images" ?p))

;;; mu4e-config.el ends here
