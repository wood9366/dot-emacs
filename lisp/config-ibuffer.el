
(use-package ibuffer
  :bind ("C-x C-b" . ibuffer)
  :config
  (fullframe ibuffer ibuffer-quit)
  (setq evil-emacs-state-modes (delq 'ibuffer-mode evil-emacs-state-modes)))

(provide 'config-ibuffer)
