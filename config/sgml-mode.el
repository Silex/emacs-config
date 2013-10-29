(defadvice sgml-calculate-indent (after sgml-do-not-indent-html-body activate)
  "Don't indent <html> and <body> tags"
  (when (looking-at "<\\(html\\|body\\)")
    (setq ad-return-value 0)))
