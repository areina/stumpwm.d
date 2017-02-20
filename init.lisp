;; -*-lisp-*-

(run-shell-command "xrdb -merge ~/.Xresources")

(in-package :stumpwm)

(defvar *stumpwm-config-dir* "~/.stumpwm.d/"
  "StumpWM configuration directory.")

(setf *startup-message* "Never Stop Hacking!")

;; ;;Set the default shell
(setf *shell-program* (stumpwm::getenv "SHELL")) ;getenv is not exported

(load "~/quicklisp/setup.lisp")
(ql:quickload "clx-truetype")
(ql:quickload :xembed) ;; Required by stumptray

;; load some contrib modules
(mapcar #'load-module '("cpu"
                        "mem"
			"battery-portable"
                        "net"
                        "wifi"
                        "disk"
                        "ttf-fonts"
                        "stumptray"
                        ))

(defun load-user-module (name)
  (load (make-pathname :defaults *stumpwm-config-dir*
                       :name name
                       :type "lisp")))

(load-user-module "theme")
;; (load-user-module "swank")
(load-user-module "utils")
(load-user-module "applications")
(load-user-module "media-keys")

;; stumptray module
(stumptray::add-mode-line-hooks)

;; disk module
(setq disk::*disk-usage-paths* '("/" "/home"))

;; wifi module
(setq wifi::*iwconfig-path* "/usr/bin/env iwconfig")

