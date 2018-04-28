(setq-default dired-dwim-target t)

(use-package dired
  :config
  (use-package diredfl
    :ensure t
    :init
    (diredfl-global-mode))

  (setq dired-recursive-deletes 'top)
  (define-key dired-mode-map (kbd "C-c C-p") 'wdired-change-to-wdired-mode)

  (defun wood9366/dired-find-alternate-file ()
    "find dired dired alternate, and find files in normal way"
    (interactive)
    (if (file-regular-p (dired-get-filename))
        (dired-find-file)
      (dired-find-alternate-file)))

  (define-key dired-mode-map (kbd "RET") 'wood9366/dired-find-alternate-file)

  (defun wood9366/dired-backward ()
    "Go back to the parent directory (..), and the cursor will be moved to where
          the previous directory."
    (interactive)
    (let* ((DIR (buffer-name)))
      (if (equal DIR "*Find*")
          (quit-window t)
        (progn (find-alternate-file "..")
               (re-search-forward DIR nil :no-error)
               (revert-buffer)))))

  (define-key dired-mode-map (kbd "J") 'wood9366/dired-backward))

(provide 'config-dired)
