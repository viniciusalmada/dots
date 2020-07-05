" This line makes pacman-installed global Arch Linux vim packages work.
source /usr/share/nvim/archlinux.vim

" Numbers
set number

" Syntax
syntax on

" Save last position
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" Enable mouse use in all modes
set mouse=nv

" Tab with 4 spaces
set tabstop=4
"set autoindent
set shiftwidth=4
"set expandtab

inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<cr>"

" This plugin was installed from <https://github.com/junegunn/vim-plug>
call plug#begin()
" Lightline status line
Plug 'itchyny/lightline.vim'

" Toml language support
Plug 'cespare/vim-toml'

" Completor
Plug 'ternjs/tern_for_vim', { 'do': 'npm install' }
Plug 'maralla/completor.vim'

" Python jedi
Plug 'davidhalter/jedi-vim'

call plug#end()
