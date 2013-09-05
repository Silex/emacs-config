;;; dired-sorting.el --- Dired sorting

;; Copyright (C) 2013 Vaucher Philippe

;; Author: Vaucher Philippe <philippe.vaucher@gmail.com>

;; Version: 1.0.0
;; Keywords: dired sorting

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:

;; Yet another sorting library for dired.
;; Allows you to sort dired buffers by name, size, extension, modification, creation, access or ctime.
;; Allows you to sort any of the previous method in reverse and/or with directories first.
;; Defines a bunch of handful functions like M-x `dired-sort-by-size' for your scripting needs.

;; ## Why???

;; I tried to use one of the options at http://www.emacswiki.org/emacs/DiredSorting but none of them were satisfying:
;; - Some of them don't allow to sort in reverse and/or with directories first.
;; - Some of them are wrong about sorting by creation time (they sort by ctime which is not the same thing).
;; - Some of them are not convenient to use (no simple keybinding / require to use the mouse / no helpful M-x functions).

;; ## Basic usage

;; Start out with:

;;     (require 'dired-sorting)

;; Then when in a dired buffer, simply do M-x `dired-sort', choose the sorting method and press enter.
;; Bind this function (or `dired-sort-quickly') to any key of your choice.
;; See also `dired-sort-by-size', `dired-sort-by-extension', `dired-sort-by-creation'

;; To sort in reverse, press C-u before calling `dired-sort' (or `dired-sort-by-size', `dired-sort-by-extension', etc).
;; Alternatively, you can use `dired-sort-reverse', `dired-sort-forward' or `dired-toggle-sorting-reverse'.

;; To sort with directories first, do M-x `dired-sort-with-directories-first' or `dired-sort-without-directories-first'.
;; You can also use `dired-toggle-sorting-with-directories-first'.

;; To make the current sorting permanent for the next dired buffers, use `dired-save-sorting-options'.
;; If you want it to stay that way the next time you start emacs, copy the "(setq dired-listing-switches ...)" line
;; that appears in *Messages* into your .emacs.

;; ## Keybinding

;; Dired-sorting doesn't bind anything by itself.  Usually you only need one keybinding (`dired-sort' or `dired-sort-quickly'),
;; which goes well on the 's' key which dired already uses to sort:

;; (eval-after-load 'dired
;;   '(define-key dired-mode-map (kbd "s") 'dired-sort))

;; ## Thanks

;; Thanks to the examples at http://www.emacswiki.org/emacs/DiredSortCriterias and
;; http://www.emacswiki.org/emacs/DiredSortDirectoriesFirst which were a great source of inspiration :)

;;; Code:

(defun dired-switches-has-flag-p (flag)
  "Return t if `dired-actual-switches' contain FLAG or nil otherwise."
  (let ((case-fold-search))
    (if (string-match (format "\\_<-[^- %s]*%s" flag flag) dired-actual-switches)
        t)))

(defun dired-switches-add-flag (flag)
  "Add FLAG to `dired-actual-switches' (FLAG must be without the dash)."
  (if (not (dired-switches-has-flag-p flag))
      (let ((flags (replace-regexp-in-string "\\_<-[^- ]+"
                                             (concat "\\&" flag)
                                             dired-actual-switches)))
        (dired-sort-other flags))))

(defun dired-switches-remove-flag (flag)
  "Remove FLAG from `dired-actual-switches' (FLAG must be without the dash)."
  (if (dired-switches-has-flag-p flag)
      (let ((flags (replace-regexp-in-string (format "\\(\\_<-[^- %s]*\\)%s\\([^ ]*\\)" flag flag)
                                             "\\1\\2"
                                             dired-actual-switches)))
        (dired-sort-other flags))))

(defun dired-switches-remove-all-sorting-flags ()
  "Remove all flags that are used for sorting."
  (dired-switches-remove-flag "S")
  (dired-switches-remove-flag "X")
  (dired-switches-remove-flag "U")
  (dired-switches-remove-flag "c")
  (dired-switches-remove-flag "u")
  (dired-switches-remove-flag "t"))

