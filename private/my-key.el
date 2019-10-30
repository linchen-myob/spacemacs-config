;; (winum-mode)
(global-set-key (kbd "H-k") 'kill-current-buffer)
;; (global-set-key (kbd "C-H-k") 'kill-buffer-and-window)
(global-set-key (kbd "H-m") 'spacemacs/toggle-maximize-buffer)
(global-set-key (kbd "H-0") 'neotree-show)
(global-set-key (kbd "H-)") 'neotree-hide)
(global-set-key (kbd "H-8") 'magit-status)
(global-set-key (kbd "H-9") 'magit-log-all)
(global-set-key (kbd "H-/") 'spacemacs/projectile-shell-pop)
(global-set-key (kbd "H-+") 'evil-numbers/inc-at-pt)
(global-set-key (kbd "H-_") 'evil-numbers/dec-at-pt)
;; (global-set-key (kbd "H-3") (other-buffer *spacemacs*))
;; (global-set-key (kbd "H-4") 'spacemacs/persp-switch-to-4)

(global-set-key (kbd "M-0") 'spacemacs/persp-switch-to-0)
(global-set-key (kbd "M-1") 'spacemacs/persp-switch-to-1)
(global-set-key (kbd "M-2") 'spacemacs/persp-switch-to-2)
(global-set-key (kbd "M-3") 'spacemacs/persp-switch-to-3)
(global-set-key (kbd "M-4") 'spacemacs/persp-switch-to-4)
(global-set-key (kbd "M-5") 'spacemacs/persp-switch-to-5)
(global-set-key (kbd "M-6") 'spacemacs/persp-switch-to-6)
(global-set-key (kbd "M-7") 'spacemacs/persp-switch-to-7)

(defun toggle-term ()
  "toggle term"
  (interactive)
	(if (equal (substring (buffer-name) 0 5) "*term")
			(spacemacs/alternate-buffer)
		(projectile-run-term "/bin/zsh")
		)
	)

(global-set-key (kbd "H-'") 'toggle-term)
(define-key input-decode-map "\C-i" [C-i])
(define-key input-decode-map [?\C-\[] (kbd "<C-[>"))

;; (spacemacs/set-leader-keys "0" 'spacemacs/projectile-shell-pop)

;; (global-set-key (kbd "<f5>") 'youdao-dictionary-search-at-point+)
(global-set-key (kbd "C-H-h") 'previous-buffer)
(global-set-key (kbd "C-H-l") 'next-buffer)
;; (global-set-key (kbd "<C-tab>") 'tabbar-forward-tab)
;; (global-set-key (kbd "<C-s-tab>") 'tabbar-backward-tab)
;; (global-set-key (kbd "C-H-j") 'tabbar-forward-group)
;; (global-set-key (kbd "C-H-k") 'tabbar-backward-group)
(global-set-key (kbd "C-=") 'upward-mark-thing)
;; (global-set-key [backspace] 'evil-delete-backward-char)

;; indent guide
(add-hook 'prog-mode-hook 'highlight-indent-guides-mode)
(setq highlight-indent-guides-method 'character)
(setq highlight-indent-guides-character ?\|)

(setq highlight-indent-guides-auto-odd-face-perc 15)
(setq highlight-indent-guides-auto-even-face-perc 15)
(setq highlight-indent-guides-auto-character-face-perc 20)

(setq highlight-indent-guides-delay 0)



(provide 'my-key)
