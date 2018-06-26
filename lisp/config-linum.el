(use-package nlinum
  :ensure t
  :config
  (setq nlinum-format "%d "))

(use-package nlinum-relative
  :ensure t
  :requires (nlinum)
  :init
  (add-hook 'after-init-hook 'global-nlinum-relative-mode)
  :custom-face
  (linum ((t :inhert "default"
             :background "#002B36")))
  (nlinum-relative-current-face ((t :inhert "linum"
                                    :background "#002B36"
                                    :foreground "#FF9933"
                                    :weight bold)))
  :config
  (setq nlinum-relative-redisplay-delay 0))

(provide 'config-linum)
