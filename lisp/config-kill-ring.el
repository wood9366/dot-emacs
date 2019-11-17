
(use-package browse-kill-ring
  :ensure t
  :general
  ("M-y" 'browse-kill-ring)
  (browse-kill-ring-mode-map
   "j" 'browse-kill-ring-forward
   "k" 'browse-kill-ring-previous
   "q" 'browse-kill-ring-quit))

(provide 'config-kill-ring)
