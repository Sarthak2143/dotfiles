syntax on
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set autoindent
set mouse=a
set magic
set noswapfile
set nobackup
set nowb
set nocompatible
set hlsearch
filetype off
syntax enable
set background=dark

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'jiangmiao/auto-pairs'
Plugin 'mattn/emmet-vim'
Plugin 'preservim/nerdtree'
call vundle#end()
filetype plugin indent on

if (empty($TMUX))
  if (has("nvim"))
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  if (has("termguicolors"))
    set termguicolors
  endif
endif

let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall
