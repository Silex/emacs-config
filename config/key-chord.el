(use-package key-chord
  :init
  (key-chord-define-global "jj" 'ace-jump-word-mode)
  (key-chord-define-global "jl" 'ace-jump-line-mode)
  (key-chord-define-global "jk" 'ace-jump-char-mode)
  (key-chord-define-global "BB" 'ibuffer)
  (key-chord-mode +1))
