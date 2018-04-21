
;; show parenthese
(use-package highlight-parentheses
  :ensure t
  :config
  (custom-set-variables '(hl-paren-attributes (quote nil)))
  (custom-set-variables '(hl-paren-background-colors '("blue" "green" "yellow" "red")))
  (custom-set-variables '(hl-paren-colors (quote nil)))
  :init
  (add-hook 'after-init-hook 'global-highlight-parentheses-mode))

(add-hook 'after-init-hook 'show-paren-mode)

(provide 'config-edit)
