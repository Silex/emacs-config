;; Setup
(setq package-enable-at-startup nil)
(package-initialize)
(add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/") t)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t)

(setq user-packages '(ace-jump-mode
                      ace-jump-zap
                      ag
                      aggressive-indent
                      back-button
                      backup-each-save
                      beacon
                      bm
                      browse-kill-ring
                      camcorder
                      chess
                      chronos
                      cmake-mode
                      coffee-mode
                      color-theme-monokai
                      company
                      company-emoji
                      crontab-mode
                      css-eldoc
                      dash
                      dired-filter
                      dired-quick-sort
                      dired-ranger
                      dired-subtree
                      dirtree
                      docker
                      docker-tramp
                      dockerfile-mode
                      edit-server
                      eimp
                      elmacro
                      emr
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
                      fireplace
                      flx-ido
                      fullframe
                      fullscreen-mode
                      gh
                      gist
                      git-messenger
                      git-timemachine
                      gitconfig-mode
                      github-browse-file
                      github-clone
                      go-mode
                      google-maps
                      google-this
                      google-translate
                      goto-last-change
                      grizzl
                      guide-key
                      haml-mode
                      helm
                      helm-swoop
                      help-fns+
                      hookify
                      howdoi
                      htmlize
                      ibuffer-tramp
                      ido-grid-mode
                      ido-occur
                      ido-ubiquitous
                      idomenu
                      impatient-mode
                      indent-guide
                      js2-mode
                      json-mode
                      key-chord
                      less-css-mode
                      litable
                      macrostep
                      magit
                      magit-rockstar
                      make-color
                      markdown-mode
                      miniedit
                      minimap
                      move-dup
                      multi-term
                      multiple-cursors
                      navorski
                      neotree
                      org
                      ox-impress-js
                      ox-ioslide
                      package
                      package+
                      package-utils
                      palette
                      paradox
                      paredit
                      pcre2el
                      phi-search
                      php-eldoc
                      php-mode
                      pkg-info
                      powerline
                      pretty-symbols
                      projectile
                      projectile-rails
                      rails-log-mode
                      rainbow-mode
                      readline-complete
                      refine
                      region-bindings-mode
                      request
                      restclient
                      robe
                      rtags
                      rubocop
                      s
                      sass-mode
                      scss-mode
                      shell-pop
                      smartparens
                      smex
                      sr-speedbar
                      suggest
                      sunshine
                      switch-window
                      symon
                      tabbar
                      tagedit
                      textile-mode
                      undo-tree
                      use-package
                      vimrc-mode
                      visual-regexp-steroids
                      web-mode
                      weechat
                      wgrep
                      wgrep-ag
                      whitespace-cleanup-mode
                      yaml-mode
                      yari
                      yasnippet
                      ztree))

(defun install-user-packages (&optional no-fetch)
  "Install packages in `user-packages' if needed."
  (interactive "P")
  (when (member nil (mapcar 'package-installed-p user-packages))
    (unless no-fetch
      (with-timeout (15 (message "Timeout in package-refresh-contents"))
        (package-refresh-contents)))
    (dolist (p user-packages)
      (unless (package-installed-p p)
        (package-install p)))))

(provide 'packages)
