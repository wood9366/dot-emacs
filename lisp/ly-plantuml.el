
(defconst plantuml-jar "/usr/local/Cellar/plantuml/1.2020.9/libexec/plantuml.jar")

(use-package plantuml-mode
  :ensure t
  :defer t
  :init
  (add-hook 'plantuml-mode-hook
            (lambda ()
              (setq plantuml-output-type "png")))
  :config
  (message "load plantuml mode")
  (setq plantuml-jar-path plantuml-jar)
  (setq plantuml-default-exec-mode 'jar))

(use-package ob-plantuml
  :after org
  :config
  (setq org-plantuml-jar-path plantuml-jar))

(provide 'ly-plantuml)
