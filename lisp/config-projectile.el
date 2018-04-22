;; -*- lexical-binding: t -*-

(use-package projectile
  :ensure t
  :after (ivy)
  :init
  (let ((search-function
	 (cond
	  ((executable-find "rg") 'counsel-rg)
	  ((executable-find "ag") 'counsel-ag)
	  ((executable-find "pt") 'counsel-pt)
	  ((executable-find "ack") 'counsel-ack))))
    (when search-function
      (message "init search function: %s" search-function)
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
	  (message "search function: %s" search-function)
	  (funcall search-function initial-input dir)))))
  (use-package evil
    :config
    (evil-leader/set-key "ps" 'sanityinc/counsel-search-project))

  :config
  (setq projectile-completion-system 'ivy))


(provide 'config-projectile)
