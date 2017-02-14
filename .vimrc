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
:colorscheme peachpuff
:colorscheme elflord
":colorscheme slate
":colorscheme zellner

" vimdiff
:highlight DiffAdd term=reverse cterm=bold ctermbg=green ctermfg=black
:highlight DiffChange term=reverse cterm=bold ctermbg=blue ctermfg=yellow
:highlight DiffDelete term=reverse cterm=bold ctermbg=red ctermfg=black
:highlight DiffText term=reverse cterm=bold ctermbg=black ctermfg=white

set rtp+=~/.fzf
