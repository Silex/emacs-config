;; Disable startup screen
(setq inhibit-startup-screen t)

;; Right alt is not meta
(setq ns-right-alternate-modifier nil)

;; Stop prompting for local variables when opening files
(setq enable-local-variables :safe)
(setq enable-local-eval nil)

;; Only run the GC every time 20Mb is allocated
(setq gc-cons-threshold 20000000)

;; Hide emacs when we quit, that way it loads faster
(defun quit-by-hiding()
  (interactive)
  (server-edit)
  (make-frame-invisible nil t))
(load "server")

;; Always require a newline at end of files
(setq require-final-newline t)

;; Scrollbar
(setq scroll-bar-mode-explicit t)
(set-scroll-bar-mode `right)

;; Scrolling
(setq scroll-step 1)
(setq scroll-conservatively 50)

;; Emacs
(setq auto-mode-alist (cons `("\\.?emacs" . lisp-mode) auto-mode-alist))

;; don't create silly foo~ files
(setq backup-directory-alist `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms `((".*" ,temporary-file-directory t)))

;; disable word wrap
(setq-default truncate-lines t)

;; highlight matching parenthesis
(show-paren-mode t)
(setq show-paren-delay 0.0)

;; highlight selection
(transient-mark-mode t)

;; make all "yes or no" prompts show "y or n" instead
(fset 'yes-or-no-p 'y-or-n-p)

;; Switch windows using Shift + Arrow
;(windmove-default-keybindings 'shift)

;; Disable VC
;(setq vc-handled-backends nil)

;; Immediatly display pending commands
(setq echo-keystrokes 0.01)

;; Default file encoding
(prefer-coding-system 'utf-8-unix)

;; Never use real tabs
(setq-default indent-tabs-mode nil)

;; Whitespace
(setq-default show-trailing-whitespace t)

;; Store where we edited files
(setq-default save-place t)
(require 'saveplace)

;; Better buffer names
(require 'uniquify)
(setq uniquify-buffer-name-style 'post-forward-angle-brackets)

;; Zone-mode
(require 'zone)
(zone-when-idle (* 10 60))

;; Disable toolbar
(tool-bar-mode -1)

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

;; whenever an external process changes a file underneath emacs, and there
;; was no unsaved changes in the corresponding buffer, just revert its
;; content to reflect what's on-disk.
(global-auto-revert-mode 1)

;; M-x shell is a nice shell interface to use, let's make it colorful.  If
;; you need a terminal emulator rather than just a shell, consider M-x term
;; instead.
(autoload 'ansi-color-for-comint-mode-on "ansi-color" nil t)
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)

;; Display date & time in status bar
(setq display-time-day-and-date t)
(setq display-time-24hr-format t)
(display-time)

;; Where to split
(setq split-width-threshold nil)
;(setq split-height-threshold nil)
;(setq split-window-preferred-function 'split-window-sensibly)
