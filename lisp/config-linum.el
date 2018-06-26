(use-package nlinum
  :ensure t
  :init
  (setq-default nlinum-format "%d "))

(use-package nlinum-relative
  :ensure t
  :requires (nlinum)
  :init
  (add-hook 'after-init-hook 'global-nlinum-relative-mode)
  :config
  (set-face-background 'linum (face-background 'default))
  (set-face-background 'nlinum-relative-current-face (face-background 'default))
  (set-face-foreground 'nlinum-relative-current-face "#FF9933")
  (set-face-attribute 'nlinum-relative-current-face nil :weight 'bold)
  (setq nlinum-relative-redisplay-delay 0))

(provide 'config-linum)
