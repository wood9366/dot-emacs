
(defhydra hydra-window (:color red :timeout 0.7)
  " window"
  ("h" evil-window-left "left")
  ("l" evil-window-right "right")
  ("k" evil-window-up "up")
  ("j" evil-window-down "down")
  ("s" evil-window-split "split horizontal")
  ("v" evil-window-vsplit "split vertical")
  ("c" evil-window-delete "close")
  ("o" (lambda () (interactive) (delete-other-windows)) "maximum")
  ("x" (lambda () (interactive)
         (setq current-prefix-arg '(16))
         (call-interactively 'ace-window)) "delete")
  ("w" ace-window "ace" :color blue)
  ("C-w" ace-window "ace" :color blue)
  ("u" (lambda ()
         (interactive)
         (progn
           (winner-undo)
           (setq this-command 'winner-undo))) "undo")
  ("r" winner-redo "redo"))

(general-def
  "M-/" 'hippie-expand
  "C-c C-m" 'execute-extended-command
  "C-w" 'backward-kill-word)

(general-def '(normal visual)
  ", ," 'execute-extended-command
  ", w" 'hydra-window/body
  "C-w" 'hydra-window/body)

(general-def 'normal
  ", v" 'er/expand-region
  "g c" 'evil-avy-goto-word-1
  "g o" 'xref-find-references
  "g /" 'imenu)

(general-def '(normal visual)
  :prefix ", p"
  "p" 'counsel-projectile
  "w" 'counsel-projectile-switch-project
  "s" 'ly/counsel-projectile-search
  "r" 'projectile-invalidate-cache)

;; multiple cursor bind
(general-def '(normal visual)
  :prefix ", m"
  "a" 'evil-mc-make-all-cursors
  "A" 'evil-mc-undo-all-cursors
  "p" 'evil-mc-pause-cursors
  "P" 'evil-mc-resume-cursors
  "f" 'evil-mc-make-and-goto-first-cursor
  "l" 'evil-mc-make-and-goto-last-cursor
  "c" 'evil-mc-make-cursor-here
  "," 'evil-mc-make-cursor-move-next-line
  "." 'evil-mc-make-cursor-move-prev-line
  "j" 'evil-mc-make-and-goto-next-cursor
  "J" 'evil-mc-skip-and-goto-next-cursor
  "k" 'evil-mc-make-and-goto-prev-cursor
  "K" 'evil-mc-skip-and-goto-prev-cursor
  "n" 'evil-mc-make-and-goto-next-match
  "N" 'evil-mc-skip-and-goto-next-match
  "p" 'evil-mc-make-and-goto-prev-match
  "P" 'evil-mc-skip-and-goto-prev-match)

;; (defconst liyang/file-prefix "f")
;; (defconst liyang/quit-prefix "q")
;; (defconst liyang/toggle-prefix "t")
;; (defconst liyang/tool-prefix "x")
;; (defconst liyang/buffer-prefix "b")
;; (defconst liyang/window-prefix "w")

;; (defun liyang/bind-key()
;;   (evil-leader/set-key "," 'execute-extended-command)

;;   (evil-leader/set-key liyang/quit-prefix '("quit"))
;;   (evil-leader/set-key (concat liyang/quit-prefix "q")
;;     '("exit" . save-buffers-kill-terminal))

;;   (evil-leader/set-key liyang/toggle-prefix '("toggle"))
;;   (evil-leader/set-key (concat liyang/toggle-prefix "f")
;;     '("flycheck" . global-flycheck-mode))
;;   (evil-leader/set-key (concat liyang/toggle-prefix "c")
;;     '("column 80" . column-enforce-mode))
;;   (evil-leader/set-key (concat liyang/toggle-prefix "l")
;;     '("line wrap" . toggle-truncate-lines))
;;   (evil-leader/set-key (concat liyang/toggle-prefix "n")
;;     '("line number" . global-nlinum-mode))

;;   (evil-leader/set-key liyang/file-prefix '("file"))
;;   (evil-leader/set-key (concat liyang/file-prefix "f")
;;     '("find file" . counsel-find-file))

;;   (evil-leader/set-key liyang/buffer-prefix '("buffer"))
;;   (evil-leader/set-key (concat liyang/buffer-prefix "b")
;;     '("switch buffer" . ivy-switch-buffer))
;;   (evil-leader/set-key (concat liyang/buffer-prefix "x") 'ibuffer)

;;   (evil-leader/set-key (concat liyang/buffer-prefix "d") 'kill-this-buffer)
;;   )

;; (add-hook 'after-init-hook 'liyang/bind-key)

(provide 'key-bind)
