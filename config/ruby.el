;; Rake
(add-to-list 'auto-mode-alist '("\\.rake\\'" . ruby-mode))
(add-to-list 'auto-mode-alist '("Rakefile" . ruby-mode))

;; Gemfile
(add-to-list 'auto-mode-alist '("Gemfile" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.gemspec\\'" . ruby-mode))

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
