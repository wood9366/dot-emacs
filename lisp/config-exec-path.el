
(when _gui_
  (use-package exec-path-from-shell
    :ensure t
    :config
    (exec-path-from-shell-initialize)
    (exec-path-from-shell-copy-envs '("LANG" "LC_ALL" "LC_CTYPE"))))

(provide 'config-exec-path)
