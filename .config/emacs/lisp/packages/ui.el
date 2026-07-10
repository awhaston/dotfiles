;; Evil (vim emulation)
(use-package evil
  :init
  (setq evil-want-integration t)
  (setq evil-want-keybinding nil)
  (setq evil-want-C-u-scroll t)
  (setq evil-undo-system 'undo-redo)
  :config
  (evil-mode 1))

(use-package evil-collection
  :after evil
  :config
  (evil-collection-init))

(use-package evil-surround
  :after evil
  :config
  (global-evil-surround-mode 1))

;; Colorscheme
(add-to-list 'custom-theme-load-path (expand-file-name "themes" user-emacs-directory))
(load-theme 'rasmus t)

;; Buffer tabs (built-in tab-bar-mode)
(tab-bar-mode 1)
(setq tab-bar-new-button-show nil
      tab-bar-close-button-show nil)
(with-eval-after-load 'evil
  (evil-define-key 'normal 'global (kbd "<leader>bp") #'tab-bar-mode)
  (evil-define-key 'normal 'global (kbd "<leader>bo") #'tab-bar-close-other-tabs))

;; File explorer — dired configured oil-style (single buffer, current dir)
(use-package dired
  :ensure nil
  :config
  (if (executable-find "gls")
      (setq insert-directory-program "gls"
            dired-listing-switches "-alh --group-directories-first")
    (setq dired-listing-switches "-alh"))
  (setq dired-kill-when-opening-new-dired-buffer t)
  (with-eval-after-load 'evil
    (evil-define-key 'normal 'global (kbd "-") #'dired-jump)))

;; Fuzzy finder (telescope equivalent)
(use-package vertico
  :init (vertico-mode))

(use-package orderless
  :custom
  (completion-styles '(orderless basic))
  (completion-category-overrides '((file (styles basic partial-completion)))))

(use-package consult
  :config
  (with-eval-after-load 'evil
    (evil-define-key 'normal 'global (kbd "<leader>ff") #'consult-find)
    (evil-define-key 'normal 'global (kbd "<leader>SPC") #'consult-buffer)
    (evil-define-key 'normal 'global (kbd "<leader>fg") #'consult-ripgrep)
    (evil-define-key 'normal 'global (kbd "<leader>fd") #'consult-flymake)
    (evil-define-key 'normal 'global (kbd "<leader>fh") #'consult-info)))

;; Git signs in gutter (gitsigns equivalent)
(use-package diff-hl
  :config
  (global-diff-hl-mode)
  (diff-hl-margin-mode)
  (with-eval-after-load 'evil
    (evil-define-key 'normal 'global (kbd "]h") #'diff-hl-next-hunk)
    (evil-define-key 'normal 'global (kbd "[h") #'diff-hl-previous-hunk)
    (evil-define-key 'normal 'global (kbd "<leader>ghs") #'diff-hl-stage-current-hunk)
    (evil-define-key 'normal 'global (kbd "<leader>ghr") #'diff-hl-revert-hunk)
    (evil-define-key 'normal 'global (kbd "<leader>gp")  #'diff-hl-show-hunk)
    (evil-define-key 'normal 'global (kbd "<leader>gd")  #'diff-hl-diff-goto-hunk)))

;; Which key
(use-package which-key
  :ensure nil
  :config
  (setq which-key-idle-delay 0.3)
  (which-key-mode))

(provide 'ui)
