;; -*- lexical-binding: t -*-

(use-package lua-mode
  :ensure t
  :mode "\\.lua\\(\\.txt\\)?\\'"
  :config
  (setq lua-indent-level 4))

(provide 'ly-lua)
