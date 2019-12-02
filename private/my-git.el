;; let magit status always show in current window
(setq magit-display-buffer-function
      (lambda (buffer)
        (display-buffer
         buffer (if (and (derived-mode-p 'magit-mode)
                         (memq (with-current-buffer buffer major-mode)
                               '(magit-process-mode
                                 magit-revision-mode
                                 magit-diff-mode
                                 magit-stash-mode
                                 magit-status-mode)))
                    nil
                  '(display-buffer-same-window)))))
(use-package git-msg-prefix
  :ensure t
  :config
  (setq git-msg-prefix-log-flags " --author=clin --since='1 week ago' --no-merges" )
	(add-hook 'git-commit-mode-hook 'git-msg-prefix)
	)

;; (setq ivy-sort-functions-alist nil)
(local-set-key (kbd "C-c i") 'git-msg-prefix)
(provide 'my-git)
