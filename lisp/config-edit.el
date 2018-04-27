
;; show parenthese
;; (use-package highlight-parentheses
;;   :ensure t
;;   :init
;;   (add-hook 'after-init-hook 'global-highlight-parentheses-mode))
;;   :config
;;   (custom-set-variables '(hl-paren-attributes (quote nil)))
;;   (custom-set-variables '(hl-paren-background-colors '("blue" "green" "yellow" "red")))
;;   (custom-set-variables '(hl-paren-colors (quote nil)))

(add-hook 'after-init-hook 'show-paren-mode)

(use-package rainbow-delimiters
  :ensure t
  :init
  (add-hook 'prog-mode-hook 'rainbow-delimiters-mode))

(add-hook 'after-init-hook 'show-paren-mode)

(provide 'config-edit)
