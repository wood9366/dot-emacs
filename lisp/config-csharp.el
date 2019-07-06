(use-package csharp-mode
  :ensure t)

(use-package omnisharp
  :ensure t
  :commands (omnisharp-mode)
  :init
  (add-hook 'csharp-mode-hook 'omnisharp-mode)
  :config
  (setq omnisharp-server-executable-path "/usr/local/bin/omnisharp")

  (defun liyang/omnisharp-mode-hook()
    (add-to-list (make-local-variable 'company-backends) 'company-omnisharp))

  (add-hook 'omnisharp-mode-hook 'liyang/omnisharp-mode-hook)

  (evil-define-key 'normal omnisharp-mode-map (kbd "g u") 'omnisharp-find-usages-with-ido)
  (evil-define-key 'normal omnisharp-mode-map (kbd "g I") 'omnisharp-find-implementations) ; g i is taken
  (evil-define-key 'normal omnisharp-mode-map (kbd "g d") 'omnisharp-go-to-definition)
  (evil-define-key 'normal omnisharp-mode-map (kbd "g r") 'omnisharp-run-code-action-refactoring)
  (evil-define-key 'normal omnisharp-mode-map (kbd "g f") 'omnisharp-fix-code-issue-at-point)
  (evil-define-key 'normal omnisharp-mode-map (kbd "g F") 'omnisharp-fix-usings)
  (evil-define-key 'normal omnisharp-mode-map (kbd "g R") 'omnisharp-rename)

  (evil-define-key 'normal omnisharp-mode-map (kbd "g .") 'omnisharp-show-overloads-at-point)

  ;; (evil-define-key 'normal omnisharp-mode-map (kbd ", i") 'omnisharp-current-type-information)
  ;; (evil-define-key 'normal omnisharp-mode-map (kbd ", I") 'omnisharp-current-type-documentation)
  ;; (evil-define-key 'normal omnisharp-mode-map (kbd ", n t") 'omnisharp-navigate-to-current-file-member)
  ;; (evil-define-key 'normal omnisharp-mode-map (kbd ", n s") 'omnisharp-navigate-to-solution-member)
  ;; (evil-define-key 'normal omnisharp-mode-map (kbd ", n f") 'omnisharp-navigate-to-solution-file-then-file-member)
  ;; (evil-define-key 'normal omnisharp-mode-map (kbd ", n F") 'omnisharp-navigate-to-solution-file)
  ;; (evil-define-key 'normal omnisharp-mode-map (kbd ", n r") 'omnisharp-navigate-to-region)

  (evil-leader/set-key-for-mode omnisharp-mode-map "cc" 'recompile)
  (evil-leader/set-key-for-mode omnisharp-mode-map "ct" 'recompile)

  ;; (evil-define-key 'normal omnisharp-mode-map (kbd ",rt")
  ;;   (lambda() (interactive) (omnisharp-unit-test "single")))

  ;; (evil-define-key 'normal omnisharp-mode-map
  ;;   (kbd ",rf")
  ;;   (lambda() (interactive) (omnisharp-unit-test "fixture")))

  ;; (evil-define-key 'normal omnisharp-mode-map
  ;;   (kbd ",ra")
  ;;   (lambda() (interactive) (omnisharp-unit-test "all")))
  )

(provide 'config-csharp)
