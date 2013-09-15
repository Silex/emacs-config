(use-package newsticker
  :commands (newsticker-start
             newsticker-treeview)
  :config
  (progn
    ;; W3M HTML renderer isn't essential, but it's pretty useful.
    ;(use-package w3m
    ;  :commands w3m-region)
    ;(setq newsticker-html-renderer 'w3m-region)

    ;; We want our feeds pulled every 10 minutes.
    (setq newsticker-retrieval-interval 600)

    ;; Setup the feeds. We'll have a look at these in just a second.
    (setq newsticker-url-list-defaults nil)
    (setq newsticker-url-list (google-reader-to-newsticker "/Users/silex/Downloads/philippe.vaucher@gmail.com-takeout/Reader/subscriptions.xml"))))
