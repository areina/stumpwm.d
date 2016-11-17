;; -*-lisp-*-

(in-package :stumpwm)

(defcommand conkeror () ()
	    "run conkeror"
	    (run-or-raise "conkeror" '(:class "Conkeror")))
(define-key *root-map* (kbd "w") "conkeror")

(defcommand emacs () ()
	    "run emacs"
	    (run-or-raise "emacs" '(:class "Emacs")))
(define-key *root-map* (kbd "e") "emacs")

(defcommand lock-screen () ()
	    "lock screen"
  (run-shell-command "light-locker-command --lock"))
(define-key *root-map* (kbd "C-l") "lock-screen")

(defcommand spotify () ()
	    "run spotify"
  (run-or-raise "spotify" '(:class "Spotify")))
(define-key *root-map* (kbd "s") "spotify")

(defcommand urxvt () ()
	    "run urxvt"
	    (run-or-raise "urxvt" '(:class "URxvt")))
(define-key *root-map* (kbd "c") "urxvt")
