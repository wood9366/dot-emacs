(use-package evil
  :ensure t
  :hook (after-init . evil-mode)
  :custom
  (evil-want-integration t)
  (evil-want-keybinding nil)
  (evil-want-abbrev-expand-on-insert-exit nil)
  (evil-kill-on-visual-paste nil))

(use-package evil-escape
  :requires evil
  :ensure t
  :hook (after-init . evil-escape-mode)
  :custom
  (evil-escape-key-sequence "kj"))

(use-package evil-surround
  :requires evil
  :ensure t
  :hook (after-init . evil-surround-mode))

(use-package evil-collection
  :requires evil
  :ensure t)

(when _term_
  (use-package evil-terminal-cursor-changer
    :requires evil
    :ensure t
    :hook (after-init . etcc-on)
    :config
    (setq evil-motion-state-cursor 'box  ; █
          evil-visual-state-cursor 'box  ; █
          evil-normal-state-cursor 'box  ; █
          evil-insert-state-cursor 'bar  ; ⎸
          evil-emacs-state-cursor  'hbar) ; _
    ))

(provide 'config-evil)
