
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
  ", ," '(execute-extended-command :wk "cmd")
  ", w" '(hydra-window/body :wk "windows")
  "C-w" 'hydra-window/body)

(general-def 'normal
  ", v" '(er/expand-region :wk "expand")
  "g c" '(evil-avy-goto-word-1 :wk "jump word")
  "g o" '(xref-find-references :wk "find ref")
  "g /" 'imenu)

;; project
(general-create-definer ly/project-def
  :prefix ", p")

(ly/project-def '(normal visual)
                "" '(nil :wk "project")
                "p" '(counsel-projectile :wk "find")
                "w" '(counsel-projectile-switch-project :wk "switch")
                "s" '(ly/counsel-projectile-search :wk "search")
                "r" '(projectile-invalidate-cache :wk "refresh cache"))

;; tools
(general-create-definer ly/tool-def
  :prefix ", x")

(ly/tool-def '(normal visual)
  "" '(nil :wk "tool")
  "b" 'ibuffer)

;; toggle
(general-create-definer ly/toggle-def
  :prefix ", t")

(ly/toggle-def '(normal visual)
               "" '(nil :wk "toggle")
               "(" '(rainbow-delimiters-mode :wk "rainbow paren")
               "f" '(flycheck-mode :wk "flycheck")
               "F" '(global-flycheck-mode :wk "[flycheck]")
               "n" '(nlinum-mode :wk "line no")
               "N" '(global-nlinum-mode :wk "[line no]")
               "l" '(toggle-truncate-lines :wk "line wrap"))

;; file
(general-create-definer ly/file-def
  :prefix ", f")

(ly/file-def '(normal visual)
             "" '(nil :wk "file")
             "f" '(find-file :wk "open file"))

;; buffer
(general-create-definer ly/buffer-def
  :prefix ", b")

(ly/buffer-def '(normal visual)
               "" '(nil :wk "buffer")
               "b" '(switch-to-buffer :wk "open buffer")
               "o" '(switch-to-buffer-other-window :wk "open buffer in others")
               "x" '(kill-this-buffer :wk "kill buffer"))

;; quit
(general-create-definer ly/quit-def
  :prefix ", q")

(ly/quit-def '(normal visual)
             "" '(nil :wk "quit")
             "q" '(save-buffers-kill-terminal :wk "exit"))
 
;; multiple cursor bind
(general-def '(normal visual)
  :prefix ", m"
  "" '(nil :wk "mc")
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

(provide 'key-bind)
