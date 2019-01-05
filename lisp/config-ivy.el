;; -*- lexical-binding: t -*-

(use-package ivy
  :ensure t
  :diminish ivy-mode
  :init
  (add-hook 'after-init-hook 'ivy-mode)
  :bind ((:map ivy-minibuffer-map)
         ("RET" . ivy-alt-done)
         ("C-<return>" . ivy-immediate-done))
  :config
  (setq-default ivy-use-virtual-buffers t
                ivy-virtual-abbreviate 'fullpath
                ivy-count-format ""
                ivy-magic-tilde nil
                ivy-dynamic-exhibit-delay-ms 150
                ivy-initial-inputs-alist
                '((man . "^")
                  (woman . "^")))

  (defun sanityinc/enable-ivy-flx-matching ()
    "Make `ivy' matching work more like IDO."
    (interactive)
    (use-package flx :ensure t)
    (setq-default ivy-re-builders-alist
                  '((t . ivy--regex-fuzzy)))))

(use-package ivy-historian
  :ensure t
  :after (ivy)
  :init
  (add-hook 'after-init-hook (lambda () (ivy-historian-mode t))))

(use-package ivy-xref
  :ensure t
  :after (ivy)
  :config
  (setq ivy-xref-use-file-path t) 
  (setq xref-show-xrefs-function 'ivy-xref-show-xrefs))


(use-package counsel
  :ensure t
  :diminish counsel-mode
  :init
  (add-hook 'after-init-hook 'counsel-mode)
  :config
  (setq-default counsel-mode-override-describe-bindings t))


(use-package swiper
  :ensure t
  :after (ivy)
  :config
  (defun sanityinc/swiper-at-point (sym)
    "Use `swiper' to search for the symbol at point."
    (interactive (list (thing-at-point 'symbol)))
    (swiper sym))

  (define-key ivy-mode-map (kbd "C-s") 'swiper))


(provide 'config-ivy)
