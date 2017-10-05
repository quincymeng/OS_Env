syntax enable

set number

set tabstop=8

set expandtab

" Airline
let g:airline#extensions#tabline#enabled = 1 " Enable the list of buffers
let g:airline#extensions#tabline#fnamemod = ':t' " Show just the filename

" Define plugins to install
call plug#begin('~/.vim/plugged')

Plug 'https://github.com/tpope/vim-pathogen.git'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Browse the file system
Plug 'scrooloose/nerdtree'

" Ctrlp
Plug 'kien/ctrlp.vim'

" All of your Plugins must be added before the following line
call plug#end()

"remapping leaderkey to space
let mapleader ="\<Space>"


" -----------Buffer Management---------------
set hidden " Allow buffers to be hidden if you've modified a buffer

" Move to the next buffer
nmap <leader>l :bnext<CR>

" Move to the previous buffer
nmap <leader>h :bprevious<CR>

" Close the current buffer and move to the previous one
" This replicates the idea of closing a tab
nmap <leader>q :bp <BAR> bd #<CR>

" Show all open buffers and their status
nmap <leader>bl :ls<CR>


" -----------Window Navigation----------------
" to open vertically split view
nmap <leader>ov :vsp
" to open horizontally split view
nmap <leader>oh :sp

" Use arrow keys to navigate window splits
nnoremap <silent> <Right> :wincmd l <CR>
nnoremap <silent> <Left> :wincmd h <CR>
noremap <silent> <Up> :wincmd k <CR>
noremap <silent> <Down> :wincmd j <CR>

" ctrl-p
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](\.(git|hg|svn)|\_site)$',
  \ 'file': '\v\.(exe|so|dll|class|png|jpg|jpeg)$',
\}

" Use the nearest .git|.svn|.hg|.bzr directory as the cwd
let g:ctrlp_working_path_mode = 'r'

" enter file search mode
nmap <leader>p :CtrlP<cr>

" Nerdtree
autocmd vimenter * NERDTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" open and close file tree
map <C-n> :NERDTreeToggle<CR>

" open current buffer in file tree
nmap <leader>n :NERDTreeFind<CR>
