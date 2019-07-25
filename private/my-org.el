(setq org-indent-mode t)
(setq org-ellipsis "▼")
(setq spaceline-org-clock-p t)
(eval-after-load 'autoinsert
  '(define-auto-insert
     '("\\.org\\'" . "org header")
     '("Add export params"
       "#+TITLE: " (file-name-nondirectory (buffer-file-name))\n
       "#+AUTHOR: 林晨<lc1990linux@gmail.com>" \n
       "#+SETUPFILE: /home/chris2/Documents/Blog/utils/latex.setup" \n \n
       "#+SETUPFILE: /home/chris2/Documents/Blog/utils/worg.setup" \n \n
       "#+SETUPFILE: /home/chris2/Documents/Blog/utils/theme-readtheorg.setup" \n \n
       > _ \n)))
(setq org-latex-packages-alist
      '(("" "graphicx" t)
        ("" "longtable" nil)
        ("" "float" nil)))
;; source: https://lists.gnu.org/archive/html/emacs-orgmode/2013-06/msg00240.html
(defun my-auto-tex-cmd (backend)
  "when exporting from .org with latex,
   automatically run latex, pdflatex, or xelatex as appropriate,
   using latexmk."
  (let ((texcmd))
    (setq texcmd "latexmk -pdf %f")
    (if (string-match "LATEX_CMD: pdflatex" (buffer-string))
        (progn
          (setq texcmd "latexmk -pdf -pdflatex='pdflatex -file-line-error --shell-escape -synctex=1' %f")
          (setq org-latex-default-packages-alist
                '(("AUTO" "inputenc" t)
                  ("T1"   "fontenc"   t)
                  (""     "fixltx2e"  nil)
                  (""     "wrapfig"   nil)
                  (""     "soul"      t)
                  (""     "textcomp"  t)
                  (""     "marvosym"  t)
                  (""     "wasysym"   t)
                  (""     "latexsym"  t)
                  (""     "amssymb"   t)
                  (""     "hyperref"  nil)))))
    (if (string-match "LATEX_CMD: xelatex" (buffer-string))
        (progn
          (setq texcmd "latexmk -pdflatex='xelatex -file-line-error --shell-escape -synctex=1' -pdf %f")
          (setq org-latex-listings 'minted
                org-latex-packages-alist '(("" "minted"))
                org-latex-pdf-process
                '("pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f"
                  "pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f"))
          (setq org-latex-minted-options
                '(
                  ;;("frame" "lines")
                  ("fontsize" "\\scriptsize")
                  ;; ("linenos" "")
                  ))
          (setq org-latex-default-packages-alist '())
          ;; (setq org-latex-default-packages-alist
          ;;       '(
          ;;         ("" "fontspec" t)
          ;;         ("" "xunicode" t)
          ;;         ("" "url" t)
          ;;         ("" "rotating" t)
          ;;         ("" "fancyhdr" t)
          ;;         ("" "lastpage" t)
          ;;         ;; ("" "memoir-article-styles" nil)
          ;;         ("american" "babel" t)
          ;;         ("babel" "csquotes" t) 
          ;;         ("" "listings" t)
          ;;         ("svgnames" "xcolor" t)
          ;;         ("" "soul" t)
          ;;         ("xetex, colorlinks=true, urlcolor=FireBrick, plainpages=false, pdfpagelabels, bookmarksnumbered" "hyperref" nil)
          ;;         ))
          ;; (setq org-latex-classes
          ;;       (cons '("memarticle"
          ;;               "\\documentclass[11pt,oneside,article]{memoir}"
          ;;               ("\\section{%s}" . "\\section*{%s}")
          ;;               ("\\subsection{%s}" . "\\subsection*{%s}")
          ;;               ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
          ;;               ("\\paragraph{%s}" . "\\paragraph*{%s}")
          ;;               ("\\subparagraph{%s}" . "\\subparagraph*{%s}"))
          ;;             org-latex-classes))))
          ))
    (setq org-latex-pdf-process (list texcmd))))
