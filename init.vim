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
" => Codigo
Plug 'mattn/emmet-vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'pangloss/vim-javascript'
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
 "TAB in general mode will move to text buffer
"nnoremap <TAB> :bnext<CR>
 "SHIFT-TAB will go back
"nnoremap <S-TAB> :bprevious<CR>
nnoremap <leader>k :bnext<CR>
nnoremap <leader>j :bprevious<CR>
" Dividir pantalla de manera vertical u horizontal
nnoremap <leader>z :vsp<CR>
nnoremap <leader>x :sp<CR>

" => Configuracion para vim-javascript
let g:javascript_plugin_jsdoc = 1

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
let g:NERDTreeQuitOnOpen=1

" => Configuracion para easymotion
nmap <leader>s <Plug>(easymotion-s2)

" => Configuracion para nerdcommenter
nmap ++ <Plug>NERDCommenterToggle
vmap ++ <Plug>NERDCommenterToggle

" => Configuracion para tagbar
nmap <F9> :TagbarToggle<CR>

" => Configurar closetag
let g:closetag_filenames = "*.html, *.jsx, *.js"

" => Configuracion para coc.nvim
" TextEdit might fail if hidden is not set.
set hidden
" Give more space for displaying messages.
set cmdheight=2
" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300
" Don't pass messages to |ins-completion-menu|.
set shortmess+=c
" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("nvim-0.5.0") || has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif
" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
    \ pumvisible() ? "\<C-n>" :
    \ CheckBackspace() ? "\<TAB>" :
    \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif
" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
    \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
" Use K to show documentation in preview window.
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction
" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')
" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)
" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end
" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)
" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)
" Run the Code Lens action on the current line.
nmap <leader>cl  <Plug>(coc-codelens-action)
" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)
" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif
" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)
" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocActionAsync('format')
" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)
" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')
" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}
