
(use-package js2-mode
  :ensure t
  :mode ("\\.jsx?\\'" . js2-mode)
  :config
  (when (fboundp 'lsp)
    (add-hook 'js2-mode-hook #'lsp)))

(use-package typescript-mode
  :ensure t
  :config
  (when (fboundp 'lsp)
    (add-hook 'typescript-mode-hook #'lsp)))

(provide 'ly-js)
