(use-package evil
  :ensure t
  :custom
  (evil-want-abbrev-expand-on-insert-exit nil)
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

(use-package evil-matchit
  :ensure t
  :requires (evil)
  :init
  (add-hook 'after-init-hook 'global-evil-matchit-mode)) 

(provide 'config-evil)
