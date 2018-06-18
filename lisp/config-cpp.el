(require 'rtags)

(defun rtags-config ()
  ;; (rtags-start-process-unless-running)
  (rtags-enable-standard-keybindings c-mode-base-map)

  (setq rtags-autostart-diagnostics t)
  (rtags-diagnostics)
  (setq rtags-completions-enabled t)

  (add-to-list (make-local-variable 'company-backends) 'company-rtags)
  (setq-local company-idle-delay nil)
  (define-key c-mode-base-map (kbd "M-/") 'company-complete)

  (evil-define-key 'normal c-mode-base-map (kbd "g d") 'rtags-find-symbol-at-point)
  (evil-define-key 'normal c-mode-base-map (kbd "g D") 'rtags-find-symbol)
  (evil-define-key 'normal c-mode-base-map (kbd "g u") 'rtags-find-references-at-point)
  (evil-define-key 'normal c-mode-base-map (kbd "g U") 'rtags-find-all-references-at-point)
  (evil-define-key 'normal c-mode-base-map (kbd "g R") 'rtags-rename-symbol)

  (evil-define-key 'normal c-mode-base-map (kbd "g }") 'rtags-next-match)
  (evil-define-key 'normal c-mode-base-map (kbd "g {") 'rtags-previous-match)
  (evil-define-key 'normal c-mode-base-map (kbd "g ]") 'rtags-location-stack-forward)
  (evil-define-key 'normal c-mode-base-map (kbd "g [") 'rtags-location-stack-back)

  (evil-define-key 'normal c-mode-base-map (kbd "c c") 'projectile-compile-project)
  (evil-define-key 'normal c-mode-base-map (kbd "c r") 'projectile-run-shell-command-in-root)
  (evil-define-key 'normal c-mode-base-map (kbd "g l") 'rtags-imenu)

  (evil-define-key 'normal c-mode-base-map (kbd ", p o") 'projectile-find-other-file)
  (evil-define-key 'normal c-mode-base-map (kbd ", p O") 'projectile-find-other-file-other-window)

  (use-package flycheck-rtags
    :config
    (flycheck-select-checker 'rtags)
    (setq-local flycheck-highlighting-mode nil)
    (setq-local flycheck-check-syntax-automatically nil))

  (use-package rtags-ivy
    :config
    (setq rtags-display-result-backend 'ivy))

  (c-set-style "k&r")
  (setq c-basic-offset 4))

(add-hook 'c-mode-hook 'rtags-config)
(add-hook 'c++-mode-hook 'rtags-config)
(add-hook 'objc-mode-hook 'rtags-config)

(provide 'config-cpp)
