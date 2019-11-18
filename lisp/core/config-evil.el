(use-package evil
  :ensure t
  :custom
  (evil-want-integration t)
  (evil-want-keybinding nil)
  (evil-want-abbrev-expand-on-insert-exit nil)
  (evil-kill-on-visual-paste nil)
  :config
  (evil-mode))

(use-package evil-escape
  :requires evil
  :ensure t
  :custom
  (evil-escape-key-sequence "kj")
  :config
  (evil-escape-mode))

(use-package evil-surround
  :requires evil
  :ensure t
  :config
  (evil-surround-mode))

(use-package evil-collection
  :requires evil
  :ensure t)

(when _term_
  (use-package evil-terminal-cursor-changer
    :requires evil
    :ensure t
    :config
    (etcc-on)
    (setq evil-motion-state-cursor 'box  ; █
          evil-visual-state-cursor 'box  ; █
          evil-normal-state-cursor 'box  ; █
          evil-insert-state-cursor 'bar  ; ⎸
          evil-emacs-state-cursor  'hbar) ; _
    ))

(provide 'config-evil)
