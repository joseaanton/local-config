
" START vundle plugins
set nocompatible              " be iMproved, required
filetype off                  " required
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

colorscheme wombat256mod
let g:airline_theme='atomic'
let g:airline_powerline_fonts = 1
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#tabline#enabled = 1
set nu
set autoindent
set smartindent
set tabstop=2
set shiftwidth=2
set ignorecase
set smartcase
set gdefault
set autoindent
set autowrite
set hlsearch
set incsearch
set showmatch
set cursorline
syntax on
setlocal spell spelllang=en
set nospell
set encoding=utf-8
set showmatch "highlight matching braces
set textwidth=80
set nowrap

let mapleader = "-"

noremap <Bar> <C-W>v<C-W><Right> "Vertical Split
noremap _ <C-W>s<C-W><Down> " Horizontal Split
nnoremap <Tab> <C-W>w " Switch Window
nnoremap <C-c> <C-W>c " Close window
nnoremap <leader>t :tabnew<cr>:e<space>

highlight ColorColumn ctermbg=darkgrey
nnoremap <leader>c :set colorcolumn=<C-R>=&colorcolumn != 0 ? 0 : &textwidth + 1<CR><CR>

autocmd FileType cpp set makeprg=clang++\ -Wall\ -O2\ -std=c++1z
filetype plugin indent on

nnoremap <leader>cd :cd %:p:h<cr>:pwd<cr>

" Save, compile
function! Compile()
 silent! cd %:p:h
 write
 silent! make %
 redraw!
 cwindow
endfunction
nnoremap <leader>b :call Compile()<cr>

" Save, compile and run files
function! CompileAndRun()
 cd %:p:h
 exec '!time ./a.out'
endfunction
nnoremap <leader>r :call CompileAndRun()<cr>


nnoremap <leader><space> :noh<cr>

nnoremap <leader>s :let _s=@/ <Bar> :%s/\s\+$//e <Bar> :let @/=_s <Bar> :nohl <Bar> :unlet _s <CR>

function! FormatAll()
  let l:lines="all"
  py3f ~/.vim/clang-format.py
endfunction

map <leader>f :call FormatAll()<cr>
autocmd BufWritePre *.h,*.cc,*.cpp call FormatAll()

