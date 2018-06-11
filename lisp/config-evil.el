(use-package evil
  :ensure t
  :init
  (add-hook 'after-init-hook 'evil-mode))

(unless (display-graphic-p)
  (use-package evil-terminal-cursor-changer
    :ensure t
    :requires (evil)
    :init
    (add-hook 'after-init-hook 'etcc-on)
    :config
    (setq evil-motion-state-cursor 'box  ; █
          evil-visual-state-cursor 'box  ; █
          evil-normal-state-cursor 'box  ; █
          evil-insert-state-cursor 'bar  ; ⎸
          evil-emacs-state-cursor  'hbar) ; _
    ))

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

(use-package evil-escape
  :ensure t
  :diminish
  :requires (evil)
  :init
  (add-hook 'after-init-hook 'evil-escape-mode)
  :config
  (setq evil-escape-key-sequence "kj"))

(provide 'config-evil)
