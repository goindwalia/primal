;; keybindings -- set custom keybindings

;; allow shit+arrow key window movement
(windmove-default-keybindings)

(setq mac-command-modifier 'meta)
(setq mac-option-modifier nil)

(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "C-x C-b") 'ibuffer)
(global-set-key (kbd "C-c g") 'magit-status)
(global-set-key (kbd "C-x p") 'project-explorer-open)
(global-set-key (kbd "C-x C-f") 'helm-projectile-find-file)
(global-set-key (kbd "C-x C-a") 'projectile-mode)
(global-set-key (kbd "C-x b") 'helm-buffers-list)
(global-set-key (kbd "C-x f") 'helm-find)
(provide 'keybindings)

;; keybindings end here
