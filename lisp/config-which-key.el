
(use-package which-key
  :ensure t
  :hook (after-init . which-key-mode)
  :custom
  (which-key-enable-extended-define-key t)
  (which-key-idle-delay 0.5)
  (which-key-popup-type 'minibuffer))

(provide 'config-which-key)
