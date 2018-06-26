(use-package solarized-theme
  :ensure t
  :init
  (load-theme 'solarized-dark t)
  (setq solarized-distinct-fringe-background t))

(use-package dimmer
  :ensure t
  :init
  (add-hook 'after-init-hook 'dimmer-mode))

(provide 'config-theme)
