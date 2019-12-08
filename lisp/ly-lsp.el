
(use-package lsp-mode
  :ensure t
  :commands lsp
  :config
  (setq lsp-prefer-flymake nil))

(use-package lsp-ui
  :ensure t
  :commands lsp-ui-mode)

(use-package company-lsp
  :ensure t
  :commands company-lsp)

(use-package lsp-ivy
  :ensure t)

(use-package lsp-treemacs
  :ensure t
  :commands lsp-treemacs-errors-list)

(use-package dap-mode
  :ensure t
  :commands dap-mode)

(provide 'ly-lsp)
