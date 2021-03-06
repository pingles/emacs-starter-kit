(setq dotfiles-dir (file-name-directory
                    (or (buffer-file-name) load-file-name)))
(setq vendor-dir (concat dotfiles-dir "/vendor"))
(add-to-list 'load-path vendor-dir)

(when (not package-archive-contents)
  (package-refresh-contents))

;; Add in your own as you wish:
(defvar my-packages '(clojure-mode clojure-test-mode clojurescript-mode slime slime-repl starter-kit starter-kit-bindings starter-kit-lisp starter-kit-ruby)
  "A list of packages to ensure are installed at launch.")

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))

(menu-bar-mode)

(fset 'insertPound "#")
(global-set-key (kbd "M-3") 'insertPound)
(global-set-key (kbd "<s-S-return>") 'ns-toggle-fullscreen)

(set-face-attribute 'default nil :font "Akkurat-Mono 12")

(add-to-list 'load-path "~/.emacs.d/elpa/auto-complete-1.4.20110207")
(require 'auto-complete-config)
(require 'auto-complete)
(ac-config-default)
(add-hook 'clojure-mode-hook 'auto-complete-mode)

(require 'linum+)
(require 'ac-slime)

(require 'protobuf-mode)
(add-to-list 'auto-mode-alist '("\\.proto\\'" . protobuf-mode))

(require 'go-mode)
(require 'go-mode-load)

(add-hook 'slime-mode-hook 'set-up-slime-ac)

(require 'textmate)
(textmate-mode)

(setq linum-format " %d ")
(global-linum-mode)
