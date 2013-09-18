(use-package undo-tree
  :commands undo-tree-mode
  :init
  (progn
    ;; Undo
    (setq undo-tree-auto-save-history t)
    (setq undo-tree-history-directory-alist `((".*" . ,temporary-file-directory)))))

(undo-tree-mode)

;; Keep region when undoing in region
(defadvice undo-tree-undo (around keep-region activate)
  (if (use-region-p)
      (let ((m (set-marker (make-marker) (mark)))
            (p (set-marker (make-marker) (point))))
        ad-do-it
        (goto-char p)
        (set-mark m)
        (set-marker p nil)
        (set-marker m nil))
    ad-do-it))
