(defun munen-gptel--edit-file-v4 (file-path file-edits)
  "Edit FILE-PATH by applying FILE-EDITS (V4) and save changes automatically.

This function directly modifies the file on disk without user confirmation.
Each edit in FILE-EDITS is a plist specifying:
- :search_block - The exact, potentially multi-line, string to search for.
  - If :search_block is empty/nil:
    - If FILE-PATH does not exist, it's created; :replace_block is file content.
    - If FILE-PATH exists, :replace_block is prepended.
- :replace_block - The exact, potentially multi-line, string to replace with.
  - If empty/nil and :search_block is not, :search_block is deleted.

Returns a message indicating success/failure and applied/skipped edits.
WARNING: Modifies files without confirmation - use with caution!"
  (if (and file-path (stringp file-path) (not (string= file-path "")))
      (let ((expanded-file-path (expand-file-name file-path))
            (edits-applied-count 0)
            (failed-searches 0)
            (edit-log-parts '()) ; Accumulate log parts in reverse, then join
            (file-created-or-modified nil))

        (with-current-buffer (get-buffer-create (concat "*edit-file-v2-" (file-name-nondirectory expanded-file-path) "*"))
          (let ((inhibit-read-only t)
                (case-fold-search nil) ; For exact matching
                (original-file-exists (file-exists-p expanded-file-path)))

            (if original-file-exists
                (insert-file-contents expanded-file-path)
              ;; If file doesn't exist, buffer starts empty.
              ;; Creation handled by an edit with empty search_block.
              )

            (if (or (not file-edits) (seq-empty-p file-edits))
                (if original-file-exists
                    (add-to-list 'edit-log-parts (format "No edits provided for existing file %s. File unchanged." expanded-file-path))
                  (add-to-list 'edit-log-parts (format "No edits provided and file %s does not exist. No action taken." expanded-file-path)))
              (dolist (file-edit (seq-into file-edits 'list))
                (let* ((search-str (plist-get file-edit :search_block))
                       (replace-str (or (plist-get file-edit :replace_block) ""))) ; Default replace to "" if nil

                  (if (or (null search-str) (string= search-str ""))
                      ;; Handle empty search_block: create file or prepend
                      (progn
                        (goto-char (point-min))
                        (insert replace-str)
                        (setq file-created-or-modified t)
                        (setq edits-applied-count (1+ edits-applied-count))
                        (add-to-list 'edit-log-parts (format "Applied prepend/create for %s." expanded-file-path)))
                    ;; Handle non-empty search_block: search and replace/delete
                    (progn
                      (goto-char (point-min))
                      (if (search-forward search-str nil t)
                          (progn
                            (replace-match replace-str t t) ; t for fixed-case, t for literal
                            (setq file-created-or-modified t)
                            (setq edits-applied-count (1+ edits-applied-count))
                            (add-to-list 'edit-log-parts (format "Found and processed '%s'." (substring-no-properties search-str 0 (min 30 (length search-str))))))
                        (progn
                          (setq failed-searches (1+ failed-searches))
                          (add-to-list 'edit-log-parts (format "Search block '%s' NOT found." (substring-no-properties search-str 0 (min 30 (length search-str))))))))))))

            (let ((final-log-message (string-join (reverse edit-log-parts) " ")))
              (if file-created-or-modified
                  (progn
                    (make-directory (file-name-directory expanded-file-path) t) ; Ensure dir exists
                    (write-file expanded-file-path nil)
                    (kill-buffer (current-buffer))
                    (format "Successfully applied %d edit(s) to %s. %d search block(s) not found. Log: %s"
                            edits-applied-count expanded-file-path failed-searches final-log-message))
                (progn
                  (kill-buffer (current-buffer)) ; Clean up temp buffer even if no changes
                  (format "No changes applied to %s. Edits attempted: %d. Failed searches: %d. Log: %s"
                          expanded-file-path (+ edits-applied-count failed-searches) failed-searches final-log-message))))))
        (format "Failed to edit (invalid file path provided: '%s')." (or file-path "nil")))))

(gptel-make-tool
 :function #'munen-gptel--edit-file-v4
 :name "edit_file_v4"
 :description "Edits a file non-interactively using search/replace blocks and saves changes.
**Guidance for Use (Inspired by Aider's robust editing):**
1.  **Target File:** Specify the `file-path` for changes.
2.  **Edits Array (`file-edits`):** Provide a list of edit objects. Each object defines one change:
    *   `search_block`: The *exact*, case-sensitive, potentially multi-line string to find.
    *   `replace_block`: The *exact*, potentially multi-line string to replace the `search_block` with.
3.  **Operations:**
    *   **Replace:** `search_block` = text to find, `replace_block` = new text.
    *   **Delete:** `search_block` = text to delete, `replace_block` = \"\" (empty string).
    *   **Create New File:** `file-path` = new path, `file-edits` = `[{ \"search_block\": \"\", \"replace_block\": \"<file_content>\" }]`.
    *   **Prepend to File:** `file-path` = existing path, `file-edits` = `[{ \"search_block\": \"\", \"replace_block\": \"<content_to_prepend>\" }]`.
4.  **Accuracy is Key:** `search_block` must match existing content *exactly*. Include enough surrounding context if needed for uniqueness.
5.  **Sequential Application:** Edits are applied in the order they appear in the `file-edits` list.
**WARNING:** This tool directly modifies and saves files without user confirmation. Use with extreme caution. If a `search_block` is not found, that specific edit is skipped. The file is saved if any edit is successfully applied or if a new file is created."
 :args (list
        '(:name "file-path"
                :type string
                :description "The full path of the file to edit or create.")
        '(:name "file-edits"
                :type array
                :items (:type object
                        :properties (:search_block (:type string :description "The exact, multi-line string to search. Empty for new file/prepend. Must be exact match.")
                                     :replace_block (:type string :description "Replacement string. Empty to delete search_block. Content for new file/prepend.")))
                :description "A list of edit objects. Each object must have 'search_block' (string) and 'replace_block' (string). See main tool description for detailed usage (REPLACE, DELETE, CREATE, PREPEND)."))
 :category "filesystem"
 :include t)
