(use-package multi-web-mode
  :commands (multi-web-mode
             multi-web-global-mode)
  :init
  (progn
    (setq mweb-default-major-mode 'html-mode)
    (setq mweb-tags '((php-mode "<\\?php\\|<\\? \\|<\\?=" "\\?>")
                      (js-mode "<script +\\(type=\"text/javascript\"\\|language=\"javascript\"\\)[^>]*>" "</script>")
                      (ruby-mode "<%==\\|<%=\\|<%#\\|<%" "%>")
                      (css-mode "<style[^>]*>" "</style>")))
    (setq mweb-filename-extensions '("php" "htm" "html" "ctp" "phtml" "php4" "php5" "erb"))))

(multi-web-global-mode)
