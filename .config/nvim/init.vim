" Must install pip to use completor
" pip install --user pynvim
" pip install --user neovim
" Install VimPlug to config directory
" sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.config}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

source /usr/share/nvim/archlinux.vim

call plug#begin(stdpath('data') . '/plugged')
Plug 'morhetz/gruvbox'

" Use multiple cursors, select key word and Ctrl N. Press
" n to get next occurrences and i to edit all in same time.
Plug 'mg979/vim-visual-multi', {'branch': 'master'}

" Multiple languages syntax support
Plug 'sheerun/vim-polyglot'

" Fuzzy finder
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Completor
" Must install `pip instal --user neovim` to work
Plug 'maralla/completor.vim'

" Lint helper
Plug 'dense-analysis/ale'

" Status line
Plug 'itchyny/lightline.vim'

" Files manager
Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' }
call plug#end()

colorscheme gruvbox
set background=dark

" Enable tab to autocompletion
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<cr>"

" Save last position
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" Enable system clipboard access
set clipboard+=unnamedplus
" Enable edit multiple files in same window
set hidden
" Enable Numbers
set number
" Enable relative line distance
set relativenumber
" Enable mouse support
set mouse=a
" Open command splitted
set inccommand=split
" No show mode
set noshowmode
set laststatus=2

set autoindent
set expandtab
set shiftwidth=2
set smartindent
set softtabstop=2
set tabstop=2

set wrap
set linebreak

let g:lightline = { 'colorscheme': 'gruvbox' }

" Set leader key to be space key
let mapleader="\<space>"
" n-nore-map: n (normal), nore (no recursive), map (nvim shortcut)
" Add ; to end of line
nnoremap <leader>; A; <esc>
" Open nvim config file
nnoremap <leader>ev :vsplit ~/.config/nvim/init.vim<cr>
" Reload nvim configuration
nnoremap <leader>r :source ~/.config/nvim/init.vim<cr>
" Open fuzzy
nnoremap <c-p> :Files<cr>
" Open silver search
nnoremap <c-f> :Ag<space>
" Open defx
nnoremap <leader>1 :Defx -columns=icons:indent:filename:type -split=vertical -winwidth=50 -direction=topleft<cr>

nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk
nnoremap <Down> gj
nnoremap <Up> gk
vnoremap <Down> gj
vnoremap <Up> gk
inoremap <Down> <C-o>gj
inoremap <Up> <C-o>gk

" Disabled arrow keys
"noremap <Up> <Nop>
"noremap <Down> <Nop>
"noremap <Left> <Nop>
"noremap <Right> <Nop>

autocmd FileType defx call s:defx_my_settings()
	function! s:defx_my_settings() abort
	  " Define mappings
	  nnoremap <silent><buffer><expr> <CR>
	  \ defx#do_action('open')
	  nnoremap <silent><buffer><expr> c
	  \ defx#do_action('copy')
	  nnoremap <silent><buffer><expr> m
	  \ defx#do_action('move')
	  nnoremap <silent><buffer><expr> p
	  \ defx#do_action('paste')
	  nnoremap <silent><buffer><expr> l
	  \ defx#do_action('open')
	  nnoremap <silent><buffer><expr> E
	  \ defx#do_action('open', 'vsplit')
	  nnoremap <silent><buffer><expr> P
	  \ defx#do_action('preview')
	  nnoremap <silent><buffer><expr> o
	  \ defx#do_action('open_tree', 'toggle')
	  nnoremap <silent><buffer><expr> K
	  \ defx#do_action('new_directory')
	  nnoremap <silent><buffer><expr> N
	  \ defx#do_action('new_file')
	  nnoremap <silent><buffer><expr> M
	  \ defx#do_action('new_multiple_files')
	  nnoremap <silent><buffer><expr> C
	  \ defx#do_action('toggle_columns',
	  \                'mark:indent:icon:filename:type:size:time')
	  nnoremap <silent><buffer><expr> S
	  \ defx#do_action('toggle_sort', 'time')
	  nnoremap <silent><buffer><expr> d
	  \ defx#do_action('remove')
	  nnoremap <silent><buffer><expr> r
	  \ defx#do_action('rename')
	  nnoremap <silent><buffer><expr> !
	  \ defx#do_action('execute_command')
	  nnoremap <silent><buffer><expr> x
	  \ defx#do_action('execute_system')
	  nnoremap <silent><buffer><expr> yy
	  \ defx#do_action('yank_path')
	  nnoremap <silent><buffer><expr> .
	  \ defx#do_action('toggle_ignored_files')
	  nnoremap <silent><buffer><expr> ;
	  \ defx#do_action('repeat')
	  nnoremap <silent><buffer><expr> h
	  \ defx#do_action('cd', ['..'])
	  nnoremap <silent><buffer><expr> ~
	  \ defx#do_action('cd')
	  nnoremap <silent><buffer><expr> q
	  \ defx#do_action('quit')
	  nnoremap <silent><buffer><expr> <Space>
	  \ defx#do_action('toggle_select') . 'j'
	  nnoremap <silent><buffer><expr> *
	  \ defx#do_action('toggle_select_all')
	  nnoremap <silent><buffer><expr> j
	  \ line('.') == line('$') ? 'gg' : 'j'
	  nnoremap <silent><buffer><expr> k
	  \ line('.') == 1 ? 'G' : 'k'
	  nnoremap <silent><buffer><expr> <C-l>
	  \ defx#do_action('redraw')
	  nnoremap <silent><buffer><expr> <C-g>
	  \ defx#do_action('print')
	  nnoremap <silent><buffer><expr> cd
	  \ defx#do_action('change_vim_cwd')
 endfunction
