(require 'config)

;; Install packages
(require 'packages)
(install-user-packages)

;; Configure packages
(setq use-package-verbose t)
(require 'use-package)
(configure-packages)

;; Load key bindings
(load-key-bindings)
