;;; package --- Munen Emacs config
;;; Commentary:
;;; Code:

; Initialise Cask for dependency management
(require 'cask "/usr/local/share/emacs/site-lisp/cask/cask.el")
(cask-initialize)

; Enable Evil Mode
(evil-mode t)
; Enable "M-x" in evil mode
(global-set-key (kbd "M-x") 'execute-extended-command)

; Leader Mode Config
(global-evil-leader-mode)
(evil-leader/set-leader ",")
(evil-leader/set-key
  "w" 'basic-save-buffer)
; TODO: figure out what the buffer quit function is
;  "q" 'buffer-quit-function)


; TODO: Map "Fast switching of buffers"
;"{" 'evil-next-buffer
;"}" 'evil-prev-buffer)

; Themes
;(load-theme 'wombat)
(set-frame-parameter nil 'background-mode 'dark)
(load-theme 'solarized t)

; Do not display GUI Toolbar
(tool-bar-mode 0)

; Enable global syntax checking through flycheck
(add-hook 'after-init-hook #'global-flycheck-mode)

; For syntax checking to work, also run the following commands:
; RUBY
; $ gem install rubocop ruby-lint
; JS
; $ npm install -g eslint

; Enable web-mode for html files
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))

;;; init.el ends here
