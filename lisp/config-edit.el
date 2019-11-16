
;; search or match ignore case
(setq case-fold-search t) 

;; tab
(setq indent-tabs-mode nil ;; replace tab with space
      tab-width 4) 

;; (use-package subword
;;   :diminish subword-mode
;;   :init
;;   (add-hook 'c-mode-common-hook 'subword-mode))

(when (fboundp 'global-prettify-symbols-mode)
  (add-hook 'after-init-hook 'global-prettify-symbols-mode))

;; bind key for kill back word
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
  :diminish undo-tree-mode
  :init
  (add-hook 'after-init-hook 'global-undo-tree-mode))

(use-package highlight-escape-sequences
  :ensure t
  :diminish hes-mode
  :init
  (add-hook 'after-init-hook 'hes-mode))

;; ; 80 column
;; (use-package column-enforce-mode
;;   :ensure t
;;   :diminish)

(provide 'config-edit)
