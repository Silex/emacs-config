(ido-mode t)
(ido-everywhere t)
(ido-ubiquitous)
(ido-vertical-mode)

(setq ido-enable-flex-matching t)
(setq ido-create-new-buffer 'always)

;(setq ido-show-dot-for-dired t)
(setq ido-use-url-at-point nil)
(setq ido-use-filename-at-point nil)

;; Disable auto searching for files unless called explicitly
(setq ido-auto-merge-delay-time 99999)

;; Enable R key in dired to use ido
(put 'dired-do-rename 'ido 'find-file)

;; Avoid "size too big" errors
(setq ido-max-directory-size 300000)

;; Always propose old buffers as well
(setq ido-use-virtual-buffers t)

;; Helper for recentf
(defun recentf-ido-find-file ()
  "Find a recent file using Ido."
  (interactive)
  (let ((file (ido-completing-read "Choose recent file: " recentf-list nil t)))
    (when file
      (find-file file))))

;;; Display ido results vertically, rather than horizontally
;(setq ido-decorations (quote ("\n ->" "" "\n   " "\n   ..." "\n ->" "" " [No match]" " [Matched]" " [Not readable]" " [Too big]" " [Confirm]")))
;(defun ido-disable-line-trucation () (set (make-local-variable 'truncate-lines) nil))
;(add-hook 'ido-minibuffer-setup-hook 'ido-disable-line-trucation)

; '(ido-create-new-buffer (quote never))
; '(ido-enable-flex-matching t)
; '(ido-enable-last-directory-history nil)
; '(ido-enable-regexp nil)
; '(ido-max-file-prompt-width 0.1)
