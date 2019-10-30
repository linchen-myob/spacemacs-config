;; (global-git-gutter+-mode)               ;

;; (global-git-commit-mode t)

;; (use-package company-tabnine :ensure t)
;; (add-to-list 'company-backends #'company-tabnine)
;; (use-package tabbar :ensure t
;;   :after projectile :config
;;   (defun tabbar-buffer-groups ()
;;     "Return the list of group names the current buffer belongs to.
;; Return a list of one element based on major mode."
;;     (list
;;      (cond
;;       ((or (get-buffer-process (current-buffer))
;;            ;; Check if the major mode derives from `comint-mode' or
;;            ;; `compilation-mode'.
;;            (tabbar-buffer-mode-derived-p
;;             major-mode '(comint-mode compilation-mode)))
;;        "Process"
;;        )
;;       ((member (buffer-name)
;;                '("*scratch*" "*Messages*" "*dashboard*" "TAGS"))
;;        "Common"
;;        )
;;       ((eq major-mode 'dired-mode)
;;        "Dired"
;;        )
;;       ((memq major-mode
;;              '(help-mode apropos-mode Info-mode Man-mode))
;;        "Help"
;;        )
;;       ((memq major-mode
;;              '(rmail-mode
;;                rmail-edit-mode vm-summary-mode vm-mode mail-mode
;;                mh-letter-mode mh-show-mode mh-folder-mode
;;                gnus-summary-mode message-mode gnus-group-mode
;;                gnus-article-mode score-mode gnus-browse-killed-mode))
;;        "Mail"
;;        )
;;     ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;     ;;; Group tabs by projectile projects
;;       ((memq (current-buffer)
;;              (condition-case nil
;;                  (projectile-buffers-with-file-or-process (projectile-project-buffers))
;;                (error nil)))
;;        (projectile-project-name)
;;        )
;;     ;;; end of hacking
;;     ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;       (t
;;        ;; Return `mode-name' if not blank, `major-mode' otherwise.
;;        (if (and (stringp mode-name)
;;                 ;; Take care of preserving the match-data because this
;;                 ;; function is called when updating the header line.
;;                 (save-match-data (string-match "[^ ]" mode-name)))
;;            mode-name
;;          (symbol-name major-mode))
;;        ))))

;;   (tabbar-mode )
;;   )
;; ;; Tabbar
;; (require 'tabbar)
;; ;; Tabbar settings
;; (set-face-attribute
;;  'tabbar-default nil
;;  :background "gray20"
;;  :foreground "gray20"
;;  :box '(:line-width 1 :color "gray20" :style nil)
;;  :height 1.4)
;; (set-face-attribute
;;  'tabbar-unselected nil
;;  :background "gray30"
;;  :foreground "white"
;;  :box '(:line-width 5 :color "gray30" :style nil))
;; (set-face-attribute
;;  'tabbar-selected nil
;;  :background "gray75"
;;  :foreground "black"
;;  :box '(:line-width 5 :color "gray75" :style nil))
;; (set-face-attribute
;;  'tabbar-highlight nil
;;  :background "white"
;;  :foreground "black"
;;  :underline nil
;;  :box '(:line-width 5 :color "white" :style nil))
;; (set-face-attribute
;;  'tabbar-button nil
;;  :box '(:line-width 1 :color "gray20" :style nil))
;; (set-face-attribute
;;  'tabbar-separator nil
;;  :background "gray20"
;;  :height 1.2)

(use-package git-msg-prefix
  :ensure t
  :config
  (setq git-msg-prefix-log-flags " --author=clin --since='1 week ago' --no-merges" )
	(add-hook 'git-commit-mode-hook 'git-msg-prefix)
	)

(setq ivy-sort-functions-alist nil)
(local-set-key (kbd "C-c i") 'git-msg-prefix)
(provide 'my-git)
