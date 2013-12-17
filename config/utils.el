;; Inspired from https://github.com/magnars/.emacs.d/blob/master/defuns/buffer-defuns.el
(defun tabify-buffer ()
  "Tabify the whole buffer."
  (interactive)
  (tabify (point-min) (point-max)))

(defun untabify-buffer ()
  "Untabify the whole buffer."
  (interactive)
  (untabify (point-min) (point-max)))

(defun indent-buffer ()
  "Reindent the whole buffer."
  (interactive)
  (indent-region (point-min) (point-max)))

(defun cleanup-buffer ()
  "Untabify, reindent and delete trailing whitespace."
  (interactive)
  (untabify-buffer)
  (indent-buffer)
  (delete-trailing-whitespace))

;; Makes all lines unique
(defun uniquify-all-lines-region (start end)
  "Find duplicate lines in region START to END keeping first occurrence."
  (interactive "*r")
  (save-excursion
    (let ((end (copy-marker end)))
      (while
          (progn
            (goto-char start)
            (re-search-forward "^\\(.*\\)\n\\(\\(.*\n\\)*\\)\\1\n" end t))
        (replace-match "\\1\n\\2")))))

(defun uniquify-all-lines-buffer ()
  "Delete duplicate lines in buffer and keep first occurrence."
  (interactive "*")
  (uniquify-all-lines-region (point-min) (point-max)))

(defun open-url-in-buffer (url)
  "Downloads and displays an url in a buffer"
  (interactive "sUrl? ")
  (unless url-handler-mode
    (url-handler-mode))
  (let ((current-directory default-directory))
    (find-file url)
    (setq default-directory current-directory)
    (set-visited-file-name (file-name-nondirectory (buffer-file-name)))
    (setq buffer-read-only nil)))

;; Simpler way to quit with M-x quit
(defun quit ()
  (interactive)
  (save-buffers-kill-terminal))

(defun insert-file-name (f)
  (interactive "fFile? ")
  (insert f))

(defun dos2unix ()
  (interactive)
  (set-buffer-file-coding-system 'undecided-unix))

(defun unix2dos ()
  (interactive)
  (set-buffer-file-coding-system 'undecided-dos))

(defun open-in-desktop ()
  "Open the current file in desktop. Works in Microsoft Windows, Mac OS X, Linux."
  (interactive)
  (cond
    ((string-equal system-type "windows-nt") (w32-shell-execute "explore" (replace-regexp-in-string "/" "\\" default-directory t t)))
    ((string-equal system-type "darwin") (shell-command "open ."))
    ((string-equal system-type "gnu/linux") (shell-command "xdg-open ."))
  ))

(defun purge-obsolete-buffers ()
  (interactive)
  "Kill all buffers that are visiting a file, but whose file no longer exists."
  (let (victims)
    (mapc
     (lambda (b)
       (let ((description
              (with-current-buffer b

                ;; If we should kill this buffer, return a description
                ;; of it.

                (cond

                 ;; an "ephemeral" buffer.  Don' keel me.  Who knows
                 ;; what it's for.
                 ((equal ?\s (elt (buffer-name) 0))
                  nil)

                 ;; an ordinary file-visiting buffer
                 ((and buffer-file-name
                       (not (file-exists-p buffer-file-name)))
                  (format "buffer %S, which had been visiting %S" (buffer-name) buffer-file-name))

                 ;; maybe a dired buffer
                 ((not (file-exists-p default-directory))
                  (format "buffer %S in directory %S" (buffer-name) default-directory))
                 ))))

         (when (and description (kill-buffer b))
           (setq victims (cons description victims)))))

     (buffer-list))
    (if victims
        (let ((tmp-buffer-name "*Purged Buffers*"))
          (let ((temp-buffer-show-hook (cons 'shrink-window-if-larger-than-buffer temp-buffer-show-hook)))
            (with-output-to-temp-buffer tmp-buffer-name
              (dolist (v victims)
                (princ (format "Killed %s\n" v))))))

      (message "No obsolete buffers; did nothing."))))

(defvar bfy-html-document-path "~/.emacs.d/")

(defvar bfy-html-document-name "document.html")

(defun browserify (&optional buffer)
  "Instantly opens the content of a buffer in the system's default browser"
  (interactive "bBuffer: ")
  (message (format "BUFFER: %s" buffer))  ; DEBUG
  (let ((url (expand-file-name (concat bfy-html-document-path
                                       bfy-html-document-name))))
    (with-current-buffer (htmlize-buffer buffer)
      (write-file
       url)
      (browse-url url))))

;; Hide emacs when we quit, that way it loads faster
(defun quit-by-hiding()
  (interactive)
  (server-edit)
  (make-frame-invisible nil t))

;; Helper to describe macros
(autoload 'apropos-macrop "apropos"
  "Return t if SYMBOL is a Lisp macro.

\(fn symbol)")

(defun describe-macro (macro)
  "Display documentation for MACRO."
  (interactive
   (list
    (intern
     (completing-read "Macro: " obarray
                      'apropos-macrop
                      'require-match))))
  (describe-function macro))

;; Taken from http://www.emacswiki.org/emacs/TransposeWindows
(defun swap-windows (arg)
  "Transpose the buffers shown in two windows."
  (interactive "p")
  (let ((selector (if (>= arg 0) 'next-window 'previous-window)))
    (while (/= arg 0)
      (let ((this-win (window-buffer))
            (next-win (window-buffer (funcall selector))))
        (set-window-buffer (selected-window) next-win)
        (set-window-buffer (funcall selector) this-win)
        (select-window (funcall selector)))
      (setq arg (if (plusp arg) (1- arg) (1+ arg))))))

;; Taken from http://www.emacswiki.org/emacs/ToggleWindowSplit
(defun toggle-windows-orientation ()
  "If the frame is split vertically, split it horizontally or vice versa.
Assumes that the frame is only split into two."
  (interactive)
  (unless (= (length (window-list)) 2) (error "Can only toggle a frame split in two"))
  (let ((split-vertically-p (window-combined-p)))
    (delete-window) ; closes current window
    (if split-vertically-p
        (split-window-horizontally)
      (split-window-vertically)) ; gives us a split with the other window twice
    (switch-to-buffer nil))) ; restore the original window in this part of the frame
