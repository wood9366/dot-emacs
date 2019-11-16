;; platform variables
(defconst _mac_ (eq system-type 'darwin))
(defconst _win_ (eq system-type 'windows-nt))

(defconst _gui_ (display-graphic-p))

(provide 'vars)
