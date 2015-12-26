;;Menu bar off
(menu-bar-mode -1)

;;load path
(setq emacs-lisp-dir "~/.emacs.d/lisp/"
      my-elmode-dir (concat emacs-lisp-dir "elmodes/"))
(setq load-path
      (append load-path (list my-elmode-dir)))

;;Epitech header
(load "std.el")
(load "std_comment.el")

;;Repo melpa, marmalade and gnu
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
			 ("marmalade" . "https://marmalade-repo.org/packages/")
			 ("melpa" . "http://melpa.milkbox.net/packages/")))
(add-to-list 'load-path "~/.emacs.d/elpa/")

;; affiche les espaces en trop en rouge
(require 'whitespace)
(setq whitespace-style '(face lines-tail trailing))
(global-whitespace-mode t)

;; affiche les accolades et parentheses parrente
(require 'paren)
(show-paren-mode)

;;Language mode
(add-hook 'c++-mode-hook 'irony-mode)
(add-hook 'c-mode-hook 'irony-mode)
(add-hook 'objc-mode-hook 'irony-mode)
