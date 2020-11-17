" Enable Vundle: vim plugin manager
 filetype plugin on
 set nocompatible              " be iMproved, required
 filetype off                  " required

 set rtp+=~/.vim/bundle/Vundle.vim
 call vundle#begin()
 Plugin 'VundleVim/Vundle.vim'
 Plugin 'ryanoasis/vim-devicons'
 Plugin 'preservim/nerdtree'
 Plugin 'wincent/terminus'
 Plugin 'junegunn/vim-peekaboo'
 call vundle#end()
 filetype plugin indent on

" Basic Behavior
 set number              " show line numbers
 set relativenumber      " relative lines
 set wrap                " wrap lines
 set encoding=utf8       " set encoding to UTF-8 (default was "latin1")
 set mouse=a             " enable mouse support (might not work well on Mac OS
" X)
 set wildmenu            " visual autocomplete for command menu
 set lazyredraw          " redraw screen only when we need to
 set showmatch           " highlight matching parentheses / brackets [{()}]
 set laststatus=2        " always show statusline (even with only single
 set nopaste
" window)
 set ruler               " show line and column number of the cursor on right
" side of statusline
" set visualbell         " blink cursor on error, instead of beeping

" Key Bindings
 source ~/custom-confs/vim/no_arrows.vim

" NerdTree
 nmap <C-f> :NERDTreeToggle<CR>
 autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif " Quit vim if only NERTTree tab remains
 nmap <C-h> <C-w>h
 nmap <C-l> <C-w>l
 nmap <C-k> <C-w>k
 nmap <C-j> <C-w>j


" Cscope
 source ~/custom-confs/vim/cscope_maps.vim

" Vim Appearance
"
" put colorscheme files in ~/.vim/colors/
 colorscheme slate 

" use filetype-based syntax highlighting, ftplugins, and indentation
 syntax enable

" Tab settings
 set tabstop=4           " number of spaces per <TAB>
 set expandtab           " convert <TAB> key-presses to spaces
 set shiftwidth=4        " set a <TAB> key-press equal to 4 spaces

 set autoindent          " copy indent from current line when starting a new line
 set smartindent         " even better autoindent (e.g. add indent after '{')

function! s:DiffWithSaved()
  let filetype=&ft
  diffthis
  vnew | r # | normal! 1Gdd
  diffthis
  exe "setlocal bt=nofile bh=wipe nobl noswf ro ft=" . filetype
endfunction
com! DiffSaved call s:DiffWithSaved()

" Syntax for some file extensions
autocmd BufNewFile,BufRead *.bb* set syntax=sh
