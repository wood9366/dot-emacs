
(add-to-list 'load-path
             (expand-file-name "core"
                               (file-name-directory load-file-name)))

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

(use-package fullframe
  :ensure t)

(require 'config-utf8)
(require 'config-exec-path)
(require 'config-osx)

(require 'config-evil)

(require 'config-common)
(require 'config-edit)

;; theme
(require 'config-font)
(require 'config-theme)
(require 'config-status-bar)

;; candidate framework
(require 'config-smex)
(require 'config-ivy)

;; utilities
(require 'config-dired)
;; (require 'config-projectile)
;; (require 'config-sessions)
;; (require 'config-windows)

;; (require 'config-company)

(require 'key-bind)

(provide 'core)
