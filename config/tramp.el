;; For TRAMP to work with ssh-key, install the programm ssh-askpass (https://github.com/markcarver/mac-ssh-askpass)

;;(add-to-list 'tramp-default-proxies-alist '(".*" "\`root\'" "/ssh:%h:"))

(defun find-alternative-file-with-sudo ()
  (interactive)
  (let* ((file-name (or buffer-file-name dired-directory))
         (new-name (concat "/sudo::" file-name)))
    (find-alternate-file new-name)))
