(menu-bar-mode -1)

(setq emacs-lisp-dir "~/.emacs.d/lisp/"
      my-elmode-dir (concat emacs-lisp-dir "elmodes/"))
(setq load-path
      (append load-path (list my-elmode-dir)))

(load "std.el")
(load "std_comment.el")
(if (file-exists-p "~/.myemacs")
    (load-file "~/.myemacs"))
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

(add-hook 'c++-mode-hook 'irony-mode)
(add-hook 'c-mode-hook 'irony-mode)
(add-hook 'objc-mode-hook 'irony-mode)

;; replace the `completion-at-point' and `complete-symbol' bindings in
;; irony-mode's buffers by irony-mode's asynchronous function
(defun my-irony-mode-hook ()
  (define-key irony-mode-map [remap completion-at-point]
    'irony-completion-at-point-async)
  (define-key irony-mode-map [remap complete-symbol]
    'irony-completion-at-point-async))
    (add-hook 'irony-mode-hook 'my-irony-mode-hook)
