(use-package atomic-chrome
  :demand t
  :custom
  (atomic-chrome-url-major-mode-alist '(("github\\.com" . gfm-mode)
                                        ("redmine" . textile-mode)))
  :config
  (atomic-chrome-start-server))
