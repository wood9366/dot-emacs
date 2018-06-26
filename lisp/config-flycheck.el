(use-package flycheck
  :ensure t
  :init
  (add-hook 'after-init-hook 'global-flycheck-mode)
  :config
  (setq flycheck-display-errors-function #'flycheck-display-error-messages-unless-error-list))

(use-package flycheck-color-mode-line
  :ensure t
  :after (flycheck)
  :init
  (add-hook 'flycheck-mode-hook 'flycheck-color-mode-line-mode))

(provide 'config-flycheck)