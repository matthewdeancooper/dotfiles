;; -*- mode: emacs-lisp -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Configuration Layers declaration.
You should not put any user code in this function besides modifying the variable
values."
  (setq-default
   ;; Base distribution to use. This is a layer contained in the directory
   ;; `+distribution'. For now available distributions are `spacemacs-base'
   ;; or `spacemacs'. (default 'spacemacs)
   dotspacemacs-distribution 'spacemacs
   ;; Lazy installation of layers (i.e. layers are installed only when a file
   ;; with a supported type is opened). Possible values are `all', `unused'
   ;; and `nil'. `unused' will lazy install only unused layers (i.e. layers
   ;; not listed in variable `dotspacemacs-configuration-layers'), `all' will
   ;; lazy install any layer that support lazy installation even the layers
   ;; listed in `dotspacemacs-configuration-layers'. `nil' disable the lazy
   ;; installation feature and you have to explicitly list a layer in the
   ;; variable `dotspacemacs-configuration-layers' to install it.
   ;; (default 'unused)
   dotspacemacs-enable-lazy-installation 'unused
   ;; If non-nil then Spacemacs will ask for confirmation before installing
   ;; a layer lazily. (default t)
   dotspacemacs-ask-for-lazy-installation t
   ;; If non-nil layers with lazy install support are lazy installed.
   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '()
   ;; List of configuration layers to load.
   dotspacemacs-configuration-layers
   '(
     ;; ----------------------------------------------------------------
     ;; Example of useful layers you may want to use right away.
     ;; Uncomment some layer names and press <SPC f e R> (Vim style) or
     ;; <M-m f e R> (Emacs style) to install them.
     ;; ----------------------------------------------------------------
     helm
     (auto-completion :variables
                      auto-completion-enable-snippets-in-popup t
                      auto-completion-enable-help-tooltip 'manual)
     better-defaults
     emacs-lisp
     git
     org
     bibtex
     latex
     shell-scripts
     python
     c-c++
     ess
     pdf-tools
     (shell :variables
            shell-default-height 30
            shell-default-position 'bottom)

     spell-checking
     ;; (spell-checking :variables
     ;; spell-checking-enable-by-default t
     ;; =enable-flyspell-auto-completion= t)
     syntax-checking
     version-control
     vinegar
     (mu4e :variables
           ;; mu4e-enable-notifications t
           ;; mu4e-enable-mode-line t
           mu4e-account-alist t)
     ranger
     )
   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages, then consider creating a layer. You can also put the
   ;; configuration in `dotspacemacs/user-config'.
   dotspacemacs-additional-packages '(
                                      ;; snippets library
                                      yasnippet-snippets
                                      ;; yanking highlights
                                      evil-goggles
                                      ;; ipython support org mode
                                      ob-ipython
                                      ;; Used for pomodoro alarm
                                      sound-wav
                                      ;; latex completion in org
                                      cdlatex
                                      ;; make helm even fuzzier
                                      helm-fuzzier
                                      ;; struc search org from anywhere
                                      helm-org-rifle
                                      )
   ;; A list of packages that cannot be updated.
   dotspacemacs-frozen-packages '()
   ;; A list of packages that will not be installed and loaded.
   dotspacemacs-excluded-packages '(
                                    vi-tilde-fringe
                                    ;; rainbow-delimiters
                                    lorem-ipsum
                                    ;; solarized-theme
                                    neotree
                                    fancy-battery
                                    golden-ratio
                                    evil-tutor
                                    google-translate
                                    doc-view
                                    evil-escape
                                    ;; use ** instead of bullets in org
                                    org-bullets
                                    smooth-srcolling
                                    winum
                                    spaceline
                                    )
   ;; Defines the behaviour of Spacemacs when installing packages.
   ;; Possible values are `used-only', `used-but-keep-unused' and `all'.
   ;; `used-only' installs only explicitly used packages and uninstall any
   ;; unused packages as well as their unused dependencies.
   ;; `used-but-keep-unused' installs only the used packages but won't uninstall
   ;; them if they become unused. `all' installs *all* packages supported by
   ;; Spacemacs and never uninstall them. (default is `used-only')
   dotspacemacs-install-packages 'used-only))

