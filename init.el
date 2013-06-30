;; Install el-get and build recipes if necessary
(add-to-list 'load-path (concat el-get-dir "/el-get"))
(unless (require 'el-get nil 'noerror)
  (with-current-buffer
    (url-retrieve-synchronously "https://raw.github.com/dimitri/el-get/master/el-get-install.el")
    (let (el-get-master-branch)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (el-get-elpa-build-local-recipes))

;; Custom sources for el-get
(setq el-get-sources '((:name tabbar
                              :description "Tabbar"
                              :type http
                              :url "https://github.com/davidswelt/aquamacs-emacs/raw/master/aquamacs/src/site-lisp/tabbar/tabbar.el")

                       (:name exec-path-from-shell
                              :description "exec-path-from-shell"
                              :type github
                              :pkgname "purcell/exec-path-from-shell")

                       (:name erc-znc
                              :description "erc-znc"
                              :type git
                              :url "git://github.com/sshirokov/ZNC.el.git")

                       (:name work-timer
                              :description "Work timer"
                              :type http
                              :url "http://www.emacswiki.org/emacs-de/download/work-timer.el")

                       (:name pomodoro
                              :description "Pomodoro"
                              :type http
                              :url "http://kanis.fr/hg/lisp/ivan/pomodoro.el")

                       (:name helm-projectile
                              :description "Pomodoro"
                              :type http
                              :url "https://raw.github.com/bbatsov/projectile/master/helm-projectile.el")

                       (:name ediff-trees
                              :description "ediff-trees"
                              :type http
                              :url "http://www.emacswiki.org/emacs/download/ediff-trees.el")

                       (:name palette
                              :description "Palette"
                              :type http
                              :url "http://www.emacswiki.org/emacs-en/download/palette.el")

                       (:name working-dirtree
                              :description "working-dirtree"
                              :type git
                              ;:depends (tree-mode windata)
                              :url "git://github.com/zkim/emacs-dirtree.git")

                       (:name icicles
                              :type http-tar
                              :options ("xzf")
                              :url "http://www.emacswiki.org/emacs/download/Icicles.tar.gz"
                              :load-path ("./icicles")
                              :library icicles :features icicles
                              :autoloads nil :post-init (lambda () (icy-mode)))))

;; Fix broken recipes
(push '(:name evil
              :build (("make" "all"))
              :info nil)
      el-get-sources)

;; Desired packages
(setq el-get-packages '(;; Misc
                        google-maps
                        emacschrome
                        work-timer
                        goto-last-change
                        exec-path-from-shell

                        ;; Naviguation
                        helm
                        smex
                        dired+
                        ido-ubiquitous
                        expand-region
                        multiple-cursors

                        ;; Snippets
                        yasnippet

                        ;; Frame
                        maxframe

                        ;; Github
                        gist

                        ;; ELISP
                        dash

                        ;; Auto-complete
                        auto-complete
                        auto-complete-clang
                        auto-complete-ruby

                        ;; Vim
                        evil
                        evil-leader
                        evil-surround  ; surround.vim equivalent
                        evil-numbers   ; C-a/C-x equivalent
                        evil-rails     ; :Rview/:Rmodel equivalent

                        ;; Ruby/Rails
                        rvm
                        rinari
                        ruby-compilation
                        rcodetools

                        ;; Code
                        js2-mode
                        cmake-mode
                        haml-mode
                        sass-mode
                        coffee-mode
                        yaml-mode
                        json

                        ;; Documentation
                        markdown-mode
                        textile-mode

                        ;; VCS
                        magit

                        ;; org-mode
                        org-mode
                        org-impress-js

                        ;; IRC
                        ;erc erc-znc erc-highlight-nicknames sr-speedbar

                        ;; GUI
                        tabbar
                        color-theme
                        color-theme-monokai
                        rainbow-mode))

;; Fetch packages
(el-get 'sync el-get-packages)

;; Load customizations
(defun load-directory (dir)
  "Loads every .el file in a directory in sorted order"
  (mapcar 'load-file (directory-files dir t "\\.el\\'")))
(load-directory (concat config-directory "/config"))
