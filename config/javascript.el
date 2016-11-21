(use-package js2-mode
  :ensure t
  :mode ("\\.js\\'" . js2-mode))

(defun js2-add-semi-colons ()
  "Add missing semi-colons."
  (interactive)
  (--each (--select (string-equal (caar it) "msg.missing.semi") (js2-warnings))
    (let ((pos (nth 1 it))
          (length (nth 2 it)))
      (goto-char (+ pos length))
      (insert ";"))))
