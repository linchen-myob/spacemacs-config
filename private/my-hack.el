;; ;; fix issues yasnippet is the only one candidates for company
;; ;; (defun jj*--company-calculate-candidates (prefix)
;;   (let ((candidates (cdr (assoc prefix company-candidates-cache)))
;;         (ignore-case (company-call-backend 'ignore-case)))
;;     (or candidates
;;         (when company-candidates-cache
;;           (let ((len (length prefix))
;;                 (completion-ignore-case ignore-case)
;;                 prev)
;;             (cl-dotimes (i (1+ len))
;;               (when (setq prev (cdr (assoc (substring prefix 0 (- len i))
;;                                            company-candidates-cache)))
;;                 (setq candidates (all-completions prefix prev))
;;                 (cl-return t)))))
;;         (progn
;;           ;; No cache match, call the backend.
;;           (setq candidates (company--preprocess-candidates
;;                             (company--fetch-candidates prefix)))
;;           ;; Save in cache.
;;           (push (cons prefix candidates) company-candidates-cache)))
;;     ;; Only now apply the predicate and transformers.
;;     (setq candidates (company--postprocess-candidates candidates))
;;     (when candidates
;;       (if (or (cdr candidates)
;;               (get-text-property 0 'yas-template (car candidates))
;;               (not (eq t (compare-strings (car candidates) nil nil
;;                                           prefix nil nil ignore-case))))
;;           candidates
;;         t))))

;; ;; (advice-add 'company-calculate-candidates
;;             :override 'jj*--company-calculate-candidates)

;; ;; (defun jj*--company-show-inline-p ()
;;   (and (and (not (cdr company-candidates))
;;             (not (get-text-property 0 'yas-template (car company-candidates))))
;;        company-common
;;        (or (eq (company-call-backend 'ignore-case) 'keep-prefix)
;;            (string-prefix-p company-prefix company-common))))
;; ;; (advice-add 'company--show-inline-p :override 'jj*--company-show-inline-p)


;; fix js2r-rename ;; Rename variable

(defun chen-js2r-rename-var ()
  "Renames the variable on point and all occurrences in its lexical scope."
  (if (fboundp 'evil-insert-state) (evil-insert-state))
  (interactive)
  (js2r--guard)
  (js2r--wait-for-parse
   (let* ((current-node (js2r--local-name-node-at-point))
          (len (js2-node-len current-node))
          (current-start (js2-node-abs-pos current-node))
          (current-end (+ current-start len)))
     (save-excursion
       (mapc (lambda (beg)
               (when (not (= beg current-start))
                 (goto-char beg)
                 (set-mark (+ beg len))
                 (mc/create-fake-cursor-at-point)))
             (js2r--local-var-positions current-node)))
     (push-mark current-end)
     (goto-char current-start)
     (activate-mark))
   (mc/maybe-multiple-cursors-mode)))
(advice-add 'js2r-rename-var :override 'chen-js2r-rename-var)

;;(add-to-list 'mc--default-cmds-to-run-once 'js2r-rename-var)

;; 不要总是问我“quit ediff session ?"
(defun disable-y-or-n-p (orig-fun &rest args)
(cl-letf (((symbol-function 'y-or-n-p) (lambda (prompt) t)))
  (apply orig-fun args)))

(advice-add 'ediff-quit :around #'disable-y-or-n-p)

(provide 'my-hack)
