(defun dotspacemacs/layers ()
  (setq common-layers '(
     spacemacs-project
     spacemacs-navigation
     spacemacs-editing
     fasd
     neotree
     (multiple-cursors :variables multiple-cursors-backend 'evil-mc)
     (auto-completion :variables
                      auto-completion-enable-help-tooltip t
                      auto-completion-enable-snippets-in-popup t
											auto-completion-idle-delay 0.01
                      auto-completion-private-snippets-directory "~/MyConfig/private/snippets/")
     yaml
     git
     ;; (wakatime :variables
     ;;           wakatime-api-key  "bf4dec38-82d7-49f1-a6d9-6fbc737c2b18"
     ;;           wakatime-cli-pathk "/usr/local/bin/wakatime")
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
   dotspacemacs-folding-method 'origami
   dotspacemacs-configuration-layers (if (version<= emacs-version "26.1")
                                         (append common-layers
                                                 '(imenu-list
                                                   html
                                                   import-js
                                                   prettier
		                                               react
                                                   spacemacs-layouts
                                                   restclient
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
                                                   (lsp :variables
                                                        lsp-navigation 'simple
                                                        lsp-ui-sideline-enable nil)
                                                   (typescript :variables
                                                               typescript-fmt-on-save 't
                                                               typescript-fmt-tool 'prettier
                                                               typescript-backend #'lsp)
                                                   docker
		                                               (terraform :variables terraform-auto-format-on-save t)
                                                   ))
                                       (append common-layers '(emacs-lisp org)))
   dotspacemacs-additional-packages '(
                                      ov
                                      hexo
                                      ;; ace-jump-mode
                                      ;; org-octopress
                                      git-msg-prefix
                                      npm-mode
                                      mocha
																			eterm-256color
																			thingopt
                                      indium
                                      ;; ts-comint
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
                                      company-tabnine
																			highlight-indent-guides
                                      ;; tabbar
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
   dotspacemacs-themes (if (version<= emacs-version "26.1") '(misterioso) '(leuven))
   dotspacemacs-colorize-cursor-according-to-state t
   dotspacemacs-default-font '(
                               "Monaco"
                               :size 12
                               :weight light
                               :width normal
                               :powerline-scale 0.8)
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
   dotspacemacs-maximized-at-startup t
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
   ))

(defun dotspacemacs/user-config ()
  ;; (org-defkey org-mode-map [(meta return)] 'org-meta-return)
  (delete-selection-mode t)
  (package-initialize)
  (add-to-list 'load-path "~/.spacemacs.d/private/")
  (setq yas-snippet-dirs (append '("~/.spacemacs.d/private/snippets/") yas-snippet-dirs))
  (require 'my-key)
  (require 'my-text)
  (require 'my-hack)
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

  ;; (defadvice switch-to-buffer (before save-buffer-now activate)
  ;;   (when buffer-file-name (save-buffer)))
  ;; (defadvice other-window (before other-window-now activate)
  ;;   (when buffer-file-name (save-buffer)))
  ;; (setq recentf-save-file (format "/tmp/recentf.%s" (emacs-pid)))
  ;; (setq powerline-height 14)
  ;; (setq powerline-default-separator 'icons)
  ;; (setq powerline-image-apple-rgb t)
  ;; (setq powerline-default-separator 'icons)
  ;; (spaceline-compile)
  (setq ns-use-srgb-colorspace t)
  ;; (focus-autosave-mode)

  ;; (setq company-auto-complete-chars nil)

  ;; (setq auto-save-interval 5)
  (global-evil-matchit-mode)

  (if (version<= emacs-version "26.1") (server-start))
  ;; (setq neo-theme (if (display-graphic-p) 'icons 'arrow))
  ;; (setq neo-vc-integration '(face))
  ;; (setq meghanada-javac-xlint "-Xlint:all,-processing")
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
 '(custom-safe-themes
	 (quote
		("fa2b58bb98b62c3b8cf3b6f02f058ef7827a8e497125de0254f56e373abee088" "bd7b7c5df1174796deefce5debc2d976b264585d51852c962362be83932873d9" "b3775ba758e7d31f3bb849e7c9e48ff60929a792961a2d536edec8f68c671ca5" default)))
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
 '(mocha-jest-command "jest --config jest.config.js --colors")
 '(package-selected-packages
	 (quote
		(highlight-indent-guides yapfify utop tuareg caml sqlup-mode sql-indent seeing-is-believing rvm ruby-tools ruby-test-mode ruby-refactor ruby-hash-syntax rubocopfmt rubocop rspec-mode robe rbenv rake pytest pyenv-mode py-isort pippel pipenv pyvenv pip-requirements ocp-indent ob-elixir mvn minitest meghanada maven-test-mode lsp-python-ms python lsp-java live-py-mode importmagic groovy-mode groovy-imports pcache gradle-mode flycheck-ocaml merlin flycheck-mix flycheck-credo emojify emoji-cheat-sheet-plus helm helm-core dune cython-mode company-emoji company-anaconda chruby bundler inf-ruby browse-at-remote blacken anaconda-mode pythonic alchemist elixir-mode org-plus-contrib persp-projectile ov centered-window ace-jump-mode tabbar magit-tbdiff vdiff-magit diffview org-preview-html company-tabnine git-msg-prefix multi-web-mode yarn-mode ts-comint realgud-node-inspect realgud indium hide-lines graphql impatient-mode counsel-css zenburn-theme zen-and-art-theme yaml-mode ws-butler winum white-sand-theme which-key wgrep web-mode web-beautify volatile-highlights vi-tilde-fringe uuidgen use-package underwater-theme ujelly-theme twilight-theme twilight-bright-theme twilight-anti-bright-theme toxi-theme toc-org tide typescript-mode thingopt terraform-mode hcl-mode tao-theme tangotango-theme tango-plus-theme tango-2-theme tagedit sunny-day-theme sublime-themes subatomic256-theme subatomic-theme spaceline powerline spacegray-theme soothe-theme solarized-theme soft-stone-theme soft-morning-theme soft-charcoal-theme smyx-theme smex smeargle slim-mode shell-pop seti-theme scss-mode sass-mode reverse-theme reveal-in-osx-finder restart-emacs request rebecca-theme rainbow-delimiters railscasts-theme pyim pyim-basedict purple-haze-theme pug-mode professional-theme popwin planet-theme phoenix-dark-pink-theme phoenix-dark-mono-theme persp-mode pcre2el pbcopy paradox spinner pangu-spacing osx-trash osx-dictionary orgit organic-green-theme org-projectile org-category-capture org-present org-pomodoro alert log4e gntp org-octopress ctable orglue epic org-mime org-download org-bullets open-junk-file omtose-phellack-theme oldlace-theme occidental-theme obsidian-theme npm-mode noctilux-theme neotree naquadah-theme mustang-theme multi-term move-text monochrome-theme molokai-theme moe-theme mocha minimal-theme material-theme majapahit-theme magit-gitflow madhat2r-theme macrostep lush-theme lorem-ipsum livid-mode skewer-mode simple-httpd linum-relative link-hint light-soap-theme launchctl js2-refactor multiple-cursors js2-mode js-doc jbeans-theme jazz-theme ivy-hydra ir-black-theme inkpot-theme indent-guide imenu-list hydra lv hungry-delete htmlize hl-todo highlight-parentheses highlight-numbers parent-mode highlight-indentation heroku-theme hemisu-theme helm-make hc-zenburn-theme haml-mode gruvbox-theme gruber-darker-theme grandshell-theme gotham-theme google-translate golden-ratio gnuplot gitignore-mode gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link git-gutter-fringe+ git-gutter-fringe fringe-helper git-gutter+ git-gutter gandalf-theme fuzzy focus-autosave-mode flycheck-pos-tip flycheck flx-ido flx flatui-theme flatland-theme find-by-pinyin-dired fill-column-indicator fasd farmhouse-theme fancy-battery eyebrowse expand-region exotica-theme exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-search-highlight-persist highlight evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-magit magit transient git-commit with-editor evil-lisp-state smartparens evil-indent-plus evil-iedit-state iedit evil-exchange evil-escape evil-ediff evil-args evil-anzu anzu evil goto-chg undo-tree eval-sexp-fu eterm-256color xterm-color espresso-theme eshell-z eshell-prompt-extras esh-help emmet-mode elisp-slime-nav dumb-jump f drag-stuff dracula-theme dockerfile-mode docker json-mode tablist magit-popup docker-tramp json-snatcher json-reformat django-theme diminish diff-hl darktooth-theme autothemer darkokai-theme darkmine-theme darkburn-theme dakrone-theme cyberpunk-theme counsel-projectile projectile pkg-info epl counsel swiper company-web web-completion-data company-tern s dash-functional tern company-statistics company-quickhelp pos-tip company column-enforce-mode color-theme-sanityinc-tomorrow color-theme-sanityinc-solarized coffee-mode clues-theme clean-aindent-mode cherry-blossom-theme busybee-theme bubbleberry-theme birds-of-paradise-plus-theme bind-map bind-key badwolf-theme auto-yasnippet yasnippet auto-highlight-symbol auto-compile packed async apropospriate-theme anti-zenburn-theme ample-zen-theme ample-theme all-the-icons-ivy ivy all-the-icons-gnus dash all-the-icons-dired all-the-icons memoize alect-themes aggressive-indent afternoon-theme adaptive-wrap ace-window ace-pinyin pinyinlib ace-link avy ac-ispell auto-complete popup monokai-theme)))
 '(pdf-view-midnight-colors (quote ("#b2b2b2" . "#292b2e")))
 '(projectile-test-suffix-function (quote default-projectile-suffix-unless-gradlew))
 '(safe-local-variable-values
	 (quote
		((eval projectile-register-project-type
					 (quote npm)
					 (quote
						("package.json"))
					 :compile "npm install" :test "npm test" :run "npm run start" :test-suffix ".spec")
		 (typescript-backend . tide)
		 (typescript-backend . lsp)
		 (javascript-backend . tern)
		 (javascript-backend . lsp)))))
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
