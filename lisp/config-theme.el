
(use-package spacemacs-dark-theme
  :ensure spacemacs-theme
  :custom
  (spacemacs-theme-comment-bg nil)
  :config
  (load-theme 'spacemacs-dark t)
  (enable-theme 'spacemacs-dark))

;; Highlight current line
(global-hl-line-mode)

(provide 'config-theme)
