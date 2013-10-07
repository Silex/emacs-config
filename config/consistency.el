(require 'ehelp)

;; Use electric-* instead of describe-* so we can press 'q'
(substitute-key-definition 'apropos           'electric-apropos           help-map)
(substitute-key-definition 'command-apropos   'electric-command-apropos   help-map)
(substitute-key-definition 'view-lossage      'electric-view-lossage      help-map)
(substitute-key-definition 'describe-key      'electric-describe-key      help-map)
(substitute-key-definition 'describe-mode     'electric-describe-mode     help-map)
(substitute-key-definition 'describe-syntax   'electric-describe-syntax   help-map)
(substitute-key-definition 'describe-function 'electric-describe-function help-map)
(substitute-key-definition 'describe-variable 'electric-describe-variable help-map)
(substitute-key-definition 'describe-bindings 'electric-describe-bindings help-map)

;; Make it so man pages have focus when I request them
(setq Man-notify-method 'aggressive)

;; Give focus to describe-file
(defadvice describe-file (around focus activate)
  ad-do-it
  (other-window 1))
