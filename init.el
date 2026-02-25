(setq package-enable-at-startup nil)
(setq package-native-compile t)

;; ensure the right directory is set (tumbleweed does something weird here).
(setq-default emacs-dir "~/.config/emacs/")

;; packages
;; add MELPA
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)

;; org
(use-package org
 :ensure t)
;; rainbow delimiters to easily display bracket depth.
(use-package rainbow-delimiters
  :ensure t)
;; Prot's excellent theme package
(use-package ef-themes
  :ensure t)
;; Prot's excellent note-taking package
(use-package denote
  :ensure t)				
;; Allow reading and annotation of pdfs via emacs (useful!)
(use-package pdf-tools
  :ensure t)
;; emacs document annotator.
(use-package org-noter
  :ensure t)
;; consult search package for quick searching (buffer search M-s b)
(use-package consult
  :ensure t)
;; consult package used for notes
(use-package consult-notes
  :ensure t)
;; context sensitive suggested actions
(use-package embark
  :ensure t)
(use-package embark-consult
  :ensure t)
;; minibuffer productivity as recommended by Prot.
;; sets the height of the minibuffer and allows keyboard control.
(use-package vertico
  :ensure t)
;; shows docstring for functions in the minibuffer.
(use-package marginalia
  :ensure t)
;; focus mode for reading and writing written by Prot. Can be used like org-present.
(use-package logos
  :ensure t)
(use-package corfu
  :ensure t)
;; emacs timers by Prot.
(use-package tmr
  :ensure t)
;; emacs completion style for minibuffer functions; allows clearer searching.
(use-package orderless
  :ensure t)
;; dired previews
(use-package dired-preview
  :ensure t)
;; font changes to be used in conjunction with org-present.
(use-package fontaine
  :ensure t)
;; simple presentations
(use-package org-present
  :ensure t)
;; word count mode in the mode-line
(use-package wc-mode
  :ensure t)
;; spell check, pop-up not entirely functional.
(use-package flyspell-correct
  :ensure t)
(use-package flyspell-correct-popup
  :ensure t)
;; print from emacs
(use-package lpr
  :ensure t)
;; keyboard shortcuts shown in the minibuffer
(use-package which-key
  :ensure t)
;; rss
(use-package elfeed
  :ensure t)
(use-package elfeed-protocol
  :ensure t)
;; email
(use-package notmuch
  :ensure t)
;; pandoc/LaTeX engine - ox-pandoc, requires pandoc and texlive-recommended packages installed via apt
(use-package ox-pandoc
  :ensure t)

;; custom packages & libraries.
(load-file "~/.config/emacs/csrc/shortcuts.el")
(load-file "~/.config/emacs/csrc/workflow.el")
(load-file "~/.config/emacs/csrc/anglifying.el")

;; Modes
(which-key-mode)
(global-corfu-mode)
(setq inhibit-startup-screen 1)
(add-hook 'org-mode-hook #'rainbow-delimiters-mode)
(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)
(setq make-backup-files nil)
(setq tramp-default-method "ssh")
(which-key-setup-minibuffer)
(delete-selection-mode 1)

;; UI
(tool-bar-mode -1)
(menu-bar-mode -1)
(marginalia-mode 1)
(rainbow-delimiters-mode 1)
(desktop-save-mode -1) ;; avoid multiple files per document
(global-display-line-numbers-mode 1)
(global-visual-line-mode t)
(global-font-lock-mode 1)
(auto-save-visited-mode -1) ;; this prevents auto-saving of files when opened.
(add-to-list 'default-frame-alist '(fullscreen . fullboth)) ;; fullboth, not maximized, gives what we're after.

;; Keybinds
;; open modifier binds
;; M-s
;; M-g
;; C-z

