set nocompatible        " Use Vim settings, rather than Vi settings 
set softtabstop=2       " Indent by 2 spaces when hitting tab
set shiftwidth=4        " Indent by 4 spaces when auto-indenting
set tabstop=4           " Show existing tab with 4 spaces width
syntax on               " Enable syntax highlighting
filetype indent on      " Enable indenting for files
set autoindent          " Enable auto indenting
colorscheme desert      " Set color scheme
set nobackup            " Disable backup files
set laststatus=2        " SHow status line
set statusline=%F%m%r%h%w%=(%{&ff}/%Y)\ (line\ %l\/%L,\ col\ %c)\
set wildmenu            " Display command line's tab complete options as a menu.
set directory=~/.vim/swp//
set undofile			" Maintain undo history between sessions
set undodir=~/.vim/undodir//
set cursorline


" set noerrorbells		"Disable beep on errors.
" set visualbell			" Flash the screen instead of beeping on errors.

set number " relativenumber             " Enable line numbers
