;;; package --- unofficial dict.cc elisp wrapper
;;; Commentary: This is a wrapper application around the dict.cc translation service
;;; Code:

(defvar dict.cc-url "http://www.dict.cc/")
(defvar res)
(defvar words1)
(defvar words2)
(defvar translations)

(defun extract-words-from-buffer (buffer number)
  "Given a http BUFFER from dict.cc and as NUMBER either '1' or '2', return the translated words."
  (with-current-buffer buffer
    ;; Very hacky. In the HTML results of dict.cc, there's embedded
    ;; JavaScript with the results embedded in two arrays c1Arr and
    ;; c2Arr. Parse those JS Arrays into a list and return it.
    (let* ((js-var (concat "var c" number "Arr = new Array("))
           (begin (+ (string-match js-var (buffer-string))
                     ;; Number of characters until first array element
                     ;; after match point
                     25))
           (end   (if begin
                      (string-match ")" (buffer-string) begin))))
      ;; TODO: Special characters conversion does not work.
      ;; `string-to-multibyte` is obviously the wrong function
      (mapcar #' string-to-multibyte
      (split-string (substring (buffer-string) begin end)
                    "\,")))))

;; (with-current-buffer res
;;   (while (re-search-forward "my_regexp")
;;     (print (match-string 0))))


(defun insert-translation-to-buffer
    (list)
    "Given a LIST of translations, add them to the buffer."
    (when list
      (progn
        (insert (car list))
        (insert "\n"))
      (insert-translation-to-buffer (cdr list))))


(defun initialize-translations-buffer (search-term)
  "Create a new buffer and initializs it with SEARCH-TERM."

  ;; TODO: If a buffer "dict-results" exists, close it

  ;; Get or create a new buffer called "dict-results"
  (get-buffer-create "dict-results")

  (with-current-buffer "dict-results"
    ;; Initialize
    (erase-buffer)
    (org-mode)

    ;; TODO: First create a new minor mode, because local key maps are
    ;; shared between all buffers of the same major mode!
    ;; (local-set-key (kbd "q") '(lambda()
    ;;                             (interactive)
    ;;                             (delete-window)))

    (insert (concat "* Translations for: " search-term "\n\n"))))

(defun main (results)
  "Main logic: Add the dict.cc RESULTS to a results buffer."

  (setq words1 (extract-words-from-buffer results "1"))
  (setq words2 (extract-words-from-buffer results "2"))

  (setq translations (mapcar* (lambda (w1 w2)
                                (concat "|" w1 "|" w2 "|"))
                              words1 words2))

  (with-current-buffer "dict-results"
    ;; Move behind the "Translations for: " header
    (forward-line)
    ;; Add actual data
    (insert-translation-to-buffer translations)
    ;; Move one line up to the last translations row
    (forward-line -1)
    ;; Pretty print the table
    (org-cycle)
    (forward-line 2)
    (insert "\n\nTranslations by http://dict.cc - this is an unofficial app")
    ;; Move to beginning of buffer
    (goto-char (point-min)))

  (split-window)
  (switch-to-buffer "dict-results"))

(defun query-dict.cc (search-term)
  "Query dict.cc with SEARCH-TERM."
  (let ((url-request-method "GET")
        (arg-stuff (concat "?s=" (url-hexify-string search-term))))
    (url-retrieve (concat dict.cc-url arg-stuff)
                  (lambda (status)
                    (setq res (current-buffer))
                    (let ((res (current-buffer)))
                      ;; Debug for REPL
                      ;; (setq res (current-buffer))
                      (main res))))))

(defun dict ()
  "Lookup a word on dict.cc."
  (interactive)
  (let ((word (read-string "Word: " (word-at-point))))

    (initialize-translations-buffer word)

    (query-dict.cc word)

    (other-window 1)))

(provide 'dict)
;;; dict.el ends here
