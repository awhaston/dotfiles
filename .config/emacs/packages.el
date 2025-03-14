;; Set up package.el to work with MELPA
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))
(package-initialize)
;;(package-refresh-contents)

;; Download Evil
(unless (package-installed-p 'evil)
  (package-install 'evil))

;; Download lsp-mode
(unless (package-installed-p 'lsp-mode)
  (package-install 'lsp-mode))

;; Download company
(unless (package-installed-p 'company)
  (package-install 'company))

;; Download Evil
(unless (package-installed-p 'doom-themes)
  (package-install 'doom-themes))

