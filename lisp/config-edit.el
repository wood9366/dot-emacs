
;; show parenthese
(use-package highlight-parentheses
  :ensure t
  :init
  (add-hook 'after-init-hook 'global-highlight-parentheses-mode)
  :custom
  (hl-paren-attributes 'nil)
  (hl-paren-background-colors '("#FF0000" "#00FF00" "#0000FF" "#FFFF00" "#00FFFF" "#FF00FF" "#800000" "#008000" "#000080" "#808000" "#008080" "#800080"))
  (hl-paren-colors 'nil))

(add-hook 'after-init-hook 'show-paren-mode)

(use-package rainbow-delimiters
  :ensure t
  :init
  (add-hook 'prog-mode-hook 'rainbow-delimiters-mode))

;; basic
(setq-default
 case-fold-search t ;; search or match ignore case
 column-number-mode t ;; show column number
 indent-tabs-mode nil ;; replace tab with space
 default-tab-width 4) 

(use-package subword
  :diminish subword-mode)

(when (fboundp 'global-prettify-symbols-mode)
  (add-hook 'after-init-hook 'global-prettify-symbols-mode))

(global-set-key "\C-w" 'backward-kill-word)

(use-package browse-kill-ring
  :ensure t
  :init
  (global-set-key (kbd "M-y") 'browse-kill-ring)
  :config
  (define-key browse-kill-ring-mode-map (kbd "j") 'browse-kill-ring-forward)
  (define-key browse-kill-ring-mode-map (kbd "k") 'browse-kill-ring-previous)
  (define-key browse-kill-ring-mode-map (kbd "q") 'browse-kill-ring-quit))

(use-package undo-tree
  :ensure t
  :diminish undo-tree-mode
  :init
  (add-hook 'after-init-hook 'global-undo-tree-mode))

;; highlight escape sequence
(use-package highlight-escape-sequences
  :ensure t
  :init
  (add-hook 'after-init-hook 'hes-mode))

(provide 'config-edit)
