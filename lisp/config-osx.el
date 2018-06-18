(when _mac_
  (setq mac-command-modifier 'meta)
  (setq mac-option-modifier 'none)
  (let ((default-directory  "/usr/local/share/emacs/site-lisp"))
    (normal-top-level-add-subdirs-to-load-path)))

(provide 'config-osx)
