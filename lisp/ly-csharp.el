;; -*- lexical-binding: t -*-

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
  (setq omnisharp-server-executable-path "/usr/local/bin/omnisharp")

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
    [remap xref-find-definitions] 'omnisharp-go-to-definition
    [remap xref-find-references] 'omnisharp-ivy-find-usage)

  (general-def 'normal omnisharp-mode-map
    :prefix "SPC"
    "r" 'omnisharp-rename
    "c" 'omnisharp-run-code-action-refactoring
    "f" 'omnisharp-fix-usings)
  )

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

(defun origami-csharp-region-parser (create)
  (lambda (content)
    (let ((positions (origami-get-positions content "#region\\|#endregion")))
      (origami-build-pair-tree create "#region" "#endregion" positions))))
 
(defun origami-csharp-parser (create)
  (let ((c-style (origami-c-style-parser create))
        (region (origami-csharp-region-parser create)))
    (lambda (content)
      (origami-fold-children
       (origami-fold-shallow-merge
        (origami-fold-root-node (funcall c-style content))
        (origami-fold-root-node (funcall region content)))))))

;; (setq origami-parser-alist (assoc-delete-all 'csharp-mode origami-parser-alist))
(add-to-list 'origami-parser-alist
             '(csharp-mode . origami-csharp-parser))

(provide 'ly-csharp)
