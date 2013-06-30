;; ;; ERC
;; ;(require 'erc-nicklist)
;; (require 'erc-highlight-nicknames)
;; (add-to-list 'erc-modules 'highlight-nicknames)
;; (erc-update-modules)
;; (custom-set-faces
;;  '(erc-current-nick-face ((t (:foreground "orange"))))
;;  '(erc-input-face ((t (:foreground "orange"))))
;;  '(erc-my-nick-face ((t (:foreground "orange"))))
;;  '(erc-prompt-face ((t (:foreground "white")))))
;; (setq erc-fill-function 'erc-fill-static)
;; (setq erc-fill-static-center 15)
;; (setq erc-track-shorten-function nil)
;; (setq erc-track-exclude-types '("JOIN" "NICK" "PART" "QUIT" "MODE" "324" "329" "332" "333" "353" "477"))
;; (setq erc-server-reconnect-attempts t)
;; (add-hook 'window-configuration-change-hook
;;   '(lambda () (setq erc-fill-column (- (window-width) 4))))

;; ;; Clears out annoying erc-track-mode stuff for when we don't care.
;; (defun reset-erc-track-mode ()
;;   (interactive)
;;   (setq erc-modified-channels-alist nil)
;;   (erc-modified-channels-update))
