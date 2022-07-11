" => Instalar plugins externos para nvim
call plug#begin("~/AppData/Local/nvim/plugged")

" => Funcionalidad
Plug 'christoomey/vim-tmux-navigator'
Plug 'scrooloose/nerdtree'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'easymotion/vim-easymotion'
Plug 'preservim/nerdcommenter'
Plug 'majutsushi/tagbar'
Plug 'jiangmiao/auto-pairs'
Plug 'alvan/vim-closetag'
" => Visual
Plug 'yggdroot/indentline'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ryanoasis/vim-devicons'
Plug 'lilydjwg/colorizer'
" => Temas para el editor
Plug 'ayu-theme/ayu-vim'
Plug 'joshdick/onedark.vim'
Plug 'morhetz/gruvbox'

call plug#end()

" => Configuraciones basicas/nativas de nvim
syntax on

set number
set mouse=a
set encoding=utf-8
set relativenumber
set showmatch
set sw=4
set nowrap
set clipboard=unnamed
set smartindent
set expandtab
set noerrorbells
set numberwidth=1
set noswapfile
set nobackup
set incsearch
set ignorecase
" set cursorline
set termguicolors
set showcmd
set ruler
set noshowmode

" => Establecer los temas
let ayucolor="mirage"
colorscheme ayu

" => Configuraciones personalizadas del editor
let mapleader = " "
" Mover bloques de codigo
xnoremap K :move '<-2<CR>gv-gv
xnoremap J :move '>+1<CR>gv-gv
" Realizar indentacion
vnoremap < <gv
vnoremap > >gv
" Bloquear las teclas/flechas direccionales
noremap <up> <nop>
noremap <down> <nop>
noremap <left> <nop>
noremap <right> <nop>
" Entrar/salir del modo insertar
:inoremap ii <Esc>
" Atajos basicos para guardar, eliminar y crear nuevo buffer/archivo
nnoremap <leader>w :w<CR>
nnoremap <leader>q :bdelete<CR>
nnoremap <leader>t :tabe<CR>
" Cambiar el tamaño de los buffers, si es que hay multiples de ellos
nnoremap <silent> <right> :vertical resize +5<CR>
nnoremap <silent> <left> :vertical resize -5<CR>
nnoremap <silent> <up> :resize +5<CR>
nnoremap <silent> <down> :resize -5<CR>
" Cambiar/navegar entre los buffers, si es que hay multiples de ellos
nnoremap <leader>k :bnext<CR>
nnoremap <leader>j :bprevius<CR>
" Dividir pantalla de manera vertical u horizontal
nnoremap <leader>z :vsp<CR>
nnoremap <leader>x :sp<CR>

" => Configurar el indentline
let g:indentLine_char = "┆"

" => Configuracion para nerdtree
nnoremap <leader>n :NERDTreeToggle<CR>
let g:NERDTreeShowHidden=1

" => Configuracion para easymotion
nmap <leader>s <Plug>(easymotion-s2)

" => Configuracion para nerdcommenter
nmap ++ <Plug>NERDCommenterToggle
vmap ++ <Plug>NERDCommenterToggle

" => Configuracion para tagbar
nmap <F9> :TagbarToggle<CR>

" => Configurar closetag
let g:closetag_filenames = "*.html, *.jsx, *.js"
