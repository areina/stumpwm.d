;; -*-lisp-*-

(in-package :stumpwm)

(defvar *stumpwm-config-dir* "~/.stumpwm.d/"
  "StumpWM configuration directory.")

(setf *startup-message* "Never Stop Hacking!")

;; ;;Set the default shell
(setf *shell-program* (stumpwm::getenv "SHELL")) ;getenv is not exported

;; load some contrib modules
(mapcar #'load-module '("cpu"
                        "mem"
			"battery-portable"
                        "net"
                        "wifi"
                        "disk"
                        "ttf-fonts"))

(setq disk::*disk-usage-paths* '("/" "/home"))

(defun load-user-module (name)
  (load (make-pathname :defaults *stumpwm-config-dir*
                       :name name
                       :type "lisp")))

(load-user-module "swank")
(load-user-module "utils")
(load-user-module "theme")
(load-user-module "applications")
(load-user-module "media-keys")

;; (run-shell-command "setxkbmap -geometry \"thinkpad(us)\" -option \"grp:shifts_toggle,ctrl:nocaps\" us,es")
(run-shell-command "xrdb -merge -I ~/ ~/.Xresources")
