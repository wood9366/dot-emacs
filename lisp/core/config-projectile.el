;;; -*- lexical-binding: t -*-

(use-package projectile
  :ensure t
  :config
  (projectile-global-mode 1)

  (defun ly/projectile-mode-line ()
    (let ((project-name (projectile-project-name)))
      (format "%s[%s]" projectile-mode-line-prefix (or project-name "-"))))

  (setq projectile-enable-caching t
        projectile-completion-system 'ivy
        projectile-mode-line-prefix " p"
        projectile-mode-line-function 'ly/projectile-mode-line)

  (setq-default projectile--mode-line projectile-mode-line-prefix))

(use-package counsel-projectile
  :ensure t
  :after (counsel projectile))

(defun ly/counsel-projectile-search (initial-input)
  (interactive (list (thing-at-point 'symbol)))
  (if ly/counsel-search-function
      (funcall ly/counsel-search-function
               initial-input (projectile-project-root))
    (message "no search tool found")))

(provide 'config-projectile)
