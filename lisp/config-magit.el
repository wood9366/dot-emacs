(use-package magit
  :ensure t
  :config
  (evil-leader/set-key "gg" 'magit-status))

(use-package evil-magit
  :ensure t
  :after (magit evil))

(provide 'config-magit)
