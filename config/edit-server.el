(defun emacs-chrome-start()
  (edit-server-start))

(use-package edit-server
  :defer t
  :idle (edit-server-start))
