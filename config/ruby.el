(defun seeing-is-believing ()
  "Replace the current region (or the whole buffer, if none) with the output
of seeing_is_believing."
  (interactive)
  (let ((beg (if (region-active-p) (region-beginning) (point-min)))
        (end (if (region-active-p) (region-end) (point-max))))
    (shell-command-on-region beg end "seeing_is_believing" nil 'replace)))

(use-package ruby-mode
  :mode (;; Rake
         ("\\.rake\\'" . ruby-mode)
         ("Rakefile" . ruby-mode)

         ;; Capistrano
         ("Capfile" . ruby-mode)

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

  ;; robe-mode
  (add-hook 'ruby-mode-hook 'robe-mode)

  :config
  (use-package ruby-compilation)
  (use-package rcodetools))

(use-package robe
  :defer t
  :config
  (push 'company-robe company-backends))

(use-package rspec-mode
  :defer t)
