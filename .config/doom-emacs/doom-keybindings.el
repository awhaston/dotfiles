;;; doom-keybindings.el --- Keybindings ported from Neovim config
;;; Place in ~/.config/doom/config.el (or merge into existing config.el)

;; ── Window navigation ────────────────────────────────────────────────────────
;; C-h/j/k/l are already bound by Doom evil. Add rotate:
(map! :n "C-r" #'evil-window-rotate-downwards)

;; ── Visual: move lines ───────────────────────────────────────────────────────
;; Requires drag-stuff or move-text package. Add to packages.el:
;;   (package! drag-stuff)
(map! :v "K" #'drag-stuff-up
      :v "J" #'drag-stuff-down)

;; ── Clipboard ────────────────────────────────────────────────────────────────
(map! :nv "SPC y" (cmd! (let ((select-enable-clipboard t))
                           (call-interactively #'evil-yank))))

;; ── Buffer management ────────────────────────────────────────────────────────
;; SPC b d / SPC b D are already Doom defaults (kill-buffer).
;; These add/override the ones that differ:
(map! :leader
      :desc "Kill other buffers"         "b o" #'doom/kill-other-buffers
      :desc "Kill buffers to the right"  "b r" #'+workspace/close-window-or-workspace
      :desc "Kill buffers to the left"   "b l" #'doom/kill-buried-buffers
      :desc "Pin buffer"                 "b p" #'+popup/toggle)
(map! :n "S-h" #'previous-buffer
      :n "S-l" #'next-buffer)

;; ── Window management ────────────────────────────────────────────────────────
;; SPC w v / SPC w s / SPC w d are already Doom defaults.
(map! :leader
      :desc "Maximize window"   "w f" #'doom/window-maximize-buffer
      :desc "Equalize windows"  "w F" #'balance-windows)
;; Resize: C-. / C-, (height), SPC < / SPC > (width)
(map! :n "C-." (cmd! (evil-window-increase-height 5))
      :n "C-," (cmd! (evil-window-decrease-height 5))
      :n "SPC <" (cmd! (evil-window-increase-width 5))
      :n "SPC >" (cmd! (evil-window-decrease-width 5)))

;; ── File finder (Vertico/Consult — Telescope equivalent) ─────────────────────
(map! :leader
      :desc "Find files"            "f f" #'+default/find-file-under-here
      :desc "Switch buffer"         "SPC" #'consult-buffer
      :desc "Live grep"             "f g" #'+default/search-project
      :desc "Find references"       "f r" #'lsp-find-references
      :desc "Find implementations"  "f i" #'lsp-find-implementation
      :desc "Find type definitions" "f t" #'lsp-find-type-definition
      :desc "Diagnostics (file)"    "f d" #'consult-lsp-diagnostics
      :desc "Diagnostics (project)" "f D" (cmd! (consult-lsp-diagnostics t))
      :desc "Find help"             "f h" #'describe-symbol)

;; ── File explorer (Dired — Oil equivalent) ────────────────────────────────────
(map! :n "-" #'dired-jump)

;; ── Git (Magit + diff-hl — Gitsigns equivalent) ──────────────────────────────
;; Requires diff-hl. Add to packages.el if not already present:
;;   (package! diff-hl)
(map! :n "]h" #'diff-hl-next-hunk
      :n "[h" #'diff-hl-previous-hunk)
(map! :leader
      :desc "Stage hunk"          "g h s" #'diff-hl-stage-dwim
      :desc "Reset hunk"          "g h r" #'diff-hl-revert-hunk
      :desc "Stage buffer"        "g S"   #'magit-stage-buffer-file
      :desc "Undo stage hunk"     "g u"   #'magit-unstage
      :desc "Preview hunk inline" "g p"   #'diff-hl-show-hunk-inline
      :desc "Blame line"          "g b"   #'magit-blame-addition
      :desc "Diff this"           "g d"   #'magit-diff-buffer-file
      :desc "Diff this ~"         "g D"   #'magit-diff-working-tree)

;; ── Compile mode ─────────────────────────────────────────────────────────────
(map! :leader
      :desc "Compile" "c c" #'compile)
(map! :map compilation-mode-map
      :n "]" #'next-error
      :n "[" #'previous-error)

;; ── LSP ───────────────────────────────────────────────────────────────────────
;; K / gd are already Doom lsp defaults. These fill in the rest:
(map! :leader
      :desc "Goto implementation" "g i" #'lsp-find-implementation
      :desc "Goto references"     "g r" #'lsp-find-references
      :desc "Code action"         "c a" #'lsp-execute-code-action
      :desc "Line diagnostics"    "c d" #'lsp-ui-doc-glance
      :desc "Diagnostics list"    "c D" #'lsp-ui-flycheck-list
      :desc "Restart LSP"         "l r" #'lsp-restart-workspace
      :desc "Format"              "c f" #'lsp-format-buffer)
(map! :n "[d" #'flycheck-previous-error
      :n "]d" #'flycheck-next-error)
