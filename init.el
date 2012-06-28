; -*- Mode: Emacs-Lisp ; Coding: utf-8 -*-
;; ------------------------------------------------------------------------
;; @ load-path

;; load-pathの追加関数
(defun add-to-load-path (&rest paths)
  (let (path)
    (dolist (path paths paths)
      (let ((default-directory (expand-file-name (concat user-emacs-directory path))))
        (add-to-list 'load-path default-directory)
        (if (fboundp 'normal-top-level-add-subdirs-to-load-path)
            (normal-top-level-add-subdirs-to-load-path))))))

;; load-path
(add-to-load-path "elisp")


(push "/usr/local/bin" exec-path)
(setq make-backup-files nil)
(setq auto-save-default nil)
(setq-default tab-width 2)
(setq-default indent-tabs-mode nil)
(setq inhibit-startup-message t)
(fset 'yes-or-no-p 'y-or-n-p)
(delete-selection-mode t)
(scroll-bar-mode -1)
(tool-bar-mode -1)
(blink-cursor-mode t)
(show-paren-mode t)
(column-number-mode t)
(set-fringe-style -1)
(tooltip-mode -1)
(set-face-background 'region "#555")

;; タイトルバーにファイルのフルパス表示
(setq frame-title-format
      (format "%%f - Emacs@%s" (system-name)))

;; 行番号表示
(global-linum-mode t)
(set-face-attribute 'linum nil
                    :foreground "#800"
                    :height 0.9)

;; 行番号フォーマット
;;(setq linum-format "%4d")

;; 最近使ったファイルをメニューに表示
(recentf-mode t)

;; 最近使ったファイルの表示数
(setq recentf-max-menu-items 10)

;; 最近開いたファイルの保存数を増やす
(setq recentf-max-saved-items 3000)

;; ミニバッファの履歴を保存する
(savehist-mode 1)

;; ミニバッファの履歴の保存数を増やす
(setq history-length 3000)

;; フレームの透明度
(set-frame-parameter (selected-frame) 'alpha '(0.85))

;; モードラインに行番号表示
(line-number-mode t)

;; モードラインに列番号表示
(column-number-mode t)

;; Coding system.
(set-default-coding-systems 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-buffer-file-coding-system 'utf-8)
(prefer-coding-system 'utf-8)

;; Yen-key and backslash.
;(define-key global-map [?\] [?\\])
;(define-key global-map [?\C-\] [?\C-\\])
;(define-key global-map [?\M-\] [?\M-\\])
;(define-key global-map [?\C-\M-\] [?\C-\M-\\])

;; Custom.
(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(inhibit-default-init t)
 '(inhibit-startup-buffer-menu t)
 '(inhibit-startup-screen t))

(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 )

;; Font, width, height, color.
(if (eq (window-system) 'ns)
    (progn
      (create-fontset-from-ascii-font "Menlo-15:weight=normal:slant=normal" nil "menlokakugo")
      (set-fontset-font "fontset-menlokakugo"
            'unicode
            (font-spec :family "Hiragino Maru Gothic ProN" :size 14)
            nil
            'append)
      (add-to-list 'default-frame-alist '(font . "fontset-menlokakugo"))
      (add-to-list 'default-frame-alist '(width . 128))
      (add-to-list 'default-frame-alist '(height . 60))
      (add-to-list 'default-frame-alist '(foreground-color . "black"))
      (add-to-list 'default-frame-alist '(background-color . "white"))
      (add-to-list 'default-frame-alist '(cursor-color . "blue4"))))

;; Set background color of current line.
;; Color table: http://life.a.la9.jp/hp/color/rgb-tab.html
;;(global-hl-line-mode 1)
;;(set-face-background 'hl-line "oldlace")

;; AutoInstall
;;(when (require 'auto-install nil t)
;;  (setq auto-install-directory "~/.emacs.d/elisp/")
;;  (auto-install-update-emacswiki-package-name t)
;;  (auto-install-compatibility-setup))

;; Remember point in file.
(setq-default save-place t)
(require 'saveplace)

;; ------------------------------------------------------------------------
;; @  color-theme.el
;; http://code.google.com/p/gnuemacscolorthemetest/
;;(when (and (require 'color-theme nil t) (window-system))
;;  (color-theme-initialize)
;;  (color-theme-clarity))

(setq message-beep 'silent)