(defun dotspacemacs/init ()
  "Initialization function.
This function is called at the very startup of Spacemacs initialization
before layers configuration.
You should not put any user code in there besides modifying the variable
values."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; If non nil ELPA repositories are contacted via HTTPS whenever it's
   ;; possible. Set it to nil if you have no way to use HTTPS in your
   ;; environment, otherwise it is strongly recommended to let it set to t.
   ;; This variable has no effect if Emacs is launched with the parameter
   ;; `--insecure' which forces the value of this variable to nil.
   ;; (default t)
   dotspacemacs-elpa-https t
   ;; Maximum allowed time in seconds to contact an ELPA repository.
   dotspacemacs-elpa-timeout 5
   ;; If non nil then spacemacs will check for updates at startup
   ;; when the current branch is not `develop'. Note that checking for
   ;; new versions works via git commands, thus it calls GitHub services
   ;; whenever you start Emacs. (default nil)
   dotspacemacs-check-for-update nil
   ;; If non-nil, a form that evaluates to a package directory. For example, to
   ;; use different package directories for different Emacs versions, set this
   ;; to `emacs-version'.
   dotspacemacs-elpa-subdirectory nil
   ;; One of `vim', `emacs' or `hybrid'.
   ;; `hybrid' is like `vim' except that `insert state' is replaced by the
   ;; `hybrid state' with `emacs' key bindings. The value can also be a list
   ;; with `:variables' keyword (similar to layers). Check the editing styles
   ;; section of the documentation for details on available variables.
   ;; (default 'vim)
   dotspacemacs-editing-style 'vim
   ;; If non nil output loading progress in `*Messages*' buffer. (default nil)
   dotspacemacs-verbose-loading nil
   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner 'nil
   ;; List of items to show in startup buffer or an association list of
   ;; the form `(list-type . list-size)`. If nil then it is disabled.
   ;; Possible values for list-type are:
   ;; `recents' `bookmarks' `projects' `agenda' `todos'."
   ;; List sizes may be nil, in which case
   ;; `spacemacs-buffer-startup-lists-length' takes effect.
   dotspacemacs-startup-lists '(
                                ;; (agenda . 5)
                                ;; (todos . 5)
                                )
   ;; True if the home buffer should respond to resize events.
   dotspacemacs-startup-buffer-responsive t
   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'text-mode
   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press <SPC> T n to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(leuven)
   ;; If non nil the cursor color matches the state color in GUI Emacs.
   dotspacemacs-colorize-cursor-according-to-state t
   ;; Default font, or prioritized list of fonts. `powerline-scale' allows to
   ;; quickly tweak the mode-line size to make separators look not too crappy.
   dotspacemacs-default-font '(
                               "Source Code Pro"
                               :size 15
                               :width normal
                               :weight normal
                               :powerline-scale .5)
   ;; The leader key
   dotspacemacs-leader-key "SPC"
   ;; The key used for Emacs commands (M-x) (after pressing on the leader key).
   ;; (default "SPC")
   dotspacemacs-emacs-command-key "SPC"
   ;; The key used for Vim Ex commands (default ":")
   dotspacemacs-ex-command-key ":"
   ;; The leader key accessible in `emacs state' and `insert state'
   ;; (default "M-m")
   dotspacemacs-emacs-leader-key "M-m"
   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
   dotspacemacs-major-mode-leader-key ","
   ;; Major mode leader key accessible in `emacs state' and `insert state'.
   ;; (default "C-M-m")
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   ;; These variables control whether separate commands are bound in the GUI to
   ;; the key pairs C-i, TAB and C-m, RET.
   ;; Setting it to a non-nil value, allows for separate commands under <C-i>
   ;; and TAB or <C-m> and RET.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab t
   ;; If non nil `Y' is remapped to `y$' in Evil states. (default nil)
   dotspacemacs-remap-Y-to-y$ t
   ;; If non-nil, the shift mappings `<' and `>' retain visual state if used
   ;; there. (default t)
   dotspacemacs-retain-visual-state-on-shift t
   ;; If non-nil, J and K move lines up and down when in visual mode.
   ;; (default nil)
   dotspacemacs-visual-line-move-text t
   ;; If non nil, inverse the meaning of `g' in `:substitute' Evil ex-command.
   ;; (default nil)
   dotspacemacs-ex-substitute-global nil
   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Default"
   ;; If non nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout nil
   ;; If non nil then the last auto saved layouts are resume automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts nil
   ;; Size (in MB) above which spacemacs will prompt to open the large file
   ;; literally to avoid performance issues. Opening a file literally means that
   ;; no major mode or minor modes are active. (default is 1)
   dotspacemacs-large-file-size 1
   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location 'cache
   ;; Maximum number of rollback slots to keep in the cache. (default 5)
   dotspacemacs-max-rollback-slots 5
   ;; If non nil, `helm' will try to minimize the space it uses. (default nil)
   dotspacemacs-helm-resize nil
   ;; if non nil, the helm header is hidden when there is only one source.
   ;; (default nil)
   dotspacemacs-helm-no-header nil
   ;; define the position to display `helm', options are `bottom', `top',
   ;; `left', or `right'. (default 'bottom)
   dotspacemacs-helm-position 'bottom
   ;; Controls fuzzy matching in helm. If set to `always', force fuzzy matching
   ;; in all non-asynchronous sources. If set to `source', preserve individual
   ;; source settings. Else, disable fuzzy matching in all sources.
   ;; (default 'always)
   dotspacemacs-helm-use-fuzzy 'always
   ;; If non nil the paste micro-state is enabled. When enabled pressing `p`
   ;; several times cycle between the kill ring content. (default nil)
   dotspacemacs-enable-paste-transient-state nil
   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 0.4
   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; (default 'bottom)
   dotspacemacs-which-key-position 'bottom
   ;; If non nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar nil
   ;; If non nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil
   ;; If non nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native nil
   ;; If non nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (default nil) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup nil
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 90
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 90
   ;; If non nil show the titles of transient states. (default t)
   dotspacemacs-show-transient-state-title t
   ;; If non nil show the color guide hint for transient state keys. (default t)
   dotspacemacs-show-transient-state-color-guide t
   ;; If non nil unicode symbols are displayed in the mode line. (default t)
   dotspacemacs-mode-line-unicode-symbols t
   ;; If non nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters point
   ;; when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling nil
   ;; Control line numbers activation.
   ;; If set to `t' or `relative' line numbers are turned on in all `prog-mode' and
   ;; `text-mode' derivatives. If set to `relative', line numbers are relative.
   ;; This variable can also be set to a property list for finer control:
   ;; '(:relative nil
   ;;   :disabled-for-modes dired-mode
   ;;                       doc-view-mode
   ;;                       markdown-mode
   ;;                       org-mode
   ;;                       pdf-view-mode
   ;;                       text-mode
   ;;   :size-limit-kb 1000)
   ;; (default nil)
   dotspacemacs-line-numbers nil
   ;; Code folding method. Possible values are `evil' and `origami'.
   ;; (default 'evil)
   dotspacemacs-folding-method 'evil
   ;; If non-nil smartparens-strict-mode will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil
   ;; If non-nil pressing the closing parenthesis `)' key in insert mode passes
   ;; over any automatically added closing parenthesis, bracket, quote, etc…
   ;; This can be temporary disabled by pressing `C-q' before `)'. (default nil)
   dotspacemacs-smart-closing-parenthesis nil
   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all
   ;; If non nil, advise quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server nil
   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `ag', `pt', `ack' and `grep'.
   ;; (default '("ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("ag" "pt" "ack" "grep")
   ;; The default package repository used if no explicit repository has been
   ;; specified with an installed package.
   ;; Not used for now. (default nil)
   dotspacemacs-default-package-repository nil
   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed'to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup 'nil
   ))

(defun dotspacemacs/user-init ()
  "Initialization function for user code.
It is called immediately after `dotspacemacs/init', before layer configuration
executes.
 This function is mostly useful for variables that need to be set
before packages are loaded. If you are unsure, you should try in setting them in
`dotspacemacs/user-config' first."
  )

(defun dotspacemacs/user-config ()
  "Configuration function for user code.
This function is called at the very end of Spacemacs initialization after
layers configuration.
This is the place where most of your configurations should be done. Unless it is
explicitly specified that a variable should be set before a package is loaded,
you should place your code here."

  ;; GENERAL
  ;; Edit actual file not sym
  (setq vc-follow-symlinks nil)
  ;; Highlighted yank etc
  (evil-goggles-mode)
  ;; Highlighted time
  (setq evil-goggles-duration 0.100)
  ;; Turn on agressive indent mode globally except:
  (global-aggressive-indent-mode 1)
  (add-to-list 'aggressive-indent-excluded-modes 'html-mode)

  ;; OTHER
  ;; enable helm fuzzier
  (helm-fuzzier-mode 1)

  ;; LATEX
  ;; Some latex stuff told i needed by pdftools
  (add-hook 'TeX-after-compilation-finished-functions #'TeX-revert-document-buffer)
  ;; Use pdf-tools to open PDF files
  (setq TeX-view-program-selection '((output-pdf "PDF Tools"))
        TeX-source-correlate-start-server t)
  ;; Update PDF buffers after successful LaTeX runs
  (add-hook 'TeX-after-compilation-finished-functions
            #'TeX-revert-document-buffer)


  ;; ORG MODE - AGENDA
  ;; Where is the org directory
  (setq org-directory "~/Documents/org")
  ;; Where are the agenda files
  (setq org-agenda-files (list "~/Documents/org/todo.org"))
  ;; Where to capture by default
  (setq org-default-notes-file "~/Documents/org/todo.org")
  ;; open agenda in current window
  ;; (setq org-agenda-window-setup (quote current-window))
  ;; Dont warn me in advance, just on the day
  (setq org-deadline-warning-days 0)
  ;; Dont carry over missed scheduled
  ;; (setq org-scheduled-past-days 0)
  ;; Org capture stuff
  (setq org-capture-templates
        '(("t" "Task" entry (file+headline "~/Documents/org/todo.org" "Tasks")
           "* TODO  %? \n  %i")
          ("T" "Task linked" entry (file+headline "~/Documents/org/todo.org" "Tasks")
           "* TODO %? \n  %i %a")
          ("d" "Calendar" entry (file+headline "~/Documents/org/todo.org" "Calendar")
           "* %? \n  %i")
          ("D" "Calendar linked" entry (file+headline "~/Documents/org/todo.org" "Calendar")
           "* %? \n  %i %a")))

  (setq org-agenda-clockreport-parameter-plist
        (quote (:link t :maxlevel 4 :fileskip0 t :compact t :narrow 80 :formula %)))
  ;; (org-agenda-clockreport-mode)

  ;; Custom agenda stuff
  (setq org-agenda-custom-commands
        '(("u" "Unscheduled"
           ((agenda "" ((org-agenda-ndays 1)))
            (alltodo ""
                     ((org-agenda-skip-function '(or (org-agenda-skip-if nil '(scheduled deadline))))
                      (org-agenda-overriding-header " \n No schedule/deadline"))))
           ((org-agenda-compact-blocks t)))))


  ;; ORG MODE - POMODORO
  (setq org-pomodoro-length 60)
  (setq org-pomodoro-short-break-length 5)
  (setq org-pomodoro-long-break-length 15)
  (setq org-pomodoro-play-sounds 1)


  ;; ORG MODE - SRC
  ;; fontify code in source code blocks
  (setq org-src-fontify-natively t)
  ;; better latex in org mode for maths
  (add-hook 'org-mode-hook 'turn-on-org-cdlatex)
  ;; (setq org-image-actual-width nil)


  ;; ORG MODE - BABEL
  (org-babel-do-load-languages
   'org-babel-load-languages
   '((ipython . t)
     (python . t)))
  ;; Dont ask about running code in org mode
  (setq org-confirm-babel-evaluate nil)
  ;; display/update images in the buffer after I evaluate
  (add-hook 'org-babel-after-execute-hook 'org-display-inline-images 'append)
  ;; Scale up latex eq rendering
  (setq org-format-latex-options (plist-put org-format-latex-options :scale 1.65))
  ;; completion in src blocks for i-python
  ;; (add-to-list 'company-backends 'company-ob-ipython)
  ;; proper code highligting for ipython when export to pdf
  ;; (add-to-list 'org-latex-minted-langs '(ipython "python"))


  ;; ORG MODE - REFERENCES
  (setq reftex-default-bibliography '("~/Documents/bibliography/references.bib"))
  ;; see org-ref for use of these variables
  (setq org-ref-bibliography-notes "~/Documents/bibliography/helm-bibtex-notes"
        ;; (setq org-ref-bibliography-notes "~/Documents/bibliography/notes.org"
        org-ref-default-bibliography '("~/Documents/bibliography/references.bib")
        org-ref-pdf-directory "~/Documents/bibliography/bibtex-pdfs/")
  ;; helm completion for org-ref
  (setq bibtex-completion-bibliography "~/Documents/bibliography/references.bib"
        bibtex-completion-library-path "~/Documents/bibliography/bibtex-pdfs"
        bibtex-completion-notes-path "~/Documents/bibliography/helm-bibtex-notes")
  ;; Tell org-ref to let helm-bibtex find notes for it
  (setq org-ref-notes-function
        (lambda (thekey)
          (let ((bibtex-completion-bibliography (org-ref-find-bibliography)))
            (bibtex-completion-edit-notes
             (list (car (org-ref-get-bibtex-key-and-file thekey)))))))
  ;; open pdf with system pdf viewer
  (setq bibtex-completion-pdf-open-function
        (lambda (fpath)
          (start-process "open" "*open*" "open" fpath)))
  ;; If you plan to build PDF files via LaTeX you need to make sure that
  ;; org-latex-pdf-process is set to process the bibliography (using bibtex or biblatex).
  ;; Here is one example of how to do that (see ./org-ref.org::*LaTeX export for other alternatives).
  (setq org-latex-pdf-process (list "latexmk -shell-escape -bibtex -f -pdf %f"))


  ;; ORG MODE - OTHER
  ;; download images
  (add-hook 'dired-mode-hook 'org-download-enable)


  ;; EYEBROWSE
  ;; Emacs multiple tabs
  (define-key eyebrowse-mode-map (kbd "M-1") 'eyebrowse-switch-to-window-config-1)
  (define-key eyebrowse-mode-map (kbd "M-2") 'eyebrowse-switch-to-window-config-2)
  (define-key eyebrowse-mode-map (kbd "M-3") 'eyebrowse-switch-to-window-config-3)
  (define-key eyebrowse-mode-map (kbd "M-4") 'eyebrowse-switch-to-window-config-4)
  (define-key eyebrowse-mode-map (kbd "M-5") 'eyebrowse-switch-to-window-config-5)


  ;; EMAIL - MU4E - GENERAL
  (setq mu4e-user-mail-address-list '("matthewdeancooper@gmail.com" "mcoo3379@uni.sydney.edu.au"))
  ;;store link to message if in header view, not to header query
  (setq org-mu4e-link-query-in-headers-mode nil)
  ;; Set up some common mu4e variables
  (setq mu4e-maildir "~/Maildir"
        mu4e-trash-folder "/Trash"
        mu4e-refile-folder "/Archive"
        mu4e-get-mail-command "offlineimap"
        mu4e-update-interval nil
        mu4e-compose-signature-auto-include nil
        mu4e-view-show-images t
        mu4e-view-show-addresses t)

  ;; EMAIL - MU4E - ACCOUNTS
  (setq mu4e-account-alist
        '(("gmail"
           ;; Under each account, set the account-specific variables you want.
           (mu4e-sent-messages-behavior delete)
           (mu4e-sent-folder "/gmail/[Gmail].Sent Mail")
           (mu4e-drafts-folder "/gmail/[Gmail].Drafts")
           (user-mail-address "matthewdeancooper@gmail.com")
           (user-full-name "matthew"))
          ("usyd"
           (mu4e-sent-messages-behavior sent)
           (mu4e-sent-folder "/usyd/Sent Items")
           (mu4e-drafts-folder "/usyd/Drafts")
           (user-mail-address "mcoo3379@uni.sydney.edu.au")
           (user-full-name "Matthew"))))
  (mu4e/mail-account-reset)

  ;; ;; Alerts
  ;; (with-eval-after-load 'mu4e-alert
  ;;   ;; Enable Desktop notifications
  ;;   ;; (mu4e-alert-set-default-style 'notifications)) ; For linux
  ;;   (mu4e-alert-set-default-style 'libnotify))  ; Alternative for linux


  ;; EMAIL - SMTP - For sending mail
  (setq message-send-mail-function 'smtpmail-send-it
        smtpmail-stream-type 'starttls
        smtpmail-default-smtp-server "smtp.gmail.com"
        smtpmail-smtp-server "smtp.gmail.com"
        smtpmail-smtp-service 587)
  ;; don't keep message buffers around
  (setq message-kill-buffer-on-exit t)


  )
;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (ranger helm-org-rifle helm-fuzzier arch-packer yasnippet-snippets yapfify xterm-color ws-butler which-key volatile-highlights uuidgen use-package unfill toc-org sound-wav smeargle shell-pop restart-emacs rainbow-delimiters pyvenv pytest pyenv-mode py-isort popwin pip-requirements persp-mode pcre2el paradox orgit org-ref org-projectile org-present org-pomodoro org-mime org-download open-junk-file ob-ipython mwim multi-term mu4e-maildirs-extension mu4e-alert move-text magit-gitflow macrostep live-py-mode linum-relative link-hint insert-shebang indent-guide hy-mode hungry-delete hl-todo highlight-parentheses highlight-numbers highlight-indentation helm-themes helm-swoop helm-pydoc helm-projectile helm-mode-manager helm-make helm-gitignore helm-flx helm-descbinds helm-company helm-c-yasnippet helm-ag gnuplot gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link git-gutter-fringe git-gutter-fringe+ fuzzy flyspell-correct-helm flycheck-pos-tip flx-ido fish-mode fill-column-indicator eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-magit evil-lisp-state evil-indent-plus evil-iedit-state evil-goggles evil-exchange evil-ediff evil-args evil-anzu eval-sexp-fu ess-smart-equals ess-R-data-view eshell-z eshell-prompt-extras esh-help elisp-slime-nav dumb-jump disaster diminish diff-hl define-word cython-mode company-statistics company-shell company-quickhelp company-c-headers company-auctex company-anaconda column-enforce-mode cmake-mode clean-aindent-mode clang-format cdlatex auto-yasnippet auto-highlight-symbol auto-dictionary auto-compile auctex-latexmk aggressive-indent adaptive-wrap ace-window ace-link ace-jump-helm-line ac-ispell))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )