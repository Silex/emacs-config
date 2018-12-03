(use-package smartparens
  :config
  (require 'smartparens-config)
  (define-key smartparens-mode-map (kbd "C-M-f") 'sp-forward-sexp)
  (define-key smartparens-mode-map (kbd "C-M-b") 'sp-backward-sexp)

  (define-key smartparens-mode-map (kbd "C-M-d") 'sp-down-sexp)
  (define-key smartparens-mode-map (kbd "C-M-a") 'sp-backward-down-sexp)
  (define-key smartparens-mode-map (kbd "C-S-a") 'sp-beginning-of-sexp)
  (define-key smartparens-mode-map (kbd "C-S-d") 'sp-end-of-sexp)

  (define-key smartparens-mode-map (kbd "C-M-e") 'sp-up-sexp)
  ;;(define-key emacs-lisp-mode-map (kbd ")") 'sp-up-sexp)
  (define-key smartparens-mode-map (kbd "C-M-u") 'sp-backward-up-sexp)
  (define-key smartparens-mode-map (kbd "C-M-t") 'sp-transpose-sexp)

  (define-key smartparens-mode-map (kbd "C-M-n") 'sp-next-sexp)
  (define-key smartparens-mode-map (kbd "C-M-p") 'sp-previous-sexp)

  (define-key smartparens-mode-map (kbd "C-M-k") 'sp-kill-sexp)
  (define-key smartparens-mode-map (kbd "C-M-w") 'sp-copy-sexp)

  (define-key smartparens-mode-map (kbd "M-<delete>") 'sp-unwrap-sexp)
  (define-key smartparens-mode-map (kbd "M-<backspace>") 'sp-backward-unwrap-sexp)

  (define-key smartparens-mode-map (kbd "C-(") 'sp-forward-slurp-sexp)
  (define-key smartparens-mode-map (kbd "C-)") 'sp-forward-barf-sexp)
  (define-key smartparens-mode-map (kbd "C-{") 'sp-backward-slurp-sexp)
  (define-key smartparens-mode-map (kbd "C-}") 'sp-backward-barf-sexp)

  ;; (define-key smartparens-mode-map (kbd "M-D") 'sp-splice-sexp)
  ;; (define-key smartparens-mode-map (kbd "C-M-<delete>") 'sp-splice-sexp-killing-forward)
  ;; (define-key smartparens-mode-map (kbd "C-M-<backspace>") 'sp-splice-sexp-killing-backward)
  ;; (define-key smartparens-mode-map (kbd "C-S-<backspace>") 'sp-splice-sexp-killing-around)

  ;; (define-key smartparens-mode-map (kbd "C-]") 'sp-select-next-thing-exchange)
  ;; (define-key smartparens-mode-map (kbd "C-<left_bracket>") 'sp-select-previous-thing)
  ;; (define-key smartparens-mode-map (kbd "C-M-]") 'sp-select-next-thing)

  (define-key smartparens-mode-map (kbd "M-F") 'sp-forward-symbol)
  (define-key smartparens-mode-map (kbd "M-B") 'sp-backward-symbol)

  ;; (define-key smartparens-mode-map (kbd "H-t") 'sp-prefix-tag-object)
  ;; (define-key smartparens-mode-map (kbd "H-p") 'sp-prefix-pair-object)
  ;; (define-key smartparens-mode-map (kbd "H-s c") 'sp-convolute-sexp)
  ;; (define-key smartparens-mode-map (kbd "H-s a") 'sp-absorb-sexp)
  ;; (define-key smartparens-mode-map (kbd "H-s e") 'sp-emit-sexp)
  ;; (define-key smartparens-mode-map (kbd "H-s p") 'sp-add-to-previous-sexp)
  ;; (define-key smartparens-mode-map (kbd "H-s n") 'sp-add-to-next-sexp)
  ;; (define-key smartparens-mode-map (kbd "H-s j") 'sp-join-sexp)
  ;; (define-key smartparens-mode-map (kbd "H-s s") 'sp-split-sexp)

  ;; html-mode
  (sp-with-modes '(html-mode sgml-mode)
    (sp-local-pair "<" ">"))
  (smartparens-global-mode t)
  (show-smartparens-global-mode))
