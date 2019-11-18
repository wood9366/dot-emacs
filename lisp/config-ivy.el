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
  :defer t
  :config
  (ivy-mode 1)

  (general-def '(ivy-minibuffer-map ivy-switch-buffer-map)
    "C-j" 'ivy-next-line
    "C-n" 'ivy-next-line
    "C-k" 'ivy-previous-line
    "C-p" 'ivy-previous-line
    "C-b" 'ivy-scroll-down-command
    "C-f" 'ivy-scroll-up-command
    "TAB" 'ivy-partial-or-done
    "M-RET" 'ivy-done
    "RET" 'ivy-alt-done
    "C-<return>" 'ivy-immediate-done)

  (evil-make-overriding-map ivy-occur-mode-map 'normal))

(use-package ivy-historian
  :after ivy
  :ensure t
  :config
  (ivy-historian-mode 1))

(use-package ivy-xref
  :ensure t
  :defer t
  :custom
  (ivy-xref-use-file-path t)
  :init
  (setq xref-show-xrefs-function 'ivy-xref-show-xrefs))

(use-package counsel
  :ensure t
  :diminish
  :custom
  (counsel-mode-override-describe-bindings t)
  :config
  (counsel-mode 1)

  (general-def counsel-mode-map
    [remap yank-pop] nil))

(use-package swiper
  :ensure t
  :defer t)

;; utils
(defun ly/search ()
  (interactive)
  (if (window-minibuffer-p)
      (let ((text))
        (with-ivy-window
          (setq text (thing-at-point 'symbol)))
        (when text
          (insert text)))
    (swiper)))

;; key-binding
(general-def '(normal insert)
  [remap yank-pop] 'counsel-yank-pop)

(general-def
  "C-s" 'ly/search)

(provide 'config-ivy)
