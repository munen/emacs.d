;;; package --- Alain M. Lafon <alain@200ok.ch> Emacs config
;;; Commentary:
;;   - Most of the configuration is within `configuration.org`
;;; Code:

;; This loads the actual configuration in literate org-mode elisp

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)
(org-babel-load-file "~/.emacs.d/configuration.org")

;; custom-set-variables was added by Custom.
(custom-set-variables
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;;; init.el ends here
