(use-package magit
  :ensure t)

(use-package evil-magit
  :ensure t
  :after (magit evil)
  :config
  (evil-leader/set-key "gg" 'magit-status))

(provide 'config-magit)
