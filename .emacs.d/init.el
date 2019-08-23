(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq indent-line-function 'insert-tab)
(defvaralias 'c-basic-offset 'tab-width)
(defvaralias 'cperl-indent-level 'tab-width)

(windmove-default-keybindings)


(load-file "/usr/share/emacs/site-lisp/xcscope/xcscope.el")
(require 'xcscope)
