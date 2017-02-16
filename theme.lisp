;; -*-lisp-*-

(in-package :stumpwm)

(setf *mode-line-position* :top)
;; how many seconds elapse between each update of the modeline
(setf *mode-line-timeout* 2)

(set-fg-color "#61afef")
(set-bg-color "#21252b")
(set-border-color "#21252b")
(set-win-bg-color "#21252b")
(set-focus-color "#61afef")
(set-unfocus-color "#21252b")
(setf *maxsize-border-width* 1)
(setf *transient-border-width* 1)
(setf *normal-border-width* 1)
(set-msg-border-width 10)
(setf *window-border-style* :thin)
(setf *mode-line-pad-y* 0)

(setf *message-window-gravity* :top)
(setf *input-window-gravity* :top)
(setf *message-window-padding* 14)
;; (setf *mouse-follows-focus* t)

(setf *mode-line-background-color* "#38394c")
(setf *mode-line-foreground-color* "#61afef")
(setf *mode-line-border-color* "#28394c")

(setf *screen-mode-line-format*
      (list ;; "%w | "
       '(:eval (run-shell-command "date +'%d/%m/%Y %H:%M:%S' | tr -d '[:cntrl:]'" t))
       " | %c| %M| WIFI: %I | NET: %l | BATTERY: %B | DISK: %D"))

(set-maxsize-gravity :center)
(set-transient-gravity :top)

(setf *mouse-focus-policy* :sloppy)

(xft:cache-fonts)
(set-font (make-instance 'xft:font
			 :family "Fira Mono"
			 :subfamily "Bold"
			 :size 10
			 :antialiased t))

(defcommand toggle-current-mode-line () ()
  "Toggle the mode line in StumpWM."
  (toggle-mode-line (current-screen) (current-head)))
(define-key *root-map* (kbd "q") "toggle-current-mode-line")

;; stumptray module
(setq stumptray::*tray-viwin-background* "#38394c")
(setq stumptray::*tray-cursor-thickness* -1)
(setq stumptray::*tray-cursor-icon-distance* 1)

;; Random wallpapers

(defparameter *wallpapers* "~/Pictures/Wallpapers/*.jpg")

(defun set-random-wallpaper ()
  (run-shell-command
   (concatenate 'string "feh --bg-fill "
                (namestring
                 (alexandria:random-elt (directory *wallpapers*))))))

(defcommand random-wallpaper () ()
  (set-random-wallpaper))

(random-wallpaper)

;; Code by Male
;; Display the keysequence in progress
(defun key-press-hook (key key-seq cmd)
  (declare (ignore key))
  (unless (eq *top-map* *resize-map*)
    (message "Key sequence: ~A" (print-key-seq (reverse key-seq)))
    (when (stringp cmd)
      ;; Give 'em time to read it.
      (sleep 0.3))))

(defmacro replace-hook (hook fn)
 `(remove-hook ,hook ,fn)
 `(add-hook ,hook ,fn))

(replace-hook *key-press-hook* 'key-press-hook)
