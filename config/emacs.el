;; Right alt is not meta
(setq ns-right-alternate-modifier nil)

;; Stop prompting for local variables when opening files
(setq enable-local-variables :safe)
(setq enable-local-eval nil)

;; Only run the GC every time 20Mb is allocated
(setq gc-cons-threshold 20000000)

;; Allow *Messages* to log a lot of stuffs
(setq message-log-max 16384)

;; Always require a newline at end of files
(setq require-final-newline t)

;; Scrolling
(setq scroll-step 1)
(setq scroll-conservatively 50)

;; Emacs
(add-to-list 'auto-mode-alist '("\\.?emacs\\'" . emacs-lisp-mode))

;; don't create silly foo~ files
(setq backup-directory-alist `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms `((".*" ,temporary-file-directory t)))

;; disable word wrap
(setq-default truncate-lines t)

;; make all "yes or no" prompts show "y or n" instead
(fset 'yes-or-no-p 'y-or-n-p)

;; Switch windows using Shift + Arrow
;(windmove-default-keybindings 'shift)

;; Disable VC
;(setq vc-handled-backends nil)

;; Default file encoding
(prefer-coding-system 'utf-8-unix)

;; Never use real tabs
(setq-default indent-tabs-mode nil)

;; On the fly reindentation
(electric-indent-mode)

;; Store where we edited files
(setq-default save-place t)
(require 'saveplace)

;; Better buffer names
(require 'uniquify)
(setq uniquify-buffer-name-style 'post-forward-angle-brackets)

;; Zone-mode
(require 'zone)
(zone-when-idle (* 15 60))

;; whenever an external process changes a file underneath emacs, and there
;; was no unsaved changes in the corresponding buffer, just revert its
;; content to reflect what's on-disk.
(global-auto-revert-mode 1)

;; M-x shell is a nice shell interface to use, let's make it colorful.  If
;; you need a terminal emulator rather than just a shell, consider M-x term
;; instead.
(autoload 'ansi-color-for-comint-mode-on "ansi-color" nil t)
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)

;; Enable disabled commands (narrow-to-region, erase-buffer, etc)
(setq disabled-command-function nil)

;; Don't wait for eldoc-mode to give help
(setq eldoc-idle-delay 0)
