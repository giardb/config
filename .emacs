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
(add-to-list 'load-path "/home/giab/.opam/system/share/emacs/site-lisp/")

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
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("51277c9add74612c7624a276e1ee3c7d89b2f38b1609eed6759965f9d4254369" "e87a2bd5abc8448f8676365692e908b709b93f2d3869c42a4371223aab7d9cf8" default))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; Add opam emacs directory to the load-path
     (setq opam-share (substring (shell-command-to-string "opam
   config var share 2> /dev/null") 0 -1))
(add-to-list 'load-path (concat opam-share
				"/emacs/site-lisp"))
;; Load merlin-mode
;;(require 'merlin)
;; Start merlin on ocaml files
;;(add-hook 'tuareg-mode-hook 'merlin-mode t)
;;(add-hook 'caml-mode-hook 'merlin-mode t)
;; Enable auto-complete
;;(setq merlin-use-auto-complete-mode 'easy)
;; Use opam switch to lookup ocamlmerlin binary
;;(setq merlin-command 'opam)
