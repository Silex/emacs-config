;; Inspired from https://github.com/magnars/.emacs.d/blob/master/appearance.el

(defun maximize-frame ()
  (interactive)
  (set-frame-parameter nil 'fullscreen 'maximized))

(defun restore-frame ()
  (interactive)
  (set-frame-parameter nil 'fullscreen nil))

;; Disable startup screen
(setq inhibit-startup-screen t)

;; Disable toolbar
(tool-bar-mode -1)

;; Scrollbar
(setq scroll-bar-mode-explicit t)
(set-scroll-bar-mode `right)

;; Start maximized
(maximize-frame)

;; highlight matching parenthesis
(show-paren-mode t)
(setq show-paren-delay 0.0)

;; highlight selection
(transient-mark-mode t)

;; Immediatly display pending commands
(setq echo-keystrokes 0.01)

;; Whitespace
(setq-default show-trailing-whitespace t)

(setq visible-bell t)
(setq font-lock-maximum-decoration t)
(setq color-theme-is-global t)
(setq truncate-partial-width-windows nil)

;; Don't defer screen updates when performing operations
(setq redisplay-dont-pause t)

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

(provide 'visual)
