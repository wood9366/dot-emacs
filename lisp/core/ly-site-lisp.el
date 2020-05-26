
;; Add local site lisp into load path
(let ((default-directory (expand-file-name "site-lisp" user-emacs-directory)))
  (add-to-list 'load-path default-directory)
  (normal-top-level-add-subdirs-to-load-path))

;; Add mac system site lisp into load path
(when _mac_
  (let ((default-directory  "/usr/local/share/emacs/site-lisp"))
    (normal-top-level-add-subdirs-to-load-path)))

(provide 'ly-site-lisp)
