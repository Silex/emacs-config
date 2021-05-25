;; Inspired from https://github.com/magnars/.emacs.d/blob/master/appearance.el
(defun maximize-frame ()
  (interactive)
  (set-frame-parameter nil 'fullscreen 'maximized))

(defun restore-frame ()
  (interactive)
  (set-frame-parameter nil 'fullscreen nil))

(defun maximize-frame-wsl ()
  (interactive)
  (let* ((script "/mnt/c/Users/Philippe\\ Vaucher/pCloud/dotfiles/emacs/w32/maximise-window-wsl.ps1")
         (windows-script (s-replace "/mnt/c" "C:" script))
         (command (format "powershell.exe -f %s" windows-script)))
    (shell-command command)))

;; Scrollbar
(use-package scroll-bar
  :ensure nil
  :demand t
  :custom
  (scroll-bar-mode-explicit t)
  (scroll-bar-mode 'right)
  :config
  (scroll-bar-mode))

;; Disable startup screen
(setq inhibit-startup-screen t)

;; Disable bars
(tool-bar-mode -1)
(menu-bar-mode -1)

;; Start maximized
;; (maximize-frame-wsl)

;; Load theme
(load-theme 'silex-monokai t)

;; Pretty modeline
(use-package airline-themes
  :demand t
  :custom
  (airline-cursor-colors nil)
  :config
  (load-theme 'airline-cool t))
