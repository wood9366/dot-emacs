;; -*- lexical-binding: t -*-

(use-package ivy
  :ensure t
  :init
  (add-hook 'after-init-hook 'ivy-mode)
  :config
  (setq-default ivy-use-virtual-buffers t
		ivy-virtual-abbreviate 'fullpath
		ivy-count-format ""
		ivy-magic-tilde nil
		ivy-dynamic-exhibit-delay-ms 150
		ivy-initial-inputs-alist
		'((man . "^")
		  (woman . "^")))

  ;; IDO-style directory navigation
  (define-key ivy-minibuffer-map (kbd "RET") #'ivy-alt-done)
  (dolist (k '("C-j" "C-RET"))
    (define-key ivy-minibuffer-map (kbd k) #'ivy-immediate-done))

  (define-key ivy-minibuffer-map (kbd "<up>") #'ivy-previous-line-or-history)

  (use-package diminish
    :ensure t
    :config
    (diminish 'ivy-mode))

  (defun sanityinc/enable-ivy-flx-matching ()
    "Make `ivy' matching work more like IDO."
    (interactive)
    (use-package flx :ensure t)
    (setq-default ivy-re-builders-alist
                  '((t . ivy--regex-fuzzy)))))


(use-package ivy-historian
  :ensure t
  :init
  (add-hook 'after-init-hook (lambda () (ivy-historian-mode t))))

(use-package counsel
  :ensure t
  :init
  (add-hook 'after-init-hook 'counsel-mode)
  :config
  (setq-default counsel-mode-override-describe-bindings t)
  (use-package diminish
    :ensure t
    :config
    (diminish 'counsel-mode)))

(use-package swiper
  :ensure t
  :after (ivy)
  :config
  (defun sanityinc/swiper-at-point (sym)
    "Use `swiper' to search for the symbol at point."
    (interactive (list (thing-at-point 'symbol)))
    (swiper sym))

  (define-key ivy-mode-map (kbd "M-s /") 'sanityinc/swiper-at-point))


(use-package ivy-xref
  :ensure t
  :config
  (setq xref-show-xrefs-function 'ivy-xref-show-xrefs))


(provide 'config-ivy)
