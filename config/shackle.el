(use-package shackle
  :defer t
  :init
  (setq shackle-rules '(("\\*magit.*" :regexp t)
                        (t :select t :popup t))))

(shackle-mode)
