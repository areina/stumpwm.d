;; -*-lisp-*-

(in-package :stumpwm)

(defun echo-progress (val &key label width)
  (message "~A ~A% ~A"
	   (if label (concat label ":") "")
	   (round val)
	   (progress-string val width)))

(defun progress-string (val &optional width)
  (let* ((width (or width 20))
	 (progress (round (* width (/ val 100))))
	 (rest (- width progress)))
    (concat "["
	    (apply #'concat (loop repeat progress collect "|"))
	    "|"
	    (apply #'concat (loop repeat rest collect " "))
	    "]")))

