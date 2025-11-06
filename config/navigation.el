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
  :after dired
  :bind (:map dired-mode-map
              ("s" . hydra-dired-quick-sort/body)))

(use-package dired-launch
  :after dired
  :init
  (add-hook 'dired-mode-hook 'dired-launch-mode))

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

(use-package hydra)

(defhydra hydra-window (:color red :hint nil)
  "
 Split: _v_ert _x_:horz
Delete: _o_nly  _da_ce  _dw_indow  _db_uffer  _df_rame
  Move: _s_wap
Frames: _f_rame new  _df_ delete
  Misc: _m_ark _a_ce  _u_ndo  _r_edo"
  ("h" windmove-left)
  ("j" windmove-down)
  ("k" windmove-up)
  ("l" windmove-right)
  ("H" hydra-move-splitter-left)
  ("J" hydra-move-splitter-down)
  ("K" hydra-move-splitter-up)
  ("L" hydra-move-splitter-right)
  ("|" (lambda ()
         (interactive)
         (split-window-right)
         (windmove-right)))
  ("_" (lambda ()
         (interactive)
         (split-window-below)
         (windmove-down)))
  ("v" split-window-right)
  ("x" split-window-below)
                                        ;("t" transpose-frame "'")
  ;; winner-mode must be enabled
  ("u" winner-undo)
  ("r" winner-redo) ;;Fixme, not working?
  ("o" delete-other-windows :exit t)
  ("a" ace-window :exit t)
  ("f" make-frame :exit t)
  ("s" ace-swap-window)
  ("da" ace-delete-window)
  ("dw" delete-window)
  ("db" kill-this-buffer)
  ("df" delete-frame :exit t)
  ("q" nil)
                                        ;("i" ace-maximize-window "ace-one" :color blue)
                                        ;("b" ido-switch-buffer "buf")
  ("m" headlong-bookmark-jump))

