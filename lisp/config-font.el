(defvar liyang/font-size)
(defvar liyang/font-en)
(defvar liyang/font-cn)
(defvar liyang/font-sym)
(defvar liyang/font-size-list)

(defun liyang/set-font (font-en font-cn font-sym font-size)
  (let* ((en-size font-size)
         (sizes (or (assoc-default font-size liyang/font-size-list)))
         (cn-size (if sizes (nth 0 sizes) font-size))
         (sym-size (if sizes (nth 1 sizes) font-size)))
    (set-face-attribute 'default nil :font (format "%s %s" font-en en-size))
    (dolist (charset '(kana han symbol cjk-misc bopomofo))
      (set-fontset-font (frame-parameter nil 'font) charset
                        (font-spec :family font-cn
                                   :size cn-size)))
    (set-fontset-font (frame-parameter nil 'font) '(#x24D0 . #x24E9)
                      (font-spec :family font-sym
                                 :size sym-size))
    (setq liyang/font-en font-en
          liyang/font-cn font-cn
          liyang/font-sym font-sym
          liyang/font-size font-size)
    (liyang/font-info)))

(defun liyang/adjust-font-size (inc)
  (setq liyang/font-size (+ liyang/font-size inc))
  (liyang/set-font liyang/font-en liyang/font-cn liyang/font-sym liyang/font-size))

(defun liyang/increase-font-size ()
  (interactive)
  (liyang/adjust-font-size 1))

(defun liyang/decrease-font-size ()
  (interactive)
  (liyang/adjust-font-size -1))

(defun liyang/font-info()
  (interactive)
  (let* ((sizes (assoc-default liyang/font-size liyang/font-size-list)))
    (message "font en %s %s cn %s %s sym %s %s"
             liyang/font-en
             liyang/font-size
             liyang/font-cn
             (if sizes (nth 0 sizes) liyang/font-size)
             liyang/font-sym
             (if sizes (nth 1 sizes) liyang/font-size))))

(defun liyang/refresh-font()
  (interactive)
  (liyang/set-font liyang/font-en liyang/font-cn liyang/font-sym liyang/font-size))

(global-set-key (kbd "C-x C-=") 'liyang/increase-font-size)
(global-set-key (kbd "C-x C--") 'liyang/decrease-font-size)

(setq liyang/font-size-list '((8 10 10)
                              (9 10 10)
                              (10 12 12)
                              (11 14 14)
                              (12 14 14)
                              (13 16 16)
                              (14 16 16)
                              (15 18 18)
                              (16 20 20)
                              (17 20 20)
                              (18 22 22)
                              ))

(liyang/set-font "SauceCodePro Nerd Font Mono"
                 "SauceCodePro Nerd Font Mono"
                 "SauceCodePro Nerd Font Mono"
                 15)

;; |abcd|efgh|ijkl|mnop|qrst|uvwx|yz|
;; |ABCD|EFGH|IJKL|MNOP|QRST|UVWX|YZ|
;; |你好|你好|你好|你好|你好|你好|你|
;; |ⓡⓡ|ⓡⓡ|ⓡⓡ|ⓡⓡ|ⓡⓡ|ⓡⓡ|ⓡ|

(provide 'config-font)
