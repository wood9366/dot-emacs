;; -*- lexical-binding: t -*-

(use-package ivy
  :ensure t
  :diminish
  :custom
  (ivy-use-virtual-buffers t)
  (ivy-virtual-abbreviate 'fullpath)
  (ivy-count-format "")
  (ivy-height 7)
  (ivy-magic-tilde nil)
  (ivy-dynamic-exhibit-delay-ms 150)
  (ivy-initial-inputs-alist '((man . "^")
                              (woman . "^")))
  :config
  (ivy-mode)

  (general-def '(ivy-minibuffer-map ivy-switch-buffer-map)
    "C-j" 'ivy-next-line
    "C-n" 'ivy-next-line
    "C-k" 'ivy-previous-line
    "C-p" 'ivy-previous-line
    "C-f" 'ivy-scroll-down-command
    "C-b" 'ivy-scroll-up-command
    "TAB" 'ivy-partial-or-done
    "M-RET" 'ivy-done
    "RET" 'ivy-alt-done
    "C-<return>" 'ivy-immediate-done)

  (evil-make-overriding-map ivy-occur-mode-map 'normal))

(use-package ivy-historian
  :requires ivy
  :ensure t
  :config
  (ivy-historian-mode))

(use-package ivy-xref
  :requires ivy
  :ensure t
  :custom
  (ivy-xref-use-file-path t)
  :config
  (setq xref-show-xrefs-function 'ivy-xref-show-xrefs))

(use-package counsel
  :requires ivy
  :ensure t
  :diminish
  :custom
  (counsel-mode-override-describe-bindings t)
  :config
  (counsel-mode)

  (defun ly/yank ()
    (interactive)
    (if (window-minibuffer-p)
        (yank-pop)
      (counsel-yank-pop)))

  (general-def counsel-mode-map
    "M-y" 'ly/yank)

  (general-def 'normal counsel-mode-map
    "g /" 'counsel-imenu))

(use-package swiper
  :requires ivy
  :ensure t
  :config
  (defun ly/search ()
    (interactive)
    (if (window-minibuffer-p)
        (let ((text))
          (with-ivy-window
            (setq text (thing-at-point 'symbol)))
          (when text
            (insert text)))
      (swiper)))

  (general-def ivy-mode-map
    "C-s" 'ly/search))

(provide 'config-ivy)
