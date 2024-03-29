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
  :ensure nil
  :config
  (add-to-list 'warning-suppress-types '(undo discard-info)))

;; Disable on the fly reindentation
(electric-indent-mode -1)

;; When something is selected, replace content when you type
(pending-delete-mode t)

;; Save history
(savehist-mode 1)

;; Better buffer names
(require 'uniquify)
(setq uniquify-buffer-name-style 'post-forward-angle-brackets)

;; whenever an external process changes a file underneath emacs, and there
;; was no unsaved changes in the corresponding buffer, just revert its
;; content to reflect what's on-disk.
(global-auto-revert-mode 1)

;; Enable disabled commands (narrow-to-region, erase-buffer, etc)
(setq disabled-command-function nil)

;; Stop prompting for local variables when opening files
(setq enable-local-variables :safe)
(setq enable-local-eval nil)

;; make all "yes or no" prompts show "y or n" instead
(fset 'yes-or-no-p 'y-or-n-p)

;; Save copied items from external programs in kill ring
(setq save-interprogram-paste-before-kill t)

;; Right alt is not meta
(setq ns-right-alternate-modifier nil)

;; Avoid running the GC all the time
(setq gc-cons-threshold 16777216
      gc-cons-percentage 0.1)

;; Don't limit *Messages* to 1000 lines only
(setq message-log-max 16384)

;; Don't limit mark-ring to 16 places only
(setq mark-ring-max 999)

;; Don't create silly foo~ files
(setq backup-directory-alist `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms `((".*" ,temporary-file-directory t)))

;; Grep/Occur/Compile
(global-set-key (kbd "C-S-<up>") 'previous-error)
(global-set-key (kbd "C-S-<down>") 'next-error)

;; Save with one key
(global-set-key (kbd "C-s") 'save-buffer)

;; Kill buffer
(global-set-key (kbd "C-S-k") 'kill-this-buffer)

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

;; Where to split
(setq split-width-threshold nil)
;(setq split-height-threshold nil)
;(setq split-window-preferred-function 'split-window-sensibly)

(setq-default major-mode 'text-mode)
