(use-package nlinum
  :ensure t
  :init
  (setq-default nlinum-format "%d "))

(use-package nlinum-relative
  :ensure t
  :commands (global-nlinum-relative-mode)
  :requires (nlinum)
  :init
  (defun adjust-linum-face ()
    (set-face-background 'linum (face-background 'default))
    (set-face-foreground 'linum (face-foreground 'default))
    (set-face-background 'nlinum-relative-current-face (face-background 'default)))

  (defadvice reapply-themes (after adjust-linum-face-after-theme-load activate)
    (adjust-linum-face))

  (add-hook 'after-init-hook 'global-nlinum-relative-mode)
  :config
  (adjust-linum-face)
  (set-face-attribute 'linum nil :inverse-video nil)
  (set-face-foreground 'nlinum-relative-current-face "#FF9933")
  (set-face-attribute 'nlinum-relative-current-face nil :weight 'bold)
  (set-face-attribute 'nlinum-relative-current-face nil :inverse-video nil)
  (setq nlinum-relative-redisplay-delay 0))

(provide 'config-linum)
