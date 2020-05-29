
(add-to-list 'load-path
             (expand-file-name "core" (file-name-directory (ly/current-elisp-path))))

(require 'ly-core-vars)

;; package
(require 'ly-elpa)
(require 'ly-site-lisp)

(require 'ly-custom-file)
(require 'ly-local)

;; install use-package
;; use use-package install and config other packages
(sanityinc/require-package 'use-package)

;; key bind packages
(use-package general :ensure t)
(use-package hydra :ensure t)

;; hide or short minor mode display
(use-package diminish :ensure t)

;; max/min specific window
(use-package fullframe :ensure t)

;; environment
(require 'ly-utf8)
(require 'ly-exec-path)
(require 'ly-sessions)
(require 'ly-osx)

(require 'ly-evil)

;; basic
(require 'ly-common)
(require 'ly-edit)

;; theme
(require 'ly-font)
(require 'ly-theme)
(require 'ly-status-bar)

;; candidate framework
(require 'ly-smex)
(require 'ly-ivy)

;; complete
(require 'ly-company)

;; utilities
(require 'ly-dired)
(require 'ly-projectile)
(require 'ly-flycheck)

(require 'ly-core-key-bind)

(provide 'ly-core)
