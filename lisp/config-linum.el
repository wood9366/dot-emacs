(use-package nlinum
  :ensure t
  :config
  (set-face-background 'linum "black")
  (setq nlinum-format "%d "))

(use-package nlinum-relative
  :ensure t
  :requires (nlinum)
  :init 
  (add-hook 'after-init-hook 'global-nlinum-relative-mode)
  :config
  (set-face-attribute 'nlinum-relative-current-face nil
                      :background "black"
                      :foreground "#FF9933"
                      :weight 'bold)
  (setq nlinum-relative-redisplay-delay 0))

(provide 'config-linum)
