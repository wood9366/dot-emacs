
;; Set customization file name
(setq custom-file "~/.emacs-custom.el")

;; Try to load custom file
(if (file-exists-p custom-file)
    (load custom-file))

(provide 'ly-custom-file)
