;; platform variables
(defconst _mac_ (eq system-type 'darwin))
(defconst _win_ (eq system-type 'windows-nt))

(defconst _gui_ (memq window-system '(mac ns x)))
(defconst _term_ (not window-system))

(provide 'core-vars)
