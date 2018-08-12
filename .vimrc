let mapleader = ','

" turn on line numbers
set number

" set soft tabs @ 2 spaces
set tabstop=2
set shiftwidth=2
set expandtab
set ruler
set showcmd
" set cursorline
set ai
set noshowmode
set encoding=utf-8
set clipboard=unnamedplus
set autoindent
set smartindent
set hlsearch
set noswapfile
" set 
set guifont=DejaVu\ Sans\ Mono\ for\ Powerline\ 10
set guioptions-=m  "remove menu bar

set background=dark

if exists('+colorcolumn')
  set colorcolumn=80
endif

" add mouse support
set mouse=a

" turn on colors
set t_Co=256

" turn off gui scroll bars and toolbar
set guioptions-=L
set guioptions-=r
set guioptions-=T

set noshowmode " hide current mode indicator

" disable indentLine for json files (hides quotes otherwise)
autocmd Filetype json let g:indentLine_setConceal = 0

" plugins
call plug#begin('~/.vim/plugged')

Plug 'airblade/vim-gitgutter' " git gutter for vim
Plug 'jszakmeister/vim-togglecursor' " show cursor as I bar in insert mode
Plug 'jiangmiao/auto-pairs' " add and delete brackets in pairs
Plug 'vim-airline/vim-airline' " airline power bar
Plug 'vim-airline/vim-airline-themes' " airline power bar themes
" Plug 'Yggdroot/indentLine' " causes issues with json files
Plug 'tomtom/tcomment_vim' " code commenter (gc)
Plug 'scrooloose/nerdtree' " nerdtree file tree
" Plug 'dracula/vim', { 'as': 'dracula' } " dracula theme
Plug 'nathanaelkane/vim-indent-guides' " indent guides
Plug 'mxw/vim-jsx' " jsx syntax highlighting
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' } " fuzzy file finder (see bellow)
Plug 'junegunn/fzf.vim'
Plug 'vim-scripts/copypath.vim' " copy file path with :CopyPath
Plug 'ajmwagar/vim-deus' " deus color scheme
" Plug 'NLKNguyen/papercolor-theme'
" Plug 'hzchirs/vim-material' " vim-material theme
Plug 'rhysd/vim-crystal' " crystal syntax
Plug 'tpope/vim-fugitive' " fugitive git wrapper
Plug 'silvertale/vim', {'as': 'dracula'}
call plug#end()

colorscheme dracula "vim-material deus dracula

" add fzf for fuzzy finder
set rtp+=/usr/local/opt/fzf
set rtp+=~/.fzf

" add keybindings for fzf
nmap <Leader>b :Buffers<CR>
nmap <Leader>t :Files<CR>
nmap <Leader>r :Tags<CR>

" add keybinding for copying current file path
nnoremap <leader>p :let @+=expand("%")<CR>

" use normal backspace in gvim
set backspace=2
set backspace=indent,eol,start

"remap movement keys to be the same as i3
noremap ; l
noremap l k
noremap k j
noremap j h

" map next and previous buffers
nmap <C-n> :bnext<CR>
nmap <C-p> :bprev<CR>


" turn on gitgutter
let g:gitgutter_enabled = 1

" set nerdtree shortcut
map <C-t> :NERDTreeToggle<CR>

" show nerdtree when no file was specified
"autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" turn on airline (power bar)
let g:airline_powerline_fonts = 1
let g:Powerline_symbols = 'unicode'

" copy file path
if exists("loaded_copypath")
  finish
endif
let loaded_copypath = 1

function CopyPath()
  let @+=expand('%:p')
endfunction

function CopyFileName()
  let @+=expand('%:t')
endfunction

command! -nargs=0 CopyPath call CopyPath()
command! -nargs=0 CopyFileName call CopyFileName()
