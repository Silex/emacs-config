;; Inspired from https://github.com/magnars/.emacs.d/blob/master/appearance.el
(defun maximize-frame ()
  (interactive)
  (set-frame-parameter nil 'fullscreen 'maximized))

(defun restore-frame ()
  (interactive)
  (set-frame-parameter nil 'fullscreen nil))

(use-package monokai-theme
  :ensure t
  :defer t
  :custom
  (monokai-yellow "orange")
  (monokai-blue "#A6E22E")
  (monokai-cyan "#A6E22E"))

(use-package zenburn-theme
  :ensure t
  :defer t)

;; Scrollbar
(use-package scroll-bar
  :custom
  (scroll-bar-mode-explicit t)
  (scroll-bar-mode 'right)
  :config
  (scroll-bar-mode))

;; Disable startup screen
(setq inhibit-startup-screen t)

;; Disable toolbar
(tool-bar-mode -1)

;; Start maximized
(maximize-frame)

;; Load theme
(load-theme 'silex-monokai t)

;; Pretty modeline
(use-package airline-themes
  :ensure t
  :config
  (load-theme 'airline-cool t))
