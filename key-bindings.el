;; Switch windows using Super + Arrow
(windmove-default-keybindings 'super)

;; Smex
(global-set-key (kbd "M-x") 'smex) ; Old m-x is execute-extended-command

;; expand-region
;;(global-set-key (kbd "C-e") 'er/expand-region)
;;(eval-after-load 'evil
;;  '(progn
;;     (define-key evil-normal-state-map (kbd "C-e") 'er/expand-region)
;;     (define-key evil-visual-state-map (kbd "C-e") 'er/expand-region)))

;; Undo kill buffer (like in chrome/firefox for tabs)
(global-set-key (kbd "C-S-t") 'undo-kill-buffer)

;; Switch-window
(global-set-key (kbd "C-x o") 'switch-window)

;; Magit
(global-set-key (kbd "C-x g") 'magit-status)

;; Grep/Occur/Compile
(global-set-key (kbd "C-S-<up>") 'previous-error)
(global-set-key (kbd "C-S-<down>") 'next-error)

;; Save with one key
(global-set-key (kbd "C-s") 'save-buffer)
(global-set-key (kbd "C-x C-s") (lambda () (interactive) (message "Use C-s instead!")))

;; phi-search is multiple cursors friendly
(global-set-key (kbd "C-f") 'phi-search)
(eval-after-load 'evil
  '(define-key evil-normal-state-map (kbd "C-f") 'phi-search))

;; FIXME recentf?
;(eval-after-load 'ido
;  '(progn
;     (let ((lexical-binding))
;       (dolist (map '(ido-completion-map ido-common-completion-map ido-file-completion-map ido-file-dir-completion-map ido-buffer-completion-map))
;         (define-key (symbol-value map) (kbd "<up>") 'ido-prev-match)
;         (define-key (symbol-value map) (kbd "<down>") 'ido-next-match)
;         (define-key (symbol-value map) (kbd "<left>") 'ido-prev-match-dir)
;         (define-key (symbol-value map) (kbd "<right>") 'ido-next-match-dir)))))

;; Dired
(global-set-key (kbd "C-d") 'dired-jump)
(eval-after-load 'evil
  '(define-key evil-normal-state-map (kbd "C-d") 'dired-jump))
(eval-after-load 'dired+
  '(progn
     (define-key dired-mode-map (kbd "* n") 'dired-mark-files-regexp)
     (define-key dired-mode-map (kbd "<backspace>") 'dired-jump)
     (define-key dired-mode-map (kbd "E") 'dired-do-eval)
     (define-key dired-mode-map (kbd "F") 'dired-do-find-marked-files-and-select-in-ibuffer)
     (define-key dired-mode-map (kbd "s") 'dired-sort)))

;; recentf
(global-set-key (kbd "C-x C-r") 'recentf-ido-find-file)

;; Buffers
(global-set-key (kbd "C-w") 'kill-this-buffer)
(global-set-key (kbd "C-b") 'ido-switch-buffer)
(eval-after-load 'evil
  '(progn
     (define-key evil-normal-state-map (kbd "C-w") 'kill-this-buffer)
     (define-key evil-normal-state-map (kbd "C-b") 'ido-switch-buffer)))

;; IBuffer
(global-set-key (kbd "C-x C-b") 'ibuffer)
(eval-after-load 'ibuffer
  '(progn
     (define-key ibuffer-mode-map (kbd "U") (lambda()(interactive)(ibuffer-unmark-all ?\n)))
     (define-key ibuffer-mode-map (kbd "* .") 'ibuffer-mark-by-extension)
     (define-key ibuffer-mode-map (kbd "* *") 'ibuffer-mark-special-buffers)))

;; Comint
(eval-after-load 'comint
  '(progn
     (define-key comint-mode-map (kbd "C-<up>") nil)
     (define-key comint-mode-map (kbd "C-<down>") nil)))

;; Git
(eval-after-load 'magit
  '(progn
     (define-key magit-status-mode-map (kbd "q") 'magit-status-quit)))

(eval-after-load 'git-rebase-mode
  '(progn
     (define-key git-rebase-mode-map (kbd "M-<up>") 'git-rebase-move-line-up)
     (define-key git-rebase-mode-map (kbd "M-<down>") 'git-rebase-move-line-down)))

(eval-after-load 'vc-annotate
  '(progn (define-key vc-annotate-mode-map (kbd "q") 'vc-annotate-quit)))

;; evil
(eval-after-load 'evil
  '(progn
     (define-key evil-normal-state-map "Y" "y$")))

;; evil-leader
(eval-after-load 'evil-leader
  '(progn
     (evil-leader/set-leader ",")
     (evil-leader/set-key "r" 'recentf-ido-find-file)
     (evil-leader/set-key "t" 'textmate-goto-file)
     (evil-leader/set-key "f" 'ido-find-file)
     (evil-leader/set-key "b" 'ido-switch-buffer)))

;; evil-numbers
(eval-after-load 'evil-numbers
  '(progn
     (define-key evil-normal-state-map (kbd "C-c +") 'evil-numbers/inc-at-pt)
     (define-key evil-normal-state-map (kbd "C-c -") 'evil-numbers/dec-at-pt)))

;(define-key inf-ruby-mode-map (kbd "<up>") 'comint-previous-input)
;(define-key inf-ruby-mode-map (kbd "<down>") 'comint-next-input)

;(define-key dired-mode-map (kbd "<backspace>") (lambda()(interactive)(find-alternate-file "..")))

;(define-key magit-mode-map (kbd "1") 'magit-jump-to-unstaged)
;(define-key magit-mode-map (kbd "2") 'magit-jump-to-staged)
;(define-key magit-mode-map (kbd "3") 'magit-jump-to-untracked)
;(define-key magit-mode-map (kbd "4") 'magit-jump-to-unpushed)

;; ESC quits
;(define-key evil-normal-state-map [escape] 'keyboard-quit)
;(define-key evil-visual-state-map [escape] 'keyboard-quit)
;(define-key minibuffer-local-map [escape] 'abort-recursive-edit)
;(define-key minibuffer-local-ns-map [escape] 'abort-recursive-edit)
;(define-key minibuffer-local-completion-map [escape] 'abort-recursive-edit)
;(define-key minibuffer-local-must-match-map [escape] 'abort-recursive-edit)
;(define-key minibuffer-local-isearch-map [escape] 'abort-recursive-edit)

;;(unless (server-running-p)
;;  ((server-start) (global-set-key (kbd "C-x C-c") 'quit-by-hiding)))

;(global-set-key (kbd "C-SPC") 'hippie-expand)
