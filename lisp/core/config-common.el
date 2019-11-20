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
  :diminish (auto-revert-mode . "r")
  :config
  (auto-revert-mode 1))

;; eldoc
(diminish 'eldoc-mode "d")

;; use visual bell instead of sound bell
(use-package mode-line-bell
  :ensure t
  :config
  (mode-line-bell-mode 1))

;; display difference name for same name buffer
(use-package uniquify
  :config
  (setq uniquify-buffer-name-style 'forward))

;; show key tips
(use-package which-key
  :ensure t
  :diminish
  :config
  (which-key-mode 1)

  (setq which-key-enable-extended-define-key t
        which-key-idle-delay 0.5
        which-key-popup-type 'minibuffer))

;; ediff
(setq ediff-window-setup-function 'ediff-setup-windows-plain)
(setq ediff-split-window-function (if (> (frame-width) 150)
                                      'split-window-horizontally
                                    'split-window-vertically))

;; undo/redo window layout
(winner-mode 1)

;; ace window
(use-package ace-window
  :ensure t
  :config
  (setq aw-keys '(?a ?s ?d ?f ?j ?k ?l))
  (set-face-attribute
   'aw-leading-char-face nil
   :foreground "deep sky blue"
   :weight 'bold
   :box nil
   :height 3.0))

;; ibuffer
(use-package ibuffer
  :config
  (fullframe ibuffer quit-window)
  (evil-collection-ibuffer-setup)

  (general-def 'normal ibuffer-mode-map
    (kbd ",") nil
    (kbd "o o") 'ibuffer-toggle-sorting-mode))

;; info
(evil-collection-info-setup)

;; debugger
(evil-collection-debug-setup)

;; tablist
(use-package tablist
  :ensure t
  :defer t)

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
