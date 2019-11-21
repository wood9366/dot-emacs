
(use-package magit
  :ensure t
  :defer t
  :init
  (ly/tool-def 'normal "g" 'magit-status)
  :config
  (fullframe magit-status magit-mode-bury-buffer))

(use-package evil-magit
  :requires evil
  :ensure t
  :after (evil magit))

(provide 'git)
