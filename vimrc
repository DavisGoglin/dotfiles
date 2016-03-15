syntax on
set laststatus=2
filetype plugin indent on
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
" <leader>e[dit]v[im]
" <leader>s[ource]v[im]
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

" leader directions splits that direction
nmap <silent> <leader>l :vsp<CR><C-w>l
nmap <silent> <leader>h :vsp<CR>
nmap <silent> <leader>j :sp<CR><C-w>j
nmap <silent> <leader>k :sp<CR>

" chance camelCase to camel_case - <leader>c[ase]
nmap <silent> <leader>c vaw :s/\%V[A-Z]/\_\l\0/g<CR>

" leader shortcuts
" save
nmap <silent> <leader>w :w<CR>
" add a newline
nmap <silent> <leader>o mzo<Esc>`z
nmap <silent> <leader>O mzO<Esc>`z
" underline current line
nmap <silent> <leader>u yyp:s/./-/g<CR>

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

imap jk <esc>

" Filetype settings
autocmd FileType php setlocal fo-=o
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType ansible setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType python setlocal ts=2 sw=4 sts=4 expandtab
autocmd BufRead,BufNewFile ~/projects/nav_* set filetype=sqlserver

" May not actually do anything
set showcmd
set autoindent
if version >= 700
	set spl=en spell
	set nospell
endif

" Maybe someday
" nnoremap ; :
" nnoremap : ;

set foldmethod=indent
nnoremap <space> za
set foldlevelstart=99

" keep at least 2 lines above/below
set scrolloff=2

" error bells
set noerrorbells
set visualbell

" vundle
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'

Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-abolish'
Plugin 'tpope/vim-repeat'
Plugin 'jeffkreeftmeijer/vim-numbertoggle'
Plugin 'bling/vim-airline'
Plugin 'honza/vim-snippets'
Plugin 'gabrielelana/vim-markdown'
Plugin 'chase/vim-ansible-yaml'
Plugin 'vim-scripts/align'
Plugin 'jdevera/vim-tsql'
Plugin 'PProvost/vim-ps1'
Plugin 'hynek/vim-python-pep8-indent'

" has config from here on
Plugin 'Valloric/YouCompleteMe'
Plugin 'SirVer/ultisnips'
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
Plugin 'scrooloose/syntastic'
Plugin 'Shougo/unite.vim'
Plugin 'nanotech/jellybeans.vim'
Plugin 'osyo-manga/vim-over'
Plugin 'junegunn/vim-easy-align'
" end has config

call vundle#end()

" YouCompleteMe
" python with virtualenv support
py << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
  project_base_dir = os.environ['VIRTUAL_ENV']
  activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
  execfile(activate_this, dict(__file__=activate_this))
EOF

" untisnips 
let g:UltiSnipsExpandTrigger="<c-c>"

" sparkup
let g:sparkupNextMapping = '<leader>m'

" syntastic
let g:syntastic_scss_sass_args='-I bower_components'
let g:syntastic_javascript_checkers=['jshint']

" unite
call unite#filters#matcher_default#use(['matcher_fuzzy'])
let g:unite_source_history_yank_enable = 1
nnoremap <C-p> :Unite -no-split -buffer-name=files -start-insert file_rec<CR>
nnoremap <leader>y :Unite -buffer-name=yank history/yank<CR>
nnoremap <leader>s :Unite -buffer-name=buffer -quick-match buffer<CR>

" Custom mappings for the unite buffer
autocmd FileType unite call s:unite_settings()
function! s:unite_settings()
	" Enable navigation with control-j and control-k in insert mode
	imap <buffer> <C-j>   <Plug>(unite_select_next_line)
	imap <buffer> <C-k>   <Plug>(unite_select_previous_line)
	nmap <buffer> Q <plug>(unite_exit)
	nmap <buffer> <esc> <plug>(unite_exit)
endfunction

" vim-over
nnoremap <silent><F8> :OverCommandLine<CR>
vnoremap <silent><F8> <Esc>:OverCommandLine<CR>

" easy-align
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" color scheme
colorscheme jellybeans

filetype plugin indent on
