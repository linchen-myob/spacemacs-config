(require 'hexo)
(setq org-ellipsis "▼")
(setq spaceline-org-clock-p t)
(setq-default org-use-sub-superscripts nil) ;; 关闭org中 _ 和^ 下缀和上缀的问题

(setq org-capture-templates
      '(("t" "Technial Study" entry (file+headline "~/Library/Mobile Documents/iCloud~com~appsonthemove~beorg/Documents/org/list.org" "技术学习计划")
         "* TODO [#B] %?\n  %i\n"
         :empty-lines 1)
        ("r" "Reading" entry (file+headline "~/Library/Mobile Documents/iCloud~com~appsonthemove~beorg/Documents/org/list.org" "读书计划")
         "* TODO [#B] %?\n  %i\n"
         :empty-lines 1)
        ("w" "Writing" entry (file+headline "~/Library/Mobile Documents/iCloud~com~appsonthemove~beorg/Documents/org/list.org" "写作计划")
         "* TODO [#B] %?\n  %i\n "
         :empty-lines 1)
        ))

;;An entry without a cookie is treated just like priority ' B '.
;;So when create new task, they are default 重要且紧急
(setq org-agenda-custom-commands
      '(
        ("w" . "任务安排")
        ("wa" "重要且紧急的任务" tags-todo "+PRIORITY=\"A\"")
        ("wb" "重要且不紧急的任务" tags-todo "-Weekly-Monthly-Daily+PRIORITY=\"B\"")
        ("wc" "不重要且紧急的任务" tags-todo "+PRIORITY=\"C\"")
        ("b" "Blog" tags-todo "BLOG")
        ;; ("p" . "项目安排")
        ;; ("pw" tags-todo "PROJECT+WORK+CATEGORY=\"Plan\"")
        ;; ("pl" tags-todo "PROJECT+DREAM+CATEGORY=\"Read\ It\ Later\"")
        ("W" "Weekly Review"
         ((stuck "") ;; review stuck projects as designated by org-stuck-projects
          (tags-todo "PROJECT") ;; review all projects (assuming you use todo keywords to designate projects)
          ))))
(setq org-agenda-files '("~/Library/Mobile Documents/iCloud~com~appsonthemove~beorg/Documents/org/list.org"))

;; using alfred to capture
(defun make-orgcapture-frame ()
  "Create a new frame and run org-capture."
  (interactive)
  (org-capture))
(setq org-attach-screenshot-command-line "screencapture -i %f")

(setq org-download-screenshot-method "screencapture -i %s")
(setq org-image-actual-width 400)

;; (setq org-publish-project-alist
;;       '(("myBlog"
;;          :base-directory "~/Documents/MyBlog/"
;;          :base-extension "org"
;;          :recursive t
;;          :publishing-directory "source/_posts/"
;;          :publishing-function org-jekyll-publish-to-html
;;          )))

(require 'org-octopress)
(setq org-octopress-directory-top       "~/Documents/MyBlog/")
(setq org-octopress-directory-posts     "~/Documents/MyBlog/source/_posts") ;文章发布目录
(setq org-octopress-directory-org-top   "~/Documents/MyBlog")
(setq org-octopress-directory-org-posts "~/Documents/MyBlog/source/_drafts") ;org文章目录

(add-hook 'org-octopress-summary-mode-hook
          #'(lambda () (local-set-key (kbd "q") 'bury-buffer)))
(defun hexo-my-blog ()
  (interactive)
  (hexo "~/Documents/MyBlog/"))


(defun org-custom-link-img-export (path desc format)
  (cond
   ((eq format 'html)
    (format "<img src=\"%s\" alt=\"%s\" width=\"400\"/>" path desc)))) ;the path of the image in webserver

(org-add-link-type "img" 'org-custom-link-img-follow 'org-custom-link-img-export)

(org-add-link-type
 "image-url"
 (lambda (path)
   (let ((img (expand-file-name
           (concat (md5 path) "." (file-name-extension path))
           temporary-file-directory)))
     (if (file-exists-p img)
     (find-file img)
       (url-copy-file path img)
       (find-file img))))
 'org-custom-link-img-export)

(defun image-url-overlays ()
  "Put image overlays on remote image urls."
  (interactive)
  (loop for image-url in (org-element-map (org-element-parse-buffer) 'link
                           (lambda (link)
                             (when (string= "image-url" (org-element-property :type link))
                               link)))
        do
        (let* ((path (org-element-property :path image-url))
               (ov (make-overlay (org-element-property :begin image-url)
                                 (org-element-property :end image-url)))
               (img (create-image (expand-file-name
                                   (concat (md5 path)
                                           "."
                                           (file-name-extension
                                            path))
                                   temporary-file-directory) (and 400 'imagemagick) nil :width 400)))
          (url-copy-file path (expand-file-name (concat (md5 path) "." (file-name-extension path)) temporary-file-directory) t)
          (overlay-put ov 'display img)
          (overlay-put ov 'image-url t))))

(defun image-url-clear-overlays ()
  "Reove overlays on image-urls."
  (interactive)
  (require 'ov)
  (ov-clear 'image-url))

(add-hook 'org-mode-hook
          (lambda ()
            (define-key org-mode-map (kbd "H-r") 'image-url-overlays)))
(provide 'my-org-simple)
