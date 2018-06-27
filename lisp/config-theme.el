(use-package color-theme-solarized
  :ensure t
  :init
  (load-theme 'solarized t)
  :custom
  (frame-background-mode 'dark)
  :config
  (enable-theme 'solarized))

(provide 'config-theme)
