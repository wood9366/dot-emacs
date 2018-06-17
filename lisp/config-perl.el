(use-package cperl-mode
  :mode "\\.\\([pP][Llm]\\|al\\|t\\)\\'"
  :interpreter "perl"
  :interpreter "perl5"
  :interpreter "miniperl"
  :config
  (setq cperl-invalid-face nil)
  ;; (setq cperl-hairy t)

  (setq cperl-indent-level 4
        cperl-close-paren-offset -4
        cperl-continued-statement-offset 4
        cperl-indent-parens-as-block t
        cperl-tab-always-indent t)

  (defadvice cperl-backward-to-start-of-continued-exp (after indentation-fix)
    (and (not (memq char-after '(?\) ?\})))
         (or (not is-block) (looking-back "^[ \t]+"))
         (> (current-column) cperl-continued-statement-offset)
         (backward-char cperl-continued-statement-offset)))

  (defun liyang/perl-test ()
    "run perl test"
    (interactive)
    (shell-command (format "cd %s && prove -l" (locate-dominating-file (buffer-file-name) ".git")
                           (get-buffer-create "perl-output"))))

  (evil-leader/set-key-for-mode 'cperl-mode "ct" 'liyang/perl-test)

  (defun liyang/perl-run ()
      "run perl script"
      (interactive)
      (shell-command (format "perl %s" (buffer-file-name)) (get-buffer-create "perl-output")))

  (evil-leader/set-key-for-mode 'cperl-mode "cr" 'liyang/perl-run))
  
(provide 'config-perl)
