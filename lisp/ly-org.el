
;; export org to html
(use-package htmlize
  :ensure t
  :defer t)

;; export org to reveal
(use-package ox-reveal
  :ensure t
  :defer t
  :config
  (setq org-reveal-root (concat "file://"
                                (expand-file-name (concat user-emacs-directory
                                                          "third/reveal.js")))))

;; auto refresh preview picture after change babel
(add-hook 'org-babel-after-execute-hook 'org-redisplay-inline-images)

(setq org-capture-templates
      '(("t" "todo" entry (file "~/note/_gtd.org")
         "* TODO %?\n:PROPERTIES:\n:CREATED: %T\n:END:\n")
        ("n" "note" entry (file+datetree "~/note/note.org")
         "* %? %^G\n%T\n")
        ("c" "scratch" entry (file "")
         "* %T %?\n")))

(setq org-default-notes-file "~/note/_scratch.org")
(setq org-agenda-files '("~/note"))

(general-create-definer ly/org-def
  :prefix ", c")

(ly/org-def '(normal visual)
            "" '(nil :wk "org")
            "c" '(org-capture :wk "capture")
            "a" '(org-agenda :wk "agenda"))

(provide 'ly-org)
