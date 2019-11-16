
;; show matched paren
(show-paren-mode t)

;; different level matched paren show different color
(use-package rainbow-delimiters
  :ensure t
  :hook (prog-mode . rainbow-delimiters-mode))

(provide 'config-show-paren)
