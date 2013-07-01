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
                        google-maps           ; Naviguate google maps inside emacs
                        emacschrome           ; Edit chrome textareas inside emacs
                        work-timer            ; A timer so you know when telax, and when to work
                        goto-last-change      ; Move point through buffer-undo-list positions
                        exec-path-from-shell  ; Make Emacs use the $PATH set up by the user's shell
                        maxframe              ; Maxframe provides the ability to maximize the emacs frame and stay within the display resolution.

                        ;; GUI
                        tabbar                ; Display a tab bar in the header line
                        powerline             ; Like the powerline plugin for vim
                        color-theme           ; An Emacs-Lisp package with more than 50 color themes for your use.
                        color-theme-monokai   ; Monokai Color Theme for Emacs.
                        rainbow-mode          ; Colorize color names in buffers

                        ;; Naviguation
                        helm                  ; Emacs incremental and narrowing framework
                        smex                  ; M-x interface with Ido-style fuzzy matching.
                        dired+                ; Extensions to Dired
                        ido-ubiquitous        ; Use ido (nearly) everywhere
                        ido-vertical-mode     ; Makes ido-mode display vertically
                        expand-region         ; Expand region increases the selected region by semantic units.
                        multiple-cursors      ; Multiple cursors in emacs
                        switch-window         ; A *visual* way to choose a window to switch to

                        ;; Snippets
                        yasnippet             ; YASnippet is a template system for Emacs.

                        ;; Code
                        auto-complete         ; The most intelligent auto-completion extension.

                        ;; Web
                        js2-mode              ; Javascript mode
                        haml-mode             ; Haml mode
                        sass-mode             ; Sass mode
                        coffee-mode           ; CoffeeScript mode

                        ;; C++
                        cmake-mode            ; Provides syntax highlighting and indentation for CMakeLists.txt and *.cmake source files.
                        auto-complete-clang   ; Auto-complete sources for Clang. Combine the power of AC, Clang and Yasnippet.

                        ;; ELISP
                        dash                  ; A modern list api for Emacs. No 'cl required.

                        ;; Ruby/Rails
                        auto-complete-ruby    ; Auto-complete sources for Ruby
                        rvm                   ; Emacs integration for rvm
                        rinari                ; Rinari Is Not A Rails IDE
                        ;ruby-compilation      ; Run a ruby process in a compilation buffer
                        rcodetools            ; rcodetools is a collection of Ruby code manipulation tools.

                        ;; Git
                        magit                 ; It's Magit! An Emacs mode for Git.
                        gist                  ; Emacs integration for gist.github.com

                        ;; File formats
                        json                  ; JSON mode
                        yaml-mode             ; YAML mode
                        markdown-mode         ; Markdown mode
                        textile-mode          ; Textile mode

                        ;; org-mode
                        org-mode              ; Org-mode is for keeping notes, maintaining ToDo lists, doing project planning, and authoring with a fast and effective plain-text system.
                        org-impress-js        ; impress.js export for Org-mode
                        ;ess                   ; Emacs Speaks Statistics: statistical programming within Emacs

                        ;; IRC
                        ;erc erc-znc erc-highlight-nicknames sr-speedbar

                        ;; Vim
                        evil                  ; Evil is an extensible vi layer for Emacs.
                        evil-leader           ; Add <leader> shortcuts to Evil
                        evil-surround         ; Emulate Tim Pope's surround.vim
                        evil-numbers          ; Increment/decrement numbers
                        evil-rails))          ; Rails specific commands for evil


;; Fetch packages
(el-get 'sync el-get-packages)

;; Load customizations
(defun load-directory (dir)
  "Loads every .el file in a directory in sorted order"
  (mapcar 'load-file (directory-files dir t "\\.el\\'")))
(load-directory (concat config-directory "/config"))
