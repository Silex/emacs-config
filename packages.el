;; Setup variables
(setq package-enable-at-startup nil)
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.milkbox.net/packages/")
                         ("org" . "http://orgmode.org/elpa/")))
(package-initialize)

(setq user-packages '(ace-jump-mode
                      auto-complete
                      backup-each-save
                      bm
                      cmake-mode
                      coffee-mode
                      company
                      color-theme-monokai
                      css-eldoc
                      dash
                      dired+
                      dired-filter
                      edit-server
                      eimp
                      evil
                      evil-leader
                      evil-numbers
                      evil-visualstar
                      exec-path-from-shell
                      expand-region
                      fic-mode
                      fill-column-indicator
                      fiplr
                      flx
                      fullscreen-mode
                      fuzzy
                      gh
                      gist
                      gitconfig-mode
                      git-messenger
                      google-maps
                      google-translate
                      goto-last-change
                      grizzl
                      haml-mode
                      help-fns+
                      htmlize
                      ido-ubiquitous
                      ido-vertical-mode
                      idomenu
                      js2-mode
                      json-mode
                      less-css-mode
                      litable
                      magit
                      markdown-mode
                      minimap
                      multi-term
                      multi-web-mode
                      multiple-cursors
                      org
                      package
                      package+
                      pcre2el
                      phi-search
                      php-eldoc
                      php-mode
                      popup
                      projectile
                      rainbow-mode
                      readline-complete
                      request
                      robe
                      rinari
                      rsense
                      rubocop
                      rvm
                      s
                      sass-mode
                      scss-mode
                      shell-pop
                      smex
                      smooth-scrolling
                      sr-speedbar
                      switch-window
                      tabbar
                      tabulated-list
                      textile-mode
                      undo-tree
                      use-package
                      vimrc-mode
                      yaml-mode
                      yasnippet
                      ztree))

(defun install-user-packages ()
  "Install packages in `user-packages' if needed."
  (when (member nil (mapcar 'package-installed-p user-packages))
    (package-refresh-contents)
    (dolist (p user-packages)
      (unless (package-installed-p p)
        (package-install p)))))

(provide 'packages)
