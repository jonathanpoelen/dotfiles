set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' }
Plugin 'junegunn/fzf.vim'


" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
" Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
" Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line


" set rtp+=~/.fzf

filetype plugin on
filetype plugin indent on

" https://github.com/trapd00r/configs/tree/master/vim

set number
set expandtab
set shiftwidth=2

" autocmd FileType make set noexpandtab
" autocmd VimEnter * if @% == 'Makefile' | set noexpandtab | else | set expandtab | endif

set incsearch
":set wildignore=*.o,*.obj,*.bak,*.exe
":syntax on : display syntactical elements by color based on filetype ( extension )

"set showcmd            " Show (partial) command in status line.
"set showmatch          " Show matching brackets.
"set ignorecase         " Do case insensitive matching
"set smartcase          " Do smart case matching
"set autowrite          " Automatically save before commands like :next and :make
"set hidden             " Hide buffers when they are abandoned
"set mouse=a            " Enable mouse usage (all modes)
"set background=dark

":colorscheme koehler
":colorscheme peachpuff
:colorscheme elflord
":colorscheme slate
":colorscheme zellner

" vimdiff
:highlight DiffAdd term=reverse cterm=bold ctermbg=green ctermfg=black
:highlight DiffChange term=reverse cterm=bold ctermbg=blue ctermfg=yellow
:highlight DiffDelete term=reverse cterm=bold ctermbg=red ctermfg=black
:highlight DiffText term=reverse cterm=bold ctermbg=black ctermfg=white

:set relativenumber
:set scrolljump=3
:set mouse=n " normal mode

