;; custom-set-variables was added by Custom.
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(cider-boot-parameters "cider repl -s wait")
 '(custom-safe-themes
   (quote
    ("d91ef4e714f05fff2070da7ca452980999f5361209e679ee988e3c432df24347" "df3e05e16180d77732ceab47a43f2fcdb099714c1c47e91e8089d2fcf5882ea3" "d09467d742f713443c7699a546c0300db1a75fed347e09e3f178ab2f3aa2c617" "8db4b03b9ae654d4a57804286eb3e332725c84d7cdab38463cb6b97d5762ad26" "85c59044bd46f4a0deedc8315ffe23aa46d2a967a81750360fb8600b53519b8a" default)))
 '(mml-secure-key-preferences
   (quote
    ((OpenPGP
      (sign)
      (encrypt
       ("alain@zen-tempel.ch" "D465337B218A0216ECDC368E137099B38E1FC0E9")
       ("tpo@sourcepole.ch" "549A598550F2C6DB416F287C9EF854EDFC992520")))
     (CMS
      (sign)
      (encrypt)))))
 '(org-agenda-files
   (quote
    ("~/switchdrive/org/things.org" "~/switchdrive/org/inbox.org" "~/Dropbox/ZHAW/web3-unterlagen/README.org" "~/Dropbox/ZHAW/weng-unterlagen/README.org" "~/switchdrive/org/reference.org")))
 '(package-selected-packages
   (quote
    (ob-restclient diminish elfeed spaceline ido-vertical-mode spacemacs-theme solarized-theme editorconfig dired-narrow evil-mc forge edit-server dumb-jump ggtags browse-kill-ring clipmon rainbow-mode beacon js2-refactor graphviz-dot-mode js-comint intero haskell-mode comment-tags handlebars-mode json-mode mustache-mode seeing-is-believing elfeed-goodies elfeed-org zenburn-theme writegood-mode writeroom-mode which-key darktooth-theme magit restclient impatient-mode evil-numbers evil-surround evil-leader evil smex ledger-mode robe enh-ruby-mode markdown-mode projectile coffee-mode tern-auto-complete tern pdf-tools yaml-mode sass-mode fixme-mode flycheck-flow ac-js2 js2-mode ac-cider exec-path-from-shell cider clj-refactor parinfer clojure-mode web-mode auto-complete flycheck ag)))
 '(safe-local-variable-values
   (quote
    ((cider-ns-refresh-after-fn . "integrant.repl/resume")
     (cider-ns-refresh-before-fn . "integrant.repl/suspend")
     (Epa-file-encrypt-to "munen@200ok.ch")))))

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