(defun dired-switches-is-sorted-by-name-p ()
  "Return t if `dired-actual-switches' would sort by name or nil otherwise.
Use `dired-sort-by-name-regexp' to achieve that."
  (let ((case-fold-search))
    (if (string-match dired-sort-by-name-regexp dired-actual-switches)
        t)))

(defvar dired-switches-directories-first-flag "--group-directories-first"
  "Variable representing what to add to `dired-actual-switches' to have directories listed first.")

(defun dired-switches-has-directories-first-p ()
  "Return t if current listing is with the directories first or nil otherwise."
  (let ((case-fold-search))
    (if (string-match dired-switches-directories-first-flag dired-actual-switches)
        t)))

(defun dired-sort-with-directories-first ()
  "Make it so dired listing is sorted with directories first."
  (interactive)
  (dired-sort-other (concat dired-actual-switches " " dired-switches-directories-first-flag)))

(defun dired-sort-without-directories-first ()
  "Make it so dired listing is not sorted with directories first."
  (interactive)
  (dired-sort-other (replace-regexp-in-string (concat " ?" dired-switches-directories-first-flag)
                                              ""
                                              dired-actual-switches)))

(defun dired-toggle-sorting-with-directories-first ()
  "Toggle between sorting dired listings with directories first or not.
Return t if dired listing is with directories first after calling this function or nil otherwise."
  (interactive)
  (if (dired-switches-has-directories-first-p)
      (dired-sort-without-directories-first)
    (dired-sort-with-directories-first))
  (dired-switches-has-directories-first-p))

(defun dired-switches-is-reverse-p ()
  "Return t if current listing is in reverse, otherwise nil."
  (dired-switches-has-flag-p "r"))

(defun dired-sort-reverse ()
  "Make it so dired listing is sorted in reverse."
  (dired-switches-add-flag "r"))

(defun dired-sort-forward ()
  "Make it so dired listing is not sorted in reverse."
  (dired-switches-remove-flag "r"))

(defun dired-toggle-sorting-reverse ()
  "Toggle between sorting dired listing in reverse or not.
Return t if dired listing is in reverse after calling this function nil otherwise."
  (interactive)
  (if (dired-switches-is-reverse-p)
      (dired-sort-forward)
    (dired-sort-reverse))
  (dired-switches-is-reverse-p))

(defun dired-sort (criteria &optional reverse)
  "Sort dired buffers.
CRITERIA must be one of name, size, extension, modification, creation, access, ctime.
If REVERSE is set, sort in reverse.  See also `dired-toggle-sorting-reverse'."
  (interactive
   (list (completing-read "Criteria: " '("name" "size" "extension" "modification" "creation" "access" "ctime"))
         current-prefix-arg))
  (let* ((modes-to-flags '(("size"         . "S")
                           ("extension"    . "X")
                           ("creation"     . "U")
                           ("access"       . "ut")
                           ("ctime"        . "ct")
                           ("modification" . "t")))
         (flag (cdr (assoc criteria modes-to-flags))))

    ;; Remove all sorting flags and add the one we want
    (dired-switches-remove-all-sorting-flags)
    (dired-switches-add-flag flag)

    ;; Handle reverse
    (if reverse
        (dired-switches-add-flag "r")
      (dired-switches-remove-flag "r"))))

(defun dired-sort-quickly (criteria &optional reverse)
  "Like `dired-sort' but only ask for one key.
CRITERIA must be one of these letter: n/s/x/m/c/a/t.
If REVERSE is set, sort in reverse.  See also `dired-toggle-sorting-reverse'."
  (interactive "cCriteria (n)ame (s)ize e(x)tension (m)odification-time (c)reation-time (a)ccess-time c(t)ime ?: \nP")
  (let* ((chars-to-modes '(("n" . "name")
                           ("s" . "size")
                           ("x" . "extension")
                           ("m" . "modification")
                           ("c" . "creation")
                           ("a" . "access")
                           ("t" . "ctime")))
         (mode (cdr (assoc (string criteria) chars-to-modes))))
    (dired-sort mode reverse)))

(defun dired-sort-set-mode-line ()
  "This is a redefinition of the fn from `dired.el'.
Provides the modeline in dired mode, depending on the sorting mode."
  (when (eq major-mode 'dired-mode)
    (setq mode-name (cond ((dired-switches-has-flag-p "S")
                           "Dired/size")
                          ((dired-switches-has-flag-p "X")
                           "Dired/extension")
                          ((dired-switches-has-flag-p "U")
                           "Dired/creation")
                          ((dired-switches-has-flag-p "u")
                           "Dired/access")
                          ((dired-switches-has-flag-p "c")
                           "Dired/ctime")
                          ((dired-switches-has-flag-p "t")
                           "Dired/modification")
                          ((dired-switches-is-sorted-by-name-p)
                           "Dired/name")
                          (t
                           (concat "Dired/" dired-actual-switches))))
    (let ((options '()))
      (if (dired-switches-is-reverse-p)
          (add-to-list 'options "reverse" t))
      (if (dired-switches-has-directories-first-p)
          (add-to-list 'options "dirs first" t))
      (if options
          (setq mode-name (concat mode-name " (" (mapconcat 'identity options ", ") ")"))))
    (force-mode-line-update)))

(defun dired-save-sorting-options ()
  "Make it so current sorting options are stored in `dired-listing-switches', which makes it the default for the next dired buffers.
Also output in the *Messages* buffer the line to copy into your .emacs file for it to be that way the next time you start emacs."
  (interactive)
  (setq dired-listing-switches dired-actual-switches)
  (message "(setq dired-listing-switches \"%s\")" dired-listing-switches)
  (message "Dired listing switches set to \"%s\"" dired-listing-switches))

(defun dired-sort-generate-helper (name)
  (let ((funcname (intern (concat "dired-sort-by-" name))))
    (fset funcname `(lambda (&optional reverse)
                      ,(format "Sort dired listing by %s.
If REVERSE is set, sort in reverse. See also `dired-toggle-sorting-reverse'." name)
                      (interactive "P")
                      (dired-sort ,name reverse)))))

(dolist (symbol '(name size extension modification creation access ctime))
  (dired-sort-generate-helper (symbol-name symbol)))

(provide 'dired-sorting)

;;; dired-sorting.el ends here
