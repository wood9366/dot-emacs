
(use-package js
  :ensure t
  :config
  (setq js-indent-level 2)
  (when (fboundp 'lsp)
    (add-hook 'js-mode-hook #'lsp)))

(use-package js2-mode
  :ensure t
  :mode ("\\.jsx?\\'" . js2-mode)
  :config
  (when (fboundp 'lsp)
    (add-hook 'js2-mode-hook #'lsp)))

(use-package typescript-mode
  :ensure t
  :config
  (setq typescript-indent-level 2)
  (when (fboundp 'lsp)
    (add-hook 'typescript-mode-hook #'lsp)))

(provide 'ly-js)
