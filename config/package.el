(use-package package
  :defer t
  :init
  (progn
    (setq package-user-dir (expand-file-name "package/elpa" packages-directory))
    (make-directory package-user-dir t)
    (setq package-archives '(("ELPA" . "http://tromey.com/elpa/")
                             ("gnu" . "http://elpa.gnu.org/packages/")
                             ("marmalade" . "http://marmalade-repo.org/packages/")
                             ("SC"   . "http://joseito.republika.pl/sunrise-commander/")))))
