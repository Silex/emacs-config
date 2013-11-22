;; For TRAMP to work with ssh-key, install the programm ssh-askpass (https://github.com/markcarver/mac-ssh-askpass)

;; C-x C-f /ssh:you@remotehost|sudo:remotehost:/path/to/file

;; Never expire passwords
(setq password-cache-expiry nil)

;; Use out-of-band method for files bigger than 2 megabytes
(setq tramp-copy-size-limit (* 2 1024 1024))

(use-package tramp-gvfs
  :defer t
  :config
  ;; Prefer gvfs for FTP
  (add-to-list 'tramp-gvfs-methods "ftp"))

(defun find-alternative-file-with-sudo ()
  (interactive)
  (let* ((file-name (or buffer-file-name dired-directory))
         (new-name (concat "/sudo::" file-name)))
    (find-alternate-file new-name)))
