;; -*- lexical-binding: t -*-

(when _gui_
  (defvar wood9366/font-size)
  (defvar wood9366/font-en)
  (defvar wood9366/font-cn)
  (defvar wood9366/font-sym)
  (defvar wood9366/font-size-list)

  (defun wood9366/set-font (font-en font-cn font-sym font-size)
    (let* ((en-size font-size)
           (sizes (or (assoc-default font-size wood9366/font-size-list)))
           (cn-size (if sizes (nth 0 sizes) font-size))
           (sym-size (if sizes (nth 1 sizes) font-size)))
      (set-face-attribute 'default nil :font (format "%s %s" font-en en-size))
      (dolist (charset '(kana han cjk-misc bopomofo))
        (set-fontset-font (frame-parameter nil 'font) charset
                          (font-spec :family font-cn
                                     :size cn-size)))
      (dolist (charset '(symbol))
        (set-fontset-font (frame-parameter nil 'font) charset
                          (font-spec :family font-sym
                                     :size sym-size)))
      (setq wood9366/font-en font-en
            wood9366/font-cn font-cn
            wood9366/font-sym font-sym
            wood9366/font-size font-size)
      (wood9366/font-info)))

  (defun wood9366/adjust-font-size (inc)
    (setq wood9366/font-size (+ wood9366/font-size inc))
    (wood9366/set-font wood9366/font-en wood9366/font-cn wood9366/font-sym wood9366/font-size))

  (defun wood9366/increase-font-size ()
    (interactive)
    (wood9366/adjust-font-size 1))

  (defun wood9366/decrease-font-size ()
    (interactive)
    (wood9366/adjust-font-size -1))

  (defun wood9366/font-info()
    (interactive)
    (let* ((sizes (assoc-default wood9366/font-size wood9366/font-size-list)))
      (message "font en %s %s cn %s %s sym %s %s"
               wood9366/font-en
               wood9366/font-size
               wood9366/font-cn
               (if sizes (nth 0 sizes) wood9366/font-size)
               wood9366/font-sym
               (if sizes (nth 1 sizes) wood9366/font-size))))

  (defun wood9366/refresh-font()
    (interactive)
    (wood9366/set-font wood9366/font-en wood9366/font-cn wood9366/font-sym wood9366/font-size))

  (general-def
    "C-x C-=" 'wood9366/increase-font-size
    "C-x C--" 'wood9366/decrease-font-size)

  (setq wood9366/font-size-list '((8 8 8)
                                  (9 8 9)
                                  (10 10 10)
                                  (11 11 11)
                                  (12 12 12)
                                  (13 13 13)
                                  (14 14 14)
                                  (15 15 15)
                                  (16 16 16)
                                  (17 17 17)
                                  (18 18 18)
                                  ))

  (add-hook 'after-init-hook
            (lambda ()
              (wood9366/set-font "SauceCodePro Nerd Font Mono"
                                 "Source Han Sans SC"
                                 "Arial Unicode MS"
                                 15)))
  )

;; |abcd|efgh|ijkl|mnop|qrst|uvwx|yz|
;; |ABCD|EFGH|IJKL|MNOP|QRST|UVWX|YZ|
;; |你好|你好|你好|你好|你好|你好|你|
;; |ⓡⓡ|ⓡⓡ|ⓡⓡ|ⓡⓡ|ⓡⓡ|ⓡⓡ|ⓡ|

(provide 'config-font)
