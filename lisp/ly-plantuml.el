
(use-package plantuml-mode
  :ensure t
  :defer t
  :config
  (setq plantuml-jar-path "/usr/local/Cellar/plantuml/1.2018.12/libexec/plantuml.jar"))

(use-package ob-plantuml
  :after org
  :config
  (setq org-plantuml-jar-path "/usr/local/Cellar/plantuml/1.2018.12/libexec/plantuml.jar"))

(provide 'ly-plantuml)
