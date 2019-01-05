(defconst liyang/file-prefix "f")
(defconst liyang/quit-prefix "q")
(defconst liyang/toggle-prefix "t")
(defconst liyang/tool-prefix "x")
(defconst liyang/buffer-prefix "b")
(defconst liyang/window-prefix "w")

(add-hook 'after-init-hook
          (lambda ()
            (evil-leader/set-key liyang/quit-prefix '("quit"))
            (evil-leader/set-key (concat liyang/quit-prefix "q") '("exit" . save-buffers-kill-terminal))

            (evil-leader/set-key liyang/file-prefix '("file"))
            (evil-leader/set-key (concat liyang/file-prefix "f") '("find file" . counsel-find-file))

            (evil-leader/set-key liyang/window-prefix '("window"))
            (evil-leader/set-key (concat liyang/window-prefix "s")
              '("split horizontal" . evil-window-split))
            (evil-leader/set-key (concat liyang/window-prefix "v")
              '("split vertical" . evil-window-vsplit))
            (evil-leader/set-key (concat liyang/window-prefix "o")
              '("keep current window" . delete-other-windows))
            (evil-leader/set-key (concat liyang/window-prefix "c")
              '("delete current window" . evil-window-delete))

            (evil-leader/set-key liyang/buffer-prefix '("buffer"))
            (evil-leader/set-key (concat liyang/buffer-prefix "b") '("switch buffer" . ivy-switch-buffer))
            (evil-leader/set-key (concat liyang/buffer-prefix "B") 'ibuffer)))

(provide 'config-key-bind)
