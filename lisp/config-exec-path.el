
(when _gui_
  (use-package exec-path-from-shell
    :ensure t
    :init
    (when (memq window-system '(mac ns x))
      (exec-path-from-shell-initialize)
      (exec-path-from-shell-copy-envs '("LANG" "LC_ALL" "LC_CTYPE")))))

(provide 'config-exec-path)
