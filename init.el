;;; package --- Alain M. Lafon <alain@200ok.ch> Emacs config
;;; Commentary:
;;   - All of the configuration is within `configuration.org`
;;; Code:

(package-initialize)

(defun load-config()
  "Load the actual configuration in literate 'org-mode' elisp."
  (interactive)
  (org-babel-load-file "~/.emacs.d/configuration.org"))

(load-config)

;;; init.el ends here
