;;; emacs.el --- Core editor defaults and built-in behaviour  -*- lexical-binding: t; -*-

;; Default file encoding
(prefer-coding-system 'utf-8-unix)

;; Display as hex instead of octal
(setq display-raw-bytes-as-hex t)

;; disable word wrap
(setq-default truncate-lines t)

;; Always require a newline at end of files
(setq require-final-newline t)

;; Scrolling
(setq scroll-step 0)
(setq scroll-conservatively 5)

;; Increase undo limit
(setq undo-limit (* 10 1024 1024))

;; After how many columns should fill-paragraph break
(setq-default fill-column 120)

;; Don't warn when cutting large chunk of texts
(use-package warnings
  :straight nil
  :config
  (add-to-list 'warning-suppress-types '(undo discard-info)))

;; Disable on the fly reindentation
(electric-indent-mode -1)

;; When something is selected, replace content when you type
(pending-delete-mode t)

;; Better buffer names
(require 'uniquify)
(setq uniquify-buffer-name-style 'post-forward-angle-brackets)

;; whenever an external process changes a file underneath emacs, and there
;; was no unsaved changes in the corresponding buffer, just revert its
;; content to reflect what's on-disk.
(global-auto-revert-mode 1)

;; Enable disabled commands (narrow-to-region, erase-buffer, etc)
(setq disabled-command-function nil)

;; make all "yes or no" prompts show "y or n" instead
(fset 'yes-or-no-p 'y-or-n-p)

;; Save copied items from external programs in kill ring
(setq save-interprogram-paste-before-kill t)

;; Right alt is not meta
(setq ns-right-alternate-modifier nil)

;; Avoid running the GC all the time
(setq gc-cons-threshold 100000000)

;; Increase the amount of data which Emacs reads from the process
(setq read-process-output-max (* 1024 1024))

;; Don't limit *Messages* to 1000 lines only
(setq message-log-max 16384)

;; Don't limit mark-ring to 16 places only
(setq mark-ring-max 999)

;; Don't create silly foo~ files
(setq backup-directory-alist `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms `((".*" ,temporary-file-directory t)))

(defun silex/last-error ()
  "Visit the last error or match of the current `next-error' buffer."
  (interactive)
  (with-current-buffer (next-error-find-buffer)
    ;; Compilation buffers (compile, grep, ag) step from this marker rather
    ;; than from point.
    (when (derived-mode-p 'compilation-mode)
      (setq compilation-current-error (point-max-marker)))
    (goto-char (point-max)))
  (next-error -1))

(use-package simple
  :straight nil
  :bind
  ("C-S-<up>" . previous-error)
  ("C-S-<down>" . next-error)
  ("C-S-<left>" . first-error)
  ("C-S-<right>" . silex/last-error)
  ("C-S-k" . kill-current-buffer))

(use-package files
  :straight nil
  :bind
  ("C-s" . save-buffer))

;; No *scratch* message
(setq initial-scratch-message nil)

;; highlight matching parenthesis
(show-paren-mode t)
(setq show-paren-delay 0.0)

;; highlight selection
(transient-mark-mode t)

;; Immediatly display pending commands
(setq echo-keystrokes 0.01)

(setq visible-bell t)
(setq font-lock-maximum-decoration t)
(setq color-theme-is-global t)
(setq truncate-partial-width-windows nil)

(when window-system
  (setq frame-title-format '(buffer-file-name "%f" ("%b")))
  (tooltip-mode -1)
  (blink-cursor-mode -1))

;; Max 100 chars (instead of 80)
(setq fill-column 100)

;; Show line/column numbers
(line-number-mode 1)
(column-number-mode 1)

;; update the mode line to have line number and column number
(setq mode-line-position '("%p (%l," (:eval (format "%d)" (1+ (current-column))))))

;; force the update of the mode line so the column gets updated
;(add-hook 'post-command-hook 'force-mode-line-update)

;(global-hl-line-mode)

;; Display date & time in status bar
(setq display-time-day-and-date t)
(setq display-time-24hr-format t)
(display-time)

;; Where to split: the new buffer goes on top, the current one stays at the
;; bottom.  This bypasses `split-window-sensibly', so `split-width-threshold'
;; and friends no longer apply; override the direction per command with
;; `C-x 4 <arrow>'.
(defun silex/split-window-above (window)
  "Split WINDOW into two stacked windows and return the new one, on top."
  (split-window window nil 'above))

(setq split-window-preferred-function #'silex/split-window-above)

(setq-default major-mode 'text-mode)

(defun split-window-and-focus (split-fn)
  (funcall split-fn)
  (other-window 1))

(use-package emacs
  :straight nil
  :bind
  ("C-x 2" . (lambda () (interactive) (split-window-and-focus #'split-window-below)))
  ("C-x 3" . (lambda () (interactive) (split-window-and-focus #'split-window-right))))
