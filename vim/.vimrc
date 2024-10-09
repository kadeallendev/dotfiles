" Fast and minimal vim config

" Syntax highlighting
syntax on

" Indenting
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set smartindent

" Line numbers
set nu
set relativenumber

" Disable sounds on errors
set noerrorbells
set novisualbell

" Sign column
set signcolumn=number

" Searching
set nohlsearch
set ignorecase
set smartcase
set incsearch

" Scrolloff
set scrolloff=6

" Command history
set history=500

" Enable filetype plugins
filetype plugin on
filetype indent on

" Detect changes in open files and reopen
set autoread
au FocusGained,BufEnter * silent! checktime

" Turn on wild menu
set wildmenu

" Turn on ruler (file progress)
set ruler

" Improved backspacing
set backspace=eol,start,indent

" Don't redraw when executing macros (improves performance)
set lazyredraw

" Turn magic on for regular expressions
set magic


" Return to last edit position when opening files
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" ------------
" Mappings
" ------------

" Leader key
let mapleader=" "

" Window movement
nnoremap <C-h> <C-W>h
nnoremap <C-j> <C-W>j
nnoremap <C-k> <C-W>k
nnoremap <C-l> <C-W>l

" -----------
"  Visual
" ----------
" Set utf8 as standard encoding
set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos,mac

" Status line
" Always show the status line
set laststatus=2

" set statusline=\ %F%m%r%h\ %w\ \ %r%{getcwd()}%h\ \ \ Line:\ %l\ \ Column:\ %c

" Format the status line
" Create highlight group
highlight StatusLineCWD guifg=#5ea1ff gui=bold
function! StatusLine()
  let cwd = getcwd()
  let home = expand('~')
  let full_fname = expand('%:p')

  " Replace home directory with ~
  if stridx(cwd, home) == 0
    let cwd = substitute(cwd, home, '~', '')
  endif

  if stridx(full_fname, home) == 0
    let full_fname = substitute(full_fname, home, '~', '')
  endif

  " Replace cwd in full_fname if it's a subdirectory of cwd
  if stridx(full_fname, cwd) == 0
    let relative_fname = full_fname[len(cwd) + 1:]

    return '%<' . '%h' . '%#StatusLineCWD#' . cwd . '/' . '%*' . relative_fname . ' ' . '%m' . '%=' . '%y ' . '(%l,%c%V)' . ' ' . '%P'
  else
    return full_fname
  endif
endfunction

set statusline=%!StatusLine()

" --------
" Backups
" --------

" Turn backups off
set nobackup
set nowb
set noswapfile

" --------
" Plugins
" -------
call plug#begin()

Plug 'rose-pine/vim'

call plug#end()

" Colorscheme
colorscheme rosepine

