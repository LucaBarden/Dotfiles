(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)
(add-to-list 'load-path "~/.emacs.local/")
(require 'simpc-mode)
(add-to-list 'auto-mode-alist '("\\.[hc]\\(pp\\)?\\'" . simpc-mode))
(package-initialize)
(setq warning-minimum-level :emergency)
(add-to-list 'default-frame-alist '(font . "Iosevka-20"))
(set-face-attribute 'default t :font "Iosevka-20")
(setq mac-command-modifier 'meta
      mac-option-modifier 'none
      default-input-method "MacOSX")
(setq mac-option-modifier 'meta)
(setq mac-option-key-is-meta t
      mac-right-option-modifier nil)
(tool-bar-mode 0)
(menu-bar-mode 0)
(scroll-bar-mode 0)
(column-number-mode 1)
(show-paren-mode 1)

(load-theme 'gruber-darker t)
(require 'dired-x)
(setq dired-omit-files
      (concat dired-omit-files "\\|^\\..+$"))
(add-to-list 'auto-mode-alist '("\\.asm\\'" . nasm-mode))
(add-hook 'dired-mode-hook(lambda () (dired-omit-mode)))
(require 'evil)
(evil-mode 1)

(require 'compile)
(require 'multiple-cursors)
(ido-mode 1)
(ido-everywhere 1)
(ido-ubiquitous-mode 1)
(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)

(global-set-key (kbd "C->") 'mc/mark-next-line-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C->") 'mc/mark-all-like-this)

(add-hook 'simpc-mode-hook
	  (lambda ()
	    (interactive)
	    (setq-local fill-paragraph-function 'astyle-buffer)))


(defun kill-dired-buffers ()
  (interactive)
  (mapc (lambda (buffer)
	  (when (eq 'dired-mode (buffer-local-value 'major-mode buffer))
	    (kill-buffer buffer)))
	         (buffer-list)))

(global-set-key (kbd "C-c C-d") 'kill-dired-buffers)

(custom-set-variables
 ;; custom-set-variables was added by custom.
 ;; if you edit it by hand, you could mess it up, so be careful.
 ;; your init file should contain only one such instance.
 ;; if there is more than one, they won't work right.
 '(custom-enabled-themes '(gruber-darker))
 '(custom-safe-themes
   '("e13beeb34b932f309fb2c360a04a460821ca99fe58f69e65557d6c1b10ba18c7" default))
 '(ispell-dictionary nil)
 '(package-selected-packages
   '(magit nasm-mode python-mode ido-completing-read+ multiple-cursors evil gruber-darker-theme)))
(custom-set-faces
 ;; custom-set-faces was added by custom.
 ;; if you edit it by hand, you could mess it up, so be careful.
 ;; your init file should contain only one such instance.
 ;; if there is more than one, they won't work right.
 )
