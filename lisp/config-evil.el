(use-package evil
  :ensure t
  :diminish "e"
  :init
  (setq evil-want-integration t)
  (setq evil-want-keybinding nil)
  (add-hook 'after-init-hook 'evil-mode)
  :custom
  (evil-want-abbrev-expand-on-insert-exit nil)
  (evil-kill-on-visual-paste nil)
  :config
  (evil-global-set-key 'normal (kbd "g o") 'xref-find-references))

(use-package evil-escape
  :ensure t
  :requires evil
  :diminish
  :config
  (setq evil-escape-key-sequence "kj")
  (evil-escape-mode 1))

(use-package evil-surround
  :ensure t
  :diminish
  :init
  (add-hook 'after-init-hook 'global-evil-surround-mode))

(use-package evil-collection
  :ensure t
  :requires evil)

(when _term_
  (use-package evil-terminal-cursor-changer
    :ensure t
    :requires evil
    :init
    (add-hook 'after-init-hook 'etcc-on)
    :config
    (setq evil-motion-state-cursor 'box  ; █
          evil-visual-state-cursor 'box  ; █
          evil-normal-state-cursor 'box  ; █
          evil-insert-state-cursor 'bar  ; ⎸
          evil-emacs-state-cursor  'hbar) ; _
    ))

(provide 'config-evil)
