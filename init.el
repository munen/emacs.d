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
                      ac-js2
                      tern
                      tern-auto-complete
                      coffee-mode
                      auto-complete
                      projectile
                      markdown-mode
                      evil
                      evil-leader
                      evil-numbers
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
;; (set-frame-parameter nil 'background-mode 'light)
;; (load-theme 'solarized t)
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
(add-hook 'js-mode-hook 'js2-minor-mode)
(setq js2-highlight-level 3)

;; Tern
(add-hook 'js-mode-hook (lambda () (tern-mode t)))
(eval-after-load 'tern
   '(progn
      (require 'tern-auto-complete)
      (tern-ac-setup)))

;; CoffeeScript
(custom-set-variables '(coffee-tab-width 2))

;; Use spaces instead of tabs
(setq-default tab-width 2 indent-tabs-mode nil)

;; Auto-indent with the Return key
(define-key global-map (kbd "RET") 'newline-and-indent)

;; Show matching paren
(show-paren-mode t)


;;; orgmode
(require 'org)

;; Pomodoro configuration
(add-to-list 'org-modules 'org-timer)

(defun set-break-timer ()
  "When the timer is over, go back to work."

  (if (eq system-type 'darwin)
      (shell-command "say 'Break is over'")
    nil)
  (message-box "Break is over"))

(defun set-start-timer ()
  "When the timer is over, let the user take a break!"

  (if (eq system-type 'darwin)
      (shell-command "say 'Time to take a break'")
    nil)
  (message-box "Time to take a break"))
  

(defun pomodoro-break ()
  "."
  (interactive)
  (remove-hook 'org-timer-done-hook 'set-start-timer)
  (add-hook 'org-timer-done-hook 'set-break-timer)
  (org-timer-set-timer 5))

(defun pomodoro-start ()
  "."
  (interactive)
  (remove-hook 'org-timer-done-hook 'set-break-timer)
  (add-hook 'org-timer-done-hook 'set-start-timer)
  (org-timer-set-timer 25)
  (if (eq system-type 'darwin)
      (shell-command "say 'Ready, set, go!'")
    nil))

;; Modify the org-clock-in so that a pomodoro timer is started except
;; if a timer is already started already.
(add-hook 'org-clock-in-hook (lambda ()
                               (remove-hook 'org-timer-done-hook 'set-break-timer)
                               (if (not org-timer-current-timer)
                                   (pomodoro-start))))

;;; init.el ends here
