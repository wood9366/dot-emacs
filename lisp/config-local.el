
(add-hook 'after-init-hook
          (lambda ()
            (let ((local-config "~/.emacs-local.el"))
              (when (file-exists-p local-config)
                (message "load local config %s" local-config)
                (load-file local-config)))))

(provide 'config-local)
