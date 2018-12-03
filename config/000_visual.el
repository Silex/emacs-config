;; Inspired from https://github.com/magnars/.emacs.d/blob/master/appearance.el
(defun maximize-frame ()
  (interactive)
  (set-frame-parameter nil 'fullscreen 'maximized))

(defun restore-frame ()
  (interactive)
  (set-frame-parameter nil 'fullscreen nil))

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
  :custom
  (airline-cursor-colors nil)
  :config
  (load-theme 'airline-cool t))
