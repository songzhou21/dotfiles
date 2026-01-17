let $LANG = 'en_US'

" Plug {{{
set nocompatible    "be iMproved, required 
filetype off        "required

"call plug#begin()

"call plug#end()

filetype indent plugin on
" }}}

" General {{{
" Encoding
set encoding=utf-8 nobomb           " Vim inside encoding (buffer, register...)
set fileencoding=utf-8 nobomb       " New file encoding 
" Auto file encoding detection order
set fileencodings=ucs-bom,utf-8,gb2312,gbk,gb18030,big5,euc-jp,euc-kr,latin1 

"Folding
set nofoldenable
set foldnestmax=3
set foldmethod=syntax

set nobackup

set autochdir

set autoindent
set smartindent
" Tabs, spaces, wrapping
set tabstop=4                   " the width of a tab is set to 4.
                                " still it is a \t. it is just that
                                " vim will interpret it to be having
                                " a width of 4.
set softtabstop=4               " sets the number of columns for a tab.
set shiftwidth=4                " indents will have a width of 4.
set expandtab                   " expand tabs to spaces.

set wrap " wrap the long line to next line
set textwidth=79

set backspace=indent,eol,start

"set mouse-=a                               " no mouse
set ignorecase                              " Case insensitive search
set incsearch                               " show match when typing
set smartcase                               " be case sensitive when input has a captial letter
set gdefault                                " all matches in a line are substituted

set wildmenu                                " Show list instead of just completing
set wildignore+=*/tmp/*,*.so,*.swp,*.zip    " Ignore file extentions


" vimrc group
augroup song_rc
    "clean existed autocmds
    autocmd!
augroup END

autocmd song_rc VimResized * :wincmd =              " Resize splits when the window is resized
set shell=/bin/zsh

" ui
syntax on            " enable syntax hightlighting
set ruler

set laststatus=2
set listchars=tab:▸\ ,trail:·,eol:¬,nbsp:_  " show “invisible” characters
"set nolist                                    " show listchars
set hlsearch                                " Highlight search terms
set nonumber

set splitbelow
set splitright

" }}}

" File type {{{
    " fastlane {{{
        au BufNewFile,BufRead Podfile set ft=ruby
        au BufNewFile,BufRead Appfile set ft=ruby
        au BufNewFile,BufRead Fastfile set ft=ruby
        au BufNewFile,BufRead Deliverfile set ft=ruby
        au BufNewFile,BufRead Pluginfile set ft=ruby
    "}}}
    
" }}}


" Key bindings {{{
let mapleader = ' '

" clear search highlights
nmap <Esc> :nohl<CR>

" Toggle `set list` to show invisible chars
nmap <leader>l :set list!<CR>
"}}}

let g:fzf_preview_window = []
