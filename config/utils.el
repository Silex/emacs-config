;; M-x snake
;; M-x tetris
;; M-x zone
;; M-x doctor
;; M-x butterfly
;; M-x yow
;; M-x phases-of-moon
;; M-x animate-birthday-present

(use-package crux
  :bind
  ("C-x C-S-e" . crux-eval-and-replace))

(use-package hl-todo
  :demand t
  :config
  (global-hl-todo-mode))

(use-package ialign)

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

(defun indent-region-html (beg end)
  (interactive "r")
  (sgml-pretty-print beg end))

(defun indent-buffer-html ()
  (interactive)
  (indent-region-html (point-min) (point-max)))

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

(defun sort-words (reverse beg end)
  "Sort words in region alphabetically, in REVERSE if negative.
Prefixed with negative \\[universal-argument], sorts in reverse.

The variable `sort-fold-case' determines whether alphabetic case
affects the sort order.

See `sort-regexp-fields'."
  (interactive "*P\nr")
  (sort-regexp-fields reverse "\\([^ ]+\\)+" "\\&" beg end))

(defun sort-lines-buffer (&optional reverse)
  "Sort lines in buffer alphabetically; REVERSE means descending order.
The variable `sort-fold-case' determines whether alphabetic case affects
the sort order."
  (interactive "*P")
  (sort-lines reverse (point-min) (point-max)))

(defun html-table-to-csv ()
  "Convert an HTML table to CSV."
  (interactive)
  (let* ((xml (xml-parse-region (point-min) (point-max) (current-buffer)))
         (rows (cdr (cdr (car (cdr (cdr (car xml)))))))
         (rows2 (--map (cddr it) rows))
         (rows3 (--map (-map 'caddr it) rows2))
         (rows4 (--map (s-join "|" it) rows3)))
    (insert (s-join "|\n" rows4))))

(defun show-string-as-c (string)
  "Generate C program printing obfuscated string."
  (interactive "sString? ")
  (require 'bindat)
  (let* ((vector (string-to-vector string))
         (vector (vconcat vector (make-vector (- 4 (mod (length vector) 4)) 0)))
         (len (/ (length vector) 4))
         (unpack (bindat-unpack `((test vec ,len u32r)) vector))
         (integers (cdr (car unpack))))
    (with-current-buffer-window
     "fun.c" nil nil
     (insert "#include <stdio.h>\n\n")
     (insert "int main()\n{\n")
     (insert "unsigned arr[] = { ")
     (insert (mapconcat 'number-to-string integers ", "))
     (insert " };\n")
     (insert "puts(arr);\nreturn 0;\n}");
     (c-mode)
     (indent-region (point-min) (point-max))
     (goto-char (point-min)))))

;; Simpler way to quit with M-x quit
(defalias 'quit #'save-buffers-kill-terminal)

(defun insert-file-name (filename &optional args)
  "Insert name of file FILENAME into buffer after point."
  (interactive "*fInsert file name: \nP")
  (if (null args)
      (insert (file-relative-name filename))
    (insert (expand-file-name filename))))

(defun insert-function-name (function)
  "Insert name of FUNCTION into buffer after point."
  (interactive (list (completing-read "Insert function: " obarray 'fboundp t)))
  (insert function))

(defun dos2unix ()
  (interactive)
  (set-buffer-file-coding-system 'undecided-unix))

(defun unix2dos ()
  (interactive)
  (set-buffer-file-coding-system 'undecided-dos))

(defun explore-current-directory ()
  "Open the current buffer's directory in nautilus/finder/explorer."
  (interactive)
  (browse-url (concat "file://" (file-name-directory (expand-file-name default-directory)))))

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

;; Word wrap
(defun enable-word-wrap ()
  (interactive)
  (setq truncate-lines nil)
  (setq word-wrap t))

(defun disable-word-wrap ()
  (interactive)
  (setq truncate-lines t)
  (setq word-wrap nil))

;; Taken from http://emacsredux.com/blog/2013/05/22/smarter-navigation-to-the-beginning-of-a-line/
(defun smarter-move-beginning-of-line (arg)
  "Move point back to indentation of beginning of line.

Move point to the first non-whitespace character on this line.
If point is already there, move to the beginning of the line.
Effectively toggle between the first non-whitespace character and
the beginning of the line.

If ARG is not nil or 1, move forward ARG - 1 lines first.  If
point reaches the beginning or end of the buffer, stop there."
  (interactive "^p")
  (setq arg (or arg 1))

  ;; Move lines first
  (when (/= arg 1)
    (let ((line-move-visual nil))
      (forward-line (1- arg))))

  (let ((orig-point (point)))
    (back-to-indentation)
    (when (= orig-point (point))
      (move-beginning-of-line 1))))

;; remap C-a to `smarter-move-beginning-of-line'
(global-set-key [remap move-beginning-of-line] 'smarter-move-beginning-of-line)
