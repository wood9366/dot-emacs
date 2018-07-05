(use-package company
  :ensure t
  :diminish "c"
  :bind (("M-C-/" . company-complete)
         :map company-mode-map
         ("M-/" . company-complete)
         :map company-active-map
         ("M-/" . company-select-next)
         ("C-j" . company-select-next)
         ("C-k" . company-select-previous)
         ("C-w" . nil)
         ("C-l" . company-show-location))
  :init
  (add-hook 'after-init-hook 'global-company-mode)
  :config
  (setq company-idle-delay 0.1)
  (setq company-backends
        '((company-files company-keywords company-capf company-yasnippet)
          (company-dabbrev-code company-dabbrev))))

(use-package company-quickhelp
  :ensure t
  :after (company)
  :init
  (add-hook 'after-init-hook 'company-quickhelp-mode))

(provide 'config-company)
