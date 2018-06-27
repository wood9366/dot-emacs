;; hide menu bar
(menu-bar-mode -1)
;; hide tool bar
(tool-bar-mode -1)
;; hide scroll bar
(scroll-bar-mode -1)

;; hide startup message
(setq inhibit-startup-message t)
(setq inhibit-startup-echo-area-message t)

;; setup welcome message
(setq-default initial-scratch-message
              (concat ";; Happy hacking, " user-login-name " - Emacs ♥ you!\n\n"))

(fset 'yes-or-no-p 'y-or-n-p)

;; redirect auto save location
(let* ((auto-save-dir (concat user-emacs-directory "autosaves/")))
  (unless (file-directory-p auto-save-dir) (make-directory auto-save-dir t))
  (setq auto-save-file-name-transforms `((".*" ,auto-save-dir t))))

;; redirect backup files location
(let* ((backup-dir (concat user-emacs-directory "backups/")))
  (unless (file-directory-p backup-dir) (make-directory backup-dir t))
  (setq backup-directory-alist `((".*" . ,backup-dir))))

;; remap M-x key bind to C-c C-m
(global-set-key (kbd "C-c C-m") 'execute-extended-command)

(use-package mode-line-bell
  :ensure t
  :init
  (add-hook 'after-init-hook 'mode-line-bell-mode))

;; display difference name for same name buffer
(use-package uniquify
  :init
  (setq uniquify-buffer-name-style 'forward))

(add-hook 'after-init-hook (lambda () (diminish 'auto-revert-mode)))

(provide 'config-common)
