(defun dotspacemacs/layers ()
	(setq common-layers '(
												spacemacs-project
												spacemacs-navigation
												spacemacs-editing
												fasd
												neotree
												(multiple-cursors :variables multiple-cursors-backend 'evil-mc)
												yaml
												git
												(wakatime :variables
												          wakatime-api-key  "bf4dec38-82d7-49f1-a6d9-6fbc737c2b18"
												          wakatime-cli-pathk "/usr/local/bin/wakatime")
												ivy
												(osx :variables
														 osx-use-option-as-meta t
														 osx-function-as 'alt
														 osx-dictionary-dictionary-choice "English")
												syntax-checking
												(shell :variables
															 shell-default-position 'bottom
															 shell-default-height 30
															 shell-default-term-shell "/bin/zsh"
															 multi-term-program "/bin/zsh"
															 shell-enable-smart-eshell t
															 shell-default-shell 'multi-term)
												))
	(setq-default
	 dotspacemacs-distribution 'spacemacs-base
	 dotspacemacs-enable-lazy-installation 'unused
	 dotspacemacs-ask-for-lazy-installation t
	 dotspacemacs-configuration-layer-path '()
	 dotspacemacs-folding-method 'evil
	 dotspacemacs-configuration-layers (if (version<= emacs-version "26.1")
																				 (append common-layers
																								 '(imenu-list
																									 html
																									 react
																									 import-js
																									 prettier
																									 spacemacs-layouts
																									 restclient
																									 epub
																									 (java :variables
																												 java-backend 'lsp)
																									 (javascript :variables
																															 javascript-backend 'lsp
																															 javascript-fmt-tool 'prettier
																															 javascript-fmt-on-save 't
																															 js2-basic-offset 2
																															 js-indent-level 2
																															 node-add-modules-path t
																															 js2-include-node-externs t
																															 javascript-repl `nodejs
																															 javascript-import-tool 'import-js)
																									 (go :variables
																											 go-backend 'lsp
																											 go-tab-width 4
																											 go-format-before-save t
																											 gofmt-command "goimports"
																											 go-use-golangci-lint t
																											 go-use-test-args "-race -timeout 10s")
																									 (lsp :variables
																												lsp-navigation 'peek
																												lsp-ui-sideline-enable nil)
																									 (typescript :variables
																															 typescript-fmt-on-save 'nil
																															 typescript-fmt-tool 'typescript-formatter
																															 typescript-backend #'lsp)
																									 (haskell :variables
																														haskell-completion-backend 'lsp
																														haskell-enable-hindent t
																														)
																									 (terraform :variables terraform-auto-format-on-save t)
																									 ))
																			 (append common-layers '(emacs-lisp)))
	 dotspacemacs-additional-packages '(
																			ov
																			keyfreq
																			org-octopress
																			git-msg-prefix
																			npm-mode
																			mocha
																			eterm-256color
																			thingopt
																			indium
																			evil-surround
																			evil-numbers
																			evil-nerd-commenter
																			evil-matchit
																			evil-vimish-fold
																			focus-autosave-mode
																			all-the-icons-dired
																			all-the-icons-gnus
																			all-the-icons-ivy
																			drag-stuff
																			highlight-indent-guides
																			;; youdao-dictionary
																			)
	 dotspacemacs-excluded-packages '(
																		realgud
																		org-projectile
																		auto-complete
																		undo-tree
																		soap-client
																		time-clock
																		tramp
																		lsp-treemacs
																		magit-svn
																		org-brain
																		tide
																		yasnippet-snippets
																		)
	 dotspacemacs-delete-orphan-packages t))

(defun dotspacemacs/init ()
	(setq-default
	 dotspacemacs-elpa-https t
	 dotspacemacs-elpa-timeout 5
	 dotspacemacs-editing-style 'hybrid
	 dotspacemacs-verbose-loading nil
	 dotspacemacs-startup-banner 'official
	 dotspacemacs-startup-lists '(recents projects)
	 dotspacemacs-startup-recent-list-size 5
	 dotspacemacs-scratch-mode 'text-mode
	 ;; dotspacemacs-themes '(manoj-dark
	 ;;                       monokai
	 ;;                       spacemacs-dark
	 ;;                       spacemacs-light
	 ;;                       solarized-light
	 ;;                       solarized-dark
	 ;;                       leuven
	 ;;                       zenburn)
	 ;; dotspacemacs-themes (if (version<= emacs-version "26.1") '(misterioso) '(leuven))
	 dotspacemacs-themes (if (version<= emacs-version "26.1") '(adwaita) '(leuven))
	 dotspacemacs-colorize-cursor-according-to-state t
	 dotspacemacs-default-font '(
															 "Monaco"
															 :size 14
															 :weight light
															 :width normal
															 :powerline-scale 1.5)
	 dotspacemacs-leader-key "SPC"
	 dotspacemacs-emacs-leader-key "M-m"
	 dotspacemacs-major-mode-leader-key ","
	 dotspacemacs-major-mode-emacs-leader-key "C-M-m"
	 dotspacemacs-emacs-command-key "SPC"
	 dotspacemacs-distinguish-gui-tab nil
	 dotspacemacs-remap-Y-to-y$ nil
	 dotspacemacs-retain-visual-state-on-shift t
	 dotspacemacs-ex-substitute-global nil
	 dotspacemacs-default-layout-name "Default"
	 dotspacemacs-display-default-layout nil
	 dotspacemacs-auto-resume-layouts nil
	 dotspacemacs-large-file-size 1
	 dotspacemacs-auto-save-file-location 'original
	 dotspacemacs-max-rollback-slots 25
	 dotspacemacs-helm-resize nil
	 dotspacemacs-helm-no-header nil
	 dotspacemacs-helm-position 'top
	 dotspacemacs-enable-paste-transient-state nil
	 dotspacemacs-which-key-delay 0.4
	 dotspacemacs-which-key-position 'bottom
	 dotspacemacs-loading-progress-bar t
	 dotspacemacs-fullscreen-at-startup nil
	 dotspacemacs-fullscreen-use-non-native nil
	 dotspacemacs-maximized-at-startup nil
	 dotspacemacs-active-transparency 90
	 dotspacemacs-inactive-transparency 90
	 dotspacemacs-show-transient-state-title t
	 dotspacemacs-show-transient-state-color-guide t
	 dotspacemacs-mode-line-unicode-symbols t
	 dotspacemacs-smooth-scrolling t
	 dotspacemacs-line-numbers nil
	 dotspacemacs-smartparens-strict-mode nil
	 dotspacemacs-smart-closing-parenthesis t
	 dotspacemacs-highlight-delimiters 'all
	 dotspacemacs-persistent-server t
	 dotspacemacs-search-tools '("rg" "ag" "pt" "ack" "grep")
	 dotspacemacs-default-package-repository nil
	 dotspacemacs-whitespace-cleanup nil
	 ;; Supported themes are ‘spacemacs’,‘all-the-icons’, ‘custom’, ‘doom’,‘vim-powerline’ and ‘vanilla’.
	 dotspacemacs-mode-line-theme 'spacemacs
	 )
	 (setq configuration-layer-elpa-archives
    '(("melpa-cn" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")
      ("org-cn"   . "http://mirrors.tuna.tsinghua.edu.cn/elpa/org/")
      ("gnu-cn"   . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")))
	  )

(defun dotspacemacs/user-config ()
	;; (org-defkey org-mode-map [(meta return)] 'org-meta-return)
	(delete-selection-mode t)
	(package-initialize)
	(add-to-list 'load-path "~/.spacemacs.d/private/")
	(defun lsp-seq-first (sequence)
		"Return the first element of SEQUENCE."
		(lsp-elt sequence 0))

;;	(setf (lsp-session-folders-blacklist (lsp-session)) nil) ;
;;	(lsp--persist-session (lsp-session))
	(require 'my-key)
	(require 'my-text)
	(require 'my-hack)
	(require 'my-git)
	(if (version<= emacs-version "26.1")
			(progn
				(require 'my-javascript)
				(require 'my-jest)
				(require 'my-typescript)
				(require 'my-project)
				)
		(progn
			(require 'my-org-simple)
			))
	(add-hook 'term-mode-hook #'eterm-256color-mode)
	(setq ivy-initial-inputs-alist nil)
	(font-lock-add-keywords
	 'typescript-mode
	 '(("\\<\\(\\sw+\\) ?(" 1 'font-lock-function-name-face)))
	(show-paren-mode)

	(setq ns-use-srgb-colorspace t)
	(focus-autosave-mode)
	(global-evil-matchit-mode)
	(if (version<= emacs-version "26.1") (server-start))
	)

(defun dotspacemacs/emacs-custom-settings ()
  "Emacs custom settings.
This is an auto-generated function, do not modify its content directly, use
Emacs customize menu instead.
This function is called at the very end of Spacemacs initialization."
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
	 ["#0a0814" "#f2241f" "#67b11d" "#b1951d" "#4f97d7" "#a31db1" "#28def0" "#b2b2b2"])
 '(c-basic-offset 2)
 '(custom-safe-themes
	 (quote
		("bffa9739ce0752a37d9b1eee78fc00ba159748f50dc328af4be661484848e476" "fa2b58bb98b62c3b8cf3b6f02f058ef7827a8e497125de0254f56e373abee088" "bd7b7c5df1174796deefce5debc2d976b264585d51852c962362be83932873d9" "b3775ba758e7d31f3bb849e7c9e48ff60929a792961a2d536edec8f68c671ca5" default)))
 '(evil-want-Y-yank-to-eol nil)
 '(hl-todo-keyword-faces
	 (quote
		(("TODO" . "#dc752f")
		 ("NEXT" . "#dc752f")
		 ("THEM" . "#2d9574")
		 ("PROG" . "#4f97d7")
		 ("OKAY" . "#4f97d7")
		 ("DONT" . "#f2241f")
		 ("FAIL" . "#f2241f")
		 ("DONE" . "#86dc2f")
		 ("NOTE" . "#b1951d")
		 ("KLUDGE" . "#b1951d")
		 ("HACK" . "#b1951d")
		 ("TEMP" . "#b1951d")
		 ("FIXME" . "#dc752f")
		 ("XXX" . "#dc752f")
		 ("XXXX" . "#dc752f")
		 ("???" . "#dc752f"))))
 '(indent-tabs-mode t)
 '(lsp-vetur-global-snippets-dir "/Users/clin/.spacemacs.d/private/snippets/vetur")
 '(mocha-jest-command "npm test -- --colors")
 '(package-selected-packages
	 (quote ()))
 '(pdf-view-midnight-colors (quote ("#b2b2b2" . "#292b2e")))
 '(projectile-test-suffix-function (quote default-projectile-suffix-unless-gradlew))
 '(safe-local-variable-values
	 (quote
		((eval projectile-register-project-type
					 (quote npm)
					 (quote
						("package.json"))
					 :compile "npm install" :test "npm test" :run "npm run start" :test-suffix ".spec")
		 (hexo-new-format . org))))
 '(yas-snippet-dirs (quote ("/Users/clin/.spacemacs.d/private/snippets/"))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(font-lock-comment-face ((t (:foreground "#75715E" :slant italic :family "Operator Mono"))))
 '(font-lock-function-name-face ((t (:foreground "LightSlateBlue" :weight normal :height 1.2 :family "Operator Mono"))))
 '(font-lock-keyword-face ((t (:foreground "#F92672" :slant italic :weight normal :height 1.2 :family "Operator Mono"))))
 '(font-lock-variable-name-face ((t (:foreground "steel blue" :slant italic :weight normal :height 1.2 :family "Operator Mono"))))
 '(lsp-face-highlight-read ((t (:box (:line-width 1 :color "gray97")))))
 '(org-date ((t (:background "#EAFFEA" :height 1.1 :foreground "dark green" :family "Ubuntu Mono"))))
 '(org-table ((t (:background "#EAFFEA" :height 1.1 :foreground "dark green" :family "Ubuntu Mono"))))
 '(region ((t (:inherit highlight :background "SkyBlue"))))
 '(web-mode-html-attr-name-face ((t (:foreground "dark orange" :slant italic))))
 '(web-mode-html-tag-face ((t (:foreground "DeepSkyBlue1" :weight semi-bold :height 1.2 :family "Courier New"))))
 '(web-mode-keyword-face ((t (:foreground "#F92672" :slant italic :weight normal :height 1.2 :family "Operator Mono")))))
)
