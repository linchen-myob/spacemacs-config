(setq projectile-project-search-path '("~/Projects"))
(setq projectile-enable-caching t)
(setq projectile-sort-order 'recentf)
(setq projectile-switch-project-action 'neotree-projectile-action)
(defun occur-dwin ()
  "Call `occur' with a sane default."
  (interactive)
  (push (if (region-active-p)
            (buffer-substring-no-properties
             (region-beginning)
             (region-end))
          (let ((sym (thing-at-point 'symbol)))
            (when (stringp sym)
              (regexp-quote sym))))
        regexp-history)
  (call-interactively 'occur))
;;(add-hook 'projectile-after-switch-project-hook 'neotree-projectile-action)

(global-set-key (kbd "M-s o") 'occur-dwim)
;; (global-set-key (kbd "<f8>") 'treemacs)
;; (global-set-key (kbd "H-0") 'treemacs-select-window)
(global-set-key (kbd "<f9>") 'imenu-list-smart-toggle)


(provide 'my-project)

