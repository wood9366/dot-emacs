                                        ; feature could be rtags, base
(defun cpp-base-config()
  (c-set-style "k&r")
  (setq c-basic-offset 4)
  )

(defun cpp-rtags-config()
  (when (require 'rtags nil 'noerror)
    (defun rtags-config (keymap)
      ;; (rtags-start-process-unless-running)
      ;; (rtags-enable-standard-keybindings c-mode-base-map)

      (setq rtags-autostart-diagnostics t)
      (rtags-diagnostics)
      (setq rtags-completions-enabled t)

      (add-to-list (make-local-variable 'company-backends) 'company-rtags)
      (setq-local company-idle-delay nil)

      (evil-define-key 'normal keymap (kbd "g d") 'rtags-find-symbol-at-point)
      (evil-define-key 'normal keymap (kbd "g D") 'rtags-find-symbol)
      (evil-define-key 'normal keymap (kbd "g u") 'rtags-find-references-at-point)
      (evil-define-key 'normal keymap (kbd "g U") 'rtags-find-all-references-at-point)
      (evil-define-key 'normal keymap (kbd "g R") 'rtags-rename-symbol)

      (evil-define-key 'normal keymap (kbd "g }") 'rtags-next-match)
      (evil-define-key 'normal keymap (kbd "g {") 'rtags-previous-match)
      (evil-define-key 'normal keymap (kbd "g ]") 'rtags-location-stack-forward)
      (evil-define-key 'normal keymap (kbd "g [") 'rtags-location-stack-back)

      ;; (evil-define-key 'normal keymap (kbd "c c") 'projectile-compile-project)
      ;; (evil-define-key 'normal keymap (kbd "c r") 'projectile-run-shell-command-in-root)
      (evil-define-key 'normal keymap (kbd "g l") 'rtags-imenu)

      (evil-define-key 'normal keymap (kbd ", p o") 'projectile-find-other-file)
      (evil-define-key 'normal keymap (kbd ", p O") 'projectile-find-other-file-other-window)

      (use-package flycheck-rtags
        :config
        (flycheck-select-checker 'rtags)
        (setq-local flycheck-highlighting-mode nil)
        (setq-local flycheck-check-syntax-automatically nil))

      ;; (use-package ivy-rtags
      ;;   :config
      ;;   (setq rtags-display-result-backend 'ivy))

      ;; (setq rtags-display-result-backend 'ivy)
      )
    (cpp-base-config)
    (rtags-config c++-mode-map)
    (rtags-config objc-mode-map)
    )
  )

(defun cpp-ctags-config()
  (defun liyang/update-tags ()
    "update etags under projecitle project"
    (interactive)
    (let ((dir (projectile-project-root))
          tag)
      (if (not dir)
          (message "not projectile project")
        (setq tag (concat dir "TAGS"))
        (message "generate tag %s" tag)
        (shell-command (format "ctags -f %s -e -R %s" tag dir))
        )
      ))

  (cpp-base-config)
  (evil-define-key 'normal c++-mode-map (kbd "g d") 'xref-find-definitions)
  (evil-define-key 'normal c++-mode-map (kbd "g D") 'xref-find-definitions-other-window)
  (evil-define-key 'normal c++-mode-map (kbd "g u") 'xref-find-references)
  (evil-leader/set-key "gg" 'liyang/update-tags)
  )

(defconst cpp-feature 'base)

(let ((cpp-config-fn
       (cond
        ((eq cpp-feature 'rtags) 'cpp-rtags-config)
        (t 'cpp-ctags-config))))
  (add-hook 'c++-mode-hook cpp-config-fn)
  (add-hook 'objc-mode-hook cpp-config-fn))

(provide 'config-cpp)
