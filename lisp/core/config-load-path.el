
(let ((default-directory (expand-file-name "lisp" user-emacs-directory)))
  (add-to-list 'load-path 'default-directory)
  (normal-top-level-add-subdirs-to-load-path))
