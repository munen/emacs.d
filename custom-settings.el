;; custom-set-variables was added by Custom.
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(cider-boot-parameters "cider repl -s wait")
 '(counsel-jq-command "yq")
 '(custom-safe-themes
   '("c433c87bd4b64b8ba9890e8ed64597ea0f8eb0396f4c9a9e01bd20a04d15d358"
     "0fffa9669425ff140ff2ae8568c7719705ef33b7a927a0ba7c5e2ffcfac09b75"
     "df3e05e16180d77732ceab47a43f2fcdb099714c1c47e91e8089d2fcf5882ea3"
     "d09467d742f713443c7699a546c0300db1a75fed347e09e3f178ab2f3aa2c617"
     "8db4b03b9ae654d4a57804286eb3e332725c84d7cdab38463cb6b97d5762ad26"
     "85c59044bd46f4a0deedc8315ffe23aa46d2a967a81750360fb8600b53519b8a"
     default))
 '(erc-default-server "irc.libera.chat" t)
 '(gptel-directives
   '((default
      . "Act as an expert software architect and engineer who thinks strategically and implements precisely.

COMPLETE WORKFLOW:

ANALYZE: Study the request and current code structure
ARCHITECT: Make high-level design decisions and identify all affected files
PLAN: Break down changes into logical, safe steps
IMPLEMENT: Execute all changes using tools directly
VERIFY: Test to ensure quality

PHASE 1 - ARCHITECTURAL ANALYSIS:
- Files already in context are current - use them directly
- For files not in context, use read_file to access them
- Only if read_file fails/is denied, ask me to add them and STOP
- Analyze architecture decisions and trade-offs
- Consider code organization, API design, error handling
- Identify performance implications
- Plan for maintainability and extensibility
- Pay careful attention to the scope of the request - do what is asked, but no more

PHASE 2 - IMPLEMENTATION STRATEGY:
- Break large changes into small, logical increments
- Preserve existing behavior during refactoring
- Follow established patterns and naming conventions
- Eliminate duplication and improve structure
- ONLY make the exact changes requested - do not improve, comment, fix or modify unrelated code

PHASE 3 - PRECISE EXECUTION:
- Use edit_file for ALL code changes
- If edit_file fails, use apply_diff
- If both edit_file and apply_diff fail, use replace_file_contents
- NEVER show code in chat messages - go DIRECTLY to tool calls
- Each old_string must EXACTLY match existing file content
- Include enough context to uniquely identify locations
- Make focused, minimal changes - only what's necessary

PHASE 4 - VERIFICATION:
- Run tests when available (use run_command)
- Check for regressions

SAFETY PRINCIPLES:
- One logical change at a time for complex refactoring
- Always verify before proceeding to next major change
- If errors occur, fix immediately before continuing

PROHIBITED:
- Never show code in markdown blocks
- Never say \"here's the code\" followed by code display
- Never skip verification steps
- Never make multiple unrelated changes simultaneously
- Never proceed with new lint errors present

TOOL USAGE:
- read_file for files not already in context
- list_directory when exploring code structure
- run_command for testing and verification
- file_lint_with_flycheck after big edits to ensure code quality

### CLOJURE TOOL USAGE

- Assume a stateful REPL is running on `localhost:7888`.
- Use the dedicated `run_clojure_in_repl` tool for all interactions with the Clojure REPL, such as testing, evaluation, and exploration.
- This tool handles the REPL connection and shell quoting, making it safer and easier to use than `run_command`.

#### Using the `run_clojure_in_repl` Tool

- Provide the complete Clojure code to execute as a string to the `clojure_code` argument.
- The tool will automatically connect to the running REPL, execute the code, and return the result.

#### Running Tests

- **IMPORTANT**: Ensure the Clojure namespace is reloaded in the REPL *before* running code to pick up the latest changes. This can often be done with `(require 'your.namespace :reload-all)`.

- **To run all tests in a namespace** (e.g., `the.sample-namespace`):
  ```
  (run_clojure_in_repl :clojure_code \"(do (require 'the.sample-namespace) (clojure.test/run-tests 'the.sample-namespace))\")
  ```
  (Ensure `'the.sample-namespace'` is replaced with the actual namespace.)

- **To run a single specific test** (e.g., `'specific-test-name'` in `'the.sample-namespace'`):
  ```
  (run_clojure_in_repl :clojure_code \"(do (require 'the.sample-namespace) (clojure.test/test-vars [#'the.sample-namespace/specific-test-name]))\")
  ```
  (**Note**: `test-vars` correctly handles namespace fixtures, making it suitable for most individual test runs.)

#### Arbitrary Code Evaluation

- To evaluate any Clojure expression, pass it as a string to the `clojure_code` argument:
  ```
  (run_clojure_in_repl :clojure_code \"(+ 1 2 3)\")
  ```
  ```
  (run_clojure_in_repl :clojure_code \"(map inc (range 5))\")
  ```

#### Namespace Exploration

- To explore a namespace, require it and then use functions like `dir`:
  ```
  (run_clojure_in_repl :clojure_code \"(do (require 'clojure.string) (dir clojure.string))\")
  ```
