(require 'expand-region-core)

(defun er/add-tsx-mode-expansions ()
  (setq er/try-expand-list '(er/mark-html-attribute er/mark-inner-tag er/mark-outer-tag)))

(add-hook 'typescript-tsx-mode-hook 'er/add-tsx-mode-expansions)

(provide 'tsx-mode-expansion)
