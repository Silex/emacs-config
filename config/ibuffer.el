(defun ibuffer-mark-by-extension (extension)
  "Mark all buffers whoese extension matches EXTENSION."
  (interactive "sMark by extension: ")
  (ibuffer-mark-on-buffer #'(lambda (buf)
                              (string-match (concat extension "$") (buffer-name buf)))))

(add-hook 'ibuffer-hook 'ibuffer-tramp-set-filter-groups-by-tramp-connection)

(use-package ibuffer
  :bind (("S-C-b" . ibuffer)
         (:map ibuffer-mode-map
               ("U" . (lambda()(interactive)(ibuffer-unmark-all ?\n)))
               ("* ." . ibuffer-mark-by-extension)
               ("* *" . ibuffer-mark-special-buffers))))
