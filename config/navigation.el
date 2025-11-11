;; Navigation, search, and buffers

(use-package ace-jump-mode)

(use-package ag
  :custom
  (ag-highlight-search t)
  (ag-group-matches nil))

(defun dired-do-find-marked-files-and-select-in-ibuffer ()
  "Open marked files in ibuffer and select them."
  (interactive)
  (let ((current (current-buffer)))
    (dired-map-over-marks
     (let* ((filename (dired-get-file-for-visit))
            (buffer (find-file-noselect filename)))
       ;; Select buffer in ibuffer
       (ibuffer)
       (ibuffer-mark-on-buffer #'(lambda (buf)
                                   (eq buf buffer)))
       ;; Go back to dired
       (switch-to-buffer current))
     nil)

    ;; Remove other buffers from ibuffer listing
    (ibuffer)
    (ibuffer-toggle-marks)
    (ibuffer-do-kill-lines)
    (ibuffer-toggle-marks)))

(defun dired-do-eval (form)
  "Evaluate FORM in each of the buffers."
  (interactive (list (read-from-minibuffer "Eval in files (form): " nil read-expression-map t 'read-expression-history)))
  (dired-map-over-marks
   (let* ((filename (dired-get-file-for-visit))
          (buf (find-file-noselect filename))
          (kill-buffer-query-functions nil))
     (unwind-protect
         (with-current-buffer buf (eval form lexical-binding)(save-buffer))
       (kill-buffer buf))) nil))

(defun dired-toggle-dwim-target ()
  (interactive)
  "Toggles `dired-dwim-target'."
  (setq dired-dwim-target (not dired-dwim-target))
  (message "Dired DWIM is %s" (if dired-dwim-target "ON" "OFF")))

(use-package dired
  :straight nil
  :bind (:map dired-mode-map
              ("<backspace>" . dired-jump)
              ("E" . dired-do-eval)
              ("F" . dired-do-find-marked-files-and-select-in-ibuffer))
  :custom
  (dired-recursive-copies 'always)
  (dired-recursive-deletes 'always)
  (dired-listing-switches "-alh")
  (dired-dwim-target t)
  :config
  (put 'dired-find-alternate-file 'disabled nil))

(use-package dired-x
  :straight nil
  :bind ("C-d" . dired-jump))

(use-package dired-filter
  :demand t
  :after dired
  :custom (dired-filter-mark-prefix "*"))

(use-package dired-quick-sort
  :demand t
  :after dired)

(use-package dired-ranger)
(use-package dired-subtree)
(use-package dired-imenu :after dired)
(use-package dired-du)

(use-package dirtree)
(use-package neotree)

(use-package tar-mode
  :custom (tar-mode-show-date t))

(use-package wdired
  :custom
  (wdired-create-parent-directories t))

(use-package dumb-jump
  :demand t
  :config
  (dumb-jump-mode)
  (add-hook 'xref-backend-functions #'dumb-jump-xref-activate))

(use-package bm)

(use-package grep
  :straight nil
  :config
  (dolist (type '(jpg jpeg png gif           ; images
                  mpg mjpg avi               ; videos
                  rar zip 7z tar tgz gz bz)) ; archives
    (add-to-list 'grep-find-ignored-files (concat "*." (symbol-name type)))))

(use-package wgrep
  :custom (wgrep-enable-key "\C-x\C-q"))

(use-package wgrep-ag)

(use-package goto-last-change)

(defun ibuffer-mark-by-extension (extension)
  "Mark all buffers whoese extension matches EXTENSION."
  (interactive "sMark by extension: ")
  (ibuffer-mark-on-buffer #'(lambda (buf)
                              (string-match (concat extension "$") (buffer-name buf)))))

(defun ibuffer-unmark-all-no-questions ()
  "Call `ibuffer-unmark-all' and press RET directly."
  (interactive)
  (ibuffer-unmark-all ?\n))

(use-package ibuffer
  :straight nil
  :bind ("C-c b" . ibuffer))

(use-package ibuffer-tramp
  :after ibuffer
  :init (add-hook 'ibuffer-hook 'ibuffer-tramp-set-filter-groups-by-tramp-connection))

(defun silex/projectile-require-tramp (&rest _)
  "Ensure TRAMP is loaded before switching projects."
  (require 'tramp))

(use-package projectile
  :demand t
  :custom
  (projectile-keymap-prefix (kbd "C-c p"))
  (projectile-use-git-grep t)
  (projectile-switch-project-action 'projectile-dired)
  (projectile-enable-caching t)
  (projectile-mode-line '(:eval (format " Projectile[%s]" (projectile-project-name))))
  (projectile-completion-system 'default)
  :config
  (advice-add 'projectile-switch-project :before #'silex/projectile-require-tramp)
  (projectile-mode))

(use-package projectile-rails
  :demand t
  :after projectile
  :config
  (projectile-rails-global-mode)
  (define-key projectile-rails-mode-map (kbd "C-c r") 'projectile-rails-command-map))

(use-package sr-speedbar
  :custom
  ;; Show tree on the left side
  (sr-speedbar-right-side nil)
  ;; Show all files
  (speedbar-show-unknown-files t)
  ;; Bigger size (default is 24)
  (sr-speedbar-width 35))

(use-package switch-window
  :bind ("C-x o" . switch-window))

(use-package treemacs)

;; For TRAMP to work with ssh-key, install the programm ssh-askpass (https://github.com/markcarver/mac-ssh-askpass)

;; C-x C-f /ssh:you@remotehost|sudo:remotehost:/path/to/file

(defun url-clear-cookies ()
  "Clear all cookies."
  (interactive)
  (setq url-cookie-storage nil)
  (setq url-cookie-secure-storage nil))

(use-package password-cache
  :straight nil
  :custom
  ;; Never expire passwords
  (password-cache-expiry nil))

(use-package tramp
  :straight nil
  :custom
  (tramp-default-method "ssh"))

(defun add-ssh-agent-to-tramp ()
  (cl-pushnew '("-A")
              (cadr (assoc 'tramp-login-args
                           (assoc "ssh" tramp-methods)))
              :test #'equal))

(use-package tramp-sh
  :straight nil
  :custom
  ;; Use out-of-band method for big files
  (tramp-copy-size-limit (* 0.5 1024 1024))
  :config
  ;; Use the PATH from the remote
  (add-to-list 'tramp-remote-path 'tramp-own-remote-path))

(use-package tramp-gvfs
  :straight nil
  :after tramp-ftp
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
         (file-name (expand-file-name (or (buffer-file-name buffer) dired-directory))))
    (if (tramp-tramp-file-p file-name)
        (tramp-file-name-as-sudo file-name)
      (local-file-name-as-sudo file-name))))

(defun find-alternative-file-with-sudo ()
  (interactive)
  (find-alternate-file (buffer-file-name-as-sudo)))

(use-package windmove
  :config
  ;; Switch windows using Super + Arrow
  (windmove-default-keybindings 'super))

(use-package ztree)
