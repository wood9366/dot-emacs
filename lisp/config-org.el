(defun wood9366/org-mode-hook ()
  (add-hook 'completion-at-point-functions 'pcomplete-completions-at-point nil t))

(setq org-capture-templates
      '(("t" "todo" entry (file "~/note/_gtd.org")
         "* TODO %?\n:PROPERTIES:\n:CREATED: %T\n:END:\n")
        ("n" "note" entry (file+datetree "~/note/note.org")
         "* %? %^G\n%T\n")))

(setq org-default-notes-file "~/note/note.org")
(setq org-agenda-files '("~/note"))
(evil-leader/set-key "cc" 'org-capture)
(evil-leader/set-key "ca" 'org-agenda)
(evil-leader/set-key "cn" (lambda () (interactive) (find-file "~/note/note.org")))



(add-hook 'org-mode-hook #'wood9366/org-mode-hook)

(provide 'config-org)
