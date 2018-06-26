(use-package smart-mode-line
  :ensure t
  :init
  (add-hook 'after-init-hook 'sml/setup))

(use-package smart-mode-line-powerline-theme
  :requires (smart-line-mode)
  :ensure t)

(provide 'config-status-bar)
