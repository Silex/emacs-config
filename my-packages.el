;; Setup variables
(setq package-enable-at-startup nil)
(setq package-user-dir (expand-file-name "elpa" config-directory))
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.milkbox.net/packages/")
                         ("org" . "http://orgmode.org/elpa/")))

;; Make sure directory exists and initialize package.el
(make-directory package-user-dir t)
(package-initialize)

;; Install package if needed
(setq my-packages '(ace-jump-mode
                    auto-complete
                    backup-each-save
                    bm
                    cmake-mode
                    coffee-mode
                    color-theme-monokai
                    css-eldoc
                    dash
                    dired+
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
                    git-messenger
                    google-maps
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
                    yasnippet))

(when (member nil (mapcar 'package-installed-p my-packages))
  (package-refresh-contents)
  (dolist (p my-packages)
    (unless (package-installed-p p)
      (package-install p))))

(provide 'my-packages)
