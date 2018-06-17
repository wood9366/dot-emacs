(use-package nlinum
  :ensure t
  :custom-face
  (linum ((t :background "black")))
  :config
  (setq nlinum-format "%d "))

(use-package nlinum-relative
  :ensure t
  :requires (nlinum)
  :init 
  (add-hook 'after-init-hook 'global-nlinum-relative-mode)
  :custom-face
  (nlinum-relative-current-face ((t :inhert "linum"
                                    :foreground "#FF9933"
                                    :weight bold)))
  :config
  (setq nlinum-relative-redisplay-delay 0))

(provide 'config-linum)
