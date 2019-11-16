
(use-package which-key
  :ensure t
  :diminish
  :custom
  (which-key-enable-extended-define-key t)
  :config
  (which-key-mode)
  (setq which-key-idle-delay 0.5)
  (setq which-key-popup-type 'minibuffer))

(provide 'config-which-key)
