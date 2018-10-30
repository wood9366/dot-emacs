(use-package plantuml-mode
  :ensure t
  :config
  (setq plantuml-jar-path "/usr/local/Cellar/plantuml/1.2018.12/libexec/plantuml.jar"))

(require 'ob-plantuml)
(setq org-plantuml-jar-path "/usr/local/Cellar/plantuml/1.2018.12/libexec/plantuml.jar")

(provide 'config-plantuml)
