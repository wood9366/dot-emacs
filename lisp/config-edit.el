
;; highlight all level of parentheses
(use-package highlight-parentheses
  :ensure t
  :init
  (add-hook 'prog-mode-hook 'global-highlight-parentheses-mode)
  :custom
  (hl-paren-attributes 'nil)
  (hl-paren-background-colors '("#FF0000" "#00FF00" "#0000FF" "#FFFF00" "#00FFFF" "#FF00FF" "#800000" "#008000" "#000080" "#808000" "#008080" "#800080"))
  (hl-paren-colors 'nil))

;; highlight matched parenthese cursor on
(add-hook 'after-init-hook 'show-paren-mode)

(use-package rainbow-delimiters
  :ensure t
  :init
  (add-hook 'prog-mode-hook 'rainbow-delimiters-mode))

;; basic
(setq-default case-fold-search t ;; search or match ignore case
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
  :bind (("M-y" . browse-kill-ring)
         :map browse-kill-ring-mode-map
         ("j" . browse-kill-ring-forward)
         ("k" . browse-kill-ring-previous)
         ("q" . browse-kill-ring-quit)))

(use-package undo-tree
  :ensure t
  :init
  (add-hook 'after-init-hook 'global-undo-tree-mode))

(use-package highlight-escape-sequences
  :ensure t
  :init
  (add-hook 'after-init-hook 'hes-mode))

(provide 'config-edit)
