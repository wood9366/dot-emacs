;; (use-package color-theme-solarized
;;   :ensure t
;;   :init
;;   (load-theme 'solarized t)
;;   :custom
;;   (frame-background-mode 'dark)
;;   :config
;;   (enable-theme 'solarized))

(use-package spacemacs-dark-theme
  :ensure spacemacs-theme
  :init
  (load-theme 'spacemacs-dark t)
  (enable-theme 'spacemacs-dark))

(provide 'config-theme)
