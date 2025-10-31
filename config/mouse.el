(setq mouse-wheel-scroll-amount '(0.01))
;(setq mouse-wheel-scroll-amount '(1 ((shift) . 1))) ;; one line at a time
;(setq mouse-wheel-progressive-speed nil) ;; don't accelerate scrolling
;(setq mouse-wheel-follow-mouse 't) ;; scroll window under mouse

(setq mouse-drag-copy-region nil)
(setq mouse-yank-at-point t)
(setq select-enable-clipboard t)

(use-package emacs
  :straight nil
  :bind
  ("<mouse-7>" . scroll-left)
  ("<mouse-6>" . scroll-right))
