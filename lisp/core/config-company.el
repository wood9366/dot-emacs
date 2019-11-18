
(use-package company
  :ensure t
  :diminish "c"
  :config
  (global-company-mode 1)

  (setq company-idle-delay nil)

  (general-def 'insert company-mode-map
    "C-/" 'company-complete
    "C-_" 'company-complete
    "C-x C-f" 'company-files
    "C-x C-x" 'company-yasnippet)

  (general-def nil company-active-map
    "C-j" 'company-select-next
    "C-n" 'company-select-next
    "C-/" 'company-select-next
    "C-_" 'company-select-next
    "C-k" 'company-select-previous
    "C-p" 'company-select-previous
    "C-f" 'company-next-page
    "C-b" 'company-previous-page
    "C-w" nil)

  (setq company-backends
        '(company-capf 
          (company-dabbrev-code company-gtags company-etags company-keywords)
          company-dabbrev)))

(provide 'config-company)
