(when _mac_
  (setq mac-command-modifier 'none)
  (setq mac-option-modifier 'meta)
  (let ((default-directory  "/usr/local/share/emacs/site-lisp"))
    (normal-top-level-add-subdirs-to-load-path)))

(provide 'config-osx)
