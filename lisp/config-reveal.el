(use-package ox-reveal
  :ensure t
  :config
  (setq org-reveal-root (concat "file://" (expand-file-name (concat user-emacs-directory "third/reveal.js"))))
  )

(provide 'config-reveal)
