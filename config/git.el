;; Largely stolen from https://github.com/magnars/.emacs.d/blob/master/setup-magit.el

;; Fullscreen magit-status
(defadvice magit-status (around magit-fullscreen activate)
  (window-configuration-to-register :magit-fullscreen)
  ad-do-it
  (delete-other-windows))

(defun magit-status-quit ()
  "Restores the previous window configuration and kills the magit buffer"
  (interactive)
  (kill-buffer)
  (jump-to-register :magit-fullscreen))

;; Fullscreen vc-annotate
(defadvice vc-annotate (around fullscreen activate)
  (window-configuration-to-register :vc-annotate-fullscreen)
  ad-do-it
  (delete-other-windows))

(defun vc-annotate-quit ()
  "Restores the previous window configuration and kills the vc-annotate buffer"
  (interactive)
  (kill-buffer)
  (jump-to-register :vc-annotate-fullscreen))

;; Close popup when commiting
(defadvice git-commit-commit (after delete-window activate)
  (delete-window))

(defadvice git-commit-abort (after delete-window activate)
  (delete-window))

;; Whitespace
(defun magit-toggle-whitespace ()
  (interactive)
  (if (member "-w" magit-diff-options)
      (magit-dont-ignore-whitespace)
    (magit-ignore-whitespace)))

(defun magit-ignore-whitespace ()
  (interactive)
  (add-to-list 'magit-diff-options "-w")
  (magit-refresh))

(defun magit-dont-ignore-whitespace ()
  (interactive)
  (setq magit-diff-options (remove "-w" magit-diff-options))
  (magit-refresh))

;; C-x C-k to kill file on line
;(defun magit-kill-file-on-line ()
;  "Show file on current magit line and prompt for deletion."
;  (interactive)
;  (magit-visit-item)
;  (delete-current-buffer-file)
;  (magit-refresh))

