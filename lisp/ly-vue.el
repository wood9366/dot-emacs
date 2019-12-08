
(use-package vue-mode
  :ensure t
  :config
  (when (fboundp 'lsp)
    (add-hook 'vue-mode-hook #'lsp)))

(provide 'ly-vue)
