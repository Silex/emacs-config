;; M-x xmp for the win!

(use-package rinari
  :commands inf-ruby)

(use-package ruby-mode
  :mode (;; Rake
         ("\\.rake\\'" . ruby-mode)
         ("Rakefile" . ruby-mode)

         ;; Thor
         ("\\.thor\\'" . ruby-mode)

         ;; ERB
         ("\\.erb\\'" . ruby-mode)

         ;; Gemfile
         ("Gemfile" . ruby-mode)
         ("\\.gemspec\\'" . ruby-mode))

  :init
  (progn
    ;; Don't automatically insert encoding
    (setq ruby-insert-encoding-magic-comment nil)

    (setq ruby-use-encoding-map nil))

  :config
  (progn
    (use-package ruby-compilation)
    (use-package rcodetools)
    (use-package rinari)
    (use-package robe)
    (use-package evil-rails)))
