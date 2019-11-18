
;; search or match ignore case
(setq case-fold-search t) 

;; tab
(setq indent-tabs-mode nil ;; replace tab with space
      tab-width 4) 

;; (use-package subword
;;   :diminish subword-mode
;;   :init
;;   (add-hook 'c-mode-common-hook 'subword-mode))

;; replace strings with pretty symbol
(when (fboundp 'global-prettify-symbols-mode)
  (add-hook 'after-init-hook 'global-prettify-symbols-mode))

;; show undo branches visually
(use-package undo-tree
  :ensure t
  :diminish "u"
  :defer t)

(use-package highlight-escape-sequences
  :ensure t
  :hook (prog-mode . hes-mode))

;; ; 80 column
;; (use-package column-enforce-mode
;;   :ensure t
;;   :diminish)

(show-paren-mode t)

;; different level matched paren show different color
(use-package rainbow-delimiters
  :ensure t
  :hook (prog-mode . rainbow-delimiters-mode))

;; quick select region under cursor with expand and contract
(use-package expand-region
  :ensure t
  :defer t
  :config
  (setq expand-region-contract-fast-key "z"))

;; navigate cursor quickly
(use-package avy
  :ensure t
  :defer t)

;; hippie expand
(setq hippie-expand-try-functions-list
      '(try-complete-file-name-partially
        try-complete-file-name
        try-expand-dabbrev
        try-expand-dabbrev-all-buffers
        try-expand-dabbrev-from-kill))

;; multiple cursor
(use-package evil-mc
  :ensure t
  :defer t
  :diminish "m")

;; linum
(use-package nlinum
  :defer t
  :config
  (setq nlinum-highlight-current-line t)
  (set-face-attribute 'linum nil
                      :background (face-background 'default)
                      :foreground "#6F6F6F")
  (set-face-attribute 'nlinum-current-line nil
                      :foreground "#FB8C1D"))

(provide 'config-edit)
