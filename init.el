;; -*- lexical-binding: t -*-

;; Adjust garbage collection thresholds during startup, and thereafter
(let ((normal-gc-cons-threshold (* 20 1024 1024))
      (init-gc-cons-threshold (* 128 1024 1024)))
  (setq gc-cons-threshold init-gc-cons-threshold)
  (add-hook 'after-init-hook
            (lambda () (setq gc-cons-threshold normal-gc-cons-threshold))))

(setq debug-on-error nil)

(when (< emacs-major-version 26)
  (error "Your emacs is too old -- this config requires v26 of higher"))

(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

(require 'ly-util)
(require 'ly-core)

(require 'ly-git)
(require 'ly-org)

(require 'ly-cmake)
(require 'ly-proto)
(require 'ly-markdown)
(require 'ly-plantuml)

(require 'ly-lsp)

(require 'ly-lua)
(require 'ly-perl)
(require 'ly-shader)
(require 'ly-csharp)
(require 'ly-vue)
(require 'ly-js)
(require 'ly-react)
(require 'ly-json)
(require 'ly-yaml)
(require 'ly-cpp)

;; (require 'config-lisp)
;; (require 'config-cpp)
;; (require 'config-csharp)
;; (require 'config-lua)
;; (require 'config-web)
;; (require 'config-java)
;; (require 'config-python)
