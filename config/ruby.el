;; M-x xmp for the win!
;; rvm rvmrc create ruby@gemset --ruby-version

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
  ;; Don't automatically insert encoding
  (setq ruby-insert-encoding-magic-comment nil)
  (setq ruby-use-encoding-map nil)

  :config
  (use-package ruby-compilation)
  (use-package rcodetools)
  (use-package rinari)
  (use-package evil-rails))
