
(use-package smart-mode-line
  :ensure t
  :custom
  (sml/no-confirm-load-theme t)
  (sml/theme 'dark)
  (sml/pre-minor-modes-separator " | "))

(add-hook 'after-init-hook
          (lambda ()
            (sml/setup)

            (column-number-mode 1)
            (size-indication-mode 1)))

(provide 'ly-status-bar)
