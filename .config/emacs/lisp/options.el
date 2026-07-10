;; Line numbers
(global-display-line-numbers-mode t)
(setq display-line-numbers-type 'relative)

;; Set font face
(set-face-attribute 'default nil :family "RobotoMono Nerd Font" :height 170)

;; Cursor — block in all states (handled per-mode by evil)
(setq-default cursor-type 'box)

;; Search
(setq isearch-lazy-highlight t)
(setq search-highlight t)

;; Tabs / indentation
(setq-default tab-width 4)
(setq-default indent-tabs-mode nil)
(setq-default evil-shift-width 4)
(setq c-ts-mode-indent-offset 4)
(setq c++-ts-mode-indent-offset 4)
(electric-indent-mode t)

;; No word wrap by default
(setq-default truncate-lines t)

;; Scrolloff equivalent
(setq scroll-margin 16)
(setq scroll-conservatively 101)
(setq hscroll-margin 16)

;; Sign column always visible
(setq-default left-fringe-width 16)

;; Faster UI updates
(setq idle-update-delay 0.05)

;; No backup/autosave/lockfiles
(setq make-backup-files nil)
(setq auto-save-default nil)
(setq create-lockfiles nil)

;; Disable startup screen
(setq inhibit-startup-message t)

;; Open a dired buffer on the home directory instead of *scratch*
(setq initial-buffer-choice (lambda () (dired "~/")))

;; Remove UI chrome
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

(provide 'options)
