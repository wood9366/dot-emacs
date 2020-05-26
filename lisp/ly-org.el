
;; export org to html
(use-package htmlize
  :ensure t
  :defer t)

;; export org to reveal
(use-package ox-reveal
  :ensure t
  :after org
  :config
  (setq org-reveal-root (concat "file://"
                                (expand-file-name (concat user-emacs-directory
                                                          "third/reveal.js")))))

;; auto refresh preview picture after change babel
(add-hook 'org-babel-after-execute-hook 'org-redisplay-inline-images)

(use-package org
  :defer t
  :config
  (setq org-capture-templates
        '(("t" "todo" entry (file "~/QQCloud/note/_gtd.org")
           "* TODO %?\n:PROPERTIES:\n:CREATED: %T\n:END:\n")
          ("p" "plan" entry (file "~/QQCloud/note/plan.org")
           "* TODO Tasks %<%Y-%m-%d> [/]")
          ("n" "note" entry (file+datetree "~/QQCloud/note/note.org")
           "* %? %^G\n%T\n")
          ("c" "scratch" entry (file "")
           "* %T %?\n")))

  (setq org-default-notes-file "~/QQCloud/note/_scratch.org")
  (setq org-agenda-files '("~/QQCloud/note"))

  ;; (defun wood9366/refresh-agenda-files ()
  ;;   (interactive)
  ;;   (dolist (dir wood9366/org-agenda-dirs)
  ;;     (dolist (file (directory-files-recursively dir org-agenda-file-regexp))
  ;;       (add-to-list 'org-agenda-files file t))))

  ;; (wood9366/refresh-agenda-files)
  )

(general-create-definer ly/org-def
  :prefix ", c")

(ly/org-def '(normal visual)
            "" '(nil :wk "org")
            "c" '(org-capture :wk "capture")
            "a" '(org-agenda :wk "agenda"))

(provide 'ly-org)
