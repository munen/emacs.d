;;; package --- Munen Emacs config
;;; Commentary:
;;; Code:

;;; Begin dependency management
(require 'package)

(setq package-archives '(("gnu" . "https://elpa.gnu.org/packages/")
                         ("marmalade" . "https://marmalade-repo.org/packages/")
                         ("melpa" . "https://melpa.org/packages/")))
(package-initialize)

(defvar my-packages '(flycheck
                      flycheck-cask
                      web-mode
                      color-theme-solarized
                      clojure-mode
                      cider
                      js2-mode
                      auto-complete
                      projectile
                      markdown-mode
                      evil
                      evil-leader
                      evil-numbers
                      powerline-evil
                      impatient-mode))

(dolist (p my-packages)
  (unless (package-installed-p p)
    (package-install p)))
;;; End dependency management

;;; Evil Mode
(evil-mode t)
;; Enable "M-x" in evil mode
(global-set-key (kbd "M-x") 'execute-extended-command)

;; Leader Mode Config
(global-evil-leader-mode)
(evil-leader/set-leader ",")
(evil-leader/set-key
  "w" 'basic-save-buffer
  "s" 'ispell
  "b" 'evil-buffer
  "q" 'evil-quit)

;; TODO: Bind M-. and M-, for Cider Mode

;; Fast switching between buffers
(define-key evil-normal-state-map (kbd "{") 'evil-next-buffer)
(define-key evil-normal-state-map (kbd "}") 'evil-prev-buffer)

;; Increment / Decrement numbers
(global-set-key (kbd "C-=") 'evil-numbers/inc-at-pt)
(global-set-key (kbd "C--") 'evil-numbers/dec-at-pt)
(define-key evil-normal-state-map (kbd "C-=") 'evil-numbers/inc-at-pt)
(define-key evil-normal-state-map (kbd "C--") 'evil-numbers/dec-at-pt)

;; Fuzzy matching of files
(ido-mode t)
(ido-everywhere t)

;; Themes
(load-theme 'wombat)
;; Presentation on Beamer Theme
;;(set-frame-parameter nil 'background-mode 'light)
;;(load-theme 'solarized t)
;; TODO: Make this a shortcut

;; Do not display GUI Toolbar
(tool-bar-mode 0)

;; Enable global syntax checking through flycheck
(add-hook 'after-init-hook #'global-flycheck-mode)

;; For syntax checking to work, also run the following commands:
;; RUBY
;; $ gem install rubocop ruby-lint
;; JS
;; $ npm install -g eslint

;; Enable web-mode for html files
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))

;; Disable startup message
(setq inhibit-splash-screen t)
(setq inhibit-startup-message t)

(powerline-evil-vim-color-theme)
(display-time-mode t)

;; j/k for browsing wrapped lines
(define-key evil-normal-state-map (kbd "j") 'evil-next-visual-line)
(define-key evil-normal-state-map (kbd "k") 'evil-previous-visual-line)

;; Do not create backup files
(setq make-backup-files nil)

;; Remember the cursor position of files when reopening them
(setq save-place-file "~/.emacs.d/saveplace")
(setq-default save-place t)
(require 'saveplace)

;; For p_slides presentations, run markdown-mode
;; This is a very primitive check
(add-to-list 'auto-mode-alist '("presentation.html" . markdown-mode))

;;; Programming Languages configuration

;; Configure auto-complete
(ac-config-default)

;; Javascript
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))

;; Use spaces instead of tabs
(setq-default tab-width 2 indent-tabs-mode nil)

;; Auto-indent with the Return key
(define-key global-map (kbd "RET") 'newline-and-indent)

;; Show matching paren
(show-paren-mode t)


;;; init.el ends here
