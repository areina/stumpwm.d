;; -*-lisp-*-

(in-package :stumpwm)

;; Functions

(defun brightness-adjust (delta)
  (run-shell-command (concat "exec xbacklight " delta))
  (echo-progress (brightness-get) :label "Brightness"))

(defun brightness-get ()
  (read-from-string (run-shell-command "xbacklight" t)))

(defun volume-get ()
  (let ((output (run-shell-command "amixer get Master" t)))
    (multiple-value-bind (result matches)
	(cl-ppcre:scan-to-strings "([0-9]+)%" output)
      (read-from-string (aref matches 0)))))

(defun volume-adjust (delta)
  "DELTA should be like \"5%+\"."
  (run-shell-command (format nil "amixer set Master ~D" delta))
  (echo-progress (volume-get) :label "Volume" :width 40))

;; Keys

(defcommand brightness-inc () ()
  (brightness-adjust "+10"))
(define-key *top-map* (kbd "XF86MonBrightnessUp") "brightness-inc")

(defcommand brightness-dec () ()
  (brightness-adjust "-10"))
(define-key *top-map* (kbd "XF86MonBrightnessDown") "brightness-dec")

(defcommand volume-inc () ()
  (volume-adjust "5%+"))
(define-key *top-map* (kbd "XF86AudioRaiseVolume") "volume-inc")

(defcommand volume-dec () ()
	    (volume-adjust "5%-"))
(define-key *top-map* (kbd "XF86AudioLowerVolume") "volume-dec")

(defcommand volume-toggle () ()
  (let ((output (run-shell-command "amixer set Master toggle" t)))
    (multiple-value-bind (result matches)
	(cl-ppcre:scan-to-strings "\\[(on|off)\\]" output)
      (let ((muted (if (equal (aref matches 0) "on") "OFF" "ON")))
		(message "~A ~A"
		 "Volume:"
		 (concat "Mute " muted))))))
(define-key *top-map* (kbd "XF86AudioMute") "volume-toggle")

(define-key *top-map* (kbd "XF86Tools") "exec xfce4-power-manager -c")
(define-key *top-map* (kbd "Print") "exec xfce4-screenshooter")
