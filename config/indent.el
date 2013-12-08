;; Never use real tabs
(setq-default indent-tabs-mode nil)

;; Display tabs as two spaces
(setq-default tab-width 2)

;; Configure other modes tab-width
(mapc (lambda(sym)(set-default sym tab-width)) '(css-indent-offset sh-basic-offset coffee-tab-width standard-indent))
