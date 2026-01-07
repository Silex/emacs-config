;; To support emoji
;; sudo apt install fonts-noto-color-emoji

;; Inspired from https://github.com/magnars/.emacs.d/blob/master/appearance.el
(defun maximize-frame ()
  (interactive)
  (set-frame-parameter nil 'fullscreen 'maximized))

(defun restore-frame ()
  (interactive)
  (set-frame-parameter nil 'fullscreen nil))

;; Scrollbar
(use-package scroll-bar
  :demand t
  :straight nil
  :custom
  (scroll-bar-mode-explicit t)
  (scroll-bar-mode 'right)
  :config
  (scroll-bar-mode))

;; Disable startup screen
(setq inhibit-startup-screen t)

;; Disable bars
(tool-bar-mode -1)
(menu-bar-mode -1)

;; Start maximized
(maximize-frame)

;; Load theme
(load-theme 'silex-monokai t)

;; Pretty modeline
(use-package airline-themes
  :demand t
  :custom
  (airline-cursor-colors nil)
  :config
  (load-theme 'airline-cool t))

;; Never lose your cursor again
(use-package beacon
  :demand t
  :config
  (beacon-mode))

;; Color pickers
(use-package zenity-color-picker)

(use-package make-color
  :custom
  (make-color-use-whole-sample t))

;; Color helpers
(use-package rainbow-mode
  :custom
  (rainbow-html-colors-major-mode-list '(css-mode
                                         html-mode
                                         less-css-mode
                                         nxml-mode
                                         php-mode
                                         sass-mode
                                         scss-mode
                                         web-mode
                                         xml-mode)))

;; Text scaling
(use-package face-remap
  :bind (("C-+" . text-scale-increase)
         ("C--" . text-scale-decrease)
         ("<C-mouse-4>" . text-scale-increase)
         ("<C-mouse-5>" . text-scale-decrease)))

;; System monitor
(use-package symon
  :custom
  (symon-delay 15)
  :config
  (symon-mode))

;; Column guide and minimap
(use-package fill-column-indicator)
(use-package minimap)

;; Tab bar UI
(use-package tabbar)
