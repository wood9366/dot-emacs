;; -*- lexical-binding: t -*-

(use-package winum
  :ensure t
  :init
  (winum-mode)
  :custom
  (winum-auto-setup-mode-line nil)
  :config
  (evil-leader/set-key "`" 'winum-select-window-by-number)
  (dolist (no (number-sequence 0 9))
    (evil-leader/set-key (number-to-string no)
      (lambda () (interactive) (winum-select-window-by-number no)))
    (which-key-add-key-based-replacements
      (format "%s%d" liyang/leader-key no) (format "select window %d" no))))

(provide 'config-windows)
