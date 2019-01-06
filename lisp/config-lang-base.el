
;; comment
(use-package evil-nerd-commenter
  :ensure t
  :requires (evil)
  :config
  (evil-leader/set-key "/" 'evilnc-comment-or-uncomment-lines))

(provide 'config-lang-base)
