;; packages - load emacs packages

(require 'package)

;; add the melpa package repo
(add-to-list 'package-archives
	     '("melpa" . "http://melpa.org/packages/") t)

(package-initialize)
(when (not package-archive-contents)
  (package-refresh-contents))

(defvar _packages
  '(better-defaults
    nyan-mode
    helm
    helm-projectile
    cyberpunk-theme
    inkpot-theme
    elpy
    flycheck
    js2-mode
    go-mode
    go-autocomplete
    auto-complete
    magit
    markdown-mode
    pbcopy
    py-autopep8
    rainbow-delimiters
    web-mode))

(mapc #'(lambda (package)
	  (unless (package-installed-p package)
	    (package-install package)))
      _packages)

(provide 'packages)

;; packages.el ends here
