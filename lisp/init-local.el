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

;; ;; 干掉 ivy minibuffer 的 M-j ivy-yank-word keybinding
;; (use-package ivy
;;   :config
;;   (progn
;;     (define-key ivy-minibuffer-map (kbd "M-j") nil)))
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

;; ledger mode
(use-package ledger-mode
  :config
  (setq ledger-accounts-file "~/Documents/Bookkeeping/accounts.txt"))

;; org roam
(use-package org-roam
  :ensure t
  :custom
  (org-roam-directory "~/Documents/RoamNotes/")
  (org-roam-completion-system 'ivy)
  (org-roam-graph-viewer "open")
  (org-roam-capture-templates '(("d" "default" plain "%?"
                                 :target (file+head "%<%Y%m%d%H%M%S>-${slug}.org" "#+TITLE: ${title}\n")
                                 :unnarrowed t)
                                ("l" "references (link)" plain "%?"
                                 :target (file+head "refs/%<%Y%m%d%H%M%S>-${slug}.org" "#+TITLE: ${title}\n#+DATE: %t\n#+ROAM_KEY: %^{ROAM_KEY}\n")
                                 :unnarrowed t)
                                ("r" "references (no link)" plain "%?"
                                 :target (file+head "refs/%<%Y%m%d%H%M%S>-${slug}.org" "#+TITLE: ${title}\n#+DATE: %t\n")
                                 :unnarrowed t)
                                ("i" "indexes" plain "%?"
                                 :target (file+head "${slug}.org" "#+TITLE: ${title}\n#+DATE: %t\n")
                                 :unnarrowed t)
                                ("a" "articals" plain "%?"
                                 :target (file+head "articals/${slug}.org" "#+TITLE: ${title}\n#+DATE: %t\n")
                                 :unnarrowed t)
                                ("D" "drafts" plain "%?"
                                 :target (file+head "drafts/%<%Y%m%d%H%M%S>-${slug}.org" "#+TITLE: ${title}\n#+DATE: %t\n")
                                 :unnarrowed t)
                                ))
  :bind (("C-c n l" . org-roam-buffer-toggle)
         ("C-c n f" . org-roam-node-find)
         ("C-c n g" . org-roam-graph)
         ("C-c n i" . org-roam-node-insert)
         ("C-c n c" . org-roam-capture)
         ;; Dailies
         ("C-c n j" . org-roam-dailies-capture-today))
  :config
  ;; If you're using a vertical completion framework, you might want a more informative completion interface
  (setq org-roam-node-display-template (concat "${title:*} " (propertize "${tags:10}" 'face 'org-tag)))
  (org-roam-db-autosync-mode)
  ;; If using org-roam-protocol
  (require 'org-roam-protocol))

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

;;; org-anki
(use-package org-anki
  :ensure t
  :custom
  (org-anki-default-deck "emacs-deck"))

;;; Since Emacs 24.4, electric-indent-mode is enabled by default. In most major modes, this causes RET to reindent the current line and indent the new line, and C-j to insert a newline without indenting.
;;; Org mode now obeys this minor mode: when electric-indent-mode is enabled, and point is neither in a table nor on a timestamp or a link:
(add-hook 'org-mode-hook (lambda () (electric-indent-local-mode -1)))

;; org-capture
(add-to-list 'org-capture-templates
             '("w" "Work-related Task" item
               (file+headline "~/Documents/work/work.org" "Tasks")
               "[ ] %?" :empty-lines 0))

(add-to-list 'org-capture-templates
             '("a" "Anki Capture Word" plain
               (function (lambda nil (goto-char  (point))))
               "\n* %^{Word} @@html:<br>@@ | %^{Pronounce} |\n%^{Description}%?\n@@html:<style>* { text-align: left; }</style>@@" :empty-lines 1))

