;;; navigation.el --- Navigation, search, and buffers  -*- lexical-binding: t; -*-

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

(defun silex/file-name-as-sudo (file-name)
  "Return FILE-NAME rewritten so it is visited with root privileges.
A remote FILE-NAME gains a sudo hop rather than being reopened as root
over the original method, so the existing connection is reused and hosts
refusing a root login still work."
  (if (not (tramp-tramp-file-p file-name))
      (concat "/sudo::" file-name)
    (let ((parts (tramp-dissect-file-name file-name)))
      (if (member (tramp-file-name-method parts) '("sudo" "su" "doas" "ksu"))
          file-name
        ;; Built by hand because tramp-make-tramp-file-name only renders the
        ;; hop when tramp-show-ad-hoc-proxies is set, and otherwise records it
        ;; in tramp-default-proxies-alist as a side effect.
        (concat "/" (tramp-make-tramp-hop-name parts)
                "sudo:" (tramp-file-name-host parts)
                ":" (tramp-file-name-localname parts))))))

(defun silex/buffer-file-name-as-sudo (&optional buffer)
  "Return the file name BUFFER visits, rewritten for root access."
  (require 'tramp)
  (let ((buffer (or buffer (current-buffer))))
    (silex/file-name-as-sudo
     (expand-file-name (or (buffer-file-name buffer) dired-directory)))))

(defun silex/find-alternate-file-as-sudo ()
  "Revisit the current file with root privileges."
  (interactive)
  (find-alternate-file (silex/buffer-file-name-as-sudo)))

(use-package windmove
  :straight nil
  :demand t
  :custom
  ;; Moving off the frame edge splits a new window there and selects it.
  (windmove-create-window t)
  :config
  ;; Switch windows using Control + Meta + Arrow.  Super is the Windows key,
  ;; which the WSL host consumes before Emacs ever sees it.
  (windmove-default-keybindings '(control meta))
  ;; Add Shift to send the next command's buffer to the window in the given
  ;; direction, splitting there if no window exists yet.  Installed by hand
  ;; because windmove-display-default-keybindings also binds 0, f and t.
  (windmove-install-defaults
   nil '(control meta shift)
   '((windmove-display-left left)
     (windmove-display-right right)
     (windmove-display-up up)
     (windmove-display-down down))))

(use-package ztree)
