

;; Ensure eglot is loaded
(use-package lsp-mode)

;; LSP
(setq lsp-keymap-prefix "C-c l")

;; Ensure eglot is activated for all programming modes
(add-hook 'python-mode-hook #'lsp)
(add-hook 'go-mode-hook     #'lsp)

;; Show all documenttion
(setq lsp-eldoc-render-all t)

;; Drop-down auto completion
(require 'company)
(add-hook 'after-init-hook 'global-company-mode)
