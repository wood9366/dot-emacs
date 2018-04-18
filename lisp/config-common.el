;; hide menu bar
(menu-bar-mode -1)
;; hide tool bar
(tool-bar-mode -1)
;; hide scroll bar
(scroll-bar-mode -1)

;; enable static elisp variable binding
(setq lexical-binding t)

;; hide startup message
(setq inhibit-startup-message t)
(setq inhibit-startup-echo-area-message t)

;; setup welcome message
(setq-default initial-scratch-message
              (concat ";; Happy hacking, " user-login-name " - Emacs ♥ you!\n\n"))

;; redirect auto save location
(let* ((auto-save-dir (concat user-emacs-directory "autosaves/")))
  (unless (file-directory-p auto-save-dir) (make-directory auto-save-dir t))
  (setq auto-save-file-name-transforms `((".*" ,auto-save-dir t))))

;; redirect backup files location
(let* ((backup-dir (concat user-emacs-directory "backups/")))
  (unless (file-directory-p backup-dir) (make-directory backup-dir t))
  (setq backup-directory-alist `((".*" . ,backup-dir))))

(provide 'config-common)
