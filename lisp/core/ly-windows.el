;; -*- lexical-binding: t -*-

(use-package ace-window
  :ensure t
  :config
  (winner-mode 1)
  (setq aw-keys '(?a ?s ?d ?f ?j ?k ?l))
  (set-face-attribute
   'aw-leading-char-face nil
   :foreground "deep sky blue"
   :weight 'bold
   :box nil
   :height 3.0)

  (defhydra hydra-window (:color pink)
    "window"
    ("h" evil-window-left "left")
    ("l" evil-window-right "right")
    ("k" evil-window-up "up")
    ("j" evil-window-down "down")
    ("s" evil-window-split "split horizontal")
    ("v" evil-window-vsplit "split vertical")
    ("x" evil-window-delete "close")
    ("d" (lambda () (interactive)
           (setq current-prefix-arg '(16))
           (call-interactively 'ace-window)) "delete")
    ("w" ace-window "ace" :color blue)
    ("o" (lambda () (interactive) (delete-other-windows)) "maximum" :color blue)
    ("u" (lambda ()
           (interactive)
           (progn
             (winner-undo)
             (setq this-command 'winner-undo))) "undo")
    ("r" winner-redo "redo")
    ("q" nil "quit"))

  (evil-leader/set-key "w" 'hydra-window/body))

(provide 'ly-windows)
