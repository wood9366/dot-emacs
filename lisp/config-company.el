(use-package company
  :ensure t
  :diminish "ⓒ "
  :bind (("M-C-/" . company-complete)
         :map company-mode-map
         ("M-/" . company-complete)
         ("M-." . company-other-backend)
         :map company-active-map
         ("M-." . company-other-backend)
         ("M-/" . company-select-next)
         ("C-j" . company-select-next)
         ("C-k" . company-select-previous)
         ("C-w" . nil)
         ("C-l" . company-show-location))
  :init
  (add-hook 'after-init-hook 'global-company-mode)
  :config
  (setq company-idle-delay 0.1)

  (add-hook
   'company-completion-started-hook
   (lambda (&rest ignore)
     (when evil-mode
       (when (evil-insert-state-p)
         (define-key evil-insert-state-map (kbd "C-k") nil)))))

  (setq company-backends
        '(company-capf
          company-yasnippet
          company-files
          (company-dabbrev-code company-gtags company-etags company-keywords)
          company-dabbrev)))

(use-package company-quickhelp
  :ensure t
  :after (company)
  :init
  (add-hook 'after-init-hook 'company-quickhelp-mode))

(provide 'config-company)
