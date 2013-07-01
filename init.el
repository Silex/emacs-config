;; Install el-get and build recipes if necessary
(add-to-list 'load-path (concat el-get-dir "/el-get"))
(unless (require 'el-get nil 'noerror)
  (with-current-buffer
    (url-retrieve-synchronously "https://raw.github.com/dimitri/el-get/master/el-get-install.el")
    (let (el-get-master-branch)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (el-get-elpa-build-local-recipes))

;; Local recipes
(add-to-list 'el-get-recipe-path (concat config-directory "/recipes"))

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
                        ido-vertical-mode
                        expand-region
                        multiple-cursors
                        switch-window

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