;; keymap-global-set is the recommended function.
;; org
(keymap-global-set "C-c t" 'org-todo)
(keymap-global-set "C-c r" 'org-refile)
;; consult
(keymap-global-set "M-s q" 'consult-grep)
(keymap-global-set "M-s b" 'consult-buffer)
(keymap-global-set "M-s M-f" 'consult-find)
(keymap-global-set "M-s t" 'consult-outline)

;; fontaine/present
(keymap-global-set "M-s f" 'fontaine-set-preset)

;; denote
(keymap-global-set "C-c d" 'denote-open-or-create)
(keymap-global-set "C-c s" 'denote-signature)
(keymap-global-set "C-c w" 'denote-link)

;;navigation
(keymap-global-set "C-x w" 'other-window)
(keymap-global-set "C-x M-e" 'eval-buffer)
(keymap-global-set "M-s s" 'search-forward-regexp)
(keymap-global-set "C-x w" 'other-window)

;; functions
(keymap-global-set "M-s d" 'delete-region)
(keymap-global-set "C-x C-e" 'eval-last-sexp)
(keymap-global-set "C-x M-e" 'eval-buffer)
(keymap-global-set "C-x C-k C-k" 'kill-current-buffer)

;; misc
(keymap-global-set "C-;" 'flyspell-correct-wrapper)

;; email
(keymap-global-set "C-x m" 'notmuch-hello)
(keymap-global-set "C-x C-m" `compose-mail)

;; elfeed
(keymap-global-set "M-s M-e" 'eww-follow-link)
(define-key elfeed-show-mode-map "v" 'forward-paragraph)
(define-key elfeed-show-mode-map "V" 'backward-paragraph)
(define-key elfeed-show-mode-map "l" 'eww-follow-link)

;; org
(keymap-global-set "C-c a" 'org-agenda)
(keymap-global-set "C-c c" 'org-capture)
(keymap-global-set "C-c l" 'org-store-link)

;; erc
(keymap-global-set "C-x c" 'erc-run-srht)

;; unbind C-z for an additional modifier keybind - by default suspends a frame
(keymap-global-unset "C-z") 

;; Modeline
;; WIP.

;; Orderless
;; makes 'M-x' a bit fuzzier.
(setq completion-styles '(orderless basic)
      completion-category-overrides '((file (styles basic partial-completion))))

;; Vertico
(setq vertico-count 6)
(setq vertico-cycle t)
(vertico-mode 1)

;; Fontaine
;; WIP

;; Dired
(setopt use-short-answers 1) ;; this is here for delete needing a 'y' or 'n'.
(setopt dired-preview-global-mode t)

;; OX-Pandoc
;; https://pandoc.org/MANUAL.html#variables-for-latex
(setq org-pandoc-options-for-latex-pdf '((pdf-engine . "pdflatex")))
(defun pdf-export ()
  "Shorthand comand for ox-pandoc export-to-pdflatex"
  (interactive)
  (org-pandoc-export-to-latex-pdf)
  )

;; Elfeed
(keymap-global-set "C-x r" 'elfeed)
(setq elfeed-search-filter "@1-months-ago")
(setq elfeed-use-curl t)		
(setq elfeed-curl-extra-arguments '("--insecure")) ;; apparently needed as elfeed doesn't have its own certs.
(setq elfeed-protocol-enabled-protocols '(fever))
(setq elfeed-protocol-fever-maxsize 50) ;; 50 is the maximum
(setq elfeed-protocol-fever-update-unread-only t)
(setq elfeed-protocol-fever-fetch-catagory-as-tag t)
(setq elfeed-protocol-feeds '(("fever+https://"
				 :api-url "https://"
				 :use-authinfo t)))
(elfeed-protocol-enable) ;; is this needed?
(add-hook 'elfeed-show-mode-hook 'scroll-lock-mode)


;; Flyspell
;; WIP

;; erc
(setq erc-sasl-auth-source-function #'erc-auth-source-search)
    
(defun erc-run-srht ()
  "Run ERC and connect to chat.sr.ht"
  (interactive)
  (erc-tls :server "chat.sr.ht" :user "$user/libera.chat" :nick "$user")
  ;; must have the second part of :user otherwise it won't work.
  )

(defun erc-run-libera ()
  "Run ERC and connect to Libera"
  (interactive)
  (erc-tls :server "irc.libera.chat" :user "$user" :nick "$user")
  )

;; wc-mode
(add-hook 'org-mode-hook 'wc-mode)


;; org
;; heavily WIP
(setq org-directory "~/Documents/org/")
(setq org-defaults-notes-file (concat org-directory "inbox.org"))
(setq org-agenda-files (list "inbox.org"))
(setq org-id-locations-file "~/Documents/org/idfile")

(setq org-priority-highest 65)
(setq org-priority-default 66)
(setq org-priority-lowest 67)
(setq org-todo-keywords
      '((sequence "TODO(t)" "DOING(d)" "WAITING(w@)" "LONGTERM(l)" "|" "DONE(x!)" "FUTURE(f)")))
(setq-default org-use-speed-commands t)
(setq-default org-agenda-include-diarty t)
(setq diargy-show-holidays nil)
(setopt org-log-into-drawer t)
;; from Rainer's org-mode videos
(defun org-copy-id-to-clipboard()
  "Copy the ID property value to killring,
   if no ID is there then create a new unique ID. 
   This function works only in org-mode buffers.

   The purpose of this function is to easily construct id:-links to 
   org-mode items. If its assigned to a key it saves you marking the
   text and copying to the killring."
   (interactive)
   (when (eq major-mode 'org-mode) ; do this only in org-mode buffers
     (setq mytmpid (funcall 'org-id-get-create))
     (kill-new mytmpid)
     (message "Copied %s to killring (clipboard)" mytmpid)
     )
)


;; Consult Notes
;; setup consult notes to point to denote/org directory
;; this is needed for *all* note direcotires.
(setq consult-notes-file-dir-sources
      '("Org" ?o "~/Documents/org"))
(setopt consult-notes-denote-mode t)

;; Denote
;; Denote's defaults are sane and require minimal tweaking
(require 'denote-silo-extras)

;; Printer
(require 'printing)
(pr-update-menus)
(setq lpr-command "gtklp")
(setq ps-lpr-command "gtklp")

;; Ef-themes
(ef-themes-select 'ef-cyprus)
(setq ef-themes-to-toggle '(ef-cyprus ef-elea-dark))

;; Auth Sources
(setq auth-sources '("~/Documents/backups/.authinfo.gpg" "~/.authinfo.gpg" default))

;; Final Steps
(force-mode-line-update t)
(setq epg-pinentry-mode 'loopback)
