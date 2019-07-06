(defun wood9366/org-mode-hook ()
  (add-hook 'completion-at-point-functions 'pcomplete-completions-at-point nil t))

(setq org-capture-templates
      '(
        ("n" "note" entry (file "~/scratch/notes.org")
         "* %U %? %^g\n")))

(setq org-default-notes-file "~/scratch/notes.org")
(setq org-agenda-files '("~/note/note" "~/scratch"))
(evil-leader/set-key "cc" 'org-capture)
(evil-leader/set-key "ca" 'org-agenda)
(evil-leader/set-key "cn" (lambda () (interactive) (find-file "~/scratch/notes.org")))

(add-hook 'org-mode-hook #'wood9366/org-mode-hook)

(provide 'config-org)
