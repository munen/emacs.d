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
                      auto-complete
                      web-mode
                      color-theme-solarized
                      clojure-mode
                      cider
                      ac-cider
                      js2-mode
                      ac-js2
                      sass-mode
                      tern
                      tern-auto-complete
                      coffee-mode
                      projectile
                      markdown-mode
                      enh-ruby-mode
                      evil
                      evil-leader
                      evil-numbers
                      impatient-mode
                      magit))

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

;; ido-mode
(ido-mode t)
(ido-everywhere t)
(setq ido-enable-flex-matching t)
(global-set-key (kbd "C-x C-b") 'ibuffer)

; Replace i-search-(forward|backward) with their respective regexp
; capable counterparts
(global-set-key (kbd "C-s") 'isearch-forward-regexp)
(global-set-key (kbd "C-r") 'isearch-backward-regexp)

;; Themes
(load-theme 'wombat)
;; (set-default-font "Menlo 14")
;; Presentation on Beamer Theme
;; (load-theme 'leuven t)
;; (set-default-font "Menlo 18")
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

;; web-mode
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))

(setq web-mode-enable-current-element-highlight t)
(setq web-mode-ac-sources-alist
  '(("html" . (ac-source-words-in-buffer ac-source-abbrev))))

;; Ruby
(add-hook 'ruby-mode-hook 'linum-mode)
(add-to-list 'auto-mode-alist '("\\.scss?\\'" . sass-mode))

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

;; custom-set-variables was added by Custom.
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(coffee-tab-width 2)
 '(send-mail-function (quote smtpmail-send-it)))

;; Use spaces instead of tabs
(setq-default tab-width 2 indent-tabs-mode nil)

;; Auto-indent with the Return key
(define-key global-map (kbd "RET") 'newline-and-indent)

;; Show matching paren
(show-paren-mode t)

;; Indentation cannot insert tabs
(setq-default indent-tabs-mode nil)

;; Clojure
(require 'ac-cider)
;;(setq ac-quick-help-delay 0.5)
(add-hook 'cider-mode-hook 'ac-flyspell-workaround)
(add-hook 'cider-mode-hook 'ac-cider-setup)
(add-hook 'cider-repl-mode-hook 'ac-cider-setup)
(eval-after-load "auto-complete"
  '(progn
     (add-to-list 'ac-modes 'cider-mode)
     (add-to-list 'ac-modes 'cider-repl-mode)))

;;; orgmode
(require 'org)

(add-hook 'org-mode-hook 'auto-fill-mode)
(add-hook 'org-mode-hook 'flyspell-mode)

;; Pomodoro configuration
(load "~/.emacs.d/org-pomodoro")

(setq org-directory "~/switchdrive/org/")

;; Set org-capture inbox
(setq org-default-notes-file (concat org-directory "inbox.org"))
(define-key global-map "\C-cc" 'org-capture)

(setq org-agenda-files (list (concat org-directory "things.org")
                             (concat org-directory "inbox.org")
                             (concat org-directory "reference.org")))

(setq org-capture-templates
      '(("t" "Todo" entry (file+headline (concat org-directory "inbox.org") "Tasks")
         "* TODO %?\n  %U\n  %i\n  %a")
        ("m" "Media" entry
         (file+datetree (concat org-directory "media.org"))
         "* %?\nURL: \nEntered on %U\n")))

(defun things ()
  "Open main 'org-mode' file and start 'org-agenda' for today."
  (interactive)
  (find-file (concat org-directory "things.org"))
  (org-agenda-list)
  (org-agenda-day-view)
  (shrink-window-if-larger-than-buffer)
  (other-window 1))

(evil-leader/set-key
  "a" 'org-archive-subtree-default)

;;; OS X
(defun arrange-emacs-positon (w h x y)
"Set the W(idth), H(eight), and X/Y position of the current frame."
(let ((frame (selected-frame)))
    (delete-other-windows)
    (set-frame-position frame x y)
    (set-frame-size frame w h)))

(when (eq system-type 'darwin)
  ; Use Spotlight to search with M-x locate
  (setq locate-command "mdfind")


  ; Start Emacs in full right on the right side of the screen
  ; Works on a 15.4-inch (2880 x 1800) MBP
  (add-hook 'window-setup-hook (lambda()
                                 (arrange-emacs-positon 114 71 843 0))))

;;; Linux
(when (eq system-type 'gnu/linux)
  (menu-bar-mode -1))

;;; Mu4e
(load "~/.emacs.d/mu4e-config")

;;; Magit
(global-set-key (kbd "C-x g") 'magit-status)

;;; Flyspell
;; Order corrections by likeliness, not by the default of alphabetical
;; ordering
(setq flyspell-sort-corrections nil)

;; Configure ispell backend
;; The german dictionary has been installed taken from here:
;; http://fmg-www.cs.ucla.edu/geoff/ispell-dictionaries.html#German-dicts
(defun flyspell-switch-dictionary()
  "Switch between German and English dictionaries"
  (interactive)
  (let* ((dic ispell-current-dictionary)
         (change (if (string= dic "deutsch") "english" "deutsch")))
    (ispell-change-dictionary change)
    (message "Dictionary switched from %s to %s" dic change)))
    
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;;; init.el ends here
