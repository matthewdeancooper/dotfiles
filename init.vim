"---- PLUG ---------------------------------------
call plug#begin('~/.local/share/nvim/plugged')
"COMPLETION
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' } "Completion engine
Plug 'Shougo/neosnippet.vim' "Snippet engine
Plug 'Shougo/neosnippet-snippets' "Snippet database
Plug 'zchee/deoplete-jedi' "Python specific snippet database

"ERROR
Plug 'neomake/neomake' "Error highlighting

"THEME AND VISUAL
Plug 'iCyMind/NeoSolarized' "Solarized colour scheme
" Plug 'Yggdroot/indentLine' "Shows tabs lines
Plug 'airblade/vim-gitgutter' "Shows changes from git version in gutter
Plug 'machakann/vim-highlightedyank' "some visual feedback on yanked objects

"LANGUAGE MODES
Plug 'fs111/pydoc.vim' "python documentation in vim
Plug 'vim-latex/vim-latex' "latex
Plug 'jceb/vim-orgmode'

"FILE NAVIGATION
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' } "Install fzf
Plug 'junegunn/fzf.vim' "Fuzzy searching in vim with extra features
"Installed exuberant-tags for use with fzf
Plug 'francoiscabrol/ranger.vim' "Ranger integration in vim
Plug 'rbgrouleff/bclose.vim' "Required for ranger
Plug 'tpope/vim-unimpaired' "Nice navigating using [ ]
Plug 'christoomey/vim-tmux-navigator'
Plug 'jpalardy/vim-slime'

"VERSION CONTROL
Plug 'tpope/vim-fugitive' "git integration in vim

"TEXT MANIPULATION
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/vim-easy-align' "Easy alignment
Plug 'tpope/vim-surround' "Use for add/remove bracket/quotes
Plug 'tpope/vim-repeat' "Use for add/remove bracket/quotes
Plug 'tpope/vim-commentary' "Multi line comments
Plug 'dusans/vim-hardmode'
call plug#end()




"---- VIM SETTINGS ---------------------------------
set clipboard=unnamedplus  "Use system clipboard
set number "Line numbers in gutter
set relativenumber "Relative numbers
set cursorline "Cursor highlight
set mouse=a  "Enable mouse
set nocompatible "Break compatibility with vi
syntax enable "Enable syntax highlighting
filetype plugin indent on "Language specific indentation and plugins
set hidden  "switch from an unsaved buffer without saving it first
set ignorecase "Ignore case when searching
set smartcase  " ...unless you type a capital
set incsearch  "Highlight searches incrementally
set ai "Auto indent after new line
set si "Smart indent after statements
set wrap "Wrap lines
set wildmenu "Better command-line completion
set showcmd "Show partial commands in the last line of the screen
set showmatch "Matching brackets
set textwidth=80 "Set position of colorcolumn
set colorcolumn=+1 "Show column
autocmd BufEnter * silent! lcd %:p:h "set wd as the file directory
set noswapfile "Dont keep swap if two versions open
set lazyredraw "Removes lag when using rel line numbers and cursorline
set inccommand=split "On the fly splitting with split window"
set ttimeout ttimeoutlen=10
set ts=4 "tab is 4 spaces"
let mapleader = " "

"KEY SETTINGS
"Remove unused key in normal
"noremap ; :
"Turn off search highlighting when exit search
nnoremap <silent> <ESC> :nohlsearch<CR>
"Window commands
" nnoremap <space> <C-w>
" nnoremap <C-j> <C-w><C-j>
" nnoremap <C-k> <C-w><C-k>
" nnoremap <C-l> <C-w><C-l>
" nnoremap <C-h> <C-w><C-h>

"Reload config file
nnoremap <leader>R :source ~/.config/nvim/init.vim<CR>
"Jump to vimrc
nnoremap <leader>vc :e ~/.config/nvim/init.vim<CR>
"Jump to zshrc
nnoremap <leader>zc :e ~/.zshrc<CR>
"Jump to tmuxrc
nnoremap <leader>tc :e ~/.tmux.conf<CR>
"Jump to pdf 
nnoremap <leader>pdf :!mupdf main.pdf &<CR>
"yank a line (no new line included like yy)
nnoremap yal ^y$ 


"---- COMPLETION -----------------------------------------
"DEOPLETE.NVIM
"Enable completion on startup
let g:deoplete#enable_at_startup = 1
"deoplete tab to cycle
"would prefer c-j and c-k mappings
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

"DEOPLETE-JEDI
"Auto-close Jedi window
autocmd InsertLeave * pclose

"NEOSNIPPET
"Snippet expand
imap <C-l>     <Plug>(neosnippet_expand_or_jump)
smap <C-l>     <Plug>(neosnippet_expand_or_jump)
xmap <C-l>     <Plug>(neosnippet_expand_target)

"---- ERROR ----------------------------------------------
" When writing a buffer (no delay), and on normal mode changes (after 750ms).
call neomake#configure#automake('nrw', 750)
"Open error list
nnoremap <leader>eo :lopen<CR>
"Close error list
nnoremap <leader>ec :lclose<CR>

"---- THEME AND VISUAL -----------------------------------
" Solarized settings
colorscheme NeoSolarized
"Dark background
set background=dark
" set termguicolors
let g:neosolarized_bold = 1
let g:neosolarized_underline = 1
let g:neosolarized_italic = 1
let g:gitgutter_override_sign_column_highlight = 0
" For tmux
set t_8f=^[[38;2;%lu;%lu;%lum
set t_8b=^[[48;2;%lu;%lu;%lum
"Use | for splits
set fillchars=vert:\│
"Set cursor to switch between block and line
:set guicursor=n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50
"Jump back to cursor when exiting vim
au VimLeave * set guicursor=a:ver2

"INDENTLINE
""show tab indentation with |
"let g:indentLine_char = '|'
""colour of indent
"let g:indentLine_color_term = 239

"---- LANGUAGE MODES -------------------------------------
"LATEX
"required for neotex
let g:tex_flavor = 'latex'
"Use gb english
set spelllang=en_gb spell


"---- FILE NAVIGATION ------------------------------------
"FZF
"Search home
nnoremap <leader>ff :FZF! ~ <CR>
"Search MRU
nnoremap <leader>fr :History! ~<CR>
"Search project
nnoremap <leader>fp :GitFiles <CR>
"Buffer list
nnoremap <leader>fb :Buffers <CR>
"Search commands
nnoremap <leader>? :Commands! <CR>

"RANGER.VIM
"Define own launch key
let g:ranger_map_keys = 0
"Maps ranger to leader r
nnoremap <leader>r :Ranger<CR>

"SLIMUX
let g:slime_target = "tmux"
let g:slime_default_config = {"socket_name": "default", "target_pane": "2"}
let g:slime_python_ipython = 1


"---- VERSION CONTROL ------------------------------------
"FZF
"Show commits on file
nnoremap <leader>gc :Commits! <CR>

"FUG
"Show git blame on file
nnoremap <leader>gb :Gblame <CR>
"Show git diff on file
nnoremap <leader>gd :Gdiff <CR>


"---- TEXT MANIPULATION -----------------------------------
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" map f <Plug>Sneak_s
" map F <Plug>Sneak_S

" let g:sneak#s_next = 1
" let g:sneak#label = 1
"
autocmd VimEnter,BufNewFile,BufReadPost * silent! call HardMode()
