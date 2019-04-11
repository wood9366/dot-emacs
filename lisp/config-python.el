(use-package elpy
  :ensure t
  :diminish "ⓟ "
  :custom
  (flycheck-display-errors-delay 0.3)
  :init
  (elpy-enable)
  (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
  (add-hook 'elpy-mode-hook 'flycheck-mode))

(provide 'config-python)
