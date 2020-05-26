;; -*- lexical-binding: t -*-

(defun ly/current-elisp-path ()
  (or load-file-name buffer-file-name))

(provide 'ly-util)
