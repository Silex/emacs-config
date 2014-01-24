;;; help-fns+-autoloads.el --- automatically extracted autoloads
;;
;;; Code:


;;;### (autoloads (describe-keymap describe-file describe-option-of-type
;;;;;;  describe-option describe-command describe-function) "help-fns+"
;;;;;;  "help-fns+.el" (21218 52020 0 0))
;;; Generated autoloads from help-fns+.el

(autoload 'describe-function "help-fns+" "\
Display the full documentation of FUNCTION (a symbol).
FUNCTION names an Emacs Lisp function, possibly a user command.
With a prefix argument, candidates are commands (interactive) only.
Default candidate is: preferably the `symbol-nearest-point', or else
the innermost function call surrounding point
\(`function-called-at-point').
Return the description that was displayed, as a string.

\(fn FUNCTION &optional COMMANDP)" t nil)

(autoload 'describe-command "help-fns+" "\
Describe an Emacs command (interactive function).
Same as using a prefix arg with `describe-function'.

\(fn FUNCTION)" t nil)

(autoload 'describe-option "help-fns+" "\
Describe an Emacs user variable (option).
Same as using a prefix arg with `describe-variable'.

\(fn VARIABLE &optional BUFFER)" t nil)

(autoload 'describe-option-of-type "help-fns+" "\
Describe an Emacs user OPTION (variable) of a given `defcustom' TYPE.
A prefix argument determines the type-checking behavior:
 - None:         OPTION is defined with TYPE or a subtype of TYPE.
 - Plain `C-u':  OPTION is defined with TYPE or a subtype of TYPE,
                 or its current value is compatible with TYPE.
 - Negative:     OPTION is defined with TYPE (exact match).
 - Non-negative: OPTION is defined with TYPE (exact match),
                 or its current value is compatible with TYPE.

If TYPE is nil (default value) then *all* `defcustom' variables are
potential candidates.  That is different from using `describe-option',
because `describe-option' includes user-variable candidates not
defined with `defcustom' (with `*'-prefixed doc strings).

\(fn TYPE OPTION)" t nil)

(autoload 'describe-file "help-fns+" "\
Describe the file named FILENAME.
If FILENAME is nil, describe current directory (`default-directory').

Starting with Emacs 22, if the file is an image file then:
 * Show a thumbnail of the image as well.
 * If you have command-line tool `exiftool' installed and in your
   `$PATH' or `exec-path', then show EXIF data (metadata) about the
   image.  See standard Emacs library `image-dired.el' for more
   information about `exiftool'.

If FILENAME is the name of an autofile bookmark and you use library
`Bookmark+', then show also the bookmark information (tags etc.).  In
this case, a prefix arg shows the internal form of the bookmark.

In Lisp code:

Non-nil optional arg INTERNAL-FORM-P shows the internal form.
Non-nil optional arg NO-ERROR-P prints an error message but does not
 raise an error.

\(fn FILENAME &optional INTERNAL-FORM-P NO-ERROR-P)" t nil)

(autoload 'describe-keymap "help-fns+" "\
Describe bindings in KEYMAP, a variable whose value is a keymap.
Completion is available for the keymap name.

\(fn KEYMAP)" t nil)

;;;***

;;;### (autoloads nil nil ("help-fns+-pkg.el") (21218 52020 217310
;;;;;;  0))

;;;***

(provide 'help-fns+-autoloads)
;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; help-fns+-autoloads.el ends here
