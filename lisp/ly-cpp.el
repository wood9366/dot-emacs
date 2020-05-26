;; -*- lexical-binding: t -*-

(add-hook 'c-mode-common-hook
          (lambda () (progn
                  (c-set-style "k&r")
                  (setq c-basic-offset 4))))

(use-package lsp-mode :ensure t :commands lsp)
(use-package lsp-ui :ensure t :commands lsp-ui-mode)
(use-package company-lsp :ensure t :commands company-lsp)

(use-package ccls
  :ensure t
  :hook ((c-mode c++-mode objc-mode cuda-mode) .
         (lambda () (require 'ccls) (lsp))))

(setq ccls-executable "/usr/local/bin/ccls")

(provide 'ly-cpp)
