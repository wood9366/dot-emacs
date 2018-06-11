(use-package evil
  :ensure t
  :init
  (add-hook 'after-init-hook 'evil-mode))

(use-package evil-leader
  :ensure t
  :init
  (add-hook 'after-init-hook 'global-evil-leader-mode)
  :requires (evil)
  :config
  (evil-leader/set-leader ","))

(provide 'config-evil)