(defhydra hydra-window2 ()
  "
Movement^^        ^Split^         ^Switch^      ^Resize^
----------------------------------------------------------------
_h_ ←         _v_ertical      _b_uffer        _q_ X←
_j_ ↓         _x_ horizontal  _f_ind files    _w_ X↓
_k_ ↑         _z_ undo        _a_ce 1     _e_ X↑
_l_ →         _Z_ reset       _s_wap      _r_ X→
_F_ollow        _D_lt Other     _S_ave      max_i_mize
_SPC_ cancel    _o_nly this     _d_elete
"
  ("h" windmove-left )
  ("j" windmove-down )
  ("k" windmove-up )
  ("l" windmove-right )
  ("q" hydra-move-splitter-left)
  ("w" hydra-move-splitter-down)
  ("e" hydra-move-splitter-up)
  ("r" hydra-move-splitter-right)
  ("b" helm-mini)
  ("f" helm-find-files)
  ("F" follow-mode)
  ("a" (lambda ()
         (interactive)
         (ace-window 1)
         (add-hook 'ace-window-end-once-hook
                   'hydra-window/body))
   )
  ("v" (lambda ()
         (interactive)
         (split-window-right)
         (windmove-right))
   )
  ("x" (lambda ()
         (interactive)
         (split-window-below)
         (windmove-down))
   )
  ("s" (lambda ()
         (interactive)
         (ace-window 4)
         (add-hook 'ace-window-end-once-hook
                   'hydra-window/body)))
  ("S" save-buffer)
  ("d" delete-window)
  ("D" (lambda ()
         (interactive)
         (ace-window 16)
         (add-hook 'ace-window-end-once-hook
                   'hydra-window/body))
   )
  ("o" delete-other-windows)
  ("i" ace-maximize-window)
  ("z" (progn
         (winner-undo)
         (setq this-command 'winner-undo))
   )
  ("Z" winner-redo)
  ("SPC" nil)
  )

(defhydra hydra-rectangle (:body-pre (rectangle-mark-mode 1) :color pink :post (deactivate-mark))
  "
  ^_k_^     _d_elete    _s_tring
_h_   _l_   _o_k        _y_ank
  ^_j_^     _n_ew-copy  _r_eset
^^^^        _e_xchange  _u_ndo
^^^^        ^ ^         _p_aste
"
  ("h" backward-char nil)
  ("l" forward-char nil)
  ("k" previous-line nil)
  ("j" next-line nil)
  ("e" exchange-point-and-mark nil)
  ("n" copy-rectangle-as-kill nil)
  ("d" delete-rectangle nil)
  ("r" (if (region-active-p)
           (deactivate-mark)
         (rectangle-mark-mode 1)) nil)
  ("y" yank-rectangle nil)
  ("u" undo nil)
  ("s" string-rectangle nil)
  ("p" kill-rectangle nil)
  ("o" nil nil))

(defhydra hydra-projectile (:color teal :hint nil)
  "
     PROJECTILE: %(projectile-project-root)

     Find File            Search/Tags          Buffers                Cache
------------------------------------------------------------------------------------------
_s-f_: file            _a_: ag                _i_: Ibuffer           _c_: cache clear
 _ff_: file dwim       _g_: update gtags      _b_: switch to buffer  _x_: remove known project
 _fd_: file curr dir   _o_: multi-occur     _s-k_: Kill all buffers  _X_: cleanup non-existing
  _r_: recent file                                               ^^^^_z_: cache current
  _d_: dir

"
  ("a"   projectile-ag)
  ("b"   projectile-switch-to-buffer)
  ("c"   projectile-invalidate-cache)
  ("d"   projectile-find-dir)
  ("s-f" projectile-find-file)
  ("ff"  projectile-find-file-dwim)
  ("fd"  projectile-find-file-in-directory)
  ("g"   ggtags-update-tags)
  ("s-g" ggtags-update-tags)
  ("i"   projectile-ibuffer)
  ("K"   projectile-kill-buffers)
  ("s-k" projectile-kill-buffers)
  ("m"   projectile-multi-occur)
  ("o"   projectile-multi-occur)
  ("s-p" projectile-switch-project "switch project")
  ("p"   projectile-switch-project)
  ("s"   projectile-switch-project)
  ("r"   projectile-recentf)
  ("x"   projectile-remove-known-project)
  ("X"   projectile-cleanup-known-projects)
  ("z"   projectile-cache-current-file)
  ("`"   hydra-projectile-other-window/body "other window")
  ("q"   nil "cancel" :color blue))

(defhydra hydra-learn-sp (:hint nil)
  "
  _B_ backward-sexp            -----
  _F_ forward-sexp               _s_ splice-sexp
  _L_ backward-down-sexp         _df_ splice-sexp-killing-forward
  _H_ backward-up-sexp           _db_ splice-sexp-killing-backward
^^------                         _da_ splice-sexp-killing-around
  _k_ down-sexp                -----
  _j_ up-sexp                    _C-s_ select-next-thing-exchange
-^^-----                         _C-p_ select-previous-thing
  _n_ next-sexp                  _C-n_ select-next-thing
  _p_ previous-sexp            -----
  _a_ beginning-of-sexp          _C-f_ forward-symbol
  _z_ end-of-sexp                _C-b_ backward-symbol
--^^-                          -----
  _t_ transpose-sexp             _c_ convolute-sexp
-^^--                            _g_ absorb-sexp
  _x_ delete-char                _q_ emit-sexp
  _dw_ kill-word               -----
  _dd_ kill-sexp                 _,b_ extract-before-sexp
-^^--                            _,a_ extract-after-sexp
  _S_ unwrap-sexp              -----
-^^--                            _AP_ add-to-previous-sexp
  _C-h_ forward-slurp-sexp       _AN_ add-to-next-sexp
  _C-l_ forward-barf-sexp      -----
  _C-S-h_ backward-slurp-sexp    _ join-sexp
  _C-S-l_ backward-barf-sexp     _|_ split-sexp
"
  ;; TODO: Use () and [] - + * | <space>
  ("B" sp-backward-sexp );; similiar to VIM b
  ("F" sp-forward-sexp );; similar to VIM f
  ;;
  ("L" sp-backward-down-sexp )
  ("H" sp-backward-up-sexp )
  ;;
  ("k" sp-down-sexp ) ; root - towards the root
  ("j" sp-up-sexp )
  ;;
  ("n" sp-next-sexp )
  ("p" sp-previous-sexp )
  ;; a..z
  ("a" sp-beginning-of-sexp )
  ("z" sp-end-of-sexp )
  ;;
  ("t" sp-transpose-sexp )
  ;;
  ("x" sp-delete-char )
  ("dw" sp-kill-word )
  ;;("ds" sp-kill-symbol ) ;; Prefer kill-sexp
  ("dd" sp-kill-sexp )
  ;;("yy" sp-copy-sexp ) ;; Don't like it. Pref visual selection
  ;;
  ("S" sp-unwrap-sexp ) ;; Strip!
  ;;("wh" sp-backward-unwrap-sexp ) ;; Too similar to above
  ;;
  ("C-h" sp-forward-slurp-sexp )
  ("C-l" sp-forward-barf-sexp )
  ("C-S-h" sp-backward-slurp-sexp )
  ("C-S-l" sp-backward-barf-sexp )
  ;;
  ;;("C-[" (bind (sp-wrap-with-pair "[")) ) ;;FIXME
  ;;("C-(" (bind (sp-wrap-with-pair "(")) )
  ;;
  ("s" sp-splice-sexp )
  ("df" sp-splice-sexp-killing-forward )
  ("db" sp-splice-sexp-killing-backward )
  ("da" sp-splice-sexp-killing-around )
  ;;
  ("C-s" sp-select-next-thing-exchange )
  ("C-p" sp-select-previous-thing )
  ("C-n" sp-select-next-thing )
  ;;
  ("C-f" sp-forward-symbol )
  ("C-b" sp-backward-symbol )
  ;;
  ;;("C-t" sp-prefix-tag-object)
  ;;("H-p" sp-prefix-pair-object)
  ("c" sp-convolute-sexp )
  ("g" sp-absorb-sexp )
  ("q" sp-emit-sexp )
  ;;
  (",b" sp-extract-before-sexp )
  (",a" sp-extract-after-sexp )
  ;;
  ("AP" sp-add-to-previous-sexp );; Difference to slurp?
  ("AN" sp-add-to-next-sexp )
  ;;
  ("_" sp-join-sexp ) ;;Good
  ("|" sp-split-sexp ))

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
