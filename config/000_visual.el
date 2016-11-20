;; Inspired from https://github.com/magnars/.emacs.d/blob/master/appearance.el
(defun maximize-frame ()
  (interactive)
  (set-frame-parameter nil 'fullscreen 'maximized))

(defun restore-frame ()
  (interactive)
  (set-frame-parameter nil 'fullscreen nil))

;; Start maximized
(maximize-frame)

(use-package monokai-theme
  :ensure t
  :defer t
  :init
  (setq monokai-yellow "orange")
  (setq monokai-blue "#A6E22E")
  (setq monokai-cyan "#A6E22E"))

(use-package zenburn-theme
  :ensure t
  :defer t)

(use-package color-theme
  :ensure t
  :defer t)

(defun color-theme-monokai ()
  (interactive)
  (color-theme-install
   '(color-theme-monokai
     ;; Frame Parameters
     ((background-color . "#272822")
      (foreground-color . "#F8F8F2")
      (cursor-color . "#F8F8F0"))
     ;; Main
     (font-lock-builtin-face ((t (:foreground "#A6E22A"))))
     (font-lock-comment-face ((t (:foreground "#75715E"))))
     (font-lock-constant-face ((t (:foreground "#AE81FF"))))
     (font-lock-doc-string-face ((t (:foreground "#E6DB74"))))
     (font-lock-function-name-face ((t (:foreground "#A6E22E"))))
     (font-lock-keyword-face ((t (:foreground "#F92672"))))
     (font-lock-string-face ((t (:foreground "#E6DB74"))))
     (font-lock-type-face ((t (:foreground "#89BDFF"))))
     (font-lock-variable-name-face ((t (:foreground "#F92672"))))
     (font-lock-warning-face ((t (:bold t :foreground "#FD5FF1"))))
     ;; Main - #2
     (hl-line ((t (:background "#141411"))))
     (minibuffer-prompt ((t (:foreground "#75715E"))))
     (modeline ((t (:background "#595959" :foreground "#E6E6E6"))))
     (region ((t (:background "#383830"))))
     (show-paren-match-face ((t (:background "#383830"))))
     ;; CUA
     (cua-rectangle ((t (:background "#141411"))))
     ;; IDO
     (ido-first-match ((t (:foreground "#AE81FF"))))
     (ido-only-match ((t (:foreground "#A6E22A"))))
     (ido-subdir ((t (:foreground "#89BDFF"))))
     ;; Misc
     (yas/field-highlight-face ((t (:background "#383830")))))))

;; Chosen colortheme
(color-theme-monokai)

;; Disable startup screen
(setq inhibit-startup-screen t)

;; Disable toolbar
(tool-bar-mode -1)

;; Scrollbar
(setq scroll-bar-mode-explicit t)
(set-scroll-bar-mode 'right)
(scroll-bar-mode)
