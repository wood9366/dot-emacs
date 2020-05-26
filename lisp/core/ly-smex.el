
(use-package smex
  :ensure t
  :defer t
  :config
  (setq-default smex-save-file (expand-file-name ".smex-items" user-emacs-directory)))

(provide 'ly-smex)
