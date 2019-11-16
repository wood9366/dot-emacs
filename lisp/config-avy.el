
(use-package avy
  :ensure t
  :config
  (general-def 'normal
    "g c" 'evil-avy-goto-word-1))

(provide 'config-avy)
