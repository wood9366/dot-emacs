
(use-package dired
  :config
  (defun ly/dired-open-file-with-external-program ()
    (interactive)
    (shell-command (concat "open " (shell-quote-argument (dired-get-filename)))))

  (setq-default dired-dwim-target t)
  (setq dired-recursive-deletes 'top)
  (evil-set-initial-state 'dired-mode 'normal)
  (evil-collection-dired-setup)

  (put 'dired-find-alternate-file 'disabled nil)

  (general-def 'normal dired-mode-map
    [remap dired-find-file] 'dired-find-alternate-file
    [remap dired-up-directory] (lambda () (interactive) (find-alternate-file ".."))
    "C-<return>" 'ly/dired-open-file-with-external-program
    "DEL" 'dired-up-directory
    "C-c C-p" 'wdired-change-to-wdired-mode)

  (add-hook 'dired-mode-hook
            (lambda ()
              (interactive)
              (dired-hide-details-mode 1))))

(use-package diredfl
  :ensure t
  :hook (dired-mode . diredfl-mode))

(provide 'ly-dired)
