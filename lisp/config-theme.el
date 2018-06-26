(use-package color-theme-solarized
  :ensure t
  :init
  (load-theme 'solarized t)
  :custom
  (frame-background-mode 'dark)
  :config
  (enable-theme 'solarized))

(use-package dimmer
  :ensure t
  :init
  (add-hook 'after-init-hook 'dimmer-mode))

(provide 'config-theme)
