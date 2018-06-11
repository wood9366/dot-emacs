(use-package expand-region
  :ensure t
  :config
  (evil-leader/set-key "vv" 'er/expand-region)
  (use-package evil
    :config
    (setq expand-region-contract-fast-key "z")))

(provide 'config-expand-region)
