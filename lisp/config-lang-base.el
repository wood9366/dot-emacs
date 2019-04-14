
;; comment
(use-package evil-nerd-commenter
  :ensure t
  :requires (evil)
  :config
  (evil-leader/set-key "/" 'evilnc-comment-or-uncomment-lines))

;; yasnippet
(use-package yasnippet
  :ensure t
  :init
  (yas-global-mode 1))

(use-package yasnippet-snippets
  :ensure t)

(provide 'config-lang-base)
