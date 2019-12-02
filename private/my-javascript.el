(setq-default
 js-indent-level 2
 ;; js2-mode
 js2-basic-offset 2
 ;; web-mode
 css-indent-offset 2
 web-mode-markup-indent-offset 2
 web-mode-attr-value-indent-offset 2
 web-mode-css-indent-offset 2
 web-mode-code-indent-offset 2
 web-mode-attr-indent-offset 2)

(with-eval-after-load 'web-mode
  (add-to-list 'web-mode-indentation-params '("lineup-args" . nil))
  (add-to-list 'web-mode-indentation-params '("lineup-concats" . nil))
  (add-to-list 'web-mode-indentation-params '("lineup-calls" . nil)))
(npm-global-mode 1)

(add-hook 'js2-mode-hook 'emmet-mode)
(add-hook 'rjsx-mode-hook 'emmet-mode)
(add-hook 'js2-mode-hook
          (lambda ()
            (define-key js2-mode-map (kbd "H-t") 'mocha-test-at-point)
            (define-key js2-mode-map (kbd "C-H-t") 'mocha-test-file)
            (define-key js2-mode-map (kbd "H-f") 'eslint-fix-file-and-revert)
            (define-key js2-mode-map (kbd "H-p") 'prettier-js)))

(defun eslint-fix-file ()
  (interactive)
  (message "eslint --fixing the file" (buffer-file-name))
  (shell-command (concat "eslint --fix " (buffer-file-name))))

(defun eslint-fix-file-and-revert ()
  (interactive)
  (eslint-fix-file)
  (revert-buffer t t))

(provide 'my-javascript)
