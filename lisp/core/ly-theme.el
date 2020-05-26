
(use-package spacemacs-dark-theme
  :ensure spacemacs-theme
  :custom
  (spacemacs-theme-comment-bg nil))

(add-hook 'after-init-hook
          (lambda ()
            (load-theme 'spacemacs-dark t)
            (enable-theme 'spacemacs-dark)

            ;; Highlight current line
            (global-hl-line-mode)))

(provide 'ly-theme)
