
(use-package csharp-mode
  :ensure t
  :defer t)

(use-package omnisharp
  :ensure t
  :defer t
  :init
  (add-hook 'csharp-mode-hook
	    (lambda ()
	      (omnisharp-mode 1)
	      (add-to-list (make-local-variable 'company-backends) 'company-omnisharp)))
  :config
  (setq omnisharp-server-executable-path "/Users/liyang/packs/omnisharp/1.34.8/run")

  (defun omnisharp--ivy-usage-transform-candidate (candidate)
    "Convert a quickfix entry into helm output"
    (cons
     (format "%s(%s): %s"
	     (file-name-nondirectory (omnisharp--get-filename candidate))
	     (number-to-string (cdr (assoc 'Line candidate)))
	     (cdr (assoc 'Text candidate)))
     candidate))

  (defun omnisharp--ivy-got-usage (quickfixes)
    (let* ((quickfixes (alist-get 'QuickFixes quickfixes))
	   (candidates (mapcar 'omnisharp--ivy-usage-transform-candidate quickfixes)))
      (ivy-read "Find Usage: "
      		candidates
      		:require-match t
      		:action (lambda (x) (omnisharp-go-to-file-line-and-column x))
      		:caller 'omnisharp--ivy-got-usage)))

  (defun omnisharp-ivy-find-usage ()
    (interactive)
    (omnisharp--send-command-to-server
     "findusages"
     (omnisharp--get-request-object)
     #'omnisharp--ivy-got-usage))

  (evil-make-overriding-map omnisharp-mode-map 'normal)
  (general-def 'normal omnisharp-mode-map
    "g ." 'omnisharp-go-to-definition
    "g /" 'omnisharp-ivy-find-usage))

;; (use-package lsp-mode
;;   :ensure t
;;   :hook csharp-mode
;;   :config
;;   (setq lsp-csharp-server-path "/Users/liyang/packs/omnisharp/1.34.8/run"))

;; (use-package company-lsp
;;   :ensure t
;;   :defer t
;;   :config
;;   (setq company-lsp-cache-candidates 'auto
;; 	company-lsp-enable-snippet t
;; 	company-lsp-async nil))

(provide 'ly-csharp)
