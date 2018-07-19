(defun wood9366/org-mode-hook ()
  (add-hook 'completion-at-point-functions 'pcomplete-completions-at-point nil t))

(add-hook 'org-mode-hook #'wood9366/org-mode-hook)

(provide 'config-org)
