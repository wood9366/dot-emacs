(use-package magit
  :ensure t
  :init
  (evil-leader/set-key "x g" 'magit-status)
  (evil-define-key 'normal magit-mode-map "q"
    (lambda() (interactive) (magit-mode-quit-window (current-buffer))))
  :config
  (fullframe magit-status magit-mode-quit-window))

(use-package evil-magit
  :ensure t
  :after (magit)
  :requires (evil))

(provide 'config-magit)
