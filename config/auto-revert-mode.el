;; (defun current-buffer-remote-p ()
;;   (--any? (and it (file-remote-p it))
;;           (list
;;            (buffer-file-name)
;;            list-buffers-directory
;;            default-directory)))

;; (use-package autorevert
;;   :defer t
;;   :init
;;   (setq auto-revert-verbose nil)
;;   (if (not degrade-p-terminal)
;;       (setq auto-revert-mode-text " ♻"
;;             auto-revert-tail-mode-text " ♻~")
;;     (setq auto-revert-mode-text " ar"
;;           auto-revert-tail-mode-text " ar~"))
;;   :config
;;   (defun auto-revert-turn-on-maybe ()
;;     (unless (current-buffer-remote-p)
;;       (auto-revert-mode)))
;;   (add-hook 'find-file-hook 'auto-revert-turn-on-maybe))

;; ;; :idle (global-auto-revert-mode 1)
