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
    (set-face-foreground 'linum "#6F6F6F")
    (set-face-attribute 'linum nil :inverse-video nil)
    (set-face-attribute 'linum nil :italic t)

    (set-face-background 'nlinum-relative-current-face (face-background 'default))
    (set-face-foreground 'nlinum-relative-current-face "#FF9933")
    (set-face-attribute 'nlinum-relative-current-face nil :bold t))

  (defadvice reapply-themes (after adjust-linum-face-after-theme-load activate)
    (adjust-linum-face))

  (nlinum-relative-on)
  :config
  (adjust-linum-face)
  (setq nlinum-relative-redisplay-delay 0))

(provide 'config-linum)
