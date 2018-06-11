(use-package evil-mc
  :ensure t
  :requires (evil)
  :init
  (add-hook 'after-init-hook 'global-evil-mc-mode)
  :config
  (defun wood9366/toggle-mc ()
    (interactive)
    (if (evil-mc-has-cursors-p)
        (evil-mc-undo-all-cursors)
      (evil-mc-make-all-cursors)))

  (evil-leader/set-key "mm" 'wood9366/toggle-mc)

  (defun wood9366/edit-visual-block-mc ()
    (interactive)
    (if (evil-mc-has-cursors-p) (user-error "Cursors already exist.")
      (when (and (evil-visual-state-p 'visual)
                 (eq evil-visual-selection 'block))
        (evil-exit-visual-state)
        (let* ((s (marker-position evil-visual-beginning))
               (e (marker-position evil-visual-end))
               (n (- (line-number-at-pos e) (line-number-at-pos s)))
               (offset 0))
          (goto-char s)
          (setq offset (- (point) (line-beginning-position)))
          (save-excursion
            (while (> n 0)
              (let ((cur (+ (line-end-position) 1 offset)))
                (forward-line)
                (if (> cur (line-end-position))
                    (setq cur (line-end-position)))
                (evil-mc-run-cursors-before)
                (evil-mc-make-cursor-at-pos cur)
                (setq n (- n 1))))))
        (evil-mc-print-cursors-info "Created"))))

  (evil-global-set-key 'visual "R" 'wood9366/edit-visual-block-mc))

(provide 'config-multiple-cursor)
