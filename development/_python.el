;; _python -- custom python configuration

;; enable elpy (emacs lisp python)
(elpy-enable)

;; enable rainbow-delimiters
(require 'rainbow-delimiters)
(add-hook `python-mode-hook `rainbow-delimiters-mode)

;; use flycheck not flymake
(when (require 'flycheck nil t)
  (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
  (add-hook 'elpy-mode-hook 'flycheck-mode))

;; enable autopep8 formatting on save
;; ignoring:
;; - E501 - Try to make lines fit within --max-line-length characters.
;; - W293 - Remove trailing whitespace on blank line.
;; - W391 - Remove trailing blank lines.
;; - W690 - Fix various deprecated code (via lib2to3).
(require 'py-autopep8)
(setq py-autopep8-options '("--ignore=E501,W293,W391,W690"))
(add-hook 'python-mode-hook 'py-autopep8-enable-on-save)

;; enable newline-and-indent on return
(define-key global-map (kbd "RET") 'newline-and-indent)

(provide '_python)

;; _python ends here
