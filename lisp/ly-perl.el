
(use-package cperl-mode
  :mode "\\.\\([pP][Llm]\\|al\\|t\\)\\'"
  :interpreter "perl"
  :interpreter "perl5"
  :interpreter "miniperl"
  :config
  (setq cperl-invalid-face nil)

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

  (defun ly/perl-test ()
    "run perl test"
    (interactive)
    (shell-command (format "cd %s && prove -l"
                           (locate-dominating-file (buffer-file-name) ".git"))
                   (get-buffer-create "perl-output")))

  (defun ly/perl-run ()
    "run perl script"
    (interactive)
    (shell-command (format "perl %s" (buffer-file-name))
                   (get-buffer-create "perl-output")))

  (ly/mode-def 'normal
   "r" 'ly/perl-run
   "t" 'ly/perl-test))

(provide 'ly-perl)
