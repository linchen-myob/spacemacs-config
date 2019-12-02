(setq-default
 typescript-indent-level 2)
(add-hook 'typescript-tsx-mode-hook 'emmet-mode)

(setq emmet-expand-jsx-className? t)

(defun tslint-fix-file ()
  (interactive)
  (message "tslint --fixing the file" (buffer-file-name))
  (shell-command (concat "tslint --fix -p " (projectile-project-root) "tsconfig.json -c " (projectile-project-root) "tslint.json " (buffer-file-name))))

(defun tslint-fix-file-and-revert ()
  (interactive)
  (tslint-fix-file)
  (revert-buffer t t))

(add-hook 'typescript-mode-hook
					(lambda ()
						(define-key typescript-mode-map (kbd "H-t") 'mocha-test-at-point)
						(define-key typescript-mode-map (kbd "C-H-t") 'mocha-test-file)
						(define-key typescript-mode-map (kbd "H-f") 'tslint-fix-file-and-revert)
						(define-key typescript-mode-map (kbd "H-p") 'prettier-js)
            (local-set-key (kbd "C-x C-e") 'ts-send-last-sexp)
            (local-set-key (kbd "C-M-x") 'ts-send-last-sexp-and-go)
            (local-set-key (kbd "C-c b") 'ts-send-buffer)
            (local-set-key (kbd "C-c C-b") 'ts-send-buffer-and-go)
						(local-set-key (kbd "C-c l") 'ts-load-file-and-go)
						))
(add-hook 'typescript-tsx-mode-hook
					(lambda ()
						;; (add-hook 'after-save-hook 'import-js-fix nil 'make-it-local)
						(define-key typescript-tsx-mode-map (kbd "H-t") 'mocha-test-at-point)
						(define-key typescript-tsx-mode-map (kbd "C-H-t") 'mocha-test-file)
						(define-key typescript-tsx-mode-map (kbd "H-f") 'tslint-fix-file-and-revert)
						(define-key typescript-tsx-mode-map (kbd "H-p") 'prettier-js)))

(setq web-mode-enable-auto-quoting nil)
(setq rtog/mode-repl-alist '((typescript-mode . run-ts)))

(provide 'my-typescript)
