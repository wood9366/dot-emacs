
(use-package csharp-mode
  :ensure t
  :defer t)

(use-package lsp-mode
  :ensure t
  :hook csharp-mode
  :config
  (setq lsp-clients-csharp-language-server-path
	"/Users/liyang/packs/omnisharp/1.34.8/omnisharp/OmniSharp.exe")
  (lsp 1))

(provide 'ly-csharp)
