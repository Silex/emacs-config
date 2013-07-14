;; Rake
(setq auto-mode-alist (cons '("\\.rake" . ruby-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("Rakefile" . ruby-mode) auto-mode-alist))

;; Gemfile
(setq auto-mode-alist (cons '("Gemfile" . ruby-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.gemspec" . ruby-mode) auto-mode-alist))

;; Don't automatically insert encoding
(setq ruby-insert-encoding-magic-comment nil)

(eval-after-load 'ruby-mode
  '(progn
     (ignore-errors (require 'ruby-compilation))
     (ignore-errors (require 'rcodetools))
     (ignore-errors (require 'rinari))
     (ignore-errors (require 'evil-rails))

     (setq ruby-use-encoding-map nil)
     (add-hook 'ruby-mode-hook 'inf-ruby-setup-keybindings)
     (define-key ruby-mode-map (kbd "RET") 'reindent-then-newline-and-indent)))
