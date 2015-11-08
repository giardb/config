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

(add-to-list 'load-path "~/.emacs.d/go-mode.el/")
(require 'go-mode-autoloads)

;; affiche les espaces en trop en rouge
(require 'whitespace)
(setq whitespace-style '(face lines-tail trailing))
(global-whitespace-mode t)

;; affiche les accolades et parentheses parrente
(require 'paren)
(show-paren-mode t)

;;line number
(line-number-mode 1)
(global-linum-mode 1)

(defun linum-absolute-numbers ()
  "Set linum numbers to absolute values"
  (setq linum-is-relative 0)
  (setq linum-format
	(lambda (line)
	  (propertize (format
		       (let ((w (length (number-to-string
					 (count-lines (point-min) (point-max))))))
			 (concat " %" (number-to-string w) "d "))
		       line)
		      'face 'linum))))

(defun linum-relative-numbers ()
  "Set linum numbers to relative values"
  (defvar my-linum-current-line-number 0)
  (setq linum-is-relative 1)
  (setq linum-format
	(lambda (line-number)
	  (propertize (format
		       (let ((w (length (number-to-string (count-lines (point-min) (point-max))))))
			 (concat " %" (number-to-string (+ w 1)) "s "))
		       (let ((relative-line (1+ (- line-number my-linum-current-line-number))))
			 (number-to-string (cond ((/= relative-line 0) (- relative-line 1))
						 ((= relative-line 0) -1)))))
		      'face 'linum))))

(defadvice linum-update (around my-linum-update)
  (let ((my-linum-current-line-number (line-number-at-pos)))
    ad-do-it))
(ad-activate 'linum-update)

(defun toggle-linum ()
  "Toggle line number display between absolute and relative numbers"
  (interactive)
  (if (= linum-is-relative 1)
      (linum-absolute-numbers)
        (linum-relative-numbers)))

;;hilight current line
;;(global-hl-line-mode 2)

;;(global-linum-mode t)
;;(setq linum-format "% 3d \u2502")
;;(custom-set-variables'(custom-safe-themes(quote("352daa51b94b33a62b6468e8167aeb285db9fe1b7bd47f21a87f4ea15d491210" default))))
;;(custom-set-faces)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["#2d3743" "#ff4242" "#74af68" "#dbdb95" "#34cae2" "#008b8b" "#00ede1" "#e1e1e0"])
 '(custom-enabled-themes (quote (color-theme-julie)))
 '(custom-safe-themes
   (quote
    ("c3adf5f9ca8c0fee936eadd9ef0885eeb85fe487f3c77b1784f389287968f6dd" "9100c17033e0fdbdf76f34053613d2713e925f0b9b3966adb85cc42e8405da92" "34e7163479ef3669943b3b9b1fabe639d6e0a0453e0de79cea2c52cb520d3bc4" default))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

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


;;;### (autoloads nil ".emacs.d/go-mode.el/go-mode" ".emacs.d/go-mode.el/go-mode.el"
;;;;;;  (22074 23375 969581 890000))
;;; Generated autoloads from .emacs.d/go-mode.el/go-mode.el

(autoload 'go-mode ".emacs.d/go-mode.el/go-mode" "\
Major mode for editing Go source text.

This mode provides (not just) basic editing capabilities for
working with Go code. It offers almost complete syntax
highlighting, indentation that is almost identical to gofmt and
proper parsing of the buffer content to allow features such as
navigation by function, manipulation of comments or detection of
strings.

In addition to these core features, it offers various features to
help with writing Go code. You can directly run buffer content
through gofmt, read godoc documentation from within Emacs, modify
and clean up the list of package imports or interact with the
Playground (uploading and downloading pastes).

The following extra functions are defined:

- `gofmt'
- `godoc'
- `go-import-add'
- `go-remove-unused-imports'
- `go-goto-imports'
- `go-play-buffer' and `go-play-region'
- `go-download-play'
- `godef-describe' and `godef-jump'
- `go-coverage'

If you want to automatically run `gofmt' before saving a file,
add the following hook to your emacs configuration:

\(add-hook 'before-save-hook #'gofmt-before-save)

If you want to use `godef-jump' instead of etags (or similar),
consider binding godef-jump to `M-.', which is the default key
for `find-tag':

\(add-hook 'go-mode-hook (lambda ()
                          (local-set-key (kbd \"M-.\") #'godef-jump)))

Please note that godef is an external dependency. You can install
it with

go get github.com/rogpeppe/godef


If you're looking for even more integration with Go, namely
on-the-fly syntax checking, auto-completion and snippets, it is
recommended that you look at flycheck
\(see URL `https://github.com/flycheck/flycheck') or flymake in combination
with goflymake (see URL `https://github.com/dougm/goflymake'), gocode
\(see URL `https://github.com/nsf/gocode'), go-eldoc
\(see URL `github.com/syohex/emacs-go-eldoc') and yasnippet-go
\(see URL `https://github.com/dominikh/yasnippet-go')

\(fn)" t nil)

(add-to-list 'auto-mode-alist (cons "\\.go\\'" 'go-mode))

(autoload 'gofmt-before-save ".emacs.d/go-mode.el/go-mode" "\
Add this to .emacs to run gofmt on the current buffer when saving:
 (add-hook 'before-save-hook 'gofmt-before-save).

Note that this will cause go-mode to get loaded the first time
you save any file, kind of defeating the point of autoloading.

\(fn)" t nil)

(autoload 'godoc ".emacs.d/go-mode.el/go-mode" "\
Show Go documentation for QUERY, much like M-x man.

\(fn QUERY)" t nil)

(autoload 'go-download-play ".emacs.d/go-mode.el/go-mode" "\
Download a paste from the playground and insert it in a Go buffer.
Tries to look for a URL at point.

\(fn URL)" t nil)

;;;***
