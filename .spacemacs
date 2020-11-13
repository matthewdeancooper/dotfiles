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

     ;; ----------------------------------------------------------------
     ;; Checkers
     ;; ----------------------------------------------------------------
     spell-checking
     syntax-checking

     ;; ----------------------------------------------------------------
     ;; Completion
     ;; ----------------------------------------------------------------
     helm
     (auto-completion :variables
                      auto-completion-enable-snippets-in-popup t
                      auto-completion-enable-help-tooltip 'manual)

     ;; ----------------------------------------------------------------
     ;; Emacs
     ;; ----------------------------------------------------------------
     better-defaults
     emacs-lisp
     (org :variables
          org-want-todo-bindings t)

     ;; ----------------------------------------------------------------
     ;; Email
     ;; ----------------------------------------------------------------
     ;; (mu4e :variables
     ;; mu4e-enable-notifications t
     ;; mu4e-enable-mode-line t
     ;; mu4e-account-alist t)

     ;; ----------------------------------------------------------------
     ;; Programming
     ;; ----------------------------------------------------------------
     ;; ess
     bibtex
     latex
     markdown
     html
     shell-scripts
     (python :variables
             python-backend 'lsp
             python-tab-width 4
             python-fill-column 99
             python-formatter 'yapf
             python-format-on-save t
             python-sort-imports-on-save t)
     c-c++

     ;; ----------------------------------------------------------------
     ;; Source control
     ;; ----------------------------------------------------------------
     git
     version-control

     ;; ----------------------------------------------------------------
     ;; Tools
     ;; ----------------------------------------------------------------
     pdf-tools
     (shell :variables
            shell-default-shell 'eshell
            shell-default-position 'bottom)

     ;; ----------------------------------------------------------------
     ;; Vim like behaviour
     ;; ----------------------------------------------------------------
     vinegar
     evil-snipe
     )

   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages, then consider creating a layer. You can also put the
   ;; configuration in `dotspacemacs/user-config'.
   dotspacemacs-additional-packages '(;; snippets library
                                      yasnippet-snippets
                                      ;; ;; yanking highlights
                                      evil-goggles
                                      ;; ;; ipython support org mode
                                      ;; ob-ipython
                                      ;; ;; Used for pomodoro alarm
                                      ;; sound-wav
                                      ;; ;; latex completion in org
                                      ;; cdlatex
                                      ;; ;; make helm even fuzzier
                                      helm-fuzzier
                                      ;; ;; notes from pdfs with org
                                      ;; org-noter
                                      ;; Some ref done well
                                      org-ref
                                      ;; Search org files
                                      ;; helm-org-rifle
                                      ;; pass interface for helm
                                      ;; helm-pass
                                      ;; magit-todos
                                      sublimity
                                      terminal-here
                                      ;; org-download
                                      vterm
                                      vterm-toggle
                                      )
   ;; A list of packages that cannot be updated.
   dotspacemacs-frozen-packages '()
   ;; A list of packages that will not be installed and loaded.
   dotspacemacs-excluded-packages '(
                                    git-gutter
                                    git-gutter+
                                    git-gutter-fringe
                                    git-gutter-fringe+
                                    vi-tilde-fringe
                                    rainbow-delimiters
                                    evil-search-highlight-persist
                                    neotree
                                    golden-ratio
                                    evil-tutor
                                    google-translate
                                    org-bullets
                                    ;; speedbar
                                    fancy-battery
                                    doc-view
                                    spaceline
                                    org-projectile
                                    winum
                                    ;; company-tern
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
   dotspacemacs-startup-banner nil
   ;; List of items to show in startup buffer or an association list of
   ;; the form `(list-type . list-size)`. If nil then it is disabled.
   ;; Possible values for list-type are:
   ;; `recents' `bookmarks' `projects' `agenda' `todos'."
   ;; List sizes may be nil, in which case
   ;; `spacemacs-buffer-startup-lists-length' takes effect.
   dotspacemacs-startup-lists '((recents . 5)
                                (projects . 7))
   ;; True if the home buffer should respond to resize events.
   dotspacemacs-startup-buffer-responsive t
   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'text-mode
   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press <SPC> T n to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(
                         ;; solarized-dark
                         ;; majapahit-dark
                         spacemacs-dark
                         spacemacs-light
                         )
   ;; If non nil the cursor color matches the state color in GUI Emacs.
   dotspacemacs-colorize-cursor-according-to-state t
   ;; Default font, or prioritized list of fonts. `powerline-scale' allows to
   ;; quickly tweak the mode-line size to make separators look not too crappy.
   dotspacemacs-default-font '("Source Code Pro"
                               :size 16
                               :weight normal
                               :width normal
                               :powerline-scale 1.1)
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
   dotspacemacs-distinguish-gui-tab nil
   ;; If non nil `Y' is remapped to `y$' in Evil states. (default nil)
   dotspacemacs-remap-Y-to-y$ t
   ;; If non-nil, the shift mappings `<' and `>' retain visual state if used
   ;; there. (default t)
   dotspacemacs-retain-visual-state-on-shift t
   ;; If non-nil, J and K move lines up and down when in visual mode.
   ;; (default nil)
   dotspacemacs-visual-line-move-text nil
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
   dotspacemacs-loading-progress-bar t
   ;; If non nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup t
   ;; If non nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native nil
   ;; If non nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (default nil) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup t
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
   dotspacemacs-smooth-scrolling t
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
   ;; dotspacemacs-line-numbers  '(:relative t
   ;;                                        :disabled-for-modes dired-mode
   ;;                                        doc-view-mode
   ;;                                        markdown-mode
   ;;                                        org-mode
   ;;                                        pdf-view-mode
   ;;                                        text-mode
   ;;                                        :size-limit-kb 1000)
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
   dotspacemacs-whitespace-cleanup 'trailing
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

  ;; ------------------------------------------------------------
  ;; Misc
  ;; ------------------------------------------------------------
  (evil-goggles-mode)
  (setq vc-follow-symlinks t)
  (setq powerline-default-separator 'nil)

  (global-aggressive-indent-mode 1)
  (add-to-list 'aggressive-indent-excluded-modes 'html-mode)

  (setenv "PYTHONIOENCODING" "utf8")

  (setq projectile-project-search-path '("~/github/"))

  ;; (add-hook 'dired-mode-hook 'dired-git-mode)
  ;; (setq split-height-threshold nil)
  ;; (setq split-width-threshold 80)

  ;; ------------------------------------------------------------
  ;; Sublimity
  ;; ------------------------------------------------------------
  (require 'sublimity)
  ;; (require 'sublimity-scroll)
  ;; (require 'sublimity-map) ;; experimental
  (require 'sublimity-attractive)
  ;; (sublimity-attractive-hide-bars)
  ;; (sublimity-attractive-hide-vertical-border)
  ;; (sublimity-attractive-hide-fringes)
  ;; (sublimity-attractive-hide-modelines)
  (sublimity-mode 1)

  ;; ------------------------------------------------------------
  ;; Git
  ;; ------------------------------------------------------------
  (global-git-commit-mode t)

  (setq version-control-diff-tool 'diff-hl)
  (global-diff-hl-mode)
  (diff-hl-flydiff-mode)
  (add-hook 'magit-post-refresh-hook 'diff-hl-magit-post-refresh)


  ;; ------------------------------------------------------------
  ;; Dired
  ;; ------------------------------------------------------------
  (add-hook 'dired-mode-hook 'diff-hl-dired-mode)


  ;; ------------------------------------------------------------
  ;; Latex
  ;; ------------------------------------------------------------
  ;; Some latex stuff told i needed by pdftools
  (add-hook 'TeX-after-compilation-finished-functions #'TeX-revert-document-buffer)
  ;; Use pdf-tools to open PDF file
  (setq TeX-view-program-selection '((output-pdf "PDF Tools"))
        TeX-source-correlate-start-server t)
  ;; Update PDF buffers after successful LaTeX runs
  (add-hook 'TeX-after-compilation-finished-functions
            #'TeX-revert-document-buffer)


  ;; ------------------------------------------------------------
  ;; Org mode
  ;; ------------------------------------------------------------

  ;; where is the org directory
  (setq org-directory "~/github/org")
  ;; where are the agenda files
  (setq org-agenda-files (list "~/github/org"))
  ;; where to capture by default
  (setq org-default-notes-file "~/github/org/notes.org")
  ;; open agenda in current window
  (setq org-agenda-window-setup (quote other-window))
  ;; dont warn me in advance, just on the day
  (setq org-deadline-warning-days 0)
  (setq org-todo-keywords
        '((sequence "TODO(t)" "WAIT(w)" "|" "DONE(d!)")))
  (setq org-agenda-tags-column 0)
  (setq org-tags-column 0)

  ;; org-capture
  (setq org-capture-templates
        '(("t" "task" entry (file+headline "~/github/org/todo.org" "Tasks")
           "* TODO  %? \n  %i")
          ("T" "task linked" entry (file+headline "~/github/org/todo.org" "Tasks")
           "* TODO %? \n  %i %a")
          ("d" "calendar" entry (file+headline "~/github/org/todo.org" "Calendar")
           "* %? \n  %i")
          ("D" "calendar linked" entry (file+headline "~/github/org/todo.org" "Calendar")
           "* %? \n  %i %a")
          ("n" "note" entry (file+headline "~/github/org/notes.org" "Notes")
           "* %? \n  %i")
          ))

  ;; org-agenda
  (setq org-agenda-custom-commands
        '(
          ("u" "Entries without date"
           ((agenda "" ((org-agenda-ndays 1)))
            (alltodo ""
                     ((org-agenda-skip-function '(or (org-agenda-skip-if nil '(scheduled deadline time-stamp))))
                      (org-agenda-overriding-header " \n Todo without date")))
            )
           ((org-agenda-compact-blocks t)))

          ("d" "Entries with deadline" agenda "" ((org-agenda-span 'year)
                                                  (org-agenda-time-grid nil)
                                                  (org-agenda-show-all-dates nil)
                                                  (org-agenda-entry-types '(:deadline)) ;; this entry excludes :scheduled
                                                  (org-deadline-warning-days 0)))
          )
        )


  ;; org-clock-report
  (setq org-agenda-clockreport-parameter-plist
        (quote (:link t :maxlevel 4 :fileskip0 t :tags :compact t :narrow 80 :formula %)))


  ;; ORG-POMODORO
  (setq org-pomodoro-length 60)
  (setq org-pomodoro-short-break-length 5)
  ;; (setq org-pomodoro-long-break-length 15)
  (setq org-pomodoro-play-sounds 1)

  ;; ORG-SRC
  (setq org-fontify-quote-and-verse-blocks t)
  (setq org-src-fontify-natively t)
  ;; ;; better latex in org mode for maths
  (add-hook 'org-mode-hook 'turn-on-org-cdlatex)
  (setq org-src-tab-acts-natively t)
  (setq org-src-preserve-indentation t)

  ;; ORG-DOWNLOAD
  ;; download images
  (add-hook 'dired-mode-hook 'org-download-enable)

  ;; ------------------------------------------------------------
  ;; Org ref
  ;; ------------------------------------------------------------
  (setq reftex-default-bibliography '("~/github/org/references.bib"))

  ;; see org-ref for use of these variables
  (setq org-ref-bibliography-notes "~/github/org/notes.org"
        org-ref-default-bibliography '("~/github/org/references.bib")
        org-ref-pdf-directory "~/github/org/bibtex-pdfs/")
  ;; If you use helm-bibtex as the citation key completion method you should set these variables too
  (setq bibtex-completion-bibliography "~/github/org/references.bib"
        bibtex-completion-library-path "~/github/org/bibtex-pdfs"
        bibtex-completion-notes-path "~/github/org/helm-bibtex-notes")

  ;; open pdf with system pdf viewer (works on mac)
  (setq bibtex-completion-pdf-open-function
        (lambda (fpath)
          (start-process "open" "*open*" "open" fpath)))

  ;; alternative
  ;; (setq bibtex-completion-pdf-open-function 'org-open-file)

  ;; ------------------------------------------------------------
  ;; Keybindings
  ;; ------------------------------------------------------------
  (spacemacs/set-leader-keys "aon" 'org-noter)
  (spacemacs/set-leader-keys "os" 'org-save-all-org-buffers)
  (spacemacs/set-leader-keys "pf" 'helm-projectile-find-file-in-known-projects)
  (spacemacs/set-leader-keys "hm" 'helm-mark-ring)
  (spacemacs/set-leader-keys "hy" 'helm-show-kill-ring)
  (spacemacs/set-leader-keys "hb" 'helm-bibtex)
  (spacemacs/set-leader-keys "jj" 'avy-goto-char-timer)
  (spacemacs/set-leader-keys "at" 'terminal-here)

  (global-set-key (kbd "M-1") 'eyebrowse-switch-to-window-config-1)
  (global-set-key (kbd "M-2") 'eyebrowse-switch-to-window-config-2)
  (global-set-key (kbd "M-3") 'eyebrowse-switch-to-window-config-3)
  (global-set-key (kbd "M-4") 'eyebrowse-switch-to-window-config-4)
  (global-set-key (kbd "M-5") 'eyebrowse-switch-to-window-config-5)
  (global-set-key (kbd "M-o") 'ace-window)




  ;; ------------------------------------------------------------
  ;; PACKAGE - MU4E
  ;; ------------------------------------------------------------
  ;; (setq mu4e-user-mail-address-list '("matthewdeancooper@gmail.com" "mcoo3379@uni.sydney.edu.au"))
  ;; ;;store link to message if in header view, not to header query
  ;; (setq org-mu4e-link-query-in-headers-mode nil)
  ;; ;; Set up some common mu4e variables
  ;; (setq mu4e-maildir "~/.maildir"
  ;;       mu4e-trash-folder "/Trash"
  ;;       mu4e-refile-folder "/Archive"
  ;;       mu4e-get-mail-command "offlineimap"
  ;;       mu4e-update-interval nil
  ;;       mu4e-compose-signature-auto-include nil
  ;;       mu4e-view-show-images t
  ;;       mu4e-view-show-addresses t)

  ;; ;; DID USE THIS
  ;; ;; MU4E - ACCOUNTS
  ;; (setq mu4e-account-alist
  ;;       '(("gmail"
  ;;          ;; Under each account, set the account-specific variables you want.
  ;;          (mu4e-sent-messages-behavior delete)
  ;;          (mu4e-sent-folder "/gmail/Sent")
  ;;          (mu4e-drafts-folder "/gmail/Drafts")
  ;;          (user-mail-address "matthewdeancooper@gmail.com")
  ;;          (user-full-name "Matthew"))
  ;;         ("usyd"
  ;;          (mu4e-sent-messages-behavior sent)
  ;;          (mu4e-sent-folder "/usyd/Sent")
  ;;          (mu4e-drafts-folder "/usyd/Drafts")
  ;;          (user-mail-address "mcoo3379@uni.sydney.edu.au")
  ;;          (user-full-name "Matthew"))))
  ;; ;; (mu4e/mail-account-reset)

  ;; ;; SMTP - FOR SENDING MAIL
  ;; (setq message-send-mail-function 'smtpmail-send-it
  ;;       smtpmail-stream-type 'starttls
  ;;       smtpmail-default-smtp-server "smtp.gmail.com"
  ;;       smtpmail-smtp-server "smtp.gmail.com"
  ;;       smtpmail-smtp-service 587)
  ;; ;; don't keep message buffers around
  ;; (setq message-kill-buffer-on-exit t)
  )


;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(winum spaceline powerline yasnippet-snippets yapfify xterm-color ws-butler which-key web-mode vterm-toggle volatile-highlights uuidgen use-package unfill toc-org terminal-here tagedit sublimity smeargle slim-mode shell-pop scss-mode sass-mode restart-emacs pyvenv pytest pyenv-mode py-isort pug-mode popwin pip-requirements persp-mode pcre2el paradox orgit org-ref org-present org-pomodoro org-mime org-download org-bullets open-junk-file mwim multi-term move-text mmm-mode markdown-toc magit-gitflow macrostep lorem-ipsum live-py-mode linum-relative link-hint insert-shebang indent-guide hy-mode hungry-delete hl-todo highlight-parentheses highlight-numbers highlight-indentation helm-themes helm-swoop helm-pydoc helm-projectile helm-mode-manager helm-make helm-gitignore helm-fuzzier helm-flx helm-descbinds helm-css-scss helm-company helm-c-yasnippet helm-ag gnuplot gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link gh-md fuzzy flyspell-correct-helm flycheck-pos-tip flx-ido fish-mode fill-column-indicator eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired evil-surround evil-snipe evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-magit evil-lisp-state evil-indent-plus evil-iedit-state evil-goggles evil-exchange evil-escape evil-ediff evil-args evil-anzu eval-sexp-fu eshell-z eshell-prompt-extras esh-help emmet-mode elisp-slime-nav dumb-jump disaster diminish diff-hl define-word cython-mode company-web company-statistics company-shell company-quickhelp company-c-headers company-auctex company-anaconda column-enforce-mode cmake-mode clean-aindent-mode clang-format auto-yasnippet auto-highlight-symbol auto-dictionary auto-compile auctex-latexmk aggressive-indent adaptive-wrap ace-window ace-link ace-jump-helm-line ac-ispell)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
