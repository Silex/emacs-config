;; Default file encoding
(prefer-coding-system 'utf-8-unix)

;; disable word wrap
(setq-default truncate-lines t)

;; Always require a newline at end of files
(setq require-final-newline t)

;; Scrolling
(setq scroll-step 1)
(setq scroll-conservatively 0)

;; Increase undo limit
(setq undo-limit (* 10 1024 1024))

;; Don't warn when cutting large chunk of texts
(use-package warnings
  :defer t
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

;; Don't stop on hyphen in foo-bar
(global-superword-mode)

;; Enable disabled commands (narrow-to-region, erase-buffer, etc)
(setq disabled-command-function nil)

;; Stop prompting for local variables when opening files
(setq enable-local-variables :safe)
(setq enable-local-eval nil)

;; make all "yes or no" prompts show "y or n" instead
(fset 'yes-or-no-p 'y-or-n-p)

;; Allow find-file to open ftp/http/etc links
(url-handler-mode)

;; Right alt is not meta
(setq ns-right-alternate-modifier nil)

;; Avoid running the GC all the time
(setq gc-cons-threshold 20000000)

;; Don't limit *Messages* to 1000 lines only
(setq message-log-max 16384)

;; Don't limit mark-ring to 16 places only
(setq mark-ring-max 999)

;; don't create silly foo~ files
(setq backup-directory-alist `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms `((".*" ,temporary-file-directory t)))

;; Zone-mode
(require 'zone)
(zone-when-idle (* 15 60))
