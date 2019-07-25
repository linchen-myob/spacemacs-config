(setq projectile-project-search-path '("~/Documents/"))
(setq projectile-enable-caching t)
(setq projectile-sort-order 'recentf)
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

(defun projectile-test-suffix (project-type)
  "Find default test files suffix based on PROJECT-TYPE."
  (cond
   ((member project-type '(rails-rspec ruby-rspec)) "_spec")
   ((member project-type '(rails-test ruby-test lein-test go)) "_test")
   ((member project-type '(scons)) "test")
   ((member project-type '(generic)) ".test")
   ((member project-type '(npm)) ".unit")
   ((member project-type '(maven symfony)) "Test")
   ((member project-type '(gradlew grails)) "Tests")))

(defun default-projectile-suffix-unless-gradlew (project-type)
  (if (eq project-type 'gradlew)
      "Tests"
    (projectile-test-suffix project-type)))

(custom-set-variables
 '(projectile-test-suffix-function 'default-projectile-suffix-unless-gradlew))

(provide 'my-project)

