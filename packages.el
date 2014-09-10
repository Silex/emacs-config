;; Setup variables
(setq package-enable-at-startup nil)
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.milkbox.net/packages/")
                         ("org" . "http://orgmode.org/elpa/")))
(package-initialize)

(setq user-packages '(ace-jump-mode
                      ag
                      async
                      backup-each-save
                      bm
                      browse-kill-ring
                      chess
                      cmake-mode
                      coffee-mode
                      company
                      color-theme-monokai
                      css-eldoc
                      dash
                      dired+
                      dired-filter
                      dired-ranger
                      dired-subtree
                      dirtree
                      edit-server
                      eimp
                      elmacro
                      evil
                      evil-leader
                      evil-numbers
                      evil-surround
                      evil-visualstar
                      exec-path-from-shell
                      expand-region
                      f
                      feature-mode
                      fic-mode
                      fill-column-indicator
                      fiplr
                      flx
                      fullscreen-mode
                      gh
                      gist
                      gitconfig-mode
                      git-messenger
                      git-timemachine
                      github-clone
                      google-maps
                      google-this
                      google-translate
                      goto-last-change
                      grizzl
                      haml-mode
                      helm
                      help-fns+
                      htmlize
                      hookify
                      ibuffer-tramp
                      ido-ubiquitous
                      ido-vertical-mode
                      idomenu
                      js2-mode
                      json-mode
                      key-chord
                      less-css-mode
                      litable
                      magit
                      make-color
                      markdown-mode
                      minimap
                      multi-term
                      multiple-cursors
                      neotree
                      org
                      package
                      package+
                      package-utils
                      palette
                      paredit
                      pcre2el
                      phi-search
                      php-eldoc
                      php-mode
                      pkg-info
                      pretty-symbols
                      projectile
                      projectile-rails
                      rainbow-mode
                      readline-complete
                      request
                      robe
                      rails-log-mode
                      rtags
                      rubocop
                      rvm
                      s
                      sass-mode
                      scss-mode
                      shell-pop
                      smex
                      sr-speedbar
                      switch-window
                      tabbar
                      tagedit
                      textile-mode
                      undo-tree
                      use-package
                      vimrc-mode
                      visual-regexp-steroids
                      web-mode
                      weechat
                      ws-butler
                      yaml-mode
                      yari
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
