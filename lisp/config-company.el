(use-package company
  :ensure t
  :diminish "c"
  :bind (("M-C-/" . company-complete)
         :map company-mode-map
         ("M-/" . company-complete)
         ("M-." . company-other-backend)
         :map company-active-map
         ("M-/" . company-other-backend)
         ("C-j" . company-select-next)
         ("C-k" . company-select-previous)
         ("C-w" . nil)
         ("C-l" . company-show-location))
  :init
  (add-hook 'after-init-hook 'global-company-mode)
  :config
  (setq company-idle-delay 0.1)

  (setq company-backends
        '(company-capf
          company-files
          (company-dabbrev-code company-gtags company-etags company-keywords)
          company-dabbrev)))

(use-package company-quickhelp
  :ensure t
  :after (company)
  :init
  (add-hook 'after-init-hook 'company-quickhelp-mode))

(provide 'config-company)
