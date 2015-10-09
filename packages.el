;; Setup
(setq package-enable-at-startup nil)
(package-initialize)
(add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/") t)
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/") t)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t)

(setq user-packages '(ace-jump-mode
                      ace-jump-zap
                      ag
                      aggressive-indent
                      back-button
                      backup-each-save
                      bm
                      browse-kill-ring
                      chess
                      chronos
                      cmake-mode
                      coffee-mode
                      company
                      company-emoji
                      color-theme-monokai
                      css-eldoc
                      dash
                      dired-filter
                      dired-ranger
                      dired-subtree
                      dirtree
                      dockerfile-mode
                      docker-tramp
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
                      flx-ido
                      fullscreen-mode
                      gh
                      gist
                      gitconfig-mode
                      git-messenger
                      git-timemachine
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
                      howdoi
                      htmlize
                      hookify
                      ibuffer-tramp
                      ido-occur
                      ido-ubiquitous
                      ido-vertical-mode
                      idomenu
                      impatient-mode
                      indent-guide
                      js2-mode
                      json-mode
                      key-chord
                      less-css-mode
                      litable
                      magit
                      macrostep
                      make-color
                      markdown-mode
                      miniedit
                      minimap
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
                      rainbow-mode
                      readline-complete
                      request
                      restclient
                      robe
                      rails-log-mode
                      region-bindings-mode
                      rtags
                      rubocop
                      s
                      sass-mode
                      scss-mode
                      shell-pop
                      smartparens
                      smex
                      sr-speedbar
                      sunshine
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
