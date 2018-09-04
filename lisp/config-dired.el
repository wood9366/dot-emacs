(setq-default dired-dwim-target t)

(use-package dired
  :config
  (use-package diredfl
    :ensure t
    :init
    (diredfl-global-mode))

  (require 'dired+)
  (diredp-toggle-find-file-reuse-dir t)
  
  (setq dired-recursive-deletes 'top)
  (define-key dired-mode-map (kbd "C-c C-p") 'wdired-change-to-wdired-mode)
  (define-key dired-mode-map (kbd "C-c C-c") 'revert-buffer))

(provide 'config-dired)
