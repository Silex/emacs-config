;; Inspired from https://github.com/purcell/emacs.d/blob/master/init-benchmarking.el

(defun performance/time-subtract-millis (b a)
  (* 1000.0 (float-time (time-subtract b a))))

(defvar performance/require-times nil
  "A list of (FEATURE . LOAD-DURATION).
LOAD-DURATION is the time taken in milliseconds to load FEATURE.")

(defun performance/record-require-times ()
  (defadvice require
    (around build-performance (feature &optional filename noerror) activate)
    "Stores in `performance' the time taken to require each feature."
    (let* ((already-loaded (memq feature features))
           (require-start-time (and (not already-loaded) (current-time))))
      (prog1
          ad-do-it
        (when (and (not already-loaded) (memq feature features))
          (add-to-list 'performance/require-times (cons feature (performance/time-subtract-millis (current-time) require-start-time)) t))))))

(defun performance/show-require-times ()
  (interactive)
  (let* ((list (copy-sequence performance/require-times))
         (org-table (mapconcat (lambda (x) (format "| %s | %.3f |" (car x) (cdr x))) list "\n"))
         (buffer (get-buffer-create "*Require Times*")))

    ;; Switch to buffer buffer
    (set-buffer buffer)
    (erase-buffer)

    ;; Insert table
    (insert "\n")
    (insert "|---------|------|\n")
    (insert "| Feature | Time |\n")
    (insert "|---------|------|\n")
    (insert org-table "\n")
    (insert "|---------|------|\n")
    (insert "|         |      |\n")
    (insert "|---------|------|\n")
    (insert "#+TBLFM: @>$2=vsum(@II..@III)")

    ;; Realign & Recalculate
    (org-mode)
    (require 'org-table)
    (org-table-calc-current-TBLFM)

    ;; Switch to buffer
    (switch-to-buffer buffer)))

(provide 'performance)
