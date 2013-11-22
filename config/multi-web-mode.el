(require 'multi-web-mode)
;(use-package multi-web-mode
;  :commands (multi-web-mode
;             multi-web-global-mode))

;  :init
;  (progn
;    (setq mweb-default-major-mode 'html-mode)
;    (setq mweb-tags '((php-mode "<\\?php\\|<\\? \\|<\\?=" "\\?>")
;                      (js-mode "<script +\\(type=\"text/javascript\"\\|language=\"javascript\"\\)[^>]*>" "</script>")
;                      (css-mode "<style +type=\"text/css\"[^>]*>" "</style>")))
;    (setq mweb-filename-extensions '("php" "htm" "html" "ctp" "phtml" "php4" "php5"))))

;;(multi-web-global-mode 1)

(defun multi-web-mode-coffee-erb ()
  (setq mweb-default-major-mode 'coffee-mode)
  (setq mweb-tags '((ruby-mode "<%==\\|<%=\\|<%#\\|<%" "%>")))
  (setq mweb-filename-extensions '("erb"))
  (multi-web-mode))

(defun multi-web-mode-html-erb ()
  (setq mweb-default-major-mode 'html-mode)
  (setq mweb-tags '((ruby-mode "<%==\\|<%=\\|<%#\\|<%" "%>")))
  (setq mweb-filename-extensions '("erb"))
  (multi-web-mode))
;(defun multi-web-mode-html
;    (setq mweb-default-major-mode 'html-mode)
;    (setq mweb-tags '((php-mode "<\\?php\\|<\\? \\|<\\?=" "\\?>")
;                      (js-mode "<script +\\(type=\"text/javascript\"\\|language=\"javascript\"\\)[^>]*>" "</script>")
;                      (css-mode "<style +type=\"text/css\"[^>]*>" "</style>")))
;    (setq mweb-filename-extensions '("php" "htm" "html" "ctp" "phtml" "php4" "php5"))))

(add-to-list 'auto-mode-alist '("\\.coffee\\.erb\\'" . multi-web-mode-coffee-erb))
(add-to-list 'auto-mode-alist '("\\.html\\.erb\\'" . multi-web-mode-html-erb))
