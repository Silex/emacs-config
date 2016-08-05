(require 'config)

;; Install packages
(require 'packages)
(install-user-packages)

;; Configure packages
(setq use-package-verbose t)
(setq use-package-idle-interval 0.5)
(require 'use-package)
(configure-packages)
