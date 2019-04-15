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

  (add-hook 'java-mode-hook 'lsp)

  (evil-define-key 'normal java-mode-map (kbd ", . r r") 'lsp-rename)
  (evil-define-key 'normal java-mode-map (kbd ", . o o") 'lsp-java-organize-imports)
  (evil-define-key 'normal java-mode-map (kbd ", . c c") 'lsp-java-build-project))

(use-package dap-mode
  :ensure t
  :after lsp-mode
  :config
  (dap-mode t)
  (dap-ui-mode t))

(use-package dap-java
  :after (lsp-java))

(provide 'config-java)