(require 'posframe)
(use-package rime
  :config
  ;; 这个东西经常有问题，还是直接手动设置了拉倒
  (setq rime-librime-root (expand-file-name "librime/dist" user-emacs-directory))
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

(use-package osx-dictionary
  :bind
  (("C-c C-s C-d" . osx-dictionary-search-pointer)
   ("C-c C-s C-i" . osx-dictionary-search-input)))
(add-hook 'inf-ruby-mode-hook (lambda () (define-key inf-ruby-minor-mode-map (kbd "C-c C-s") nil)))
(add-hook 'inf-ruby-minor-mode-hook (lambda () (define-key inf-ruby-minor-mode-map (kbd "C-c C-s") nil)))

;; eww 屏蔽所有图片
(setq shr-blocked-images ".*")

(require 'hydra)
;; rectangle-mark-mode
(require 'rect)
(defhydra hydra-rectangle (:body-pre (rectangle-mark-mode 1)
                                     :color pink
                                     :post (deactivate-mark))
  "
  ^_k_^     _d_elete    _s_tring
_h_   _l_   _o_k        _y_ank
  ^_j_^     _n_ew-copy  _r_eset
^^^^        _e_xchange  _u_ndo
^^^^        ^ ^         _x_kill
"
  ("h" rectangle-backward-char nil)
  ("l" rectangle-forward-char nil)
  ("k" rectangle-previous-line nil)
  ("j" rectangle-next-line nil)
  ("e" hydra-ex-point-mark nil)
  ("n" copy-rectangle-as-kill nil)
  ("d" delete-rectangle nil)
  ("r" (if (region-active-p)
           (deactivate-mark)
         (rectangle-mark-mode 1)) nil)
  ("y" yank-rectangle nil)
  ("u" undo nil)
  ("s" string-rectangle nil)
  ("x" kill-rectangle nil)
  ("o" nil nil))

;; Recommended binding:
(global-set-key (kbd "C-x SPC") 'hydra-rectangle/body)

;; avy-goto-char
(global-set-key (kbd "C-:") 'avy-goto-char)

;; zap-up-to-char
(global-set-key (kbd "M-z") 'zap-up-to-char)

;; 复制路径 http://xahlee.info/emacs/emacs/emacs_copy_file_path.html
(defun xah-copy-file-path (&optional DirPathOnlyQ)
  (interactive "P")
  (let (
        ($fpath
         (if (string-equal major-mode 'dired-mode)
             (progn
               (let (
                     ($result (mapconcat 'identity (dired-get-marked-files) "\n")))
                 (if (equal (length $result) 0)
                     (progn default-directory)
                   (progn $result))))
           (if (buffer-file-name)
               (buffer-file-name)
             (expand-file-name default-directory)))))
    (kill-new
     (if DirPathOnlyQ
         (progn
           (message "Directory copied: %s" (file-name-directory $fpath))
           (file-name-directory $fpath))
       (progn
         (message "File path copied: %s" $fpath)
         $fpath)))))

;; lexic
(use-package lexic
  :commands lexic-search lexic-list-dictionary
  :bind (:map lexic-mode-map
              (("q" . lexic-return-from-lexic)
               ("RET" . lexic-search-word-at-point)
               ("a" . outline-show-all)
               ("h" . (lambda () (interactive) (outline-hide-sublevels 3)))
               ("o" . lexic-toggle-entry)
               ("n" . lexic-next-entry)
               ("N" . (lambda () (interactive) (lexic-next-entry t)))
               ("p" . lexic-previous-entry)
               ("P" . (lambda () (interactive) (lexic-previous-entry t)))
               ("E" . (lambda () (interactive) (lexic-return-from-lexic) ; expand
                        (switch-to-buffer (lexic-get-buffer))))
               ("M" . (lambda () (interactive) (lexic-return-from-lexic) ; minimise
                        (lexic-goto-lexic)))
               ("C-p" . lexic-search-history-backwards)
               ("C-n" . lexic-search-history-forwards)
               ("P" . (lambda () (interactive) (call-interactively #'lexic-search)))))
  :init
  (add-hook 'lexic-mode-hook (lambda ()
                               (setq-local visual-fill-column-center-text nil)
                               (visual-fill-column-mode nil)))
  :config
  (defun lexic--fill-string (str)
    (with-temp-buffer
      (insert str)
      (let ((fill-column 60))
        (fill-region (point-min) (point-max) nil t t))
      (buffer-substring (point-min) (point-max))))
  (defun lexic-format-html (entry &optional _expected-word)
    (shell-command-to-string (format "echo %s | w3m -T text/html -dump -cols 60" (prin1-to-string (plist-get entry :info)))))
  (defun lexic-format-oxford (entry &optional _expected-word)
    (lexic--fill-string (replace-regexp-in-string "\\([0-9]+ \\[.*?\\]\\)" "

\\1" (plist-get entry :info))))
  (setq lexic-dictionary-specs '(("牛津现代英汉双解词典" :formatter lexic-format-oxford :prioryty 1)
                                 ("Collins Cobuild 5" :formatter lexic-format-html :priority 2))))

;; 不要用原来的guide-key及其附带的popwin，会出现popup时delete-other-windows然后又不恢复，还没选项控件这个，有人提issue一个不回一个说为什么不用which-key，是真的离谱
(require 'which-key)
(which-key-mode)
(which-key-setup-side-window-right)
(setq which-key-show-early-on-C-h t)

;; 更换为ace-window
(defun joe-scroll-other-window()
  (interactive)
  (scroll-other-window 1))
(defun joe-scroll-other-window-down ()
  (interactive)
  (scroll-other-window-down 1))
(defun tep-switch-to-minibuffer ()
  "Switch to minibuffer window."
  (interactive)
  (if (active-minibuffer-window)
      (select-window (active-minibuffer-window))))
(use-package ace-window
  :ensure t
  :defer 1
  :config
  (set-face-attribute
   'aw-leading-char-face nil
   :foreground "firebrick"
   :weight 'bold
   :height 3.0)
  (set-face-attribute
   'aw-mode-line-face nil
   :inherit 'mode-line-buffer-id
   :foreground "firebrick")
  (setq aw-keys '(?a ?o ?e ?u ?h ?t ?n ?l) ;'(?a ?s ?d ?f ?j ?k ?l)
        aw-dispatch-always t
        ;; aw-dispatch-alist
        ;; '((?x aw-delete-window "Ace - Delete Window")
        ;;   (?c aw-swap-window "Ace - Swap Window")
        ;;   (?n aw-flip-window)
        ;;   (?v aw-split-window-vert "Ace - Split Vert Window")
        ;;   (?h aw-split-window-horz "Ace - Split Horz Window")
        ;;   (?m delete-other-windows "Ace - Maximize Window")
        ;;   (?g delete-other-windows)
        ;;   (?b balance-windows)
        ;;   (?u (lambda ()
        ;;         (progn
        ;;           (winner-undo)
        ;;           (setq this-command 'winner-undo))))
        ;;   (?r winner-redo))
        )

  (when (package-installed-p 'hydra)
    (defhydra hydra-window-size (:color red)
      "Windows size"
      ("<left>" shrink-window-horizontally "shrink horizontal")
      ("<up>" shrink-window "shrink vertical")
      ("<down>" enlarge-window "enlarge vertical")
      ("<right>" enlarge-window-horizontally "enlarge horizontal")
      ("b" balance-windows "balance windows"))
    ;; (defhydra hydra-window-frame (:color red)
    ;;   "Frame"
    ;;   ("f" make-frame "new frame")
    ;;   ("x" delete-frame "delete frame"))
    ;; (defhydra hydra-window-scroll (:color red)
    ;;   "Scroll other window"
    ;;   ("n" joe-scroll-other-window "scroll")
    ;;   ("p" joe-scroll-other-window-down "scroll down"))
    (setq aw-dispatch-alist (list))
    (add-to-list 'aw-dispatch-alist '(?? aw-show-dispatch-help) t)
    (add-to-list 'aw-dispatch-alist '(?\\ hydra-window-size/body) t)
    (add-to-list 'aw-dispatch-alist '(?m tep-switch-to-minibuffer) t)
    ;; (add-to-list 'aw-dispatch-alist '(?o hydra-window-scroll/body) t)
    ;; (add-to-list 'aw-dispatch-alist '(?\; hydra-window-frame/body) t)
    )
  (ace-window-display-mode t))
(global-set-key (kbd "C-x o") 'ace-window)

;; chatgpt
(use-package chatgpt-shell
  :ensure t
  :custom
  ((chatgpt-shell-openai-key "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")))

;; ellama
(use-package ellama
  :init
  (setq ellama-language "Simplified Chinese")
  (require 'llm-ollama)
  (setq ellama-provider
        ;; (make-llm-ollama
        ;;  :chat-model "mistral:7b-text-q5_K_M" :embedding-model "mistral:7b-text-q5_K_M")
        (make-llm-openai
         :key (concat "sk-qVzE1MGB1yaTsBgld" "S62T3BlbkFJazdIgQ8FWA0NqI9PhDct") :chat-model "gpt-3.5-turbo")
        ))

(provide 'init-local)
