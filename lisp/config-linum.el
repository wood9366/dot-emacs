
(use-package nlinum
  :ensure t)

(use-package nlinum-relative
  :ensure t
  :requires (nlinum)
  :init 
  (add-hook 'after-init-hook 'global-nlinum-relative-mode)
  :config
  (custom-set-faces
   '(nlinum-relative-current-face 
     ((t :inherit linum :foreground "#FF9933" :weight bold))))
  (setq nlinum-relative-redisplay-delay 0))

(provide 'config-linum)
