;; custom-set-variables was added by Custom.
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(cider-boot-parameters "cider repl -s wait")
 '(custom-safe-themes
   '("d91ef4e714f05fff2070da7ca452980999f5361209e679ee988e3c432df24347" "df3e05e16180d77732ceab47a43f2fcdb099714c1c47e91e8089d2fcf5882ea3" "d09467d742f713443c7699a546c0300db1a75fed347e09e3f178ab2f3aa2c617" "8db4b03b9ae654d4a57804286eb3e332725c84d7cdab38463cb6b97d5762ad26" "85c59044bd46f4a0deedc8315ffe23aa46d2a967a81750360fb8600b53519b8a" default))
 '(mml-secure-key-preferences
   '((OpenPGP
      (sign
       ("alain.lafon@dispatched.ch" "D465337B218A0216ECDC368E137099B38E1FC0E9")
       ("lafo@zhaw.ch" "D465337B218A0216ECDC368E137099B38E1FC0E9")
       ("alain@200ok.ch" "D465337B218A0216ECDC368E137099B38E1FC0E9"))
      (encrypt
       ("lafo@zhaw.ch" "D465337B218A0216ECDC368E137099B38E1FC0E9")
       ("alain@200ok.ch" "D465337B218A0216ECDC368E137099B38E1FC0E9")
       ("alain@zen-tempel.ch" "D465337B218A0216ECDC368E137099B38E1FC0E9")
       ("tpo@sourcepole.ch" "549A598550F2C6DB416F287C9EF854EDFC992520")))
     (CMS
      (sign)
      (encrypt))))
 '(org-agenda-files
   '("~/Dropbox/org/things.org" "~/Dropbox/org/reference.org" "~/Dropbox/org/media.org" "~/Dropbox/org/shared_with_monika/shared_alain_and_monika.org" "~/Dropbox/ZHAW/web3-unterlagen/README.org" "~/Dropbox/ZHAW/weng-unterlagen/README.org" "~/src/200ok/swiss-crowdfunder/TODO.org" "~/src/200ok/200ok-admin/THINGS.org"))
 '(org-latex-text-markup-alist
   '((bold . "\\textbf{%s}")
     (code . protectedtexttt)
     (italic . "\\emph{%s}")
     (strike-through . "\\sout{%s}")
     (underline . "\\uline{%s}")
     (verbatim . "%s")))
 '(package-selected-packages
   '(counsel-jq package-lint tide flycheck-package rjsx-mode evil-escape erc-image edit-indirect atomic-chrome ob-restclient diminish elfeed spaceline ido-vertical-mode spacemacs-theme solarized-theme editorconfig dired-narrow evil-mc forge edit-server dumb-jump ggtags browse-kill-ring clipmon rainbow-mode beacon js2-refactor graphviz-dot-mode js-comint intero haskell-mode comment-tags handlebars-mode json-mode mustache-mode seeing-is-believing elfeed-goodies elfeed-org zenburn-theme writegood-mode writeroom-mode which-key darktooth-theme magit restclient impatient-mode evil-numbers evil-surround evil-leader evil smex ledger-mode robe enh-ruby-mode markdown-mode projectile coffee-mode tern-auto-complete tern pdf-tools yaml-mode sass-mode fixme-mode flycheck-flow ac-js2 js2-mode ac-cider exec-path-from-shell cider clj-refactor parinfer clojure-mode web-mode auto-complete flycheck ag))
 '(safe-local-variable-values
   '((eval progn
           (custom-set-variables
            '(org-latex-text-markup-alist
              '((bold . "\\textbf{%s}")
                (code . protectedtexttt)
                (italic . "\\emph{%s}")
                (strike-through . "\\sout{%s}")
                (underline . "\\uline{%s}")
                (verbatim . "%s"))))
           (defun ok-add-number-grouping
               (number &optional separator)
             "Add commas to NUMBER and return it as a string. Optional
         SEPARATOR is the string to use to separate groups. It
         defaults to a apostrophe."
             (let
                 ((num
                   (if
                       (floatp number)
                       (format "%0.2f" number)
                     (number-to-string number)))
                  (op
                   (or separator "'")))
               (while
                   (string-match "\\(.*[0-9]\\)\\([0-9][0-9][0-9].*\\)" num)
                 (setq num
                       (concat
                        (match-string 1 num)
                        op
                        (match-string 2 num))))
               num))
           (defmacro ok-org-get-var
               (name)
             "Retrieves an org-variable NAME and casts it into a number."
             `(string-to-number
               (org-sbe ,name)))
           (defun ok-number-as-chf
               (number)
             "Take a NUMBER, format and return it like 'CHF 12'345.-' If the NUMBER is a float, then the precision is ."
             (concat "CHF "
                     (ok-add-number-grouping
                      (if
                          (stringp number)
                          (string-to-number number)
                        number))
                     (if
                         (floatp number)
                         "" ".-"))))
     (eval progn
           (custom-set-variables
            '(org-latex-text-markup-alist
              '((bold . "\\textbf{%s}")
                (code . protectedtexttt)
                (italic . "\\emph{%s}")
                (strike-through . "\\sout{%s}")
                (underline . "\\uline{%s}")
                (verbatim . "%s"))))
           (defun ok-add-number-grouping
               (number &optional separator)
             "Add commas to NUMBER and return it as a string. Optional
         SEPARATOR is the string to use to separate groups. It
         defaults to a apostrophe."
             (let
                 ((num
                   (if
                       (floatp number)
                       (format "%0.2f" number)
                     (number-to-string number)))
                  (op
                   (or separator "'")))
               (while
                   (string-match "\\(.*[0-9]\\)\\([0-9][0-9][0-9].*\\)" num)
                 (setq num
                       (concat
                        (match-string 1 num)
                        op
                        (match-string 2 num))))
               num))
           (defun ok-number-as-chf
               (number)
             "Take a NUMBER, format and return it like 'CHF 12'345.-' If the NUMBER is a float, then the precision is ."
             (concat "CHF "
                     (ok-add-number-grouping number)
                     (if
                         (floatp number)
                         "" ".-"))))
     (cider-ns-refresh-after-fn . "integrant.repl/resume")
     (cider-ns-refresh-before-fn . "integrant.repl/suspend")
     (Epa-file-encrypt-to "munen@200ok.ch"))))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )



;; Select the next WP page_id from a list of IDs
;; Premise in the buffer:
;; Mark a: /* 14758 */
;;
;; /* 14762 14754 15609 15615 15623 15639 15627 15631 15635 */
(fset 'select-next-page-id
   "`bdw`cdw`bhpgg")

;; Given the above setting, create new selectors for the new page-id
(fset 'create-selectors-for-page-id
   [?\C-s ?1 ?4 ?9 ?8 ?9 return ?y ?y ?p ?m ?d ?` ?b ?v ?e ?y ?` ?d ?V ?: ?s ?/ ?1 ?4 ?9 ?8 ?9 ?/ ?\C-y ?/ ?g return])
