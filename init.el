(require 'config)

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
                        fill-column-indicator ; Graphically indicates the fill column.
                        fullscreen-mode       ; fullscreen window support for Emacs
                        multi-term            ; A mode based on term.el, for managing multiple terminal buffers in Emacs.
                        shell-pop             ; Helps you pop up and pop out shell buffer easily.
                        htmlr                 ; HTML rendering in Elisp
                        bm                    ; Visible bookmarks in buffer.

                        ;; GUI
                        tabbar                ; Display a tab bar in the header line
                        powerline             ; Like the powerline plugin for vim
                        color-theme           ; An Emacs-Lisp package with more than 50 color themes for your use.
                        color-theme-monokai   ; Monokai Color Theme for Emacs.
                        rainbow-mode          ; Colorize color names in buffers

                        ;; Naviguation
                        fiplr                 ; Fuzzy finder for files in a project.
                        helm                  ; Emacs incremental and narrowing framework
                        smex                  ; M-x interface with Ido-style fuzzy matching.
                        dired+                ; Extensions to Dired
                        ido-ubiquitous        ; Use ido (nearly) everywhere
                        ido-vertical-mode     ; Makes ido-mode display vertically
                        flx                   ; Fuzzy matching for Emacs ... a la Sublime Text.
                        expand-region         ; Expand region increases the selected region by semantic units.
                        multiple-cursors      ; Multiple cursors in emacs
                        smooth-scrolling      ; Make emacs scroll smoothly
                        switch-window         ; A *visual* way to choose a window to switch to
                        minimap               ; Minimap sidebar for Emacs

                        ;; Snippets
                        yasnippet             ; YASnippet is a template system for Emacs.

                        ;; Code
                        auto-complete         ; The most intelligent auto-completion extension.

                        ;; Web
                        js2-mode              ; Javascript mode
                        haml-mode             ; Haml mode
                        sass-mode             ; Sass mode
                        less-css-mode         ; LESS CSS mode
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
                        git-messenger         ; Pops up commit messages at current line
                        gist                  ; Emacs integration for gist.github.com

                        ;; File formats
                        json                  ; JSON mode
                        yaml-mode             ; YAML mode
                        markdown-mode         ; Markdown mode
                        textile-mode          ; Textile mode

                        ;; org-mode
                        org-mode              ; Org-mode is for keeping notes, maintaining ToDo lists, doing project planning
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

;; Install or load packages
(el-get 'sync el-get-packages)

;; Configure packages
(configure-packages)

;; Load key bindings
(load-key-bindings)
