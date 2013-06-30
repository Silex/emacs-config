(require 'cl)

(case system-type
  ('windows-nt
   (defconst config-directory (expand-file-name "C:/work/emacs-config"))
   (setq el-get-dir (expand-file-name "~/../My Documents/My Dropbox/emacs-packages")))
  (otherwise
    (defconst config-directory (expand-file-name "~/work/emacs-config"))
    (setq el-get-dir (expand-file-name "~/Dropbox/emacs-packages"))))


(load-file (concat config-directory "/init.el"))
