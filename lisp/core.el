
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

(require 'config-utf8)
(require 'config-exec-path)
(require 'config-osx)

(require 'config-evil)

(require 'config-common)
(require 'config-ediff)
(require 'config-key-bind)

(require 'config-edit)
(require 'config-show-paren)

(require 'config-font)
(require 'config-theme)
(require 'config-status-bar)

(require 'config-which-key)
(require 'config-avy)

(require 'config-smex)
(require 'config-ivy)

;; (require 'config-ibuffer)
;; (require 'config-hippie-expand)
;; (require 'config-expand-region)
;; (require 'config-multiple-cursor)
;; (require 'config-linum)

;; (require 'config-projectile)
;; (require 'config-sessions)
;; (require 'config-windows)
;; (require 'config-dired)

;; (require 'config-company)

(provide 'core)
