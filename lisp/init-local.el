;; initialize el-get
(add-to-list 'load-path "~/.emacs.d/el-get/el-get")

(unless (require 'el-get nil 'noerror)
  (require 'package)
  (add-to-list 'package-archives
               '("melpa" . "http://melpa.org/packages/"))
  (package-refresh-contents)
  (package-initialize)
  (package-install 'el-get)
  (require 'el-get))

(add-to-list 'el-get-recipe-path "~/.emacs.d/el-get-user/recipes")

(el-get-bundle tep-git-auto-commit-mode
  :url "https://raw.githubusercontent.com/tepmnthar/git-auto-commit-mode/master/git-auto-commit-mode.el")

(load-theme 'cyberpunk)
(global-undo-tree-mode)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(require 'use-package)
(require 'posframe)
;; (use-package pyim
;;   :ensure nil
;;   :demand t
;;   :config

;;   ;; ;; 激活 basedict 拼音词库，五笔用户请继续阅读 README
;;   ;; (use-package pyim-basedict
;;   ;;   :ensure nil
;;   ;;   :config (pyim-basedict-enable))

;;   ;; (setq default-input-method "pyim")

;;   ;; ;; 我使用全拼
;;   ;; (setq pyim-default-scheme 'quanpin)

;;   ;; 激活 wbdict 拼音词库
;;   (use-package pyim-wbdict
;;     :ensure nil
;;     :config (pyim-wbdict-v98-enable))

;;   (setq default-input-method "pyim")

;;   ;; 我使用五笔
;;   (setq pyim-default-scheme 'wubi)

;;   ;; 设置 pyim 探针设置，这是 pyim 高级功能设置，可以实现 *无痛* 中英文切换 :-)
;;   ;; 我自己使用的中英文动态切换规则是：
;;   ;; 1. 光标只有在注释里面时，才可以输入中文。
;;   ;; 2. 光标前是汉字字符时，才能输入中文。
;;   ;; 3. 使用 M-j 快捷键，强制将光标前的拼音字符串转换为中文。
;;   (setq-default pyim-english-input-switch-functions
;;                 '(pyim-probe-dynamic-english
;;                   pyim-probe-isearch-mode
;;                   pyim-probe-program-mode
;;                   pyim-probe-org-structure-template))

;;   (setq-default pyim-punctuation-half-width-functions
;;                 '(pyim-probe-punctuation-line-beginning
;;                   pyim-probe-punctuation-after-punctuation))

;;   ;; 开启拼音搜索功能
;;   (pyim-isearch-mode 1)

;;   ;; 使用 pupup-el 来绘制选词框, 如果用 emacs26, 建议设置
;;   ;; 为 'posframe, 速度很快并且菜单不会变形，不过需要用户
;;   ;; 手动安装 posframe 包。
;;   ;; (setq pyim-page-tooltip 'posframe)
;;   (setq pyim-use-tooltip 'posframe)

;;   ;; 选词框显示5个候选词
;;   (setq pyim-page-length 5)

;;   :bind
;;   (("M-j" . pyim-convert-string-at-point) ;与 pyim-probe-dynamic-english 配合
;;    ("C-;" . pyim-delete-word-from-personal-buffer)))

;; 干掉 ivy minibuffer 的 M-j ivy-yank-word keybinding
(use-package ivy
  :config
  (progn
    (define-key ivy-minibuffer-map (kbd "M-j") nil)))
;; ;; isearch mode 里用中文
;; (defun toggle-pyim-force-input-chinese ()
;;   "切换 pyim 强制中文."
;;   (interactive)
;;   (setq pyim-force-input-chinese (not pyim-force-input-chinese)))
;; (define-key isearch-mode-map (kbd "M-j") 'toggle-pyim-force-input-chinese)

;; (setq my-input-methods
;;       '("pyim")
;;       my-current-input-methods my-input-methods)

;; (defun my-cycle-input-method ()
;;   "Cycle `my-input-method-alist'."
;;   (interactive)
;;   (if (null (cdr my-current-input-methods))
;;       (setq my-current-input-methods my-input-methods)
;;     (setq my-current-input-methods (cdr my-current-input-methods)))
;;   (set-input-method (car my-current-input-methods)))

;; (global-set-key (kbd "C-\\") 'toggle-input-method)
;; (global-set-key (kbd "M-C-\\") 'my-cycle-input-method)

;; (use-package dart-mode
;;   :custom
;;   (dart-format-on-save t)
;;   (dart-enable-analysis-server nil)
;;   (dart-sdk-path "/Users/tepmnthar/Development/flutter/bin/cache/dart-sdk/"))

(use-package flutter
  :custom
  (flutter-sdk-path "~/Development/flutter/"))

(require 'powerline)
(powerline-default-theme)

;; (require 'exwm-randr)
;; (setq exwm-randr-workspace-output-plist '(1 "default"))
;; (add-hook 'exwm-randr-screen-change-hook
;;           (lambda ()
;;             (start-process-shell-command
;;              "xrandr" nil "xrandr --output default --auto")))
;; (exwm-randr-enable)

;; (require 'exwm)
;; (require 'exwm-config)
;; (exwm-config-default)

(setq org-reveal-root "file:///Users/tepmnthar/Development/reveal.js")

(setq counsel-spotify-client-id "3e482bc54526410881b0de43c787d14e")
(setq counsel-spotify-client-secret "71f3ff04a356400797b93ea58d8b51f9")

(use-package counsel
  :defer t
  :config
  (setq ivy-initial-inputs-alist nil))

(delete-selection-mode 1)

;; org roam
(use-package org-roam
  :hook
  (after-init . org-roam-mode)
  :custom
  (org-roam-directory "~/Documents/RoamNotes/")
  (org-roam-completion-system 'ivy)
  (org-roam-graph-viewer "open")
  (org-roam-capture-templates '(("d" "default" plain (function org-roam--capture-get-point)
                                 "%?"
                                 :file-name "%<%Y%m%d%H%M%S>-${slug}"
                                 :head "#+TITLE: ${title}\n"
                                 :unnarrowed t)
                                ("l" "references (link)" plain (function org-roam--capture-get-point)
                                 "%?"
                                 :file-name "refs/%<%Y%m%d%H%M%S>-${slug}"
                                 :head "#+TITLE: ${title}\n#+DATE: %t\n#+ROAM_KEY: %^{ROAM_KEY}\n"
                                 :unnarrowed t)
                                ("r" "references (no link)" plain (function org-roam--capture-get-point)
                                 "%?"
                                 :file-name "refs/%<%Y%m%d%H%M%S>-${slug}"
                                 :head "#+TITLE: ${title}\n#+DATE: %t\n"
                                 :unnarrowed t)
                                ("i" "indexes" plain (function org-roam--capture-get-point)
                                 "%?"
                                 :file-name "${slug}"
                                 :head "#+TITLE: ${title}\n#+DATE: %t\n"
                                 :unnarrowed t)
                                ("a" "articals" plain (function org-roam--capture-get-point)
                                 "%?"
                                 :file-name "articals/${slug}"
                                 :head "#+TITLE: ${title}\n#+DATE: %t\n"
                                 :unnarrowed t)
                                ("D" "drafts" plain (function org-roam--capture-get-point)
                                 "%?"
                                 :file-name "drafts/%<%Y%m%d%H%M%S>-${slug}"
                                 :head "#+TITLE: ${title}\n#+DATE: %t\n"
                                 :unnarrowed t)
                                ))
  :bind (:map org-roam-mode-map
              (("C-c n l" . org-roam)
               ("C-c n f" . org-roam-find-file)
               ("C-c n j" . org-roam-jump-to-index)
               ("C-c n b" . org-roam-switch-to-buffer)
               ("C-c n g" . org-roam-graph))
              :map org-mode-map
              (("C-c n i" . org-roam-insert))))

(use-package org-journal
  :ensure t
  :defer t
  ;; :init
  ;; ;; Change default prefix key; needs to be set before loading org-journal
  ;; (setq org-journal-prefix-key "C-c j ")
  :config
  (setq org-journal-dir "~/Documents/InvestmentJournal"
        org-journal-file-type 'weekly
        org-journal-start-on-weekday 1
        org-journal-date-format "%Y-%m-%d %a"))

(setq org-tag-persistent-alist
      '((:startgroup)
        ("Stock")
        (:grouptags)
        ("@Good" . ?g)
        ("@Bad" . ?b)
        ("@Neutral" . ?n)
        ("@None" . ?o)
        (:endgroup)))

(setq org-tag-faces
      '(
        ("@Good" . (:foreground "Green" :weight bold))
        ("@Bad" . (:foreground "Red" :weight bold))
        ("@Neutral" . (:foreground "Yellow" :weight bold))
        ("@None" . (:foreground "Gray" :weight bold))
        ))

;;; Since Emacs 24.4, electric-indent-mode is enabled by default. In most major modes, this causes RET to reindent the current line and indent the new line, and C-j to insert a newline without indenting.
;;; Org mode now obeys this minor mode: when electric-indent-mode is enabled, and point is neither in a table nor on a timestamp or a link:
(add-hook 'org-mode-hook (lambda () (electric-indent-local-mode -1)))

;; org-capture
(add-to-list 'org-capture-templates
             '("w" "Work-related Task" item
               (file+headline "~/Documents/work/work.org" "Tasks")
               "[ ] %?" :empty-lines 1))

(require 'posframe)
(use-package rime
  :custom
  (default-input-method "rime")
  (rime-show-candidate 'posframe)
  (rime-share-data-dir "~/Library/Rime"))

;; lsp-mode
(use-package lsp-mode
  :hook ((objc-mode . lsp))
  :commands lsp)
(use-package lsp-sourcekit
  :after lsp-mode
  :config
  (setq lsp-sourcekit-executable "/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/sourcekit-lsp"))
(use-package swift-mode
  :hook (swift-mode . (lambda () (lsp))))
(use-package lsp-ui :commands lsp-ui-mode)
(use-package lsp-ivy :commands lsp-ivy-workspace-symbol)
(use-package lsp-treemacs :commands lsp-treemacs-errors-list)

(provide 'init-local)
