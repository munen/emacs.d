;;; package --- Alain M. Lafon <alain@200ok.ch> Emacs config
;;; Commentary:
;;   - Most of the configuration is within `configuration.org`
;;; Code:

;; custom-set-variables was added by Custom.
(custom-set-variables
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("df3e05e16180d77732ceab47a43f2fcdb099714c1c47e91e8089d2fcf5882ea3"
     "d09467d742f713443c7699a546c0300db1a75fed347e09e3f178ab2f3aa2c617"
     "8db4b03b9ae654d4a57804286eb3e332725c84d7cdab38463cb6b97d5762ad26"
     "85c59044bd46f4a0deedc8315ffe23aa46d2a967a81750360fb8600b53519b8a"
     default)))
 '(frame-background-mode (quote dark))
 '(pos-tip-background-color "#36473A")
 '(pos-tip-foreground-color "#FFFFC8")
 '(coffee-tab-width 2)
 '(send-mail-function (quote smtpmail-send-it)))

;; This loads the actual configuration in literate org-mode elisp
(org-babel-load-file "~/.emacs.d/configuration.org")

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;;; init.el ends here
