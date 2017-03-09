" .vimrc
set encoding=utf-8

" Vim-Plug Section
call plug#begin()
" Plug's go here
Plug 'junegunn/vim-easy-align'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-rails'
Plug 'vim-ruby/vim-ruby'
Plug 'skalnik/vim-vroom' " run tests/rspec in vim
Plug 'tpope/vim-endwise' " insert ends after methods, if, else, etc
call plug#end()


""""""""""""""""
" vim-easy-align
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)
" end vim-easy-align setup
""""""""""""""""



syntax on                         " show syntax highlighting
filetype plugin indent on
set autoindent                    " set auto indent
set ts=2                          " set indent to 2 spaces
set shiftwidth=2
set expandtab                     " use spaces, not tab characters
set nocompatible                  " don't need to be compatible with old vim
set number                        " show absolute current line number
set relativenumber                " show relative line numbers
set showmatch                     " show bracket matches
set ignorecase                    " ignore case in search
set hlsearch                      " highlight all search matches
set cursorline                    " highlight current line
set smartcase                     " pay attention to case when caps are used
set incsearch                     " show search results as I type
set ttimeoutlen=100               " decrease timeout for faster insert with 'O'
set vb                            " enable visual bell (disable audio bell)
set ruler                         " show row and column in footer
set scrolloff=2                   " minimum lines above/below cursor
set laststatus=2                  " always show status bar
set list listchars=tab:»·,trail:· " show extra space characters
set nofoldenable                  " disable code folding
set clipboard=unnamed             " use the system clipboard
set wildmenu                      " enable bash style tab completion
set wildmode=list:longest,full

" set color scheme
colorscheme blackboard

" mappings
let mapleader = ","
nnoremap <Leader>f :NERDTreeToggle<Enter>
nnoremap <silent> <Leader>v :NERDTreeFind<CR>

" nerdtree settings
let NERDTreeAutoDeleteBuffer = 1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1

" highlight the status bar when in insert mode
if version >= 700
  au InsertEnter * hi StatusLine ctermfg=235 ctermbg=2
  au InsertLeave * hi StatusLine ctermbg=240 ctermfg=12
endif

" highlight trailing spaces in annoying red
highlight ExtraWhitespace ctermbg=1 guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

" Open NerdTree when opening vim with no command line arguments
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
