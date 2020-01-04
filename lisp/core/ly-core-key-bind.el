
(general-def
  "M-/" 'hippie-expand
  "M-;" 'evilnc-comment-or-uncomment-lines
  "C-c C-m" 'execute-extended-command
  "C-w" 'backward-kill-word)

(general-def '(normal visual)
  ", ," '(execute-extended-command :wk "cmd"))

(general-def 'normal
  [remap undo] 'undo-tree-undo
  [remap redo] 'undo-tree-redo
  ", v" '(er/expand-region :wk "expand")
  "g c" '(evil-avy-goto-word-1 :wk "jump to word")
  "g s" '(imenu :wk "jump to symbol")
  "g ." '(xref-find-definitions :wk "find definitions")
  "g /" '(xref-find-references :wk "find references"))

;; window
(general-create-definer ly/window-def
  :prefix ", w")

(defun ly/delete-other-window ()
  (interactive)
  (delete-other-windows))

(defun ly/ace-close-window ()
  (interactive)
  (setq current-prefix-arg '(16))
  (call-interactively 'ace-window))

(defun ly/undo-win ()
  (interactive)
  (winner-undo)
  (setq this-command 'winner-undo))

(ly/window-def '(normal)
  "" '(nil :wk "window")
  "h" '(evil-window-left :wk "left")
  "l" '(evil-window-right :wk "right")
  "k" '(evil-window-up :wk "up")
  "j" '(evil-window-down :wk "down")
  "s" '(evil-window-split :wk "split horizontal")
  "v" '(evil-window-vsplit :wk "split vertical")
  "c" '(evil-window-delete :wk "close")
  "o" '(ly/delete-other-window :wk "maximum")
  "x" '(ly/ace-close-window :wk "ace close")
  "w" '(ace-window :wk "ace open")
  "u" '(ly/undo-win :wk "undo")
  "r" '(winner-redo :wk "redo"))

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
  "b" 'ibuffer
  "u" 'undo-tree-visualize)

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
  "b" '(switch-to-buffer :wk "open")
  "o" '(switch-to-buffer-other-window :wk "open in others")
  "r" '(revert-buffer :wk "revert")
  "s" '(save-buffer :wk "save")
  "d" '(kill-this-buffer :wk "close"))

;; quit
(general-create-definer ly/quit-def
  :prefix ", q")

(ly/quit-def '(normal visual)
  "" '(nil :wk "quit")
  "q" '(save-buffers-kill-terminal :wk "exit"))

;; major mode
(general-create-definer ly/mode-def
  :prefix "SPC")

(general-def 'normal
  "SPC" 'nil)

;; yasnippet
(general-create-definer ly/yasnippet-def
  :prefix ", y")

(ly/yasnippet-def '(normal visual)
  "" '(nil :wk "yas")
  "r" '(yas-reload-all :wk "reload")
  "i" '(yas-insert-snippet :wk "insert")
  "y" '(yas-visit-snippet-file :wk "open")
  "n" '(yas-new-snippet :wk "new"))

;; multiple cursor bind
(defhydra hydra-mc (:color pink)
  "mc"
  ("m" evil-mc-undo-all-cursors :color blue)
  ("q" nil :color blue)
  ("a" evil-mc-make-all-cursors)
  ("x" evil-mc-undo-all-cursors)
  ;; ("s" evil-mc-pause-cursors)
  ;; ("r" evil-mc-resume-cursors)
  ;; ("^" evil-mc-make-and-goto-first-cursor)
  ;; ("$" evil-mc-make-and-goto-last-cursor)
  ("SPC" evil-mc-make-cursor-here)
  ("j" evil-mc-make-cursor-move-next-line)
  ("k" evil-mc-make-cursor-move-prev-line)
  ;; ("C-n" evil-mc-make-and-goto-next-cursor)
  ;; ("C-N" evil-mc-skip-and-goto-next-cursor)
  ;; ("C-p" evil-mc-make-and-goto-prev-cursor)
  ;; ("C-P" evil-mc-skip-and-goto-prev-cursor)
  ("n" evil-mc-make-and-goto-next-match)
  ("N" evil-mc-skip-and-goto-next-match)
  ("p" evil-mc-make-and-goto-prev-match)
  ("P" evil-mc-skip-and-goto-prev-match))

(general-def '(normal visual) ", m" 'hydra-mc/body)

(provide 'ly-core-key-bind)
