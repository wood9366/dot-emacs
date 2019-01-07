;; -*- lexical-binding: t -*-

(use-package powerline
  :ensure t
  :config
  (setq powerline-image-apple-rgb t)
  (setq powerline-default-separator 'arrow)

  (defface liyang/window-id-face-active
    '((t (:bold t :foreground "black" :background "#FFCC00" :inherit mode-line))) "")

  (defface liyang/window-id-face-inactive
    '((t (:bold t :foreground "#AFAFAF" :inherit mode-line))) "")

  (defface liyang/evil-state-normal-face
    '((t (:bold t :foreground "black" :background "#01FF01"))) "")

  (defface liyang/evil-state-insert-face
    '((t (:bold t :foreground "black" :background "cyan"))) "")

  (defface liyang/evil-state-visual-face
    '((t (:bold t :foreground "black" :background "magenta"))) "")

  (defface liyang/evil-state-operator-face
    '((t (:bold t :foreground "black" :background "white"))) "")

  (defface liyang/evil-state-replace-face
    '((t (:bold t :foreground "black" :background "#FF0101"))) "")

  (defface liyang/evil-state-motion-face
    '((t (:bold t :foreground "black" :background "yellow"))) "")

  (defface liyang/evil-state-emacs-face
    '((t (:bold t :foreground "black" :background "#0101FF"))) "")

  (defconst liyang/powerline-separator-scale 1.1)

  (defun liyang/powerline-theme ()
    (interactive)
    (setq-default mode-line-format
                  '("%e"
                    (:eval
                     (let* ((active (powerline-selected-window-active))
                            (evil-state-tag (cond
                                             ((eq evil-state 'normal) "N")
                                             ((eq evil-state 'insert) "I")
                                             ((eq evil-state 'visual)
                                              (cond
                                               ((eq evil-visual-selection 'block) "B")
                                               ((eq evil-visual-selection 'line) "L")
                                               (t "V")))
                                             ((eq evil-state 'operator) "O")
                                             ((eq evil-state 'motion) "M")
                                             ((eq evil-state 'replace) "R")
                                             ((eq evil-state 'emacs) "E")))
                            (face-evil-state (intern
                                              (format "liyang/evil-state-%s-face"
                                                      (symbol-name evil-state))))
                            (mode-line-buffer-id (if active 'mode-line-buffer-id 'mode-line-buffer-id-inactive))
                            (mode-line (if active 'mode-line 'mode-line-inactive))
                            (face0 (if active 'powerline-active0 'powerline-inactive0))
                            (face1 (if active 'powerline-active1 'powerline-inactive1))
                            (face2 (if active 'powerline-active2 'powerline-inactive2))
                            (face-window-id (if active 'liyang/window-id-face-active 'liyang/window-id-face-inactive))
                            (separator-height (round (* liyang/powerline-separator-scale (frame-char-height))))
                            (separator-left (intern (format "powerline-%s-%s"
                                                            (powerline-current-separator)
                                                            (car powerline-default-separator-dir))))
                            (separator-right (intern (format "powerline-%s-%s"
                                                             (powerline-current-separator)
                                                             (cdr powerline-default-separator-dir))))
                            (item-window-id
                             (list
                              (powerline-raw (format " %d " (winum-get-number)) face-window-id)
                              (funcall separator-left face-window-id face-evil-state separator-height)))
                            (item-evil-state-tag
                             (list
                              (powerline-raw (format " %s " evil-state-tag) face-evil-state)
                              (funcall separator-left face-evil-state face1 separator-height)
                              ))
                            (item-file-props
                             (list
                              (powerline-raw " %* " face1)
                              (powerline-buffer-size face1)
                              (powerline-raw " " face1)
                              (funcall separator-left face1 face0 separator-height)
                              ))
                            (item-buffer
                             (list
                              (powerline-buffer-id `(mode-line-buffer-id ,face0))
                              (powerline-raw " " face0)
                              (funcall separator-left face0 face1 separator-height)
                              ))
                            (item-major-mode
                             (list
                              (powerline-raw " " face1)
                              (powerline-major-mode face1)
                              (powerline-raw " " face1)
                              (funcall separator-left face1 face0 separator-height)
                              ))
                            (item-flycheck
                             (when flycheck-mode
                               (list
                                (powerline-raw " " face1)
                                (powerline-raw (flycheck-mode-line-status-text) face1)
                                (powerline-raw " " face1)
                                )))
                            (item-minor-modes
                             (list
                              (funcall separator-right face1 face0 separator-height)
                              (powerline-raw " " face0)
                              (powerline-minor-modes face0)
                              (powerline-raw " " face0)
                              ))
                            (item-position
                             (list
                              (funcall separator-right face0 face1 separator-height)
                              (powerline-raw " %3l %2C " face1)))
                            (item-scroll-indicator
                             (list
                              (funcall separator-right face1 face0 separator-height)
                              (powerline-raw (format " %2d"
                                                     (* 100 (/ (float (point)) (point-max))))
                                             face0 'r)
                              (powerline-hud face0 face2)))
                            (lhs (append item-window-id
                                         item-evil-state-tag
                                         item-file-props
                                         item-buffer))
                            (rhs (append item-flycheck
                                         item-minor-modes
                                         item-position
                                         item-scroll-indicator)))
                       (concat
                        (powerline-render lhs)
                        (powerline-fill face1 (powerline-width rhs))
                        (powerline-render rhs)))))))
  (liyang/powerline-theme))

(diminish 'eldoc-mode)

(provide 'config-status-bar)
