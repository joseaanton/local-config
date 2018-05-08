set nocompatible              " be iMproved, required

" ===== Plugin Management ===== {{{
" START vundle plugins
filetype off                  " required, vundle
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'  " required
call vundle#end()            " required
filetype plugin indent on    " required
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just
" :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to
" see :h vundle for more details or wiki for FAQ
" END vundle plugins

"===============================
" Common Configuration for Vim
"================================
colorscheme wombat256mod
let g:airline_theme='atomic'
let g:airline_powerline_fonts = 1
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#tabline#enabled = 1

set encoding=utf-8      " utf-8 default  (others: big5, gbk, euc-jp)
set number              " Show line number
set cursorline          " Show underline in current cursor
set nowrap              " not wrap the long line
set textwidth=79        " Restrict text width.

set mouse=a             " Enable mouse to use (all mode)
set scrolloff=2         " Keep space from top and bottom
set laststatus=2        " Alway show status bar at bottom

""" Tab setting
set tabstop=2           " Tab key indents X spaces at a time
set softtabstop=2       " makes the spaces feel like real tabs
set shiftwidth=2        " X spaces indents
" set expandtab           " Use spaces when the <Tab> key is pressed
" could use `:retab!` to reformat code to use tabs instead of space.

""" Folding Setting
set foldmethod=indent   " allow us fold on indent
set foldlevel=99        " don't fold by default.
"nnoremap <Space> za    " conflict with current map key.

set autoindent
set smartindent

""" Searching and Pattens
set hlsearch        " Highlight search by default.
set smarttab        " handle tab more intelligently.
set incsearch       " search pattern when still typing
set showmatch 			" highlight matching braces
set ignorecase
set smartcase

" don't backup
set nobackup
set nowb
set noswapfile

" don't redraw while executing macros (good performance config)
set lazyredraw

" Otros
set gdefault
set autowrite
syntax on
setlocal spell spelllang=en
set nospell

" no beep
set visualbell

" File System
let g:netrw_banner=0						" disable banner 
"let g:netrw_browse_split=4			" open in prior window
let g:netrw_altv=1							" open splits to the right
let g:netrw_liststyle=3					" tree view
let g:netrw_list_hide=netrw_gitignore#Hide()
"let g:netrw_list_hide.=',\(^\|\s\s\)\zs\.\S\+'

"===============================
" Hotkey Setting
"===============================
let mapleader = "-"

noremap <F1> <Esc>

nnoremap <silent> <leader> <space> :noh<cr>
nnoremap <silent> <leader>s :let _s=@/ <Bar> :%s/\s\+$//e <Bar> :let @/=_s <Bar> :nohl <Bar> :unlet _s <CR>:w<CR>

" Smart way to move between windows
noremap <Bar> <C-W>v<C-W><Right> " Vertical Split
noremap _ <C-W>s<C-W><Down> " Horizontal Split
nnoremap <Tab> <C-W>w " Switch Window
nnoremap <leader>n :tabnew<cr>:e<space>
inoremap jk <Esc>
nnoremap gb :bn<cr>

nnoremap <leader>t :tabclose<cr>	" Close tab
nnoremap <leader>b :bd<cr>				" Close buffer
nnoremap <leader>w <C-W>c					" Close window

"highlight ColorColumn ctermbg=darkgrey
"nnoremap <leader>c :set colorcolumn=<C-R>=&colorcolumn != 0 ? 0 : &textwidth + 1<CR><CR>

autocmd FileType cpp set makeprg=clang++\ -Wall\ -O2\ -std=c++1z
filetype plugin indent on

nnoremap <leader>cd :cd %:p:h<cr>:pwd<cr>

set pastetoggle=<F4>            "    when in insert mode, press <F4> to go to
                                "    paste mode, where you can paste mass data
                                "    that won't be autoindented

" disbale paste mode when leaving insert mode
au InsertLeave * set nopaste

" Automatically jump to end of text you pasted:
vnoremap <silent> y y`]
vnoremap <silent> p p`]

"===============================
" Snippets
"===============================
nnoremap ,main :-1read $HOME/.vim/.snippet_main.cpp<CR>



"===============================
" cpp Settings
"===============================
augroup comment_setting
    autocmd!
    autocmd FileType python     nnoremap <buffer> <leader>c I#<esc>
    autocmd FileType javascript nnoremap <buffer> <leader>c I// <esc>
    autocmd FileType cpp        nnoremap <buffer> <leader>c I// <esc>
augroup END

set tags+=~/.vim/tags/cpp
autocmd FileType cpp	map <F12> :!ctags -R --sort=yes --c++-kinds=+pl --fields=+iaS --extra=+q --exclude=.git .<CR>

" Save, compile
function! FastCompile()
 write
 silent! make %
 redraw!
 cwindow
endfunction
autocmd FileType cpp	nnoremap <F9> :call FastCompile()<cr>

" Save, compile and run files
function! FastRun()
 exec '!time ./a.out'
endfunction
autocmd FileType cpp	nnoremap <F5> :call FastRun()<cr>


function! FormatAll()
  let l:lines="all"
  py3f ~/.vim/clang-format.py
endfunction

autocmd FileType cpp	map <F10> :call FormatAll()<cr>
autocmd BufWritePre *.h,*.cc,*.cpp call FormatAll()

