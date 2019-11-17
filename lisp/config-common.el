;; hide menu bar
(menu-bar-mode -1)
;; hide tool bar
(tool-bar-mode -1)

;; hide scroll bar
(if (functionp 'scroll-bar-mode)
    (scroll-bar-mode -1))

;; set title bar color
(when _gui_
  (add-to-list 'default-frame-alist '(ns-transparent-titlebar . t))
  (add-to-list 'default-frame-alist '(ns-appearance . dark)))

;; hide startup message
(setq inhibit-startup-message t)
(setq inhibit-startup-echo-area-message t)

;; setup welcome message
(setq-default initial-scratch-message
              (concat ";; Happy hacking, " user-login-name " - Emacs ♥ you!\n\n"))

;; no popup dialog
(setq use-dialog-box nil)

;; use y/n answer question
(fset 'yes-or-no-p 'y-or-n-p)

;; redirect auto save location
(let* ((auto-save-dir (concat user-emacs-directory "autosaves/")))
  (unless (file-directory-p auto-save-dir) (make-directory auto-save-dir t))
  (setq auto-save-file-name-transforms `((".*" ,auto-save-dir t))))

;; redirect backup files location
(let* ((backup-dir (concat user-emacs-directory "backups/")))
  (unless (file-directory-p backup-dir) (make-directory backup-dir t))
  (setq backup-directory-alist `((".*" . ,backup-dir))))

;; auto revert buffer when change
(use-package autorevert
  :ensure t
  :hook (after-init . auto-revert-mode))

;; use visual bell instead of sound bell
(use-package mode-line-bell
  :ensure t
  :hook (after-init . mode-line-bell-mode))

;; display difference name for same name buffer
(use-package uniquify
  :config
  (setq uniquify-buffer-name-style 'forward))

;; ;; view big file
;; (defun wood9366/open-big-file-hook()
;;   (when (> (buffer-size) (* 1024 1024))
;;     (message (concat "open big file" (buffer-name)))
;;     (setq buffer-read-only t)
;;     (buffer-disable-undo)
;;     (fundamental-mode)))

;; (use-package vlf
;;   :ensure t
;;   :init
;;   (defun ffap-vlf ()
;;     "Find file at point with VLF."
;;     (interactive)
;;     (let ((file (ffap-file-at-point)))
;;       (unless (file-exists-p file)
;;         (error "File does not exist: %s" file))
;;       (vlf file))))

(provide 'config-common)
