(defun seeing-is-believing ()
  "Replace the current region (or the whole buffer, if none) with the output
of seeing_is_believing."
  (interactive)
  (let ((beg (if (region-active-p) (region-beginning) (point-min)))
        (end (if (region-active-p) (region-end) (point-max))))
    (shell-command-on-region beg end "seeing_is_believing" nil 'replace)))

(use-package ruby-mode
  :ensure nil
  :custom
  ;; Don't automatically insert encoding
  (ruby-insert-encoding-magic-comment nil)
  (ruby-use-encoding-map nil))

(use-package enh-ruby-mode
  :mode ("\\(?:\\.rb\\|ru\\|rake\\|thor\\|jbuilder\\|gemspec\\|podspec\\|/\\(?:Gem\\|Rake\\|Cap\\|Thor\\|Vagrant\\|Guard\\|Pod\\)file\\)\\'" . enh-ruby-mode)
  :custom-face
  (enh-ruby-op-face ((t (:inherit (font-lock-keyword-face)))))
  :init
  (add-to-list 'interpreter-mode-alist '("ruby" . enh-ruby-mode)))

(use-package robe
  :disabled t
  :after enh-ruby-mode
  :init
  (add-hook 'enh-ruby-mode-hook 'robe-mode)
  :config
  (add-to-list 'company-backends 'company-robe))

(use-package rspec-mode
  :disabled t
  :after enh-ruby-mode)

(use-package rubocop)
