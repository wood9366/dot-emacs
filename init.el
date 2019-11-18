;; -*- lexical-binding: t -*-

(setq debug-on-error nil)

(when (< emacs-major-version 26)
  (error "Your emacs is too old -- this config requires v26 of higher"))

(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

;; Adjust garbage collection thresholds during startup, and thereafter
(let ((normal-gc-cons-threshold (* 20 1024 1024))
      (init-gc-cons-threshold (* 128 1024 1024)))
  (setq gc-cons-threshold init-gc-cons-threshold)
  (add-hook 'after-init-hook
            (lambda () (setq gc-cons-threshold normal-gc-cons-threshold))))

(require 'core)

;; (require 'config-magit)

;; (require 'config-org)
;; (require 'config-reveal)

;; (require 'config-lang-base)
;; (require 'config-flycheck)

;; (require 'config-proto)
;; (require 'config-markdown)
;; (require 'config-plantuml)
;; (require 'config-cmake)

;; (require 'config-lisp)
;; (require 'config-perl)
;; (require 'config-cpp)
;; (require 'config-csharp)
;; (require 'config-lua)
;; (require 'config-shader)
;; (require 'config-web)
;; (require 'config-java)
;; (require 'config-python)
