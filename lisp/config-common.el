;; hide menu bar
(menu-bar-mode -1)
;; hide tool bar
(tool-bar-mode -1)

;; hide scroll bar
(if (functionp 'scroll-bar-mode)
    (scroll-bar-mode -1))

(setq use-dialog-box nil)

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

;; colored title bar
(add-to-list 'default-frame-alist '(ns-transparent-titlebar . t))
(add-to-list 'default-frame-alist '(ns-appearance . dark))

;; view big file
(defun wood9366/open-big-file-hook()
  (when (> (buffer-size) (* 1024 1024))
    (message (concat "open big file" (buffer-name)))
    (setq buffer-read-only t)
    (buffer-disable-undo)
    (fundamental-mode)))

(use-package vlf
  :ensure t
  :init
  (defun ffap-vlf ()
    "Find file at point with VLF."
    (interactive)
    (let ((file (ffap-file-at-point)))
      (unless (file-exists-p file)
        (error "File does not exist: %s" file))
      (vlf file))))

;; display key guide
(use-package which-key
  :ensure t
  :diminish
  :init
  (evil-leader/set-key "t w" 'which-key-mode)
  (which-key-mode)
  :custom
  (which-key-enable-extended-define-key t)
  :config
  (setq which-key-idle-delay 0.5)
  (setq which-key-popup-type 'minibuffer))

;; ediff
(setq ediff-window-setup-function 'ediff-setup-windows-plain)
(setq ediff-split-window-function (if (> (frame-width) 150)
				      'split-window-horizontally
				    'split-window-vertically))

(provide 'config-common)
