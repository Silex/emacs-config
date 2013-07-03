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

;; Download & display an url
(defun open-url-in-buffer(url)
  (interactive "sUrl? ")
  (switch-to-buffer (url-retrieve-synchronously url)))

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

(defun open-in-desktop  ()
  "Open the current file in desktop. Works in Microsoft Windows, Mac OS X, Linux."
  (interactive)
  (cond
    ((string-equal system-type "windows-nt") (w32-shell-execute "explore" (replace-regexp-in-string "/" "\\" default-directory t t)))
    ((string-equal system-type "darwin") (shell-command "open ."))
    ((string-equal system-type "gnu/linux") (shell-command "xdg-open ."))
  ))

(defun purge-obsolete-buffers()
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
