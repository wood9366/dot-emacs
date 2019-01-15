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
  :custom
  (spacemacs-theme-comment-bg nil)
  (spacemacs-theme-comment-italic t)
  :init
  (load-theme 'spacemacs-dark t)
  (enable-theme 'spacemacs-dark))

(provide 'config-theme)
