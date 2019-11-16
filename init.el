;; -*- lexical-binding: t -*-

(setq debug-on-error nil)

(when (< emacs-major-version 26)
  (error "Your emacs is too old -- this config requires v26 of higher"))

;; Adjust garbage collection thresholds during startup, and thereafter
(let ((normal-gc-cons-threshold (* 20 1024 1024))
      (init-gc-cons-threshold (* 128 1024 1024)))
  (setq gc-cons-threshold init-gc-cons-threshold)
  (add-hook 'after-init-hook
            (lambda () (setq gc-cons-threshold normal-gc-cons-threshold))))

(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

(require 'config-benchmarking)

(require 'vars)

(require 'config-custom-file)
(require 'config-local)

(require 'config-elpa)
(require 'config-site-lisp)

(require-package 'use-package)

(use-package diminish
  :ensure t)

(use-package hydra
  :ensure t)

(use-package general
  :ensure t)

(require 'config-utf8)
(require 'config-exec-path)

(require 'config-osx)
(require 'config-theme)
(require 'config-status-bar)

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

(require 'config-org)
(require 'config-reveal)

(require 'config-lang-base)
(require 'config-flycheck)

(require 'config-proto)
(require 'config-markdown)
(require 'config-plantuml)
(require 'config-cmake)

(require 'config-lisp)
(require 'config-perl)
(require 'config-cpp)
(require 'config-csharp)
(require 'config-lua)
(require 'config-shader)
(require 'config-web)
(require 'config-java)
(require 'config-python)

(require 'config-evil)
(require 'config-common)
(require 'config-which-key)
(require 'config-ediff)
(require 'config-avy)
