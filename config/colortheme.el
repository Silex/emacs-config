;; Colortheme
;(color-theme-zenburn)

(color-theme-monokai)

;; Sweyla themes
(defun sweyla878306 ()
  "Theme generated by Sweyla: http://themes.sweyla.com/seed/878306/"
  (interactive)
  (color-theme-install
   '(sweyla878306
     ((background-color . "#111111")
      (foreground-color . "#FFFFFF")
      (background-mode . dark)
      (border-color . "#323232")
      (cursor-color . "#FFFFFF")
      (mouse-color . "#323232"))
     (mode-line ((t (:foreground "#FFFFFF" :background "#323232"))))
     (region ((t (:background "#323232"))))

     (font-lock-comment-face ((t (:foreground "#8600B2"))))
     (font-lock-constant-face ((t (:foreground "#C571F4"))))
     (font-lock-builtin-face ((t (:foreground "#9300F1"))))
     (font-lock-function-name-face ((t (:foreground "#943872"))))
     (font-lock-variable-name-face ((t (:foreground "#FFE037"))))
     (font-lock-keyword-face ((t (:foreground "#A6884F"))))
     (font-lock-string-face ((t (:foreground "#536ACB"))))
     (font-lock-doc-string-face ((t (:foreground "#536ACB"))))
     (font-lock-type-face ((t (:foreground "#BAB3FF"))))
     )))

(defun sweyla880321 ()
  "Theme generated by Sweyla: http://themes.sweyla.com/seed/880321/"
  (interactive)
  (color-theme-install
   '(sweyla880321
     ((background-color . "#333333")
      (foreground-color . "#FFFFFF")
      (background-mode . dark)
      (border-color . "#323232")
      (cursor-color . "#FFFFFF")
      (mouse-color . "#323232"))
     (mode-line ((t (:foreground "#FFFFFF" :background "#323232"))))
     (region ((t (:background "#555555"))))

     (font-lock-comment-face ((t (:foreground "#B2740C"))))
     (font-lock-constant-face ((t (:foreground "#FBFF00"))))
     (font-lock-builtin-face ((t (:foreground "#D49900"))))
     (font-lock-function-name-face ((t (:foreground "#D6DF08"))))
     (font-lock-variable-name-face ((t (:foreground "#679100"))))
     (font-lock-keyword-face ((t (:foreground "#A5A193"))))
     (font-lock-string-face ((t (:foreground "#9FAC5D"))))
     (font-lock-doc-string-face ((t (:foreground "#9FAC5D"))))
     (font-lock-type-face ((t (:foreground "#FFFF1A"))))
     )))

(defun color-theme-inkpot()
  "Color theme based on the Inkpot theme. Ported and tweaked by Per Vognsen."
  (interactive)
  (color-theme-install
   '(color-theme-inkpot
     ((foreground-color . "#cfbfad")
      (background-color . "#1e1e27")
      (border-color . "#3e3e5e")
      (cursor-color . "#404040")
      (background-mode . dark))
     (region ((t (:background "#404040"))))
     (highlight ((t (:background "#404040"))))
     (fringe ((t (:background "#16161b"))))
     (show-paren-match-face ((t (:background "#606060"))))
     (isearch ((t (:bold t :foreground "#303030" :background "#cd8b60"))))
     (modeline ((t (:bold t :foreground "#b9b9b9" :background "#3e3e5e"))))
     (modeline-inactive ((t (:foreground "#708090" :background "#3e3e5e"))))
     (modeline-buffer-id ((t (:bold t :foreground "#b9b9b9" :background "#3e3e5e"))))
     (minibuffer-prompt ((t (:bold t :foreground "#708090"))))
     (font-lock-builtin-face ((t (:foreground "#c080d0"))))
     (font-lock-comment-face ((t (:foreground "#708090")))) ; original inkpot: #cd8b00
     (font-lock-constant-face ((t (:foreground "#506dbd"))))
     (font-lock-doc-face ((t (:foreground "#cd8b00"))))
     (font-lock-function-name-face ((t (:foreground "#87cefa"))))
     (font-lock-keyword-face ((t (:bold t :foreground "#c080d0"))))
     (font-lock-preprocessor-face ((t (:foreground "309090"))))
     (font-lock-reference-face ((t (:bold t :foreground "#808bed"))))
     (font-lock-string-face ((t (:foreground "#ffcd8b" :background "#404040"))))
     (font-lock-type-face ((t (:foreground "#ff8bff"))))
     (font-lock-variable-name-face ((t nil)))
     (font-lock-warning-face ((t (:foreground "#ffffff" :background "#ff0000")))))))
