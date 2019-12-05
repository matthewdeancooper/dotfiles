;; -*- mode: emacs-lisp; lexical-binding: t -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Layer configuration:
This function should only modify configuration layer settings."
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
     html
     helm
     (auto-completion :variables
                      auto-completion-enable-snippets-in-popup t
                      auto-completion-enable-help-tooltip 'manual)
     better-defaults
     emacs-lisp
     git
     (org :variables
          org-want-todo-bindings t)
     bibtex
     latex
     shell-scripts
     (python :variables
             python-enable-yapf-format-on-save t)
     c-c++
     ;; ess
     pdf
     (shell :variables
            ;; shell-default-height 30
            ;; shell-default-position 'right
            shell-default-position 'full
            shell-default-shell 'eshell
            )
     spell-checking
     ;; (spell-checking :variables
     ;; spell-checking-enable-by-default t
     ;; =enable-flyspell-auto-completion= t)
     syntax-checking
     version-control
     ;; (version-control :variables
     ;;                  version-control-global-margin t
     ;; version-control-diff-tool 'diff-hl)
     vinegar
     (mu4e :variables
           ;; mu4e-enable-notifications t
           ;; mu4e-enable-mode-line t
           mu4e-account-alist t)
     ;; ranger
     )
   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages, then consider creating a layer. You can also put the
   ;; configuration in `dotspacemacs/user-config'.
   dotspacemacs-additional-packages '(
                                      ;; snippets library
                                      yasnippet-snippets
                                      ;; yanking highlights
                                      ;; evil-goggles
                                      ;; ipython support org mode
                                      ob-ipython
                                      ;; Used for pomodoro alarm
                                      sound-wav
                                      ;; latex completion in org
                                      cdlatex
                                      ;; make helm even fuzzier
                                      ;; helm-fuzzier
                                      ;; notes from pdfs with org
                                      org-noter
                                      ;; Some ref done well
                                      org-ref
                                      ;; org-journal
                                      ;; emacs clipboard
                                      ;; gpastel
                                      ;; pass interface for helm
                                      ;; helm-pass
                                      ;; zenburn-theme
                                      solarized-theme

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
                                    ;; lorem-ipsum
                                    neotree
                                    golden-ratio
                                    evil-tutor
                                    google-translate
                                    doc-view
                                    ;; evil-escape
                                    org-bullets
                                    ;; winum
                                    volatile-highlights
                                    ;; eyebrowse
                                    ;; ivy
                                    ;; dumb-jump
                                    speedbar
                                    fancy-battery
                                    doc-view
                                    ;; spaceline
                                    )
   ;; Defines the behaviour of Spacemacs when installing packages. Possible
   ;; values are `used-only', `used-but-keep-unused' and `all'. `used-only'
   ;; installs only explicitly used packages and uninstall any unused packages
   ;; as well as their unused dependencies. `used-but-keep-unused' installs only
   ;; the used packages but won't uninstall them if they become unused. `all'
   ;; installs *all* packages supported by Spacemacs and never uninstall them.
   ;; (default is `used-only')
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
   dotspacemacs-check-for-update t
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
   dotspacemacs-startup-lists '(;; (agenda . 5) ;; (todos . 5)
                                )
   ;; True if the home buffer should respond to resize events.
   dotspacemacs-startup-buffer-responsive t
   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'text-mode
   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press <SPC> T n to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(
                         ;; leuven
                         solarized-light
                         solarized-dark
                         )

   ;; Set the theme for the Spaceline. Supported themes are `spacemacs',
   ;; `all-the-icons', `custom', `doom', `vim-powerline' and `vanilla'. The
   ;; first three are spaceline themes. `doom' is the doom-emacs mode-line.
   ;; `vanilla' is default Emacs mode-line. `custom' is a user defined themes,
   ;; refer to the DOCUMENTATION.org for more info on how to create your own
   ;; spaceline theme. Value can be a symbol or list with additional properties.
   ;; (default '(spacemacs :separator wave :separator-scale 1.5))
   dotspacemacs-mode-line-theme '(spacemacs :separator nil :separator-scale 0.5)

   ;; If non nil the cursor color matches the state color in GUI Emacs.
   dotspacemacs-colorize-cursor-according-to-state t
   ;; Default font, or prioritized list of fonts. `powerline-scale' allows to
   ;; quickly tweak the mode-line size to make separators look not too crappy.
   dotspacemacs-default-font '(
                               "Source Code Pro"
                               :size 16
                               :width normal
                               :weight normal)
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
   ;; which-key delay in seconds. the which-key buffer is the popup listing
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
   dotspacemacs-mode-line-unicode-symbols nil
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
  ;; ------------------------------------------------------------
  ;; GENERAL
  ;; ------------------------------------------------------------
  (setq vc-follow-symlinks t)

  ;; (spaceline-toggle-buffer-size-off)
  ;; (spaceline-toggle-battery-on)
  ;; (spaceline-toggle-buffer-position-off)
  ;; (spaceline-toggle-buffer-encoding-abbrev-off)
  ;; (spaceline-toggle-hud-off)
  ;; (spaceline-toggle-line-column-off)
  ;; (spaceline-toggle-process-off)
  ;; (spaceline-toggle-workspace-number-on)
  ;; (spaceline-toggle-purpose-off)
  ;; (setq display-time-format "%H:%M %a %d/%m")
  ;; (setq display-time-default-load-average nil)
  ;; (spacemacs/toggle-display-time-on)
  ;; (fancy-battery-mode)
  ;; Turn on agressive indent mode globally except:
  (global-aggressive-indent-mode 1)
  (add-to-list 'aggressive-indent-excluded-modes 'html-mode)
  (global-git-commit-mode t)
  (setq version-control-diff-tool 'diff-hl)
  (global-diff-hl-mode)
  (diff-hl-flydiff-mode)
  (add-hook 'magit-post-refresh-hook 'diff-hl-magit-post-refresh)
  ;; Use fd
  (setq ffip-use-rust-fd t)
  ;; auto highlight-indentation-mode
  ;; (add-hook 'prog-mode-hook 'highlight-indentation-mode)


  ;; ------------------------------------------------------------
  ;; PACKAGE - EVIL-GOGGLES
  ;; ------------------------------------------------------------
  ;; Highlighted yank etc
  (evil-goggles-mode)
  ;; Highlighted time
  ;; (setq evil-goggles-duration 1.500)

  ;; ------------------------------------------------------------
  ;; PACKAGE - LATEX
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
  ;; PACKAGE - ORG MODE
  ;; ------------------------------------------------------------
  ;; basic
  ;; where is the org directory
  (setq org-directory "~/docs/org")
  ;; where are the agenda files
  (setq org-agenda-files (list "~/docs/org"))
  ;; where to capture by default
  (setq org-default-notes-file "~/docs/org/notes.org")
  ;; open agenda in current window
  (setq org-agenda-window-setup (quote current-window))
  ;; dont warn me in advance, just on the day
  (setq org-deadline-warning-days 0)
  (setq org-todo-keywords
        '((sequence "TODO(t)" "WAIT(w)" "|" "DONE(d!)")))
  (setq org-agenda-tags-column 0)
  (setq org-tags-column 0)

  ;; org-capture
  (setq org-capture-templates
        '(("t" "task" entry (file+headline "~/docs/org/todo.org" "Tasks")
           "* TODO  %? \n  %i")
          ("T" "task linked" entry (file+headline "~/docs/org/todo.org" "Tasks")
           "* TODO %? \n  %i %a")
          ("d" "calendar" entry (file+headline "~/docs/org/todo.org" "Calendar")
           "* %? \n  %i")
          ("D" "calendar linked" entry (file+headline "~/docs/org/todo.org" "Calendar")
           "* %? \n  %i %a")
          ("n" "note" entry (file+headline "~/docs/org/notes.org" "Notes")
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

  ;; org-pomodoro
  (setq org-pomodoro-length 60)
  ;; (setq org-pomodoro-short-break-length 5)
  ;; (setq org-pomodoro-long-break-length 15)
  (setq org-pomodoro-play-sounds 1)

  ;; ORG-SRC
  (setq org-fontify-quote-and-verse-blocks t)
  (setq org-src-fontify-natively t)
  ;; better latex in org mode for maths
  (add-hook 'org-mode-hook 'turn-on-org-cdlatex)
  (setq org-src-tab-acts-natively t)
  (setq org-src-preserve-indentation t)

  ;; ORG-DOWNLOAD
  ;; download images
  (add-hook 'dired-mode-hook 'org-download-enable)



  ;; ------------------------------------------------------------
  ;; PACKAGE - ORG-BABEL
  ;; ------------------------------------------------------------
  (org-babel-do-load-languages
   'org-babel-load-languages
   '((python . t)
     (ipython . t)
     ))
  (add-hook 'org-babel-after-execute-hook 'org-display-inline-images 'append)

  ;; Dont ask about running code in org mode
  (setq org-confirm-babel-evaluate nil)
  (setq org-format-latex-options (plist-put org-format-latex-options :scale 1.6))


  ;; ------------------------------------------------------------
  ;; PACKAGE - ORG-REF
  ;; ------------------------------------------------------------
  ;; see org-ref for use of these variables
  (setq reftex-default-bibliography '("~/docs/articles/references.bib"))
  (setq org-ref-bibliography-notes "~/docs/articles"
        org-ref-default-bibliography '("~/docs/articles/references.bib")
        org-ref-pdf-directory "~/docs/articles/")
  ;; Tell org-ref to let helm-bibtex find notes for it
  ;;Setting up notes to work with multiple notes.org files
  (setq org-ref-notes-function
        (lambda (thekey)
          (let ((bibtex-completion-bibliography (org-ref-find-bibliography)))
            (bibtex-completion-edit-notes
             (list (car (org-ref-get-bibtex-key-and-file thekey)))))))
  ;; If you plan to build PDF files via LaTeX you need to make sure that
  ;; org-latex-pdf-process is set to process the bibliography (using bibtex or biblatex).
  ;; Here is one example of how to do that (see ./org-ref.org::*LaTeX export for other alternatives).
  (setq org-latex-pdf-process (list "latexmk -shell-escape -bibtex -f -pdf %f"))


  ;; ------------------------------------------------------------
  ;; PACKAGE - HELM-BIBTEX
  ;; ------------------------------------------------------------
  ;; helm completion for org-ref
  (setq bibtex-completion-bibliography "~/docs/articles/references.bib"
        bibtex-completion-library-path "~/docs/articles"
        bibtex-completion-notes-path "~/docs/articles"
        bibtex-completion-notes-extension ".org")


  ;; ------------------------------------------------------------
  ;; PACKAGE - MU4E
  ;; ------------------------------------------------------------
  (setq mu4e-user-mail-address-list '("matthewdeancooper@gmail.com" "mcoo3379@uni.sydney.edu.au"))
  ;;store link to message if in header view, not to header query
  (setq org-mu4e-link-query-in-headers-mode nil)
  ;; Set up some common mu4e variables
  (setq mu4e-maildir "~/.maildir"
        mu4e-trash-folder "/Trash"
        mu4e-refile-folder "/Archive"
        mu4e-get-mail-command "offlineimap"
        mu4e-update-interval nil
        mu4e-compose-signature-auto-include nil
        mu4e-view-show-images t
        mu4e-view-show-addresses t)

  ;; (setq mu4e-contexts
  ;;       `( ,(make-mu4e-context
  ;;            :name "gmail"
  ;;            :match-func (lambda (msg) (when msg
  ;;                                        (string-prefix-p "/gmail" (mu4e-message-field msg :maildir))))
  ;;            :vars '(
  ;;                    (mu4e-trash-folder . "/gmail/[Gmail].Trash")
  ;;                    (mu4e-refile-folder . "/gmail/[Gmail].Archive")
  ;;                    ))
  ;;          ,(make-mu4e-context
  ;;            :name "usyd"
  ;;            :match-func (lambda (msg) (when msg
  ;;                                        (string-prefix-p "/usyd" (mu4e-message-field msg :maildir))))
  ;;            :vars '(
  ;;                    (mu4e-trash-folder . "/usyd/Deleted Items")
  ;;                    (mu4e-refile-folder . usyd-mu4e-refile-folder)
  ;;                    ))
  ;;          ))


  ;; MU4E - ACCOUNTS
  (setq mu4e-account-alist
        '(("gmail"
           ;; Under each account, set the account-specific variables you want.
           (mu4e-sent-messages-behavior delete)
           (mu4e-sent-folder "/gmail/Sent")
           (mu4e-drafts-folder "/gmail/Drafts")
           (user-mail-address "matthewdeancooper@gmail.com")
           (user-full-name "Matthew"))
          ("usyd"
           (mu4e-sent-messages-behavior sent)
           (mu4e-sent-folder "/usyd/Sent")
           (mu4e-drafts-folder "/usyd/Drafts")
           (user-mail-address "mcoo3379@uni.sydney.edu.au")
           (user-full-name "Matthew"))))
  ;; (mu4e/mail-account-reset)

  ;; SMTP - FOR SENDING MAIL
  (setq message-send-mail-function 'smtpmail-send-it
        smtpmail-stream-type 'starttls
        smtpmail-default-smtp-server "smtp.gmail.com"
        smtpmail-smtp-server "smtp.gmail.com"
        smtpmail-smtp-service 587)
  ;; don't keep message buffers around
  (setq message-kill-buffer-on-exit t)

  ;; ------------------------------------------------------------
  ;; FUNCTIONS - SCIMAX
  ;; ------------------------------------------------------------
  ;; Renumber org-latex equations
  ;; (defun org-renumber-environment (orig-func &rest args)
  ;;   (let ((results '())
  ;;         (counter -1)
  ;;         (numberp))
  ;;     (setq results (loop for (begin .  env) in
  ;;                         (org-element-map (org-element-parse-buffer) 'latex-environment
  ;;                           (lambda (env)
  ;;                             (cons
  ;;                              (org-element-property :begin env)
  ;;                              (org-element-property :value env))))
  ;;                         collect
  ;;                         (cond
  ;;                          ((and (string-match "\\\\begin{equation}" env)
  ;;                                (not (string-match "\\\\tag{" env)))
  ;;                           (incf counter)
  ;;                           (cons begin counter))
  ;;                          ((string-match "\\\\begin{align}" env)
  ;;                           (prog2
  ;;                               (incf counter)
  ;;                               (cons begin counter)
  ;;                             (with-temp-buffer
  ;;                               (insert env)
  ;;                               (goto-char (point-min))
  ;;                               ;; \\ is used for a new line. Each one leads to a number
  ;;                               (incf counter (count-matches "\\\\$"))
  ;;                               ;; unless there are nonumbers.
  ;;                               (goto-char (point-min))
  ;;                               (decf counter (count-matches "\\nonumber")))))
  ;;                          (t
  ;;                           (cons begin nil)))))
  ;;     (when (setq numberp (cdr (assoc (point) results)))
  ;;       (setf (car args)
  ;;             (concat
  ;;              (format "\\setcounter{equation}{%s}\n" numberp)
  ;;              (car args)))))
  ;;   (apply orig-func args))
  ;; (advice-add 'org-create-formula-image :around #'org-renumber-environment)


  ;; ------------------------------------------------------------
  ;; KEYBINDINGS
  ;; ------------------------------------------------------------
  ;; (spacemacs/declare-prefix "o" "own-menu")
  (spacemacs/set-leader-keys "aon" 'org-noter)
  ;; (spacemacs/set-leader-keys "ol" 'cdlatex-environment)
  ;; (spacemacs/set-leader-keys "om" 'menu-bar-mode)
  (spacemacs/set-leader-keys "os" 'org-save-all-org-buffers)
  (spacemacs/set-leader-keys "pf" 'helm-projectile-find-file-in-known-projects)
  (spacemacs/set-leader-keys "hm" 'helm-mark-ring)
  (spacemacs/set-leader-keys "hy" 'helm-show-kill-ring)
  (spacemacs/set-leader-keys "hb" 'helm-bibtex)

  (global-set-key (kbd "s-1") 'eyebrowse-switch-to-window-config-1)
  (global-set-key (kbd "s-2") 'eyebrowse-switch-to-window-config-2)
  (global-set-key (kbd "s-3") 'eyebrowse-switch-to-window-config-3)
  (global-set-key (kbd "s-4") 'eyebrowse-switch-to-window-config-4)
  (global-set-key (kbd "s-5") 'eyebrowse-switch-to-window-config-5)


  ;; sudo completion for eshell
  (defun pcomplete/sudo ()
    (let ((prec (pcomplete-arg 'last -1)))
      (cond ((string= "sudo" prec)
             (while (pcomplete-here*
                     (funcall pcomplete-command-completion-function)
                     (pcomplete-arg 'last) t))))))


  )
(defun dotspacemacs/emacs-custom-settings ()
  "Emacs custom settings.
This is an auto-generated function, do not modify its content directly, use
Emacs customize menu instead.
This function is called at the very end of Spacemacs initialization."
  (custom-set-variables
   ;; custom-set-variables was added by Custom.
   ;; If you edit it by hand, you could mess it up, so be careful.
   ;; Your init file should contain only one such instance.
   ;; If there is more than one, they won't work right.
   )
  (custom-set-faces
   ;; custom-set-faces was added by Custom.
   ;; If you edit it by hand, you could mess it up, so be careful.
   ;; Your init file should contain only one such instance.
   ;; If there is more than one, they won't work right.
   )
  )
