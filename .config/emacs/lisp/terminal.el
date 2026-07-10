(use-package vterm
  :commands vterm
  :config
  (setq vterm-shell (getenv "SHELL"))
  (setq vterm-max-scrollback 10000))

(defun split-term ()
  (interactive)
  (split-window-below)
  (other-window 1)
  (vterm))

(defun fullscreen-term ()
  (interactive)
  (vterm)
  (delete-other-windows))

(defvar vterm--last-escape-time 0
  "Time of the last <escape> press sent to vterm.")

(defun vterm-escape-or-normal-state ()
  "Send <escape> to vterm immediately; a second press within 0.3s also enters evil-normal-state.
Passing ESC straight through avoids Emacs holding the first press waiting for a literal
`<escape><escape>' sequence, which broke ESC for programs like vim running inside vterm."
  (interactive)
  (vterm-send-escape)
  (let ((now (float-time)))
    (if (< (- now vterm--last-escape-time) 0.3)
        (evil-normal-state)
      (setq vterm--last-escape-time now))))

(with-eval-after-load 'evil
  (evil-define-key 'normal 'global (kbd "<leader>wt") #'fullscreen-term)
  (evil-define-key 'normal 'global (kbd "<leader>wT") #'split-term)
  (evil-define-key 'insert vterm-mode-map (kbd "<escape>") #'vterm-escape-or-normal-state))

;; No line numbers in terminal
(add-hook 'vterm-mode-hook (lambda ()
  (display-line-numbers-mode -1)
  (setq-local scroll-margin 0)))

(provide 'terminal)
