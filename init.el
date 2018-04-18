;; -*- lexical-binding: t -*-

(setq debug-on-error t)

(when (< emacs-major-version 24)
  (error "Your emacs is too old -- this config requires v24 of higher"))

(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))
      
;; Adjust garbage collection thresholds during startup, and thereafter
(let ((normal-gc-cons-threshold (* 20 1024 1024))
      (init-gc-cons-threshold (* 128 1024 1024)))
  (setq gc-cons-threshold init-gc-cons-threshold)
  (add-hook 'after-init-hook
            (lambda () (setq gc-cons-threshold normal-gc-cons-threshold))))

;; bootstrap config
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))

(require 'config-elpa)
;; (package-initialize)

(require 'config-common)

(require-package 'use-package)

(use-package evil
  :ensure t
  :config
  (evil-mode 1)
  (use-package evil-leader
    :ensure t
    :config
    (global-evil-leader-mode)
    (evil-leader/set-leader ",")))

