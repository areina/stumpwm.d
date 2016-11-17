;; -*-lisp-*-

(load "/home/toni/.emacs.d/elpa/slime-20161109.640/swank-loader.lisp")

(swank-loader:init)
(swank:create-server :port 4004
		     :style swank:*communication-style*
		     :dont-close t)
