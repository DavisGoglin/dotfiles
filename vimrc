syntax on
set laststatus=2
filetype indent on
set ai
set nu
set ic
set backupdir=~/.vimbackup//
set directory=~/.vimbackup//
set ignorecase
set smartcase
set incsearch
set hidden

"wrapping navigation fixer
nnoremap j gj
nnoremap k gk

"allow pasting without auto-indenting
set pastetoggle=<F2>

"chante mapleader to , from \
let mapleader=","

"edit/reload vimrc
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

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

" map ctrl>movement to C-w movement
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l

imap jj <esc>

"kinda annoying
"autocmd BufEnter * lcd %:p:h

autocmd FileType php setlocal fo-=o
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

" http://stackoverflow.com/questions/164847/what-is-in-your-vimrc
" Necesary  for lots of cool vim things
set nocompatible
" This shows what you are typing as a command.  I love this!
set showcmd
" Who doesn't like autoindent?
set autoindent
" Use english for spellchecking, but don't spellcheck by default
if version >= 700
	set spl=en spell
	set nospell
endif
" Search mappings: These will make it so that going to the next one in a
" search will center on the line it's found in.
"map N Nzz
"map n nzz

" Swap ; and :  Convenient
" nnoremap ; :
" nnoremap : ;

" Folding
set foldmethod=marker
nnoremap <space> za

" keep at least 2 lines above/below
set scrolloff=2

" error bells
set noerrorbells
set visualbell


" vundle changes

filetype off
set rtp+=~/.vim/bundle/vundle
call vundle#rc()
Bundle 'gmarik/vundle'

Bundle 'tpope/vim-surround'
Bundle 'jeffkreeftmeijer/vim-numbertoggle'

" matchit unofficial
Bundle 'tsaleh/vim-matchit'

" javascript unofficial
Bundle 'vim-scripts/JavaScript-Indent'

Bundle 'scrooloose/syntastic'
Bundle 'kien/ctrlp.vim'
let g:ctrlp_working_path_mode = 0
" Bundle 'tpope/vim-fugitive'

Bundle 'Lokaltog/vim-powerline'
"doesn't work
"let g:Powerline_symbols = 'fancy'

Bundle 'altercation/vim-colors-solarized'
set background=dark
colorscheme solarized

filetype plugin indent on


