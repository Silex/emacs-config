(use-package auto-complete
  :disabled t
  :config
  (progn
    (global-auto-complete-mode t)
    (add-to-list 'ac-modes 'coffee-mode)
    (add-to-list 'ac-modes 'haml-mode)))

(use-package auto-complete-clang
  :disabled t)

(use-package auto-complete-ruby
  :disabled t)
