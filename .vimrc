" Force English locale
let $LANG = 'en_US'

" Disable Vi compatibility
set nocompatible
filetype indent plugin on

" Encoding
set encoding=utf-8 nobomb              " Internal encoding
set fileencoding=utf-8 nobomb          " New file encoding
set fileencodings=ucs-bom,utf-8,gb2312,gbk,gb18030,big5,euc-jp,euc-kr,latin1

" Indentation
set autoindent                         " Copy indent from current line
set smartindent                        " Smart autoindenting on new line
set tabstop=4                          " Tab width
set softtabstop=4                      " Spaces for tab in insert mode
set shiftwidth=4                       " Spaces for autoindent
set expandtab                          " Convert tabs to spaces

" Editing
set nobackup                           " Disable backup files
set wrap                               " Wrap long lines
set textwidth=79                       " Line width limit
set backspace=indent,eol,start         " Allow backspace over everything

" Search
set ignorecase                         " Case insensitive search
set smartcase                          " Case sensitive if capital letter present
set incsearch                          " Show matches while typing
set hlsearch                           " Highlight search results
set gdefault                           " Global substitution by default

" UI
syntax on                              " Enable syntax highlighting
set ruler                              " Show cursor position
set laststatus=2                       " Always show status line
set nonumber                           " Hide line numbers
set listchars=tab:▸\ ,trail:·,eol:¬,nbsp:_  " Whitespace characters
set splitbelow                         " Open horizontal splits below
set splitright                         " Open vertical splits to the right

" Completion
set wildmenu                           " Command-line completion menu
set wildignore+=*/tmp/*,*.so,*.swp,*.zip    " Ignore patterns

" Auto commands
augroup song_rc
    autocmd!
    autocmd VimResized * :wincmd =     " Auto-resize splits on window resize
augroup END

" File type detection
au BufNewFile,BufRead Podfile set ft=ruby

" Key bindings
let mapleader = ' '                    " Space as leader key
nmap <Esc> :nohl<CR>                   " Clear search highlights
nmap <leader>l :set list!<CR>          " Toggle invisible characters
