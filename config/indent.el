;; Never use real tabs
(setq-default indent-tabs-mode nil)

;; Display tabs as two spaces
(setq-default tab-width 2)

;; Configure other modes tab-width
(--each '(css-indent-offset sh-basic-offset sh-indentation coffee-tab-width js-indent-level js2-basic-offset standard-indent)
  (set-default it tab-width))
