;; highlight matched parenthese cursor on
(add-hook 'after-init-hook 'show-paren-mode)
(set-face-background 'show-paren-match "dark magenta")

(use-package rainbow-delimiters
  :ensure t
  :init
  (add-hook 'prog-mode-hook 'rainbow-delimiters-mode)
  :custom-face
  (rainbow-delimiters-depth-1-face ((t (:foreground "dark orange"))))
  (rainbow-delimiters-depth-2-face ((t (:foreground "deep pink"))))
  (rainbow-delimiters-depth-3-face ((t (:foreground "chartreuse"))))
  (rainbow-delimiters-depth-4-face ((t (:foreground "deep sky blue"))))
  (rainbow-delimiters-depth-5-face ((t (:foreground "yellow"))))
  (rainbow-delimiters-depth-6-face ((t (:foreground "orchid"))))
  (rainbow-delimiters-depth-7-face ((t (:foreground "spring green"))))
  (rainbow-delimiters-depth-8-face ((t (:foreground "sienna1")))))

;; basic
(setq-default case-fold-search t ;; search or match ignore case
              column-number-mode t ;; show column number
              indent-tabs-mode nil ;; replace tab with space
              tab-width 4) 

(use-package subword
  :diminish subword-mode
  :init
  (add-hook 'c-mode-common-hook 'subword-mode))

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
  :diminish undo-tree-mode
  :init
  (add-hook 'after-init-hook 'global-undo-tree-mode))

(use-package highlight-escape-sequences
  :ensure t
  :init
  (add-hook 'after-init-hook 'hes-mode))

; highlight current line
(global-hl-line-mode)

; 80 column
(use-package fill-column-indicator
  :ensure t
  :custom
  (fci-rule-color "#3F3F3F")
  (fci-rule-column 80)
  :init
  (add-hook 'prog-mode-hook 'fci-mode))

(provide 'config-edit)
