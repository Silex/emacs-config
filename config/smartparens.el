(use-package smartparens
  :defer 1
  :config
  (require 'smartparens-config)
  (define-key sp-keymap (kbd "C-M-f") 'sp-forward-sexp)
  (define-key sp-keymap (kbd "C-M-b") 'sp-backward-sexp)

  (define-key sp-keymap (kbd "C-M-d") 'sp-down-sexp)
  (define-key sp-keymap (kbd "C-M-a") 'sp-backward-down-sexp)
  (define-key sp-keymap (kbd "C-S-a") 'sp-beginning-of-sexp)
  (define-key sp-keymap (kbd "C-S-d") 'sp-end-of-sexp)

  (define-key sp-keymap (kbd "C-M-e") 'sp-up-sexp)
  ;;(define-key emacs-lisp-mode-map (kbd ")") 'sp-up-sexp)
  (define-key sp-keymap (kbd "C-M-u") 'sp-backward-up-sexp)
  (define-key sp-keymap (kbd "C-M-t") 'sp-transpose-sexp)

  (define-key sp-keymap (kbd "C-M-n") 'sp-next-sexp)
  (define-key sp-keymap (kbd "C-M-p") 'sp-previous-sexp)

  (define-key sp-keymap (kbd "C-M-k") 'sp-kill-sexp)
  (define-key sp-keymap (kbd "C-M-w") 'sp-copy-sexp)

  (define-key sp-keymap (kbd "M-<delete>") 'sp-unwrap-sexp)
  (define-key sp-keymap (kbd "M-<backspace>") 'sp-backward-unwrap-sexp)

  (define-key sp-keymap (kbd "C-(") 'sp-forward-slurp-sexp)
  (define-key sp-keymap (kbd "C-)") 'sp-forward-barf-sexp)
  (define-key sp-keymap (kbd "C-{") 'sp-backward-slurp-sexp)
  (define-key sp-keymap (kbd "C-}") 'sp-backward-barf-sexp)

  ;; (define-key sp-keymap (kbd "M-D") 'sp-splice-sexp)
  ;; (define-key sp-keymap (kbd "C-M-<delete>") 'sp-splice-sexp-killing-forward)
  ;; (define-key sp-keymap (kbd "C-M-<backspace>") 'sp-splice-sexp-killing-backward)
  ;; (define-key sp-keymap (kbd "C-S-<backspace>") 'sp-splice-sexp-killing-around)

  ;; (define-key sp-keymap (kbd "C-]") 'sp-select-next-thing-exchange)
  ;; (define-key sp-keymap (kbd "C-<left_bracket>") 'sp-select-previous-thing)
  ;; (define-key sp-keymap (kbd "C-M-]") 'sp-select-next-thing)

  (define-key sp-keymap (kbd "M-F") 'sp-forward-symbol)
  (define-key sp-keymap (kbd "M-B") 'sp-backward-symbol)

  ;; (define-key sp-keymap (kbd "H-t") 'sp-prefix-tag-object)
  ;; (define-key sp-keymap (kbd "H-p") 'sp-prefix-pair-object)
  ;; (define-key sp-keymap (kbd "H-s c") 'sp-convolute-sexp)
  ;; (define-key sp-keymap (kbd "H-s a") 'sp-absorb-sexp)
  ;; (define-key sp-keymap (kbd "H-s e") 'sp-emit-sexp)
  ;; (define-key sp-keymap (kbd "H-s p") 'sp-add-to-previous-sexp)
  ;; (define-key sp-keymap (kbd "H-s n") 'sp-add-to-next-sexp)
  ;; (define-key sp-keymap (kbd "H-s j") 'sp-join-sexp)
  ;; (define-key sp-keymap (kbd "H-s s") 'sp-split-sexp)

  ;; html-mode
  (sp-with-modes '(html-mode sgml-mode)
    (sp-local-pair "<" ">"))
  (smartparens-global-mode t)
  (show-smartparens-global-mode))
