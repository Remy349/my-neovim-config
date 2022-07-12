" => Instalar plugins externos para nvim
call plug#begin("~/AppData/Local/nvim/plugged")

" => Integracion con Git
Plug 'mhinz/vim-signify'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'junegunn/gv.vim'
Plug 'Xuyuanp/nerdtree-git-plugin'
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
syntax enable

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
set nowritebackup
set incsearch
set ignorecase
set termguicolors
set showcmd
set ruler
set noshowmode
set t_Co=256

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
" TAB in general mode will move to text buffer
nnoremap <TAB> :bnext<CR>
" SHIFT-TAB will go back
nnoremap <S-TAB> :bprevious<CR>
" Dividir pantalla de manera vertical u horizontal
nnoremap <leader>z :vsp<CR>
nnoremap <leader>x :sp<CR>

" => Configurar la integracion con git
" Nerdtree git plugin
let g:NERDTreeGitStatusIndicatorMapCustom = {
    \ 'Modified'  :'פֿ',
    \ 'Staged'    :'﬘',
    \ 'Untracked' :'',
    \ 'Renamed'   :'',
    \ 'Unmerged'  :'',
    \ 'Deleted'   :'﯊',
    \ 'Dirty'     :'',
    \ 'Ignored'   :'',
    \ 'Clean'     :'',
    \ 'Unknown'   :'',
    \ }

let g:NERDTreeGitStatusUseNerdFonts = 1
let g:NERDTreeGitStatusConcealBrackets = 1

" Vim signify
let g:signify_sign_add               = ''
let g:signify_sign_delete            = ''
let g:signify_sign_delete_first_line = '‾'
let g:signify_sign_change            = ''
" If you like colors instead
"highlight SignifySignAdd                  ctermbg=green                guibg=#00ff00
"highlight SignifySignDelete ctermfg=black ctermbg=red    guifg=#ffffff guibg=#ff0000
"highlight SignifySignChange ctermfg=black ctermbg=yellow guifg=#000000 guibg=#ffff00
" If you like colors instead
highlight SignifySignAdd    ctermbg=green  guifg=#00ff00
highlight SignifySignDelete ctermbg=red    guifg=#ff0000
highlight SignifySignChange ctermbg=yellow guifg=#ffff00
" If you like colors instead
"highlight SignifySignAdd    ctermfg=black ctermbg=green  guifg=#000000 guibg=#00ff00
"highlight SignifySignDelete ctermfg=black ctermbg=red    guifg=#000000 guibg=#ff0000
"highlight SignifySignChange ctermfg=black ctermbg=yellow guifg=#000000 guibg=#ffff00

" => Configuracion para airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline_theme = 'onedark'

" => Configurar el indentline
let g:indentLine_char = "┆"

" => Configuracion para nerdtree
nnoremap <leader>n :NERDTreeToggle<CR>
let g:NERDTreeShowHidden = 1

" => Configuracion para easymotion
nmap <leader>s <Plug>(easymotion-s2)

" => Configuracion para nerdcommenter
nmap ++ <Plug>NERDCommenterToggle
vmap ++ <Plug>NERDCommenterToggle

" => Configuracion para tagbar
nmap <F9> :TagbarToggle<CR>

" => Configurar closetag
let g:closetag_filenames = "*.html, *.jsx, *.js"
