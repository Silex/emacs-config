(use-package grep
  :defer t
  :config
  (dolist (type '(jpg jpeg png gif           ; images
                  mpg mjpg avi               ; videos
                  rar zip 7z tar tgz gz bz)) ; archives
    (add-to-list 'grep-find-ignored-files (concat "*." (symbol-name type)))))

(use-package wgrep :ensure t :defer t
  :custom (wgrep-enable-key "\C-x\C-q"))

(use-package wgrep-ag :ensure t :defer t)