(add-hook 'org-export-before-parsing-hook 'my-auto-tex-cmd)
(setq org-capture-templates
      '(("p" "Plan" entry (file+headline "~/Library/Mobile Documents/iCloud~com~appsonthemove~beorg/Documents/org/plan.org" "Plan")
         "* TODO [#B] %?\n  %i\n"
         :empty-lines 1)
        ("t" "Task" entry (file+headline "~/Library/Mobile Documents/iCloud~com~appsonthemove~beorg/Documents/org/gtd.org" "Task")
         "* TODO [#A] %?\n  %i\n"
         :empty-lines 1)
        ("n" "notes" entry (file+headline "~/Library/Mobile Documents/iCloud~com~appsonthemove~beorg/Documents/org/notes.org" "Quick notes")
         "* %?\n  %i\n %U"
         :empty-lines 1)
        ("b" "Book Reading" entry (file+headline "~/Documents/Blog/reading/2016.org" "Book Note")
         "* %?\n  %i\n %U"
         :empty-lines 1)
        ("d" "Diary" entry (file+headline "~/Documents/org/diary.org" "Diary")
         "* %U\n  %i\n %?"
         :empty-lines 1)
        ("B" "Blog Ideas" entry (file+headline "~/Library/Mobile Documents/iCloud~com~appsonthemove~beorg/Documents/org/plan.org" "Blog Ideas")
         "* TODO [#B] %?\n  %i\n %U"
         :empty-lines 1)
        ("s" "Code Snippet" entry
         (file "~/Documents/org/snippets.org")
         "* %?\t%^g\n#+BEGIN_SRC %^{language}\n\n#+END_SRC")
        ("w" "work" entry (file+headline "~/Library/Mobile Documents/iCloud~com~appsonthemove~beorg/Documents/org/work.org" "ThoughtWorks")
         "* TODO [#A] %?\n  %i\n %U"
         :empty-lines 1)
        ("c" "Chrome" entry (file+headline "~/Library/Mobile Documents/iCloud~com~appsonthemove~beorg/Documents/org/notes.org" "Read It Later")
         "* TODO [#C] %?\n %(zilongshanren/retrieve-chrome-current-tab-url)\n %i\n %U"
         :empty-lines 1)
        ("l" "links" entry (file+headline "~/Library/Mobile Documents/iCloud~com~appsonthemove~beorg/Documents/org/notes.org" "Read It Later")
         "* TODO [#C] %?\n  %i\n %a \n %U"
         :empty-lines 1)
        ("j" "Journal Entry"
         entry (file+datetree "~/Documents/org/journal.org")
         "* %?"
         :empty-lines 1)))

;;An entry without a cookie is treated just like priority ' B '.
;;So when create new task, they are default 重要且紧急
(setq org-agenda-custom-commands
      '(
        ("w" . "任务安排")
        ("wa" "重要且紧急的任务" tags-todo "+PRIORITY=\"A\"")
        ("wb" "重要且不紧急的任务" tags-todo "-Weekly-Monthly-Daily+PRIORITY=\"B\"")
        ("wc" "不重要且紧急的任务" tags-todo "+PRIORITY=\"C\"")
        ("b" "Blog" tags-todo "BLOG")
        ("p" . "项目安排")
        ("pw" tags-todo "PROJECT+WORK+CATEGORY=\"Plan\"")
        ("pl" tags-todo "PROJECT+DREAM+CATEGORY=\"Read\ It\ Later\"")
        ("W" "Weekly Review"
         ((stuck "") ;; review stuck projects as designated by org-stuck-projects
          (tags-todo "PROJECT") ;; review all projects (assuming you use todo keywords to designate projects)
          ))))
(setq org-agenda-files '("~/Library/Mobile Documents/iCloud~com~appsonthemove~beorg/Documents/org"))

(setq org-publish-project-alist
      '(("myBlog"
         :base-directory "~/Documents/Blog/"
         :base-extension "org"
         :recursive t
         :publishing-directory "source/_posts/"
         :publishing-function org-md-export-to-markdown
         )))
(require 'org-octopress)
(setq org-octopress-directory-top       "~/Documents/Blog/")
(setq org-octopress-directory-posts     "~/Documents/Blog/source/_posts") ;文章发布目录
(setq org-octopress-directory-org-top   "~/Documents/Blog")
(setq org-octopress-directory-org-posts "~/Documents/Blog/blog") ;org文章目录
;; (setq org-octopress-setup-file          "~/Documents/Blog/setupfile.org")

;; (evilify org-octopress-summary-mode org-octopress-summary-mode-map)
(add-hook 'org-octopress-summary-mode-hook
          #'(lambda () (local-set-key (kbd "q") 'bury-buffer)))

(require 'ox-publish)
(defun org-custom-link-img-follow (path)
  (org-open-file-with-emacs
   (format "../source/img/%s" path)))   ;the path of the image in local dic

(defun org-custom-link-img-export (path desc format)
  (cond
   ((eq format 'html)
    (format "<img src=\"/img/%s\" alt=\"%s\"/>" path desc)))) ;the path of the image in webserver

(org-add-link-type "img" 'org-custom-link-img-follow 'org-custom-link-img-export)

(defun my-org-screenshot ()
  "Take a screenshot into a time stamped unique-named file in the
same directory as the org-buffer and insert a link to this file."
  (interactive)
  (org-display-inline-images)
  (setq filename
        (concat
         (make-temp-name
          (concat (file-name-nondirectory (buffer-file-name))
                  "_imgs/"
                  (format-time-string "%Y%m%d_%H%M%S_")) ) ".png"))
  (unless (file-exists-p (file-name-directory filename))
    (make-directory (file-name-directory filename)))
                                        ; take screenshot
  (if (eq system-type 'darwin)
      (call-process "screencapture" nil nil nil "-i" filename))
  (if (eq system-type 'gnu/linux)
      (call-process "import" nil nil nil filename))
                                        ; insert into file if correctly taken
  (if (file-exists-p filename)
      (insert (concat "[[file:" filename "]]"))))

;; using alfred to capture
(defun make-orgcapture-frame ()
  "Create a new frame and run org-capture."
  (interactive)
  (make-frame '((name . "remember") (width . 80) (height . 16)
                (top . 400) (left . 300)
                (font . "-apple-Monaco-medium-normal-normal-*-13-*-*-*-m-0-iso10646-1")
                ))
  (select-frame-by-name "remember")
  (org-capture))

(setq-default org-use-sub-superscripts nil) ;; 关闭org中 _ 和^ 下缀和上缀的问题

(provide 'my-org)
