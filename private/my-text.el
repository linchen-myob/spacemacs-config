(setq drag-stuff-modifier 'hyper)
(drag-stuff-global-mode)
(drag-stuff-define-keys)
(global-subword-mode 1)

(evilnc-default-hotkeys)

;;;; mark;;;;;
;; F3 => fast to mark current word
;; M-h => fast to mard current paragraphs
;; Spc v -> expand-region start current word then press v to mark more and more

;;;;;evil-nerd-commenter

;; Emacs key bindings
;; 👍️ (global-set-key (kbd "M-;") 'evilnc-comment-or-uncomment-lines)
;; 👍️"C-c c" 'evilnc-copy-and-comment-lines
;; 👍️", cp" 'evilnc-comment-or-uncomment-paragraphs
;; 👍️"Space ;" 'evilnc-comment-operator ; if you prefer backslash key

;; Vim key bindings
;; (global-set-key (kbd "C-c l") 'evilnc-quick-comment-or-uncomment-to-the-line)
;; (global-set-key (kbd "C-c c") 'evilnc-copy-and-comment-lines)
;; (global-set-key (kbd "C-c p") 'evilnc-comment-or-uncomment-paragraphs)
;; ", ci" 'evilnc-comment-or-uncomment-lines
;; ", ll" 'evilnc-quick-comment-or-uncomment-to-the-line
;; ", cr" 'comment-or-uncomment-region
;; ", cv" 'evilnc-toggle-invert-comment-line-by-line
;; ", ."  'evilnc-copy-and-comment-operator


;;;;;; evil-surround is awesome
;;;Normal mode
;;;-----------
;;;ds  - delete a surrounding
;;;cs  - change a surrounding
;;;ys  - add a surrounding
;;;yS  - add a surrounding and place the surrounded text on a new line + indent it
;;;yss - add a surrounding to the whole line
;;;ySs - add a surrounding to the whole line, place it on a new line + indent it
;;;ySS - same as ySs
;;;
;;;Visual mode
;;;-----------
;;;s   - in visual mode, add a surrounding
;;;S   - in visual mode, add a surrounding but place text on new line + indent it
;;;
;;;Insert mode
;;;-----------
;;;<CTRL-s> - in insert mode, add a surrounding
;;;<CTRL-s><CTRL-s> - in insert mode, add a new line + surrounding + indent
;;;<CTRL-g>s - same as <CTRL-s>
;;;<CTRL-g>S - same as <CTRL-s><CTRL-s>
;;;👍️ ci[ ci( ci< ci{ 删除一对 [], (), <>, 或{} 中的所有字符并进入插入模式
;;;👍 ️ci” ci’ ci` 删除一对引号字符 ”  ‘ 或 ` 中所有字符并进入插入模式
;;;👍️ cit 删除一对 HTML/XML 的标签内部的所有字符并进入插入模式
;;;
;;;👍️ ci: 例如，ci(，或者ci)，将会修改()之间的文本；
;;;👍️ di: 剪切配对符号之间文本；
;;;👍️ yi: 复制；
;;;👍️ ca: 同ci，但修改内容包括配对符号本身；
;;;👍️ da: 同di，但剪切内容包括配对符号本身；
;;;👍️ ya: 同yi，但复制内容包括配对符号本身。
;;;👍️ PS. dib等同于di(。diB等同于di{。
(provide 'my-text)
