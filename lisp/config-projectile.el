;;; -*- lexical-binding: t -*-

(use-package projectile
  :ensure t
  :after (counsel ivy)
  :config
  (setq projectile-completion-system 'ivy))

(use-package counsel-projectile
  :ensure t
  :after (counsel projectile)
  :config
  (let ((search-function
	 (cond
	  ((executable-find "rg") 'counsel-rg)
	  ((executable-find "ag") 'counsel-ag)
	  ((executable-find "pt") 'counsel-pt)
	  ((executable-find "ack") 'counsel-ack))))
    (when search-function
      (defun sanityinc/counsel-search-project (initial-input &optional use-current-dir)
	"Search using `counsel-rg' or similar from the project root for INITIAL-INPUT.
If there is no project root, or if the prefix argument
USE-CURRENT-DIR is set, then search from the current directory
instead."
	(interactive (list (thing-at-point 'symbol)
			   current-prefix-arg))
	(let ((current-prefix-arg)
	      (dir (if use-current-dir
		       default-directory
		     (condition-case err
			 (projectile-project-root)
		       (error default-directory)))))
	  (funcall search-function initial-input dir)))))

  (use-package evil
    :config
    (evil-leader/set-key "ps" 'sanityinc/counsel-search-project)
    (evil-leader/set-key "pp" 'counsel-projectile-find-file)
    (evil-leader/set-key "pw" 'counsel-projectile-switch-project)))


(provide 'config-projectile)
