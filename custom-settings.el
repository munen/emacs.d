;; custom-set-variables was added by Custom.
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(cider-boot-parameters "cider repl -s wait")
 '(counsel-jq-command "yq")
 '(custom-safe-themes
   '("c433c87bd4b64b8ba9890e8ed64597ea0f8eb0396f4c9a9e01bd20a04d15d358" "0fffa9669425ff140ff2ae8568c7719705ef33b7a927a0ba7c5e2ffcfac09b75" "df3e05e16180d77732ceab47a43f2fcdb099714c1c47e91e8089d2fcf5882ea3" "d09467d742f713443c7699a546c0300db1a75fed347e09e3f178ab2f3aa2c617" "8db4b03b9ae654d4a57804286eb3e332725c84d7cdab38463cb6b97d5762ad26" "85c59044bd46f4a0deedc8315ffe23aa46d2a967a81750360fb8600b53519b8a" default))
 '(erc-default-server "irc.libera.chat" t)
 '(mml-secure-key-preferences
   '((OpenPGP
      (sign
       ("alain.lafon@dispatched.ch" "D465337B218A0216ECDC368E137099B38E1FC0E9")
       ("lafo@zhaw.ch" "D465337B218A0216ECDC368E137099B38E1FC0E9")
       ("alain@200ok.ch" "D465337B218A0216ECDC368E137099B38E1FC0E9"))
      (encrypt
       ("alain.lafon@dispatched.ch" "D465337B218A0216ECDC368E137099B38E1FC0E9")
       ("lafo@zhaw.ch" "D465337B218A0216ECDC368E137099B38E1FC0E9")
       ("alain@200ok.ch" "D465337B218A0216ECDC368E137099B38E1FC0E9")
       ("alain@zen-tempel.ch" "D465337B218A0216ECDC368E137099B38E1FC0E9")
       ("tpo@sourcepole.ch" "549A598550F2C6DB416F287C9EF854EDFC992520")))
     (CMS
      (sign)
      (encrypt))))
 '(org-agenda-files
   '("/home/munen/Dropbox/org/things.org" "/home/munen/Dropbox/org/reference.org" "/home/munen/Dropbox/org/media.org" "/home/munen/Dropbox/org/shared_with_monika/shared_alain_and_monika.org" "/home/munen/src/200ok/admin/THINGS.org"))
 '(org-download-heading-lvl nil)
 '(org-download-image-dir "./images")
 '(org-habit-graph-column 90)
 '(org-html-htmlize-output-type 'inline-css)
 '(org-image-actual-width 720)
 '(org-latex-text-markup-alist
   '((bold . "\\textbf{%s}")
     (code . protectedtexttt)
     (italic . "\\emph{%s}")
     (strike-through . "\\sout{%s}")
     (underline . "\\uline{%s}")
     (verbatim . "%s")))
 '(org-log-into-drawer t)
 '(org-modules
   '(ol-bbdb ol-bibtex ol-docview ol-eww ol-gnus org-habit ol-info ol-irc ol-mhe ol-rmail ol-w3m))
 '(org-safe-remote-resources '("\\`https://screenshots\\.200ok\\.ch\\(?:/\\|\\'\\)"))
 '(org-table-copy-increment nil)
 '(package-selected-packages
   '(eat org undo-tree gnuplot emacs-everywhere org-ai whisper hl-todo ace-window rfc-mode rust-mode tree-sitter-langs tree-sitter org-download magit-delta hcl-mode logview org-ql keycast adaptive-wrap counsel-jq package-lint tide flycheck-package rjsx-mode evil-escape erc-image edit-indirect atomic-chrome ob-restclient diminish elfeed spaceline ido-vertical-mode spacemacs-theme solarized-theme editorconfig dired-narrow evil-mc forge edit-server dumb-jump ggtags browse-kill-ring clipmon rainbow-mode beacon js2-refactor graphviz-dot-mode js-comint intero haskell-mode comment-tags handlebars-mode json-mode mustache-mode seeing-is-believing elfeed-goodies elfeed-org zenburn-theme writegood-mode writeroom-mode which-key darktooth-theme magit restclient impatient-mode evil-numbers evil-surround evil-leader evil smex ledger-mode robe enh-ruby-mode markdown-mode projectile coffee-mode tern-auto-complete tern pdf-tools yaml-mode sass-mode fixme-mode flycheck-flow ac-js2 js2-mode ac-cider exec-path-from-shell cider clj-refactor parinfer clojure-mode web-mode auto-complete flycheck ag))
 '(password-word-equivalents
   '("password" "passcode" "passphrase" "pass phrase" "pin" "decryption key" "encryption key" "암호" "パスワード" "ପ୍ରବେଶ ସଙ୍କେତ" "ពាក្យសម្ងាត់" "adgangskode" "contraseña" "contrasenya" "geslo" "hasło" "heslo" "iphasiwedi" "jelszó" "lösenord" "lozinka" "mật khẩu" "mot de passe" "parola" "pasahitza" "passord" "passwort" "pasvorto" "salasana" "senha" "slaptažodis" "wachtwoord" "كلمة السر" "ססמה" "лозинка" "пароль" "गुप्तशब्द" "शब्दकूट" "પાસવર્ડ" "సంకేతపదము" "ਪਾਸਵਰਡ" "ಗುಪ್ತಪದ" "கடவுச்சொல்" "അടയാളവാക്ക്" "গুপ্তশব্দ" "পাসওয়ার্ড" "රහස්පදය" "密码" "verification code"))
 '(safe-local-variable-values
   '((eval progn
           (load
            (concat
             (projectile-project-root)
             "src/org-ok-estimations/org-ok-estimations"))
           (org-babel-lob-ingest
            (concat
             (projectile-project-root)
             "common.org"))
           (custom-set-variables
            '(org-latex-text-markup-alist
              '((bold . "\\textbf{%s}")
                (code . protectedtexttt)
                (italic . "\\emph{%s}")
                (strike-through . "\\sout{%s}")
                (underline . "\\uline{%s}")
                (verbatim . "%s")))
            '(org-download-heading-lvl nil)
            '(org-download-image-dir "./images")
            '(org-image-actual-width 720))
           (defun bottom-right
               (table-name)
             "Get the bottom right value from the Org mode table with the given name."
             (save-excursion
               (goto-char
                (point-min))
               (search-forward
                (concat "#+NAME: " table-name))
               (let
                   ((table
                     (org-table-to-lisp)))
                 (let
                     ((last-row
                       (car
                        (last table))))
                   (car
                    (last last-row))))))
           (defun autocalc-clocktable nil
             (when
                 (derived-mode-p 'org-mode)
               (save-excursion
                 (goto-char 0)
                 (if
                     (string-equal
                      (car
                       (cdr
                        (car
                         (org-collect-keywords
                          '("AUTOCALC_CLOCKTABLES")))))
                      "t")
                     (progn
                       (goto-char
                        (search-forward "clocktable"))
                       (org-clock-report))))))
           (add-hook 'before-save-hook 'autocalc-clocktable)
           (defun ok-add-number-grouping
               (number &optional separator)
             "Add commas to NUMBER and return it as a string. Optional\12         SEPARATOR is the string to use to separate groups. It\12         defaults to a apostrophe."
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
           (defun org-table-result
               (table)
             "The very last cell, which is typically the result of a spreadsheet."
             (car
              (last
               (car
                (last table)))))
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
     (eval org-babel-lob-ingest "../common.org")
     (eval progn
           (load
            (concat
             (projectile-project-root)
             "src/org-ok-estimations/org-ok-estimations"))
           (org-babel-lob-ingest
            (concat
             (projectile-project-root)
             "common.org"))
           (custom-set-variables
            '(org-latex-text-markup-alist
              '((bold . "\\textbf{%s}")
                (code . protectedtexttt)
                (italic . "\\emph{%s}")
                (strike-through . "\\sout{%s}")
                (underline . "\\uline{%s}")
                (verbatim . "%s")))
            '(org-download-heading-lvl nil)
            '(org-download-image-dir "./images")
            '(org-image-actual-width 720))
           (defun autocalc-clocktable nil
             (when
                 (derived-mode-p 'org-mode)
               (save-excursion
                 (goto-char 0)
                 (if
                     (string-equal
                      (car
                       (cdr
                        (car
                         (org-collect-keywords
                          '("AUTOCALC_CLOCKTABLES")))))
                      "t")
                     (progn
                       (goto-char
                        (search-forward "clocktable"))
                       (org-clock-report))))))
           (add-hook 'before-save-hook 'autocalc-clocktable)
           (defun ok-add-number-grouping
               (number &optional separator)
             "Add commas to NUMBER and return it as a string. Optional\12         SEPARATOR is the string to use to separate groups. It\12         defaults to a apostrophe."
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
           (defun org-table-result
               (table)
             "The very last cell, which is typically the result of a spreadsheet."
             (car
              (last
               (car
                (last table)))))
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
     (org-latex-pdf-process "xelatex -shell-escape -interaction nonstopmode -output-directory %o %f" "xelatex -shell-escape -interaction nonstopmode -output-directory %o %f" "xelatex -shell-escape -interaction nonstopmode -output-directory %o %f")
     (eval progn
           (custom-set-variables
            '(org-latex-text-markup-alist
              '((bold . "\\textbf{%s}")
                (code . protectedtexttt)
                (italic . "\\emph{%s}")
                (strike-through . "\\sout{%s}")
                (underline . "\\uline{%s}")
                (verbatim . "%s")))
            '(org-download-heading-lvl nil)
            '(org-download-image-dir "./images")
            '(org-image-actual-width 720))
           (defun autocalc-clocktable nil
             (when
                 (derived-mode-p 'org-mode)
               (save-excursion
                 (goto-char 0)
                 (if
                     (string-equal
                      (car
                       (cdr
                        (car
                         (org-collect-keywords
                          '("AUTOCALC_CLOCKTABLES")))))
                      "t")
                     (progn
                       (goto-char
                        (search-forward "clocktable"))
                       (org-clock-report))))))
           (add-hook 'before-save-hook 'autocalc-clocktable)
           (defun ok-add-number-grouping
               (number &optional separator)
             "Add commas to NUMBER and return it as a string. Optional\12         SEPARATOR is the string to use to separate groups. It\12         defaults to a apostrophe."
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
           (defun org-table-result
               (table)
             "The very last cell, which is typically the result of a spreadsheet."
             (car
              (last
               (car
                (last table)))))
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
     (eval org-babel-lob-ingest "../../../../common.org")
     (eval progn
           (custom-set-variables
            '(org-latex-text-markup-alist
              '((bold . "\\textbf{%s}")
                (code . protectedtexttt)
                (italic . "\\emph{%s}")
                (strike-through . "\\sout{%s}")
                (underline . "\\uline{%s}")
                (verbatim . "%s")))
            '(org-download-heading-lvl nil)
            '(org-download-image-dir "./images")
            '(org-image-actual-width 720))
           (defun autocalc-clocktable nil
             (when
                 (derived-mode-p 'org-mode)
               (save-excursion
                 (goto-char 0)
                 (if
                     (string-equal
                      (car
                       (cdr
                        (car
                         (org-collect-keywords
                          '("AUTOCALC_CLOCKTABLES")))))
                      "t")
                     (progn
                       (goto-char
                        (search-forward "clocktable"))
                       (org-clock-report))))))
           (add-hook 'before-save-hook 'autocalc-clocktable)
           (defun ok-add-number-grouping
               (number &optional separator)
             "Add commas to NUMBER and return it as a string. Optional\12         SEPARATOR is the string to use to separate groups. It\12         defaults to a apostrophe."
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
     (org-treat-insert-todo-heading-as-state-change . t)
     (eval org-babel-lob-ingest "../common-pm.org")
     (org-treat-insert-todo-heading-as-state-change . 1)
     (eval setq org-treat-insert-todo-heading-as-state-change t)
     (eval progn
           (custom-set-variables
            '(org-latex-text-markup-alist
              '((bold . "\\textbf{%s}")
                (code . protectedtexttt)
                (italic . "\\emph{%s}")
                (strike-through . "\\sout{%s}")
                (underline . "\\uline{%s}")
                (verbatim . "%s")))
            '(org-download-heading-lvl nil)
            '(org-download-image-dir "./images")
            '(org-image-actual-width 720))
           (defun autocalc-clocktable nil
             (when
                 (derived-mode-p 'org-mode)
               (save-excursion
                 (goto-char 0)
                 (if
                     (search-forward "#+AUTOCALC_CLOCKTABLES: t")
                     (progn
                       (goto-char
                        (search-forward "clocktable"))
                       (org-clock-report))))))
           (add-hook 'before-save-hook 'autocalc-clocktable)
           (defun ok-add-number-grouping
               (number &optional separator)
             "Add commas to NUMBER and return it as a string. Optional\12         SEPARATOR is the string to use to separate groups. It\12         defaults to a apostrophe."
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
     (eval org-babel-lob-ingest "../../common.org")
     (org-latex-pdf-process "pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f" "pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f" "pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f")
     (eval org-babel-lob-ingest "common.org")
     (eval org-babel-lob-ingest "../../../common.org")
     (eval progn
           (custom-set-variables
            '(org-latex-text-markup-alist
              '((bold . "\\textbf{%s}")
                (code . protectedtexttt)
                (italic . "\\emph{%s}")
                (strike-through . "\\sout{%s}")
                (underline . "\\uline{%s}")
                (verbatim . "%s")))
            '(org-download-heading-lvl nil)
            '(org-download-image-dir "./images")
            '(org-image-actual-width 720))
           (defun autocalc-clocktable nil
             (if
                 (string-equal "bluewin.org"
                               (buffer-name))
                 (save-excursion
                   (goto-char 0)
                   (goto-char
                    (search-forward "clocktable"))
                   (org-clock-report))))
           (add-hook 'before-save-hook 'autocalc-clocktable)
           (defun ok-add-number-grouping
               (number &optional separator)
             "Add commas to NUMBER and return it as a string. Optional\12         SEPARATOR is the string to use to separate groups. It\12         defaults to a apostrophe."
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
                (verbatim . "%s")))
            '(org-download-heading-lvl nil)
            '(org-download-image-dir "./images")
            '(org-image-actual-width 720))
           (defun autocalc-clocktable nil
             (save-excursion
               (goto-char 0)
               (goto-char
                (search-forward "clocktable"))
               (org-clock-report)))
           (add-hook 'before-save-hook 'autocalc-clocktable)
           (defun ok-add-number-grouping
               (number &optional separator)
             "Add commas to NUMBER and return it as a string. Optional\12         SEPARATOR is the string to use to separate groups. It\12         defaults to a apostrophe."
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
                (verbatim . "%s")))
            '(org-download-heading-lvl nil)
            '(org-download-image-dir "./images")
            '(org-image-actual-width 720))
           (defun autocalc-clocktable
               (backend)
             (interactive)
             (save-excursion
               (goto-char 0)
               (goto-char
                (search-forward "clocktable"))
               (org-clock-report)))
           (add-hook 'before-save-hook 'autocalc-clocktable)
           (defun ok-add-number-grouping
               (number &optional separator)
             "Add commas to NUMBER and return it as a string. Optional\12         SEPARATOR is the string to use to separate groups. It\12         defaults to a apostrophe."
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
                (verbatim . "%s")))
            '(org-download-heading-lvl nil)
            '(org-download-image-dir "./images")
            '(org-image-actual-width 720))
           (defun autocalc-clocktable
               (backend)
             (save-excursion
               (goto-char 0)
               (goto-char
                (search-forward "clocktable"))
               (org-clock-report)))
           (add-hook 'before-save-hook 'autocalc-clocktable)
           (defun ok-add-number-grouping
               (number &optional separator)
             "Add commas to NUMBER and return it as a string. Optional\12         SEPARATOR is the string to use to separate groups. It\12         defaults to a apostrophe."
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
                (verbatim . "%s")))
            '(org-download-heading-lvl nil)
            '(org-download-image-dir "./images")
            '(org-image-actual-width 720))
           (defun ok-add-number-grouping
               (number &optional separator)
             "Add commas to NUMBER and return it as a string. Optional\12         SEPARATOR is the string to use to separate groups. It\12         defaults to a apostrophe."
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
     (org-download-image-dir . "./images")
     (eval progn
           (custom-set-variables
            '(org-latex-text-markup-alist
              '((bold . "\\textbf{%s}")
                (code . protectedtexttt)
                (italic . "\\emph{%s}")
                (strike-through . "\\sout{%s}")
                (underline . "\\uline{%s}")
                (verbatim . "%s")))
            '(org-download-heading-lvl nil))
           (defun ok-add-number-grouping
               (number &optional separator)
             "Add commas to NUMBER and return it as a string. Optional\12         SEPARATOR is the string to use to separate groups. It\12         defaults to a apostrophe."
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
           (setq sql-postgres-login-params
                 '((user :default "postgres")
                   (database :default "alephdam_events")
                   (server :default "localhost")
                   (port :default 5432))))
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
             "Add commas to NUMBER and return it as a string. Optional\12         SEPARATOR is the string to use to separate groups. It\12         defaults to a apostrophe."
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
             "Add commas to NUMBER and return it as a string. Optional\12         SEPARATOR is the string to use to separate groups. It\12         defaults to a apostrophe."
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
