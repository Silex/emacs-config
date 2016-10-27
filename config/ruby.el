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
         ("/Rakefile\\'" . ruby-mode)

         ;; Capistrano
         ("/Capfile\\'" . ruby-mode)

         ;; Thor
         ("\\.thor\\'" . ruby-mode)

         ;; ERB
         ("\\.erb\\'" . ruby-mode)

         ;; Gemfile
         ("/Gemfile\\'" . ruby-mode)
         ("\\.gemspec\\'" . ruby-mode))

  :init
  ;; Don't automatically insert encoding
  (setq ruby-insert-encoding-magic-comment nil)
  (setq ruby-use-encoding-map nil))

(use-package robe
  :ensure t
  :after ruby-mode
  :init
  (add-hook 'ruby-mode-hook 'robe-mode)
  :config
  (add-to-list 'company-backends 'company-robe))

(use-package rspec-mode
  :ensure t
  :after ruby-mode)
