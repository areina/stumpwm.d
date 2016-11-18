# stumpwm.d
StumpWM configuration files

The `.stumpwmrc` file should include:

```lisp
(in-package :stumpwm)
(load "~/.stumpwm.d/init.lisp")
```

StumpWM contrib modules repository is included as a git submodule. After
clone this repo, remember execute:

```shell
git submodule init
git submodule update
```
