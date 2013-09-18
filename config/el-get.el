(use-package el-get
  :commands (el-get
             el-get-install
             el-get-update
             el-get-self-update
             el-get-cd
             el-get-describe
             el-get-find-recipe-file)

  :init
  (progn
    ;; Setup el-get-dir
    (setq el-get-dir (expand-file-name "packages/" config-directory))

    ;; Disable autoloads
    (setq el-get-generate-autoloads nil))

  :config
  (progn
    ;; Set up el-get local recipes path
    (add-to-list 'el-get-recipe-path (expand-file-name "recipes/" config-directory))

    ;; Fix broken recipes
    (push '(:name evil
                  :build (("make" "all"))
                  :info nil)
          el-get-sources)))
