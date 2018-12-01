(use-package evil
  :ensure t
  :init
  (setq evil-want-abbrev-expand-on-insert-exit nil)
  (setq evil-want-integration t)
  (setq evil-want-keybinding nil)
  :config
  (evil-mode 1))

(use-package evil-collection
  :after evil
  :ensure t
  :config
  (evil-collection-init))

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
  :after (evil)
  :config
  (global-evil-leader-mode 1)
  (evil-leader/set-leader ","))

(use-package evil-surround
  :ensure t
  :after (evil)
  :config
  (global-evil-surround-mode 1))

(use-package evil-escape
  :ensure t
  :diminish
  :after (evil)
  :config
  (setq evil-escape-key-sequence "kj")
  (evil-escape-mode 1))

;; (use-package evil-matchit
;;   :ensure t
;;   :after (evil)
;;   ;; :init
;;   ;; (add-hook 'after-init-hook 'global-evil-matchit-mode)) 
;;   :config
;;   (global-evil-matchit-mode 1))

(provide 'config-evil)
