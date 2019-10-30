(setq-default
 typescript-indent-level 2)
(add-hook 'typescript-tsx-mode-hook 'emmet-mode)

(setq emmet-expand-jsx-className? t)

;; (defun tslint-fix-file ()
;;   (interactive)
;;   (message "tslint --fixing the file" (buffer-file-name))
;;   (shell-command (concat "tslint --fix -p tsconfig.json -c tslint.json " (buffer-file-name))))

;; (defun tslint-fix-file-and-revert ()
;;   (interactive)
;;   (tslint-fix-file)
;;   (revert-buffer t t))

;; (add-hook 'typescript-mode-hook
;;           (lambda () (add-hook 'after-save-hook 'tslint-fix-file nil 'make-it-local)))

;; (add-hook 'typescript-mode-hook
;;           (lambda () (add-hook 'after-save-hook 'import-js-fix nil 'make-it-local)))
(add-hook 'typescript-mode-hook
					(lambda ()
						(define-key typescript-mode-map (kbd "H-t") 'mocha-test-at-point)
						(define-key typescript-mode-map (kbd "C-H-t") 'mocha-test-file)
						;; (define-key typescript-mode-map (kbd "H-f") 'tslint-fix-file-and-revert)
            (local-set-key (kbd "C-x C-e") 'ts-send-last-sexp)
            (local-set-key (kbd "C-M-x") 'ts-send-last-sexp-and-go)
            (local-set-key (kbd "C-c b") 'ts-send-buffer)
            (local-set-key (kbd "C-c C-b") 'ts-send-buffer-and-go)
            (local-set-key (kbd "C-c l") 'ts-load-file-and-go)
						(define-key typescript-mode-map (kbd "H-p") 'prettier-js)))
(add-hook 'typescript-tsx-mode-hook
					(lambda ()
						;; (add-hook 'after-save-hook 'import-js-fix nil 'make-it-local)
						(define-key typescript-tsx-mode-map (kbd "H-t") 'mocha-test-at-point)
						(define-key typescript-tsx-mode-map (kbd "C-H-t") 'mocha-test-file)
						(define-key typescript-tsx-mode-map (kbd "H-p") 'prettier-js)))
(setq web-mode-enable-auto-quoting nil)
(setq rtog/mode-repl-alist '((typescript-mode . run-ts)))
(defun get-region()
	(interactive)
	(message (thing-at-point 'line t))
	)

(defun my-shell-execute(cmd)
	(interactive "sShell command: ")
	(shell (get-buffer-create "my-shell-buf"))
	(process-send-string (get-buffer-process "my-shell-buf") (concat cmd "\n")))

(defun test-runner()
	"save any unsaved buffers and run tester"
	(interactive)
	(save-some-buffers t)
	(setq region (get-region))
	(message region)
	(string-match "[it|describe](\\([^@]+\\),\\([^@]+\\)" region)
	(setq testName (match-string 1 region))
	(setq command (concat "jest --colors --env=jsdom " buffer-file-name " -t " testName))
	(message command)
	(my-shell-execute command)
	)

(defun run-all-test()
	(interactive)
	(save-some-buffers t)
	(shell-command (concat "jest --color " buffer-file-name)))
(add-hook 'auto-fix-mode-hook
					(lambda () (add-hook 'before-save-hook #'auto-fix-before-save)))

(provide 'my-typescript)
