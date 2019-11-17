
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

(use-package undo-tree
  :ensure t
  :hook (after-init . undo-tree-mode))

(use-package highlight-escape-sequences
  :ensure t
  :init
  (add-hook 'after-init-hook 'hes-mode))

;; ; 80 column
;; (use-package column-enforce-mode
;;   :ensure t
;;   :diminish)

(provide 'config-edit)
