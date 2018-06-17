(use-package evil-nerd-commenter
  :ensure t
  :requires (evil)
  :config
  (global-set-key (kbd "M-;") 'evilnc-comment-or-uncomment-lines)
  
  (use-package evil-leader
    :config
    (evil-leader/set-key ","  'evilnc-comment-operator)))

(provide 'config-lang-comment)
