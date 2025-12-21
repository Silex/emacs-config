(use-package auth-source
  :straight nil
  :custom
  (auth-sources '("~/.authinfo")))

(use-package message
  :straight nil
  :custom
  (user-full-name "Philippe Vaucher")
  (user-mail-address "philippe.vaucher@gmail.com")
  (message-send-mail-function 'smtpmail-send-it)
  (send-mail-function 'smtpmail-send-it))

(use-package smtpmail
  :straight nil
  :custom
  (smtpmail-smtp-server "smtp.gmail.com")
  (smtpmail-smtp-service 587)
  (smtpmail-stream-type 'starttls)
  (smtpmail-auth-supported '(login plain))
  (smtpmail-debug-info t))
