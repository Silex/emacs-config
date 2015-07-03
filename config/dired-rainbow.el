(use-package dired-rainbow
  :defer t
  :config
  ;; (dired-rainbow-define html "#4e9a06" ("htm" "html" "xhtml"))
  ;; (dired-rainbow-define xml "#b4fa70" ("xml" "xsd" "xsl" "xslt" "wsdl"))

  ;; (dired-rainbow-define document "#fce94f" ("doc" "docx" "odt" "pdb" "pdf" "ps" "rtf" "djvu" "epub"))
  ;; (dired-rainbow-define media "#ce5c00" '("mp3" "mp4" "MP3" "MP4" "avi" "mpg" "flv" "ogg" "wmv" "mkv" "mov" "wma")
  ;; (dired-rainbow-define image "#ff4b4b" ("jpg" "png" "jpeg" "gif"))

  ;; (dired-rainbow-define log "#c17d11" ("log"))
  ;; (dired-rainbow-define sourcefile "#fcaf3e" ("py" "c" "cc" "h" "java" "pl" "rb" "el"))

  ;; (dired-rainbow-define executable "#8cc4ff" ("exe" "msi"))
  ;; (dired-rainbow-define compressed "#ad7fa8" ("zip" "bz2" "tgz" "txz" "gz" "xz" "z" "Z" "jar" "war" "ear" "rar" "sar" "xpi" "apk" "xz" "tar"))
  ;; (dired-rainbow-define packaged "#e6a8df" ("deb" "rpm"))
  ;; (dired-rainbow-define encrypted "LightBlue" ("gpg" "pgp"))

  (dired-rainbow-define-chmod executable-unix "Green" "-.*x.*"))
