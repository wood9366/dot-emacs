;; -*- lexical-binding: t -*-

(use-package window-numbering
  :ensure t
  :init
  (add-hook 'after-init-hook 'window-numbering-mode)
  :config
  (use-package evil
    :config
    (dolist (no (number-sequence 0 9))
      (evil-leader/set-key (number-to-string no)
        (lambda () (interactive) (select-window-by-number no nil))))))

(provide 'config-windows)
