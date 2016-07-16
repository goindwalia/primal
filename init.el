;; init -- emacs configuration

;; add configuration sub-directories

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(let ((default-directory "~/.emacs.d/"))
  (normal-top-level-add-subdirs-to-load-path))

;; set the default (start) directory
(if (string= "" (getenv "EMACS_HOME"))
    (defvar emacs_home (getenv "EMACS_HOME")) (defvar emacs_home "~/"))
(setq default-directory emacs_home)

;; load all other configuration
(require 'packages)
(require 'keybindings)
(require 'development)

;; enable the cyberpunk theme
(load-theme 'cyberpunk t)

;; disable the default startup message
(setq inhibit-startup-message t)

;; enable global line numbers
(global-linum-mode t)
(setq linum-format "%4d \u2502 ")

;; simplify prompts (only yes or no)
(defalias 'yes-or-no-p 'y-or-n-p)

;; enable system clipboard
(require 'pbcopy)
(turn-on-pbcopy)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (nyan-mode helm-projectile go-eldoc company-go go-autocomplete auto-complete exec-path-from-shell project-explorer web-mode rainbow-delimiters py-autopep8 pbcopy markdown-mode magit go-mode js2-mode flycheck elpy cyberpunk-theme better-defaults))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )


(setq backup-directory-alist `(("." . "~/.saves")))
(setq backup-by-copying t)
(setq delete-old-versions t
  kept-new-versions 6
  kept-old-versions 2
  version-control t)

(defun go-mode-setup ()
 (setq compile-command "go build -v && go test -v && go vet")
 (define-key (current-local-map) "\C-c\C-c" 'compile)
 (go-eldoc-setup)
 (setq gofmt-command "goimports")
 (add-hook 'before-save-hook 'gofmt-before-save)
 (local-set-key (kbd "M-.") 'godef-jump))
(add-hook 'go-mode-hook 'go-mode-setup)

(require 'auto-complete-config)
(require 'go-autocomplete)

(require 'helm-config)
(require 'helm-projectile)
(require 'nyan-mode)
(nyan-mode 1)
(helm-autoresize-mode 1)
(helm-mode 1)
(helm-projectile-on)
(projectile-global-mode)
