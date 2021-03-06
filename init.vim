" An example for a vimrc file.

set backup             " keep a backup file (restore to previous version)
set undofile           " keep an undo file (undo changes after closing)
set ruler              " show the cursor position all the time
set showcmd            " display incomplete commands

set number
set relativenumber

" Mostly disable mouse, only insert
set mouse=i

" Don't use Ex mode, use Q for formatting
noremap Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" Switch syntax highlighting on
syntax on

" I like highlighting strings inside C comments.
let c_comment_strings=1

" Enable file type detection.
" Use the default filetype settings, so that mail gets 'textwidth' set to 72,
" 'cindent' is on in C files, etc.
" Also load indent files, to automatically do language-dependent indenting.
filetype plugin indent on

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
	command DiffOrig vert new | set buftype=nofile | read ++edit # | 0d_ | diffthis
				\ | wincmd p | diffthis
endif

set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
" source ~/.vimrc

" Orig .vimrc below
set backupdir=~/.vimbackup//
set directory=~/.vimbackup//

set ignorecase
set smartcase
set incsearch
set nohlsearch

"wrapping navigation fixer
nnoremap j gj
nnoremap k gk

"allow pasting without auto-indenting
set pastetoggle=<F2>

"change mapleader to , from \
let mapleader=","

"edit/reload vimrc
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

" leader directions splits that direction
nmap <silent> <leader>l :vsp<CR><C-w>l
nmap <silent> <leader>h :vsp<CR>
nmap <silent> <leader>j :sp<CR><C-w>j
nmap <silent> <leader>k :sp<CR>

" map ctrl>movement to C-w movement
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l

" chance camelCase to camel_case - <leader>c[ase]
nmap <silent> <leader>c vaw :s/\%V[A-Z]/\_\l\0/g<CR>

" leader directions splits that direction
nmap <silent> <leader>l :vsp<CR><C-w>l
nmap <silent> <leader>h :vsp<CR>
nmap <silent> <leader>j :sp<CR><C-w>j
nmap <silent> <leader>k :sp<CR>
"
" underline current line
nmap <silent> <leader>u yyp:s/./-/g<CR>

" leader shortcuts
" save
nmap <silent> <leader>w :w<CR>
" add a newline
nmap <silent> <leader>o mzo<Esc>`z
nmap <silent> <leader>O mzO<Esc>`z
" underline current line
nmap <silent> <leader>u yyp:s/./-/g<CR>

" Move line keys
nnoremap <A-j> :m+<CR>==
nnoremap <A-k> :m-2<CR>==
nnoremap <A-h> <<
nnoremap <A-l> >>
inoremap <A-j> <Esc>:m+<CR>==gi
inoremap <A-k> <Esc>:m-2<CR>==gi
inoremap <A-h> <Esc><<`]a
inoremap <A-l> <Esc>>>`]a
vnoremap <A-j> :m'>+<CR>gv=gv
vnoremap <A-k> :m-2<CR>gv=gv
vnoremap <A-h> <gv
vnoremap <A-l> >gv

" Escape after mashing jkjk
imap jk <esc>

" Filetype settings
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType ansible setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType python setlocal ts=2 sw=4 sts=4 expandtab
autocmd FileType javascript setlocal ts=4 sw=4 sts=4 expandtab

" No idea
set showcmd
set autoindent
if version >= 700
	set spl=en spell
	set nospell
endif

set foldmethod=indent
nnoremap <space> za
set foldlevelstart=99

" keep at least 2 lines above/below
set scrolloff=2

" error bells
set noerrorbells
set visualbell

" vimplug

call plug#begin()

Plug 'ripxorip/bolt.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'gioele/vim-autoswap'
"Plug 'tpope/vim-surround'
Plug 'machakann/vim-sandwich'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-repeat'
Plug 'bling/vim-airline'
"Plug 'chase/vim-ansible-yaml'
Plug 'hynek/vim-python-pep8-indent'
Plug 'maksimr/vim-jsbeautify'
Plug 'jshint/jshint'
Plug 'mattn/emmet-vim'
Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}

" has config from here on
"Plug 'Valloric/YouCompleteMe'
Plug 'scrooloose/syntastic'
Plug 'osyo-manga/vim-over'
Plug 'junegunn/vim-easy-align'
Plug 'Chiel92/vim-autoformat'
" Snippets
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'
Plug 'Shougo/neco-syntax'
" end has config

call plug#end()

" syntastic
let g:syntastic_scss_sass_args='-I bower_components'
let g:syntastic_javascript_checkers=['jshint']

" vim-over
nnoremap <silent><F8> :OverCommandLine<CR>
vnoremap <silent><F8> <Esc>:OverCommandLine<CR>

" easy-align
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" color scheme
colorscheme koehler

" autoformat
noremap <F3> :Autoformat<CR>

" Deoplete
let g:deoplete#enable_at_startup = 1
"inoremap <expr> <C-j> pumvisible() ? "\<C-n>" : "\<C-j>"
"inoremap <expr> <C-k> pumvisible() ? "\<C-p>" : "\<C-k>"
" Avoide semshi/deoplete issues
let g:deoplete#auto_complete_delay = 200

" neosnippet
" Plugin key-mappings.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif

filetype plugin indent on
