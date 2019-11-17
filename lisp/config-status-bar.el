
(use-package smart-mode-line
  :ensure t
  :custom
  (sml/no-confirm-load-theme t)
  (sml/theme 'dark))

(add-hook 'after-init-hook
          (lambda ()
            (sml/setup)

            (column-number-mode 1)
            (size-indication-mode 1)))

(provide 'config-status-bar)
