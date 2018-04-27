(use-package smex
  :ensure t
  :config
  ;; Change path for ~/.smex-items
  (setq-default smex-save-file (expand-file-name ".smex-items" user-emacs-directory)))

(provide 'config-smex)
