;;; evil.el --- Evil mode and extensions  -*- lexical-binding: t; -*-

(defun silex/leader ()
  "Act as the C-c prefix, so every C-c key is also reachable from `C-,'."
  (interactive)
  (setq prefix-arg current-prefix-arg)
  ;; no-record keeps the C-c out of a recorded macro, which already holds the C-,
  (push '(no-record . ?\C-c) unread-command-events))

(defun silex/key-hint (hint)
  "Return a command that only names HINT, the key to use instead."
  (lambda ()
    "Name the key to use instead."
    (interactive)
    (user-error "Use %s" hint)))

(use-package evil
  :demand t
  :custom
  (evil-want-keybinding nil)
  (evil-want-C-d-scroll nil)
  (evil-want-C-i-scroll nil)
  (evil-want-C-w-delete nil)
  (evil-want-C-w-in-emacs-state t)
  (evil-default-cursor '(t "white"))
  (evil-magic 'very-magic)
  (evil-shift-width 2)
  (evil-want-fine-undo t)
  (evil-search-module 'evil-search)
  :config
  ;; Set after loading: evil's deferred custom initialization discards
  ;; values given through :custom, so Y would keep yanking the whole line.
  (setopt evil-want-Y-yank-to-eol t)
  (evil-mode)
  (defalias #'forward-evil-word #'forward-evil-symbol)
  ;; Let C-. reach embark-act, not evil-repeat-pop.
  (define-key evil-normal-state-map (kbd "C-.") nil)
  ;; C-, is the leader in every state: it stands for C-c, so C-, f runs C-c f
  ;; and C-, p f runs C-c p f. The evil state maps let it win over the C-, of
  ;; org-mode and of ai-code session buffers.
  (keymap-global-set "C-," #'silex/leader)
  (evil-define-key '(normal insert visual motion emacs) 'global
    (kbd "C-,") #'silex/leader)
  (evil-declare-ignore-repeat #'silex/leader)
  ;; C-w is the window map in every state; the minibuffer gets it too, so the
  ;; same key leaves a prompt for another window.
  (keymap-set minibuffer-local-map "C-w" 'evil-window-map)
  ;; Break the C-x window habit: each key only names its evil window-map equivalent.
  (pcase-dolist (`(,key . ,hint) '(("C-x 0" . "C-w c")
                                   ("C-x 1" . "C-w o")
                                   ("C-x 2" . "C-w s")
                                   ("C-x 3" . "C-w v")
                                   ("C-x o" . "C-w w or C-w <arrow>")))
    (keymap-global-set key (silex/key-hint hint)))
  ;; evil-window-exchange swaps through window-swap-states, which keeps each
  ;; window's point and scroll.
  (defalias 'swap-windows (silex/key-hint "C-w x")
    "Name C-w x, the key that swaps the window with the next one.")
  ;; Same for files and buffers, now that the leader exists in every state.
  (pcase-dolist (`(,key . ,hint) '(("C-x C-f" . "C-, f")
                                   ("C-x b" . "C-, b")
                                   ("C-x C-b" . "C-, B")))
    (keymap-global-set key (silex/key-hint hint))))

(use-package evil-collection
  :demand t
  :after evil
  :custom
  ;; RET sends the input in insert state in comint, eshell and other REPL
  ;; buffers; evil-collection defaults to sending it only in normal state.
  (evil-collection-binding-overrides '((repl-submit  :state insert)
                                       (repl-newline :state normal)))
  :config
  (evil-collection-init))

(use-package evil-surround
  :demand t
  :after evil
  :config
  (global-evil-surround-mode 1)
  (evil-define-key 'visual evil-surround-mode-map "s" 'evil-surround-region)
  (evil-define-key 'visual evil-surround-mode-map "S" 'evil-Surround-region)
  (defmacro define-and-bind-quoted-text-object (name key start-regex end-regex)
    (let ((inner-name (make-symbol (concat "evil-inner-" name)))
          (outer-name (make-symbol (concat "evil-a-" name))))
      `(progn
         (evil-define-text-object ,inner-name (count &optional beg end type)
           (evil-select-paren ,start-regex ,end-regex beg end type count nil))
         (evil-define-text-object ,outer-name (count &optional beg end type)
           (evil-select-paren ,start-regex ,end-regex beg end type count t))
         (define-key evil-inner-text-objects-map ,key #',inner-name)
         (define-key evil-outer-text-objects-map ,key #',outer-name))))
  (define-and-bind-quoted-text-object "pipe" "|" "|" "|"))

(use-package evil-numbers
  :demand t
  :after evil
  :bind (("C-c +" . evil-numbers/inc-at-pt)
         ("C-c -" . evil-numbers/dec-at-pt)))

(use-package evil-mc
  :demand t
  :after evil
  :config
  (global-evil-mc-mode))

(use-package evil-matchit
  :demand t
  :after evil
  :config
  (global-evil-matchit-mode 1))

(use-package evil-visualstar
  :demand t
  :after evil
  :config
  (global-evil-visualstar-mode))

(use-package evil-exchange
  :demand t
  :after evil
  :custom
  (evil-goggles-pulse nil)
  :config
  (evil-exchange-install))

(use-package evil-goggles
  :demand t
  :after evil
  :config
  (evil-goggles-mode))

(use-package undo-fu
  :demand t
  :after evil
  :config
  (define-key evil-normal-state-map "u" 'undo-fu-only-undo)
  (define-key evil-normal-state-map "\C-r" 'undo-fu-only-redo))
