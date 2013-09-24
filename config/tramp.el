;; For TRAMP to work with ssh-key, install the programm ssh-askpass (https://github.com/markcarver/mac-ssh-askpass)

;; C-x C-f /ssh:you@remotehost|sudo:remotehost:/path/to/file

(defun find-alternative-file-with-sudo ()
  (interactive)
  (let* ((file-name (or buffer-file-name dired-directory))
         (new-name (concat "/sudo::" file-name)))
    (find-alternate-file new-name)))
