(defun ibuffer-mark-by-extension (extension)
  "Mark all buffers whoese extension matches EXTENSION."
  (interactive "sMark by extension: ")
  (ibuffer-mark-on-buffer #'(lambda (buf)
                              (string-match (concat extension "$") (buffer-name buf)))))

(defun ibuffer-unmark-all-no-questions ()
  "Call `ibuffer-unmark-all' and press RET directly."
  (interactive)
  (ibuffer-unmark-all ?\n))

(use-package ibuffer-tramp
  :ensure t
  :defer t
  :init (add-hook 'ibuffer-hook 'ibuffer-tramp-set-filter-groups-by-tramp-connection))

(use-package ibuffer
  :bind (("S-C-b" . ibuffer)
         :map ibuffer-mode-map
         ("U"   . ibuffer-unmark-all-no-questions)
         ("* ." . ibuffer-mark-by-extension)
         ("* *" . ibuffer-mark-special-buffers)))
