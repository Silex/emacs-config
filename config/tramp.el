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

(defun local-file-name-as-sudo (file-name)
  "Transforms /foo/bar.ext into /sudo::/foo/bar.ext"
  (concat "/sudo::" file-name))

(defun tramp-file-name-as-sudo (file-name)
  "Transforms /scp:user@host:/foo/bar.ext into /ssh:user@host|sudo:host:/foo/bar.ext"
  (let* ((parts (tramp-dissect-file-name file-name))
         (host (tramp-file-name-host parts)))

    ;; replace "host:" by "host|sudo:host:"
    (setq file-name (replace-regexp-in-string (regexp-quote (concat host ":"))
                                              (concat host "|sudo:" host ":")
                                              file-name t t))

    ;; replace scp by ssh otherwise sudo doens't work
    (setq file-name (replace-regexp-in-string "^/scp" "/ssh" file-name))))

(defun buffer-file-name-as-sudo (&optional buffer)
  "Return BUFFER filename as sudo"
  (require 'tramp)
  (let* ((buffer (or buffer (current-buffer)))
         (file-name (or (buffer-file-name buffer) dired-directory)))
    (if (tramp-tramp-file-p file-name)
        (tramp-file-name-as-sudo file-name)
      (local-file-name-as-sudo file-name))))

(defun find-alternative-file-with-sudo ()
  (interactive)
  (find-alternate-file (buffer-file-name-as-sudo)))
