;; -*- lexical-binding: t -*-

(setq debug-on-error t)

(when (< emacs-major-version 24)
  (error "Your emacs is too old -- this config requires v24 of higher"))

(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

(require 'config-benchmarking) ;; Measure startup time
      
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

;; declare platform variables
(defvar _mac_ (eq system-type 'darwin))
(defvar _win_ (eq system-type 'windows-nt))

;; features and other modes config
(require-package 'use-package)

(use-package diminish :ensure t)
(use-package fullframe :ensure t)

(require 'config-common)
(require 'config-exec-path)
(require 'config-osx)
(require 'config-theme)
(require 'config-status-bar)
(require 'config-evil)

(if (display-graphic-p)
    (require 'config-font))

(require 'config-ibuffer)
(require 'config-edit)
(require 'config-hippie-expand)
(require 'config-expand-region)
(require 'config-multiple-cursor)
(require 'config-linum)

(require 'config-smex)
(require 'config-ivy)
(require 'config-projectile)
(require 'config-sessions)
(require 'config-windows)
(require 'config-dired)

(require 'config-magit)

(require 'config-company)

(require 'config-lang-comment)
(require 'config-flycheck)

(require 'config-lisp)
(require 'config-perl)
(require 'config-cpp)
(require 'config-csharp)
