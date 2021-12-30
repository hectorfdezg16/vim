syntax on

set mouse=a
set noerrorbells
set sw=2
set expandtab
set smartindent
set number
set rnu
set numberwidth=1
set nowrap
set noswapfile
set nobackup
set incsearch
set ignorecase
set clipboard=unnamedplus
set encoding=utf-8
set cursorline
set termguicolors
set splitbelow
set splitright
set ruler

set colorcolumn=120
highlight ColoColumn ctermbg=0 guibg=lightgrey

call plug#begin('~/.local/share/nvim/site/autoload')

"themes
Plug 'morhetz/gruvbox'
Plug 'joshdick/onedark.vim'
Plug 'NLKNguyen/papercolor-theme'

"visual
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ryanoasis/vim-devicons'
Plug 'lilydjwg/colorizer'
Plug 'leafgarland/typescript-vim'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'Yggdroot/indentLine'
Plug 'sheerun/vim-polyglot'

"git
Plug 'mhinz/vim-signify'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'junegunn/gv.vim'

"functionality
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdtree'
Plug 'christoomey/vim-tmux-navigator'
Plug 'KabbAmine/vCoolor.vim'
Plug 'easymotion/vim-easymotion'
Plug 'rust-lang/rust.vim'
Plug 'cespare/vim-toml'
Plug 'vim-python/python-syntax'

"code modification
Plug 'ddollar/nerdcommenter'
Plug 'honza/vim-snippets'
Plug 'sirver/ultisnips'
Plug 'jiangmiao/auto-pairs'
Plug 'mattn/emmet-vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'ervandew/supertab'
Plug 'rhysd/vim-clang-format'
Plug 'w0rp/ale'

call plug#end()

let mapleader=" " "tecla líder nos permite ejecutar comandos que queramos

"theme
let g:python_highlight_all=1
set background=dark
let g:gruvbox_contrast_dark="hard"
colorscheme PaperColor

nmap <F5> :source ~/.config/nvim/init.vim<CR>
vmap <F5> :source ~/.config/nvim/init.vim<CR>

noremap <up> <nop>
noremap <down> <nop>
noremap <left> <nop>
noremap <right> <nop>

nnoremap <leader>w :w<CR>
nnoremap <silent> <right> :vertical resize +5<CR>
nnoremap <silent> <left> :vertical resize -5<CR>
nnoremap <silent> <up> :resize +5<CR>
nnoremap <silent> <down> :resize -5<CR>
nnoremap <leader>e :e $MYVIMRC<CR>

vnoremap <c-t> :split<CR>:ter<CR>:resize 15<CR>
nnoremap <c-t> :split<CR>:ter<CR>:resize 15<CR>

"moverse al buffer siguiente con <líder> + k
nnoremap <leader>k :bnext<CR>

"moverse al buffer anterior con <líder> + j
nnoremap <leader>j :bprevious<CR>

"cerrar el buffer actual con <líder> + q
nnoremap <leader>q :bdelete<CR>

"crear una nueva ventana
nnoremap <leader>t :tabe<CR>

"hacer un split vertical
nnoremap <leader>vs :vsp<CR>

"hacer un split horizontal
nnoremap <leader>sp :sp<CR>

"configuration of FZF
let g:fzf_preview_window='right:40%'
nnoremap <c-p> :Files<CR>
nnoremap <c-g> :GitFiles<CR>
"use current git repo/file director with ctrl p
let g:ctrlp_working_path_mode='ra'
let g:ctrlp_use_caching=0

"invertir direccion de navegacion (de arriba a abajo)
let g:SuperTabDefaultCompletionType = '<c-n>'

"signify
"change these if you want
let g:signify_sign_add               = '+'
let g:signify_sign_delete            = '_'
let g:signify_sign_delete_first_line = '‾'
let g:signify_sign_change            = '~'

"i find the numbers disctracting
let g:signify_sign_show_count = 0
let g:signify_sign_show_text = 1

"jump though hunks
nmap <leader>gj <plug>(signify-next-hunk)
nmap <leader>gk <plug>(signify-prev-hunk)
nmap <leader>gJ 9999<leader>gJ
nmap <leader>gK 9999<leader>gk

"if you like colors instead
highlight SignifySignAdd                  ctermbg=green                guibg=#00ff00
highlight SignifySignDelete ctermfg=black ctermbg=red    guifg=#ffffff guibg=#f00000
highlight SignifySignChange ctermfg=black ctermbg=yellow guifg=#000000 guibg=#ffff00

"trigger configuration
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

"vim emmet configuration C-Z,
let g:user_emmet_leader_key='C-Z'

"rust configuration
let g:rustfmt_autosave=1

nnoremap / /a<DEL>

"indentline
let g:indentLine_char_list = ['|', '┊']

"easymotion
nmap <leader>f <Plug>(easymotion-s2)
let g:EasyMotion_smartcase = 1

"NERDTree
let g:NERDTreeChDirMode=2
cnoreabbrev tree NERDTreeToggle
cnoreabbrev find NERDTreeFind
map <leader>nt :NERDTreeFind<CR>
"nerdtree se inicia automaticamente
autocmd VimEnter * NERDTree
"actualizar nerdtree al añadir d/f en la terminal
nmap <leader>r :NERDTreeFocus<CR>R<c-w><c-p>

"configuring the highlight devicons
let g:NERDTreeFileExtensionHighlightFullName=1
let g:NERDTreeExactMatchHighlightFullName=1
let g:NERDTreePatternMatchHighlightFullName=1

"configuring clang
let g:clang_format#auto_format=1

"buffers
map <leader>ob :Buffers<CR>

"vim devicons
if exists("g:loaded_webdevicons")
  call webdevicons#refresh()
endif

let g:airline#extensions#tabline#enabled = 1  " Mostrar buffers abiertos (como pestañas)
let g:airline#extensions#tabline#fnamemod = ':t'  " Mostrar sólo el nombre del archivo

"cargar fuente Powerline y símbolos (ver nota)
let g:airline_powerline_fonts = 1

set noshowmode  " No mostrar el modo actual (ya lo muestra la barra de estado)

"no mostrar en ciertos tipos de buffers y archivos
let g:indentLine_fileTypeExclude = ['text', 'sh', 'help', 'terminal']
let g:indentLine_bufNameExclude = ['NERD_tree.*', 'term:.*']

"mostrar mejor mensajes ale
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
