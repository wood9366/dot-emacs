(use-package powerline
  :ensure t
  :config
  (defface liyang/powerline-evil-base-face
    '((t (:weight bold :background "black" :inherit mode-line)))
    "Base face for powerline evil faces."
    :group 'powerline)

  (defface liyang/powerline-evil-normal-face
    '((t (:foreground "green" :inherit liyang/powerline-evil-base-face)))
    "Powerline face for evil NORMAL state."
    :group 'powerline)

  (defface liyang/powerline-evil-insert-face
    '((t (:foreground "blue" :inherit liyang/powerline-evil-base-face)))
    "Powerline face for evil INSERT state."
    :group 'powerline)

  (defface liyang/powerline-evil-visual-face
    '((t (:foreground "orange" :inherit liyang/powerline-evil-base-face)))
    "Powerline face for evil VISUAL state."
    :group 'powerline)

  (defface liyang/powerline-evil-operator-face
    '((t (:foreground "cyan" :inherit liyang/powerline-evil-base-face)))
    "Powerline face for evil OPERATOR state."
    :group 'powerline)

  (defface liyang/powerline-evil-replace-face
    '((t (:foreground "red" :inherit liyang/powerline-evil-base-face)))
    "Powerline face for evil REPLACE state."
    :group 'powerline)

  (defface liyang/powerline-evil-motion-face
    '((t (:foreground "magenta" :inherit liyang/powerline-evil-base-face)))
    "Powerline face for evil MOTION state."
    :group 'powerline)

  (defface liyang/powerline-evil-emacs-face
    '((t (:foreground "violet" :inherit liyang/powerline-evil-base-face)))
    "Powerline face for evil EMACS state."
    :group 'powerline)

  (defun liyang/powerline-evil-face ()
    "Function to select appropriate face based on `evil-state'."
    (let* ((face (intern (concat "liyang/powerline-evil-" (symbol-name evil-state) "-face"))))
      (if (facep face) face nil)))

  (defun liyang/powerline-evil-tag ()
    "Get customized tag value for current evil state."
    (upcase (concat (symbol-name evil-state)
                    (when (evil-visual-state-p)
                      (cond ((eq evil-visual-selection 'block) " BLOCK")
                            ((eq evil-visual-selection 'line) " LINE"))))))

  (setq powerline-default-separator 'utf-8)
  (setq-default mode-line-format
                '("%e"
                  (:eval
                   (let* ((active (powerline-selected-window-active))
                          (mode-line-buffer-id (if active 'mode-line-buffer-id 'mode-line-buffer-id-inactive))
                          (mode-line (if active 'mode-line 'mode-line-inactive))
                          (evil-face (liyang/powerline-evil-face))
                          (face1 (if active 'powerline-active1 'powerline-inactive1))
                          (face2 (if active 'powerline-active2 'powerline-inactive2))
                          (separator-left (intern (format "powerline-%s-%s"
                                                          (powerline-current-separator)
                                                          (car powerline-default-separator-dir))))
                          (separator-right (intern (format "powerline-%s-%s"
                                                           (powerline-current-separator)
                                                           (cdr powerline-default-separator-dir))))
                          (lhs (list (if evil-mode (powerline-raw (format " %s " (liyang/powerline-evil-tag)) evil-face))
                                     (if evil-mode (funcall separator-left evil-face mode-line))
                                     (powerline-raw "%*" mode-line 'l)
                                     (when powerline-display-buffer-size
                                       (powerline-buffer-size mode-line 'l))
                                     (when powerline-display-mule-info
                                       (powerline-raw mode-line-mule-info mode-line 'l))
                                     (powerline-buffer-id mode-line-buffer-id 'l)
                                     (when (and (boundp 'which-func-mode) which-func-mode)
                                       (powerline-raw which-func-format nil 'l))
                                     (powerline-raw " ")
                                     (funcall separator-left mode-line face1)
                                     (powerline-raw " " face1)
                                     (when (and (boundp 'erc-track-minor-mode) erc-track-minor-mode)
                                       (powerline-raw erc-modified-channels-object face1 'l))
                                     (powerline-raw "[" face1)
                                     (powerline-major-mode face1)
                                     (powerline-raw "]" face1)
                                     (powerline-process face1)
                                     (powerline-raw "[" face1)
                                     (powerline-minor-modes face1)
                                     (powerline-raw "]" face1)
                                     (powerline-narrow face1 'l)
                                     (powerline-raw " " face1)
                                     (funcall separator-left face1 face2)
                                     (powerline-vc face2 'r)
                                     (when (bound-and-true-p nyan-mode)
                                       (powerline-raw (list (nyan-create)) face2 'l))))
                          (rhs (list (powerline-raw global-mode-string face2 'r)
                                     (funcall separator-right face2 face1)
                                     (unless window-system
                                       (powerline-raw (char-to-string #xe0a1) face1 'l))
                                     (powerline-raw (window-numbering-get-number-string) face1 'l)
                                     (powerline-raw "%4l" face1 'l)
                                     (powerline-raw ":" face1 'l)
                                     (powerline-raw "%3c" face1 'r)
                                     (funcall separator-right face1 mode-line)
                                     (when powerline-display-hud
                                       (powerline-hud face2 face1)))))
                     (concat (powerline-render lhs)
                             (powerline-fill face2 (powerline-width rhs))
                             (powerline-render rhs))))))
  )

(diminish 'global-auto-revert-mode "r")
(diminish 'auto-revert-mode "r")
(diminish 'undo-tree-mode "u")
(diminish 'which-key-mode "")
(diminish 'yas-minor-mode "y")
(diminish 'global-yasnippet-mode "y")
(diminish 'evil-escape-mode "")
(diminish 'projectile-mode "p")

(provide 'config-status-bar)