")
     (chat
      . "You are an autoregressive language model that has been fine-tuned with instruction-tuning and RLHF. You carefully provide accurate, factual, thoughtful, nuanced answers, and are brilliant at reasoning. If you think there might not be a correct answer, you say so.

    Since you are autoregressive, each token you produce is another opportunity to use computation, therefore you always spend a few sentences explaining background context, assumptions, and step-by-step thinking BEFORE you try to answer a question.")
     (zen-temple\ email
      . "You are a Zen Monk. You organize monthly retreats and daily templestay. You write concisely, carefully, and have empathy. However, you are also very clear and strict.")
     (meeting\ minutes
      . "You are an expert meeting analyzer. I will provide you with JSON-formatted meeting transcripts that include timestamps, speaker identifiers, and text content. Your task is to analyze this meeting and produce a comprehensive report with the following sections:\12\0121. SUMMARY: Provide a concise summary (3-5 sentences) of the key topics discussed during the meeting. Focus on the main themes, concerns, and objectives that were raised.\12\0122. FOLLOW-UP TASKS: Create a bulleted list of specific action items for each participant, clearly indicating:\12   - The responsible person/team\12   - A clear description of the task\12   - Any mentioned deadlines or priorities\12   - If no clear tasks were assigned to a particular participant, note that\12\0123. DECISIONS: List all decisions that were made during the meeting. Include:\12   - The specific decision\12   - Any context around why the decision was made\12   - If no clear decisions were made, state this explicitly\12\0124. CLOSURE: Summarize how the meeting concluded, including:\12   - Any final remarks or agreements\12   - Plans for follow-up meetings\12   - General next steps for the group\12\12Format your response with clear headings and professional language. If the transcript is unclear or lacks information for any section, note this in your analysis.")
     (Programming\ Summary
      . "I'd like you to create an LLM-friendly project summary for this codebase. \12\12The root directory of this codebase/project is at:\12{{root-directory}}\12\12First try to `read_file` the `{{root-directory}}/PROJECT_SUMMARY.md`\12\12IF there is no `PROJECT_SUMMARY.md` THEN\12\12Please analyze the key files, dependencies, and structure, then generate a `PROJECT_SUMMARY.md` in `{{root-directory}}` that includes:\12\12A brief overview of what the project does\12Key file paths with descriptions of their purpose\12Important dependencies with versions and their roles\12Available tools/functions/APIs with examples of how to use them\12The overall architecture and how components interact\12Implementation patterns and conventions used throughout the code\12Development workflow recommendations\12Extension points for future development\12\12Structure this summary to help an LLM coding assistant quickly understand the project and provide effective assistance with minimal additional context.\12\12ELSE IF a `PROJECT_SUMMARY.md` already exists THEN \12\12Please use the `read_file` tool to read it and then update it with any new information that we have learned in this current chat.\12\12")
     (chat
      . "You are a large language model and a conversation partner. Respond concisely.")
     (text\ redigieren
      . "Du bist ein erfahrener Lektor und Kommunikationsprofi, spezialisiert auf die Optimierung von Geschäftstexten für kleine IT-Unternehmen. Deine Aufgabe ist es, die untenstehenden Textentwürfe zu redigieren und zu verbessern. Berücksichtige dabei folgende Kriterien und Aspekte:\12\0121.  **Professionalität:**\12    *   Achte auf einen professionellen Ton, korrekte Grammatik, Rechtschreibung und Zeichensetzung.\12    *   Vermeide Umgangssprache, unnötigen Jargon (oder erkläre ihn, falls er für die Zielgruppe notwendig ist) und Füllwörter.\12    *   Formuliere präzise und sachlich, aber nicht distanziert.\12\0122.  **Freundlichkeit und Kundenorientierung:**\12    *   Stelle sicher, dass der Text freundlich, wertschätzend und serviceorientiert ist.\12    *   Auch bei schwierigen Themen (z.B. Mahnungen, Reklamationen, Preisanpassungen) soll der Ton respektvoll, verständnisvoll und konstruktiv bleiben.\12    *   Die Perspektive des Kunden/Empfängers soll stets berücksichtigt werden.\12\0123.  **Lesbarkeit und Verständlichkeit:**\12    *   Optimiere die Lesbarkeit durch klare Satzstrukturen, logischen Aufbau und Vermeidung von überlangen Schachtelsätzen.\12    *   Der Text soll leicht verständlich sein, auch für Personen ohne tiefes technisches Fachwissen, es sei denn, der Kontext erfordert explizit Fachsprache.\12    *   Verwende aktive Formulierungen, wo passend.\12\0124.  **Klarheit und Prägnanz:**\12    *   Die Kernbotschaft des Textes muss eindeutig und auf den Punkt gebracht sein.\12    *   Entferne redundante Informationen und formuliere so prägnant wie möglich, ohne wichtige Details auszulassen.\12\0125.  **Zweck und Kontext des Textes:**\12    *   Passe den Stil und die Tonalität an den jeweiligen Zweck des Dokuments an (z.B. formeller bei Rechnungen und Angeboten, etwas empathischer bei Support-Anfragen, überzeugender bei Marketing-Texten).\12    *   Identifiziere den beabsichtigten Empfänger und richte die Sprache entsprechend aus.\12\0126.  **Verbesserungsvorschläge (optional):**\12    *   Gib, wo sinnvoll, alternative Formulierungen an.\12    *   Wenn du signifikante stilistische oder strukturelle Änderungen vornimmst, kannst du optional in eckigen Klammern kurz den Grund erläutern (z.B. \"[Kürzer und direkter]\" oder \"[Freundlichere Formulierung]\").\12")))
 '(mml-secure-key-preferences
   '((OpenPGP
      (sign
       ("alain.lafon@dispatched.ch"
        "D465337B218A0216ECDC368E137099B38E1FC0E9")
       ("lafo@zhaw.ch" "D465337B218A0216ECDC368E137099B38E1FC0E9")
       ("alain@200ok.ch" "D465337B218A0216ECDC368E137099B38E1FC0E9"))
      (encrypt
       ("alain.lafon@dispatched.ch"
        "D465337B218A0216ECDC368E137099B38E1FC0E9")
       ("lafo@zhaw.ch" "D465337B218A0216ECDC368E137099B38E1FC0E9")
       ("alain@200ok.ch" "D465337B218A0216ECDC368E137099B38E1FC0E9")
       ("alain@zen-tempel.ch"
        "D465337B218A0216ECDC368E137099B38E1FC0E9")
       ("tpo@sourcepole.ch" "549A598550F2C6DB416F287C9EF854EDFC992520")))
     (CMS (sign) (encrypt))))
 '(org-agenda-files
   '("/home/munen/Dropbox/org/things.org"
     "/home/munen/Dropbox/org/reference.org"
     "/home/munen/Dropbox/org/media.org"
     "/home/munen/Dropbox/org/shared_with_monika/shared_alain_and_monika.org"
     "/home/munen/src/200ok/admin/THINGS.org"))
 '(org-download-heading-lvl nil)
 '(org-download-image-dir "./images")
 '(org-habit-graph-column 90)
 '(org-html-htmlize-output-type 'inline-css)
 '(org-image-actual-width 720)
 '(org-latex-text-markup-alist
   '((bold . "\\textbf{%s}") (code . protectedtexttt)
     (italic . "\\emph{%s}") (strike-through . "\\sout{%s}")
     (underline . "\\uline{%s}") (verbatim . "%s")))
 '(org-log-into-drawer t)
 '(org-modules
   '(ol-bbdb ol-bibtex ol-docview ol-eww ol-gnus org-habit ol-info ol-irc
             ol-mhe ol-rmail ol-w3m))
 '(org-safe-remote-resources
   '("\\`https://zen-temple\\.net/wp-content/uploads/2021/08/lambda_parking\\.png\\'"
     "\\`https://screenshots\\.200ok\\.ch\\(?:/\\|\\'\\)"))
 '(org-table-copy-increment nil)
 '(package-selected-packages
   '(ac-cider ac-js2 ace-window adaptive-wrap ag aidermacs atomic-chrome
              auto-complete beacon browse-kill-ring cider clipmon
              clj-refactor clojure-mode closql codeium coffee-mode
              comment-tags counsel-jq darktooth-theme dash diminish
              dired-narrow dumb-jump eat edit-indirect edit-server
              editorconfig elfeed elfeed-goodies elfeed-org
              emacs-everywhere enh-ruby-mode erc-image evil
              evil-escape evil-leader evil-mc evil-numbers
              evil-surround exec-path-from-shell fixme-mode flycheck
              flycheck-clj-kondo flycheck-flow flycheck-package forge
              ggtags gnuplot gptel graphviz-dot-mode handlebars-mode
              haskell-mode hcl-mode hl-todo ido-vertical-mode
              impatient-mode intero js-comint js2-mode js2-refactor
              json-mode keycast ledger-mode logview magit magit-delta
              magit-section markdown-mode mcp mustache-mode
              ob-restclient org org-ai org-download org-mime org-ql
              package-lint parinfer pdf-tools projectile rainbow-mode
              restclient rfc-mode rjsx-mode robe rust-mode sass-mode
              seeing-is-believing smex solarized-theme sops spaceline
              spacemacs-theme tern tern-auto-complete tide transient
              tree-sitter tree-sitter-langs undo-tree web-mode
              which-key whisper with-editor writegood-mode
              writeroom-mode yaml-mode zenburn-theme))
 '(password-word-equivalents
   '("password" "passcode" "passphrase" "pass phrase" "pin"
     "decryption key" "encryption key" "암호" "パスワード"
     "ପ୍ରବେଶ ସଙ୍କେତ" "ពាក្យសម្ងាត់" "adgangskode" "contraseña"
     "contrasenya" "geslo" "hasło" "heslo" "iphasiwedi" "jelszó"
     "lösenord" "lozinka" "mật khẩu" "mot de passe" "parola"
     "pasahitza" "passord" "passwort" "pasvorto" "salasana" "senha"
     "slaptažodis" "wachtwoord" "كلمة السر" "ססמה" "лозинка" "пароль"
     "गुप्तशब्द" "शब्दकूट" "પાસવર્ડ" "సంకేతపదము" "ਪਾਸਵਰਡ" "ಗುಪ್ತಪದ"
     "கடவுச்சொல்" "അടയാളവാക്ക്" "গুপ্তশব্দ" "পাসওয়ার্ড" "රහස්පදය" "密码"
     "verification code"))
 '(safe-local-variable-values
   '((eval progn
           (defvar user-cider-path-configs
             '(("munen"
                ("/home/alephdam/modules/ravenna"
                 . "/home/munen/src/200ok/alephdam/modules/ravenna")
                ("/home/alephdam" . "/home/munen"))
               ("phil"
                ("/home/alephdam/modules/ravenna"
                 . "/home/phil/src/ok/alephdam/modules/ravenna")
                ("/home/alephdam" . "/home/phil"))))
           (let ((current-user (getenv "USER")))
             (setq cider-path-translations
                   (cdr (assoc current-user user-cider-path-configs)))))
     (eval progn
           (setq cider-path-translations
                 '(("/home/alephdam/alephdam/modules/ravenna"
                    . "/home/munen/src/200ok/alephdam/modules/ravenna")
                   ("/home/alephdam" . "/home/munen"))))
     (eval progn
           (setq gptel-read-file-ignore-patterns
                 (setq cider-path-translations
                       '(("/home/alephdam/alephdam"
                          . "/home/munen/src/200ok/alephdam")))))
     (eval progn
           (setq gptel-read-file-ignore-patterns
                 '("doc/*" "fixtures/*" "recordings/*" "dev/*"
                   "resources/*" "config/*" ".sourceme" ".sourceme/*"
                   "logs/*" "local/*" "systems/*" "cache/*" "bin/*"
                   "ctx.clj" "repomix.md" "gitleaks-baseline.json"
                   "*_test.clj" "*.org"))
           (setq cider-ns-code-reload-tool "cider.clj-reload/reload")
           (setq sql-postgres-login-params
                 '((user :default "postgres")
                   (database :default "alephdam_events")
                   (server :default "localhost") (port :default 5432))))
     (eval and (fboundp 'toc-org-mode) (toc-org-mode 1))
     (toc-org-max-depth . 4)
     (eval progn
           (setq cider-ns-code-reload-tool "cider.clj-reload/reload")
           (setq sql-postgres-login-params
                 '((user :default "postgres")
                   (database :default "alephdam_events")
                   (server :default "localhost") (port :default 5432))))
     (eval progn
           (load
            (concat (projectile-project-root)
                    "src/org-ok-estimations/org-ok-estimations"))
           (org-babel-lob-ingest
            (concat (projectile-project-root) "common.org"))
           (custom-set-variables
            '(org-latex-text-markup-alist
              '((bold . "\\textbf{%s}") (code . protectedtexttt)
                (italic . "\\emph{%s}")
                (strike-through . "\\sout{%s}")
                (underline . "\\uline{%s}") (verbatim . "%s")))
            '(org-download-heading-lvl nil)
            '(org-download-image-dir "./images")
            '(org-image-actual-width 720))
           (defun bottom-right (table-name)
             "Get the bottom right value from the Org mode table with the given name."
             (save-excursion
               (goto-char (point-min))
               (search-forward (concat "#+NAME: " table-name))
               (let ((table (org-table-to-lisp)))
                 (let ((last-row (car (last table))))
                   (car (last last-row))))))
           (defun autocalc-clocktable nil
             (when (derived-mode-p 'org-mode)
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
                       (goto-char (search-forward "clocktable"))
                       (org-clock-report))))))
           (add-hook 'before-save-hook 'autocalc-clocktable)
           (defun ok-add-number-grouping (number &optional separator)
             "Add commas to NUMBER and return it as a string. Optional\12         SEPARATOR is the string to use to separate groups. It\12         defaults to a apostrophe."
             (let
                 ((num
                   (if (floatp number) (format "%0.2f" number)
                     (number-to-string number)))
                  (op (or separator "'")))
               (while
                   (string-match
                    "\\(.*[0-9]\\)\\([0-9][0-9][0-9].*\\)" num)
                 (setq num
                       (concat (match-string 1 num) op
                               (match-string 2 num))))
               num))
           (defmacro ok-org-get-var (name)
             "Retrieves an org-variable NAME and casts it into a number."
             `(string-to-number (org-sbe ,name)))
           (defun org-table-result (table)
             "The very last cell, which is typically the result of a spreadsheet."
             (car (last (car (last table)))))
           (defun ok-number-as-chf (number)
             "Take a NUMBER, format and return it like 'CHF 12'345.-' If the NUMBER is a float, then the precision is ."
             (concat "CHF "
                     (ok-add-number-grouping
                      (if (stringp number) (string-to-number number)
                        number))
                     (if (floatp number) "" ".-"))))
     (eval org-babel-lob-ingest "../common.org")
     (eval progn
           (load
            (concat (projectile-project-root)
                    "src/org-ok-estimations/org-ok-estimations"))
           (org-babel-lob-ingest
            (concat (projectile-project-root) "common.org"))
           (custom-set-variables
            '(org-latex-text-markup-alist
              '((bold . "\\textbf{%s}") (code . protectedtexttt)
                (italic . "\\emph{%s}")
                (strike-through . "\\sout{%s}")
                (underline . "\\uline{%s}") (verbatim . "%s")))
            '(org-download-heading-lvl nil)
            '(org-download-image-dir "./images")
            '(org-image-actual-width 720))
           (defun autocalc-clocktable nil
             (when (derived-mode-p 'org-mode)
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
                       (goto-char (search-forward "clocktable"))
                       (org-clock-report))))))
           (add-hook 'before-save-hook 'autocalc-clocktable)
           (defun ok-add-number-grouping (number &optional separator)
             "Add commas to NUMBER and return it as a string. Optional\12         SEPARATOR is the string to use to separate groups. It\12         defaults to a apostrophe."
             (let
                 ((num
                   (if (floatp number) (format "%0.2f" number)
                     (number-to-string number)))
                  (op (or separator "'")))
               (while
                   (string-match
                    "\\(.*[0-9]\\)\\([0-9][0-9][0-9].*\\)" num)
                 (setq num
                       (concat (match-string 1 num) op
                               (match-string 2 num))))
               num))
           (defmacro ok-org-get-var (name)
             "Retrieves an org-variable NAME and casts it into a number."
             `(string-to-number (org-sbe ,name)))
           (defun org-table-result (table)
             "The very last cell, which is typically the result of a spreadsheet."
             (car (last (car (last table)))))
           (defun ok-number-as-chf (number)
             "Take a NUMBER, format and return it like 'CHF 12'345.-' If the NUMBER is a float, then the precision is ."
             (concat "CHF "
                     (ok-add-number-grouping
                      (if (stringp number) (string-to-number number)
                        number))
                     (if (floatp number) "" ".-"))))
     (org-latex-pdf-process
      "xelatex -shell-escape -interaction nonstopmode -output-directory %o %f"
      "xelatex -shell-escape -interaction nonstopmode -output-directory %o %f"
      "xelatex -shell-escape -interaction nonstopmode -output-directory %o %f")
     (eval progn
           (custom-set-variables
            '(org-latex-text-markup-alist
              '((bold . "\\textbf{%s}") (code . protectedtexttt)
                (italic . "\\emph{%s}")
                (strike-through . "\\sout{%s}")
                (underline . "\\uline{%s}") (verbatim . "%s")))
            '(org-download-heading-lvl nil)
            '(org-download-image-dir "./images")
            '(org-image-actual-width 720))
           (defun autocalc-clocktable nil
             (when (derived-mode-p 'org-mode)
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
                       (goto-char (search-forward "clocktable"))
                       (org-clock-report))))))
           (add-hook 'before-save-hook 'autocalc-clocktable)
           (defun ok-add-number-grouping (number &optional separator)
             "Add commas to NUMBER and return it as a string. Optional\12         SEPARATOR is the string to use to separate groups. It\12         defaults to a apostrophe."
             (let
                 ((num
                   (if (floatp number) (format "%0.2f" number)
                     (number-to-string number)))
                  (op (or separator "'")))
               (while
                   (string-match
                    "\\(.*[0-9]\\)\\([0-9][0-9][0-9].*\\)" num)
                 (setq num
                       (concat (match-string 1 num) op
                               (match-string 2 num))))
               num))
           (defmacro ok-org-get-var (name)
             "Retrieves an org-variable NAME and casts it into a number."
             `(string-to-number (org-sbe ,name)))
           (defun org-table-result (table)
             "The very last cell, which is typically the result of a spreadsheet."
             (car (last (car (last table)))))
           (defun ok-number-as-chf (number)
             "Take a NUMBER, format and return it like 'CHF 12'345.-' If the NUMBER is a float, then the precision is ."
             (concat "CHF "
                     (ok-add-number-grouping
                      (if (stringp number) (string-to-number number)
                        number))
                     (if (floatp number) "" ".-"))))
     (eval org-babel-lob-ingest "../../../../common.org")
     (eval progn
           (custom-set-variables
            '(org-latex-text-markup-alist
              '((bold . "\\textbf{%s}") (code . protectedtexttt)
                (italic . "\\emph{%s}")
                (strike-through . "\\sout{%s}")
                (underline . "\\uline{%s}") (verbatim . "%s")))
            '(org-download-heading-lvl nil)
            '(org-download-image-dir "./images")
            '(org-image-actual-width 720))
           (defun autocalc-clocktable nil
             (when (derived-mode-p 'org-mode)
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
                       (goto-char (search-forward "clocktable"))
                       (org-clock-report))))))
           (add-hook 'before-save-hook 'autocalc-clocktable)
           (defun ok-add-number-grouping (number &optional separator)
             "Add commas to NUMBER and return it as a string. Optional\12         SEPARATOR is the string to use to separate groups. It\12         defaults to a apostrophe."
             (let
                 ((num
                   (if (floatp number) (format "%0.2f" number)
                     (number-to-string number)))
                  (op (or separator "'")))
               (while
                   (string-match
                    "\\(.*[0-9]\\)\\([0-9][0-9][0-9].*\\)" num)
                 (setq num
                       (concat (match-string 1 num) op
                               (match-string 2 num))))
               num))
           (defmacro ok-org-get-var (name)
             "Retrieves an org-variable NAME and casts it into a number."
             `(string-to-number (org-sbe ,name)))
           (defun ok-number-as-chf (number)
             "Take a NUMBER, format and return it like 'CHF 12'345.-' If the NUMBER is a float, then the precision is ."
             (concat "CHF "
                     (ok-add-number-grouping
                      (if (stringp number) (string-to-number number)
                        number))
                     (if (floatp number) "" ".-"))))
     (org-treat-insert-todo-heading-as-state-change . t)
     (eval org-babel-lob-ingest "../common-pm.org")
     (org-treat-insert-todo-heading-as-state-change . 1)
     (eval setq org-treat-insert-todo-heading-as-state-change t)
     (eval progn
           (custom-set-variables
            '(org-latex-text-markup-alist
              '((bold . "\\textbf{%s}") (code . protectedtexttt)
                (italic . "\\emph{%s}")
                (strike-through . "\\sout{%s}")
                (underline . "\\uline{%s}") (verbatim . "%s")))
            '(org-download-heading-lvl nil)
            '(org-download-image-dir "./images")
            '(org-image-actual-width 720))
           (defun autocalc-clocktable nil
             (when (derived-mode-p 'org-mode)
               (save-excursion
                 (goto-char 0)
                 (if (search-forward "#+AUTOCALC_CLOCKTABLES: t")
                     (progn
                       (goto-char (search-forward "clocktable"))
                       (org-clock-report))))))
           (add-hook 'before-save-hook 'autocalc-clocktable)
           (defun ok-add-number-grouping (number &optional separator)
             "Add commas to NUMBER and return it as a string. Optional\12         SEPARATOR is the string to use to separate groups. It\12         defaults to a apostrophe."
             (let
                 ((num
                   (if (floatp number) (format "%0.2f" number)
                     (number-to-string number)))
                  (op (or separator "'")))
               (while
                   (string-match
                    "\\(.*[0-9]\\)\\([0-9][0-9][0-9].*\\)" num)
                 (setq num
                       (concat (match-string 1 num) op
                               (match-string 2 num))))
               num))
           (defmacro ok-org-get-var (name)
             "Retrieves an org-variable NAME and casts it into a number."
             `(string-to-number (org-sbe ,name)))
           (defun ok-number-as-chf (number)
             "Take a NUMBER, format and return it like 'CHF 12'345.-' If the NUMBER is a float, then the precision is ."
             (concat "CHF "
                     (ok-add-number-grouping
                      (if (stringp number) (string-to-number number)
                        number))
                     (if (floatp number) "" ".-"))))
     (eval org-babel-lob-ingest "../../common.org")
     (org-latex-pdf-process
      "pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f"
      "pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f"
      "pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f")
     (eval org-babel-lob-ingest "common.org")
     (eval org-babel-lob-ingest "../../../common.org")
     (eval progn
           (custom-set-variables
            '(org-latex-text-markup-alist
              '((bold . "\\textbf{%s}") (code . protectedtexttt)
                (italic . "\\emph{%s}")
                (strike-through . "\\sout{%s}")
                (underline . "\\uline{%s}") (verbatim . "%s")))
            '(org-download-heading-lvl nil)
            '(org-download-image-dir "./images")
            '(org-image-actual-width 720))
           (defun autocalc-clocktable nil
             (if (string-equal "bluewin.org" (buffer-name))
                 (save-excursion
                   (goto-char 0)
                   (goto-char (search-forward "clocktable"))
                   (org-clock-report))))
           (add-hook 'before-save-hook 'autocalc-clocktable)
           (defun ok-add-number-grouping (number &optional separator)
             "Add commas to NUMBER and return it as a string. Optional\12         SEPARATOR is the string to use to separate groups. It\12         defaults to a apostrophe."
             (let
                 ((num
                   (if (floatp number) (format "%0.2f" number)
                     (number-to-string number)))
                  (op (or separator "'")))
               (while
                   (string-match
                    "\\(.*[0-9]\\)\\([0-9][0-9][0-9].*\\)" num)
                 (setq num
                       (concat (match-string 1 num) op
                               (match-string 2 num))))
               num))
           (defmacro ok-org-get-var (name)
             "Retrieves an org-variable NAME and casts it into a number."
             `(string-to-number (org-sbe ,name)))
           (defun ok-number-as-chf (number)
             "Take a NUMBER, format and return it like 'CHF 12'345.-' If the NUMBER is a float, then the precision is ."
             (concat "CHF "
                     (ok-add-number-grouping
                      (if (stringp number) (string-to-number number)
                        number))
                     (if (floatp number) "" ".-"))))
     (eval progn
           (custom-set-variables
            '(org-latex-text-markup-alist
              '((bold . "\\textbf{%s}") (code . protectedtexttt)
                (italic . "\\emph{%s}")
                (strike-through . "\\sout{%s}")
                (underline . "\\uline{%s}") (verbatim . "%s")))
            '(org-download-heading-lvl nil)
            '(org-download-image-dir "./images")
            '(org-image-actual-width 720))
           (defun autocalc-clocktable nil
             (save-excursion
               (goto-char 0) (goto-char (search-forward "clocktable"))
               (org-clock-report)))
           (add-hook 'before-save-hook 'autocalc-clocktable)
           (defun ok-add-number-grouping (number &optional separator)
             "Add commas to NUMBER and return it as a string. Optional\12         SEPARATOR is the string to use to separate groups. It\12         defaults to a apostrophe."
             (let
                 ((num
                   (if (floatp number) (format "%0.2f" number)
                     (number-to-string number)))
                  (op (or separator "'")))
               (while
                   (string-match
                    "\\(.*[0-9]\\)\\([0-9][0-9][0-9].*\\)" num)
                 (setq num
                       (concat (match-string 1 num) op
                               (match-string 2 num))))
               num))
           (defmacro ok-org-get-var (name)
             "Retrieves an org-variable NAME and casts it into a number."
             `(string-to-number (org-sbe ,name)))
           (defun ok-number-as-chf (number)
             "Take a NUMBER, format and return it like 'CHF 12'345.-' If the NUMBER is a float, then the precision is ."
             (concat "CHF "
                     (ok-add-number-grouping
                      (if (stringp number) (string-to-number number)
                        number))
                     (if (floatp number) "" ".-"))))
     (eval progn
           (custom-set-variables
            '(org-latex-text-markup-alist
              '((bold . "\\textbf{%s}") (code . protectedtexttt)
                (italic . "\\emph{%s}")
                (strike-through . "\\sout{%s}")
                (underline . "\\uline{%s}") (verbatim . "%s")))
            '(org-download-heading-lvl nil)
            '(org-download-image-dir "./images")
            '(org-image-actual-width 720))
           (defun autocalc-clocktable (backend)
             (interactive)
             (save-excursion
               (goto-char 0) (goto-char (search-forward "clocktable"))
               (org-clock-report)))
           (add-hook 'before-save-hook 'autocalc-clocktable)
           (defun ok-add-number-grouping (number &optional separator)
             "Add commas to NUMBER and return it as a string. Optional\12         SEPARATOR is the string to use to separate groups. It\12         defaults to a apostrophe."
             (let
                 ((num
                   (if (floatp number) (format "%0.2f" number)
                     (number-to-string number)))
                  (op (or separator "'")))
               (while
                   (string-match
                    "\\(.*[0-9]\\)\\([0-9][0-9][0-9].*\\)" num)
                 (setq num
                       (concat (match-string 1 num) op
                               (match-string 2 num))))
               num))
           (defmacro ok-org-get-var (name)
             "Retrieves an org-variable NAME and casts it into a number."
             `(string-to-number (org-sbe ,name)))
           (defun ok-number-as-chf (number)
             "Take a NUMBER, format and return it like 'CHF 12'345.-' If the NUMBER is a float, then the precision is ."
             (concat "CHF "
                     (ok-add-number-grouping
                      (if (stringp number) (string-to-number number)
                        number))
                     (if (floatp number) "" ".-"))))
     (eval progn
           (custom-set-variables
            '(org-latex-text-markup-alist
              '((bold . "\\textbf{%s}") (code . protectedtexttt)
                (italic . "\\emph{%s}")
                (strike-through . "\\sout{%s}")
                (underline . "\\uline{%s}") (verbatim . "%s")))
            '(org-download-heading-lvl nil)
            '(org-download-image-dir "./images")
            '(org-image-actual-width 720))
           (defun autocalc-clocktable (backend)
             (save-excursion
               (goto-char 0) (goto-char (search-forward "clocktable"))
               (org-clock-report)))
           (add-hook 'before-save-hook 'autocalc-clocktable)
           (defun ok-add-number-grouping (number &optional separator)
             "Add commas to NUMBER and return it as a string. Optional\12         SEPARATOR is the string to use to separate groups. It\12         defaults to a apostrophe."
             (let
                 ((num
                   (if (floatp number) (format "%0.2f" number)
                     (number-to-string number)))
                  (op (or separator "'")))
               (while
                   (string-match
                    "\\(.*[0-9]\\)\\([0-9][0-9][0-9].*\\)" num)
                 (setq num
                       (concat (match-string 1 num) op
                               (match-string 2 num))))
               num))
           (defmacro ok-org-get-var (name)
             "Retrieves an org-variable NAME and casts it into a number."
             `(string-to-number (org-sbe ,name)))
           (defun ok-number-as-chf (number)
             "Take a NUMBER, format and return it like 'CHF 12'345.-' If the NUMBER is a float, then the precision is ."
             (concat "CHF "
                     (ok-add-number-grouping
                      (if (stringp number) (string-to-number number)
                        number))
                     (if (floatp number) "" ".-"))))
     (eval progn
           (custom-set-variables
            '(org-latex-text-markup-alist
              '((bold . "\\textbf{%s}") (code . protectedtexttt)
                (italic . "\\emph{%s}")
                (strike-through . "\\sout{%s}")
                (underline . "\\uline{%s}") (verbatim . "%s")))
            '(org-download-heading-lvl nil)
            '(org-download-image-dir "./images")
            '(org-image-actual-width 720))
           (defun ok-add-number-grouping (number &optional separator)
             "Add commas to NUMBER and return it as a string. Optional\12         SEPARATOR is the string to use to separate groups. It\12         defaults to a apostrophe."
             (let
                 ((num
                   (if (floatp number) (format "%0.2f" number)
                     (number-to-string number)))
                  (op (or separator "'")))
               (while
                   (string-match
                    "\\(.*[0-9]\\)\\([0-9][0-9][0-9].*\\)" num)
                 (setq num
                       (concat (match-string 1 num) op
                               (match-string 2 num))))
               num))
           (defmacro ok-org-get-var (name)
             "Retrieves an org-variable NAME and casts it into a number."
             `(string-to-number (org-sbe ,name)))
           (defun ok-number-as-chf (number)
             "Take a NUMBER, format and return it like 'CHF 12'345.-' If the NUMBER is a float, then the precision is ."
             (concat "CHF "
                     (ok-add-number-grouping
                      (if (stringp number) (string-to-number number)
                        number))
                     (if (floatp number) "" ".-"))))
     (org-download-image-dir . "./images")
     (eval progn
           (custom-set-variables
            '(org-latex-text-markup-alist
              '((bold . "\\textbf{%s}") (code . protectedtexttt)
                (italic . "\\emph{%s}")
                (strike-through . "\\sout{%s}")
                (underline . "\\uline{%s}") (verbatim . "%s")))
            '(org-download-heading-lvl nil))
           (defun ok-add-number-grouping (number &optional separator)
             "Add commas to NUMBER and return it as a string. Optional\12         SEPARATOR is the string to use to separate groups. It\12         defaults to a apostrophe."
             (let
                 ((num
                   (if (floatp number) (format "%0.2f" number)
                     (number-to-string number)))
                  (op (or separator "'")))
               (while
                   (string-match
                    "\\(.*[0-9]\\)\\([0-9][0-9][0-9].*\\)" num)
                 (setq num
                       (concat (match-string 1 num) op
                               (match-string 2 num))))
               num))
           (defmacro ok-org-get-var (name)
             "Retrieves an org-variable NAME and casts it into a number."
             `(string-to-number (org-sbe ,name)))
           (defun ok-number-as-chf (number)
             "Take a NUMBER, format and return it like 'CHF 12'345.-' If the NUMBER is a float, then the precision is ."
             (concat "CHF "
                     (ok-add-number-grouping
                      (if (stringp number) (string-to-number number)
                        number))
                     (if (floatp number) "" ".-"))))
     (eval progn
           (setq sql-postgres-login-params
                 '((user :default "postgres")
                   (database :default "alephdam_events")
                   (server :default "localhost") (port :default 5432))))
     (eval progn
           (custom-set-variables
            '(org-latex-text-markup-alist
              '((bold . "\\textbf{%s}") (code . protectedtexttt)
                (italic . "\\emph{%s}")
                (strike-through . "\\sout{%s}")
                (underline . "\\uline{%s}") (verbatim . "%s"))))
           (defun ok-add-number-grouping (number &optional separator)
             "Add commas to NUMBER and return it as a string. Optional\12         SEPARATOR is the string to use to separate groups. It\12         defaults to a apostrophe."
             (let
                 ((num
                   (if (floatp number) (format "%0.2f" number)
                     (number-to-string number)))
                  (op (or separator "'")))
               (while
                   (string-match
                    "\\(.*[0-9]\\)\\([0-9][0-9][0-9].*\\)" num)
                 (setq num
                       (concat (match-string 1 num) op
                               (match-string 2 num))))
               num))
           (defmacro ok-org-get-var (name)
             "Retrieves an org-variable NAME and casts it into a number."
             `(string-to-number (org-sbe ,name)))
           (defun ok-number-as-chf (number)
             "Take a NUMBER, format and return it like 'CHF 12'345.-' If the NUMBER is a float, then the precision is ."
             (concat "CHF "
                     (ok-add-number-grouping
                      (if (stringp number) (string-to-number number)
                        number))
                     (if (floatp number) "" ".-"))))
     (eval progn
           (custom-set-variables
            '(org-latex-text-markup-alist
              '((bold . "\\textbf{%s}") (code . protectedtexttt)
                (italic . "\\emph{%s}")
                (strike-through . "\\sout{%s}")
                (underline . "\\uline{%s}") (verbatim . "%s"))))
           (defun ok-add-number-grouping (number &optional separator)
             "Add commas to NUMBER and return it as a string. Optional\12         SEPARATOR is the string to use to separate groups. It\12         defaults to a apostrophe."
             (let
                 ((num
                   (if (floatp number) (format "%0.2f" number)
                     (number-to-string number)))
                  (op (or separator "'")))
               (while
                   (string-match
                    "\\(.*[0-9]\\)\\([0-9][0-9][0-9].*\\)" num)
                 (setq num
                       (concat (match-string 1 num) op
                               (match-string 2 num))))
               num))
           (defun ok-number-as-chf (number)
             "Take a NUMBER, format and return it like 'CHF 12'345.-' If the NUMBER is a float, then the precision is ."
             (concat "CHF " (ok-add-number-grouping number)
                     (if (floatp number) "" ".-"))))
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
