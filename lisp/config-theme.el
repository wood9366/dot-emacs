(use-package solarized-theme
  :ensure t
  :init
  (load-theme 'solarized-dark t)
  :config
  (if (display-graphic-p) (setq solarized-distinct-fringe-background t)))

;; (use-package dimmer
;;   :ensure t
;;   :init
;;   (add-hook 'after-init-hook 'dimmer-mode)
;;   :custom
;;   (dimmer-use-colorspace :rgb)
;;   (dimmer-fraction 0.1))

(provide 'config-theme)
