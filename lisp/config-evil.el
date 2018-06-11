(use-package evil
  :ensure t
  :init
  (add-hook 'after-init-hook 'evil-mode))

(use-package evil-leader
  :ensure t
  :requires (evil)
  :init
  (add-hook 'after-init-hook 'global-evil-leader-mode)
  :config
  (evil-leader/set-leader ","))

(use-package evil-surround
  :ensure t
  :requires (evil)
  :init
  (add-hook 'after-init-hook 'global-evil-surround-mode))

(provide 'config-evil)
