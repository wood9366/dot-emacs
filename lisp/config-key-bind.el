
(general-def
  "C-c C-m" 'execute-extended-command
  "C-w" 'backward-kill-word)

(with-eval-after-load 'evil
  (general-def '(normal visual)
    ", ," 'execute-extended-command)

  (general-def 'normal
    "g o" 'xref-find-references))

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
;;   (evil-leader/set-key (concat liyang/buffer-prefix "r") 'revert-buffer)
;;   (evil-leader/set-key (concat liyang/buffer-prefix "d") 'kill-this-buffer)
;;   )

;; (add-hook 'after-init-hook 'liyang/bind-key)

(provide 'config-key-bind)
