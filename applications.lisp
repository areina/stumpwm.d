;; -*-lisp-*-

(in-package :stumpwm)

(defcommand conkeror () ()
	    "run conkeror"
	    (run-or-raise "conkeror" '(:class "Conkeror")))
(define-key *root-map* (kbd "w") "conkeror")

(defcommand chromium () ()
            "run chromium"
	    (run-or-raise "chromium" '(:class "Chromium")))

(defcommand firefox () ()
  "run firefox"
  (run-or-raise "firefox" '(:class "Firefox")))
(define-key *root-map* (kbd "b") "firefox")

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
  (let ((urxvt-with-tmux "urxvt -e zsh -c 'tmux -q has-session && exec tmux attach-session -d || exec tmux new-session -n$USER -s$USER@$HOSTNAME'"))
    (run-or-raise urxvt-with-tmux '(:class "URxvt"))
    (title "URxvt")))
(define-key *root-map* (kbd "c") "urxvt")
