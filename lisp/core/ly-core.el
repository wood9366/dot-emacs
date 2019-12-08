
(add-to-list 'load-path
             (expand-file-name "core"
                               (file-name-directory load-file-name)))

(require 'config-benchmarking)

(require 'ly-core-vars)

;; package
(require 'config-elpa)
(require 'config-site-lisp)

(require 'config-custom-file)
(require 'config-local)

(require-package 'use-package)

(use-package diminish
  :ensure t)

(use-package hydra
  :ensure t)

(use-package general
  :ensure t)

(use-package fullframe
  :ensure t)

;; environment
(require 'config-utf8)
(require 'config-exec-path)
(require 'config-sessions)
(require 'config-osx)

(require 'config-evil)

;; basic
(require 'config-common)
(require 'config-edit)

;; theme
(require 'config-font)
(require 'config-theme)
(require 'config-status-bar)

;; candidate framework
(require 'config-smex)
(require 'config-ivy)

;; complete
(require 'config-company)

;; utilities
(require 'config-dired)
(require 'config-projectile)
(require 'config-flycheck)

(require 'ly-core-key-bind)

(provide 'ly-core)
