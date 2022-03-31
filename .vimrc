let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $HOME/.vimrc
endif

call plug#begin('~/.vim/plugged')

Plug 'altercation/vim-colors-solarized' 			" Solarized Colours
Plug 'cespare/vim-toml'						" Syntax highlighting for TOML
Plug 'ctrlpvim/ctrlp.vim'					" Fuzzy File Search
Plug 'davidhalter/jedi-vim'					" Bindings for Jedi autocompletion
Plug 'dense-analysis/ale'					" Asynchronous syntax checker
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }		" Go Plugin
Plug 'majutsushi/tagbar'					" ctags browser
Plug 'markonm/traces.vim'					" Search and replace preview
Plug 'ntpeters/vim-better-whitespace' 				" Whitespace cleanup
Plug 'scrooloose/nerdtree'					" File browser
Plug 'tpope/vim-surround'					" Change surrounding quotes, brackets, etc.
Plug 'vim-airline/vim-airline'					" Status bar

call plug#end()

syntax enable
set autowrite
set background=dark
set backspace=2
set colorcolumn=80
set encoding=utf-8
set fileencoding=utf-8
set number
set shiftwidth=4
set t_ut=
set tabstop=4
filetype plugin on
colorscheme solarized

map <C-n> :NERDTreeToggle<CR>
map <C-m> :TagbarToggle<CR>

" movement shortcuts
nmap <C-H> <C-W><C-H>
nmap <C-J> <C-W><C-J>
nmap <C-K> <C-W><C-K>
nmap <C-L> <C-W><C-L>

" tab movement shortcuts
nmap H :tabprevious<CR>
nmap L :tabnext<CR>

" Go shortcuts
autocmd FileType go nmap <leader>t :GoTest<CR>

" Python shortcuts
autocmd FileType python nmap <leader>t :! poetry run pytest<CR>

let g:ale_fix_on_save = 1
let g:ale_fixers = {
	\ 'python': ['black', 'isort'],
	\ 'sh': ['shfmt'],
	\}
let g:ale_linters = {
	\ 'python': ['flake8', 'mypy'],
	\ 'sh': ['shellcheck'],
	\}
let g:better_whitespace_ctermcolor='white'
let g:better_whitespace_enabled=1
let g:jedi#popup_on_dot = 0
let g:solarized_termcolors=256
let g:strip_whitespace_confirm=0
let g:strip_whitespace_on_save=1
