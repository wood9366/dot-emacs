(use-package lsp-mode
  :ensure t
  :custom (lsp-prefer-flymake nil))

(use-package company-lsp
  :ensure t)

(use-package lsp-ui
  :ensure t
  :custom
  (lsp-ui-sideline-show-symbol nil)
  (lsp-ui-sideline-show-hover nil)
  (lsp-ui-sideline-show-code-actions nil)
  (lsp-ui-doc-enable nil)
  :config
  (add-hook 'lsp-mode 'lsp-ui-mode)
  (evil-define-key 'normal java-mode-map (kbd "g r") 'lsp-ui-peek-find-references))

(use-package lsp-java
  :ensure t
  :after lsp
  :config
  (setq lsp-java-vmargs
        (let ((lombok-path "/Users/liyang/.gradle/caches/modules-2/files-2.1/org.projectlombok/lombok/1.16.20/ac76d9b956045631d1561a09289cbf472e077c01/lombok-1.16.20.jar"))
          (append lsp-java-vmargs
                  `(,(format "-javaagent:%s" lombok-path)
                    ,(format "-Xbootclasspath/a:%s" lombok-path)))))

  (add-hook 'java-mode-hook (lambda () (progn
                                         (make-local-variable 'company-backends)
                                         (lsp))))

  (evil-define-key 'normal java-mode-map (kbd ", r r") 'lsp-rename)
  (evil-define-key 'normal java-mode-map (kbd ", o o") 'lsp-java-organize-imports)
  (evil-define-key 'normal java-mode-map (kbd ", o i") 'lsp-java-add-import)
  (evil-define-key 'normal java-mode-map (kbd ", o w") 'lsp-java-add-unimplemented-methods)
  (evil-define-key 'normal java-mode-map (kbd ", c c") 'lsp-java-build-project))

(use-package dap-mode
  :ensure t
  :after lsp-mode
  :config
  (dap-mode t)
  (dap-ui-mode t)

  (evil-define-key 'normal java-mode-map (kbd ", d d") 'dap-breakpoint-toggle)
  (evil-define-key 'normal java-mode-map (kbd ", d ?") 'dap-breakpoint-condition)
  (evil-define-key 'normal java-mode-map (kbd ", d n") 'dap-next)
  (evil-define-key 'normal java-mode-map (kbd ", d i") 'dap-step-in)
  (evil-define-key 'normal java-mode-map (kbd ", d o") 'dap-step-out)
  (evil-define-key 'normal java-mode-map (kbd ", d c") 'dap-continue)
  (evil-define-key 'normal java-mode-map (kbd ", d [") 'dap-debug)
  (evil-define-key 'normal java-mode-map (kbd ", d p") 'dap-debug-last)
  (evil-define-key 'normal java-mode-map (kbd ", d ]") 'dap-disconnect)
  (evil-define-key 'normal java-mode-map (kbd ", d w 1") 'dap-ui-locals)
  (evil-define-key 'normal java-mode-map (kbd ", d w 2") 'dap-ui-breakpoints)
  )

(use-package dap-java
  :after (lsp-java))

(provide 'config-java)
