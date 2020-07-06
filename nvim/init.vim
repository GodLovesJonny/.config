syntax on
filetype off                  " required

" set termguicolors

set ts=4
set visualbell
set expandtab
set tabstop=4
set shiftwidth=4
set nocompatible              " be iMproved, required
set mouse=a
set cursorline
set autoindent
set ruler
set tabstop=4
set showmatch
set number
set relativenumber
set linebreak
set wrap
set showcmd
set wildmenu
set ignorecase
set smartcase
set hlsearch
exec "nohlsearch"
set incsearch
set showmatch
set encoding=utf-8 fileencodings=ucs-bom,utf-8,cp936,iso-8859-1
set backspace=indent,eol,start
set autochdir
set scrolloff=5
" set clipboard=unnamedplus

let g:pymode_python = 'python3'
let g:pymode_rope = 0

au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif


" 基于缩进或语法进行代码折叠
set foldmethod=indent
" set foldmethod=syntax
" 启动 vim 时关闭折叠代码, za改变当前，zM关闭所有，zR打开所有
set nofoldenable

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim

call plug#begin('~/.vim/plugged')

Plug 'dart-lang/dart-vim-plugin'
Plug 'thosakwe/vim-flutter'

Plug 'tpope/vim-surround'

Plug 'dart-lang/dart-vim-plugin'
Plug 'natebosch/vim-lsc'
Plug 'natebosch/vim-lsc-dart'
autocmd BufWritePre *.dart* DartFmt

Plug 'octol/vim-cpp-enhanced-highlight', {'for': ['c', 'cpp', 'h']}

Plug 'ajmwagar/vim-deus'
" set t_Co=256
" set termguicolors
" let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
" let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
" set background=dark    " Setting dark mode
" colorscheme deus
" let g:deus_termcolors=256

Plug 'theniceboy/vim-calc'

" Plug 'neoclide/coc.vim'

Plug 'dhruvasagar/vim-table-mode'
" Use this option to define the table corner character
let g:table_mode_corner = '|'
" Use this option to define the delimiter which used by
let g:table_mode_delimiter = ' '


Plug 'iamcco/mathjax-support-for-mkdp'
Plug 'iamcco/markdown-preview.vim'
let g:mkdp_path_to_chrome = "qutebrowser"
" let g:mkdp_auto_start = 0
" let g:mkdp_auto_close = 1
" let g:mkdp_refresh_slow = 0
" let g:mkdp_command_for_global = 0
" let g:mkdp_open_to_the_world = 0
" let g:mkdp_open_ip = ''
" let g:mkdp_echo_preview_url = 0
" let g:mkdp_browserfunc = ''
" let g:mkdp_preview_options = {
    " \ 'mkit': {},
    " \ 'katex': {},
    " \ 'uml': {},
    " \ 'maid': {},
    " \ 'disable_sync_scroll': 0,
    " \ 'sync_scroll_type': 'middle',
    " \ 'hide_yaml_meta': 1
    " \ }
" let g:mkdp_markdown_css = ''
" let g:mkdp_highlight_css = ''
" let g:mkdp_port = ''
" let g:mkdp_page_title = '「${name}」'
nmap <silent> <F8> <Plug>MarkdownPreview        " for normal mode
imap <silent> <F8> <Plug>MarkdownPreview        " for insert mode
nmap <silent> <F9> <Plug>StopMarkdownPreview    " for normal mode
imap <silent> <F9> <Plug>StopMarkdownPreview    " for insert mode

Plug 'kshenoy/vim-signature'
let g:SignatureMap = {
        \ 'Leader'             :  "m",
        \ 'PlaceNextMark'      :  "m,",
        \ 'ToggleMarkAtLine'   :  "m.",
        \ 'PurgeMarksAtLine'   :  "dm-",
        \ 'DeleteMark'         :  "dm",
        \ 'PurgeMarks'         :  "dm/",
        \ 'PurgeMarkers'       :  "dm?",
        \ 'GotoNextLineAlpha'  :  "m<LEADER>",
        \ 'GotoPrevLineAlpha'  :  "",
        \ 'GotoNextSpotAlpha'  :  "m<LEADER>",
        \ 'GotoPrevSpotAlpha'  :  "",
        \ 'GotoNextLineByPos'  :  "",
        \ 'GotoPrevLineByPos'  :  "",
        \ 'GotoNextSpotByPos'  :  "mn",
        \ 'GotoPrevSpotByPos'  :  "mp",
        \ 'GotoNextMarker'     :  "",
        \ 'GotoPrevMarker'     :  "",
        \ 'GotoNextMarkerAny'  :  "",
        \ 'GotoPrevMarkerAny'  :  "",
        \ 'ListLocalMarks'     :  "m/",
        \ 'ListLocalMarkers'   :  "m?"
        \ }

Plug 'junegunn/goyo.vim'
nnoremap <LEADER>gy :Goyo<CR>

Plug 'luochen1990/rainbow'
let g:rainbow_active = 1
let g:rainbow_conf = {
\   'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick'],
\   'ctermfgs': ['lightblue', 'lightyellow', 'lightcyan', 'lightmagenta'],
\   'operators': '_,_',
\   'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
\   'separately': {
\       '*': {},
\       'tex': {
\           'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/'],
\       },
\       'lisp': {
\           'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick', 'darkorchid3'],
\       },
\       'vim': {
\           'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/', 'start=/{/ end=/}/ fold', 'start=/(/ end=/)/ containedin=vimFuncBody', 'start=/\[/ end=/\]/ containedin=vimFuncBody', 'start=/{/ end=/}/ fold containedin=vimFuncBody'],
\       },
\       'html': {
\           'parentheses': ['start=/\v\<((area|base|br|col|embed|hr|img|input|keygen|link|menuitem|meta|param|source|track|wbr)[ >])@!\z([-_:a-zA-Z0-9]+)(\s+[-_:a-zA-Z0-9]+(\=("[^"]*"|'."'".'[^'."'".']*'."'".'|[^ '."'".'"><=`]*))?)*\>/ end=#</\z1># fold'],
\       },
\       'css': 0,
\   }
\}

Plug 'mbbill/undotree'
let g:undotree_DiffAutoOpen = 0
set undodir=~/.undodir/
set undofile
nnoremap tt :UndotreeToggle<CR>

Plug 'scrooloose/nerdtree'
let g:NERDTreeWinPos='left'
let g:NERDTreeSize=30
let g:NERDTreeShowLineNumbers=1
let g:NERDTreeHidden=0
map ff :NERDTreeToggle<CR>
Plug 'scrooloose/nerdcommenter'
Plug 'Xuyuanp/nerdtree-git-plugin'
let g:NERDSpaceDelims=1
let NERDTreeMapOpenExpl = ""
let NERDTreeMapUpdir = ""
let NERDTreeMapUpdirKeepOpen = "l"
let NERDTreeMapOpenSplit = ""
let NERDTreeOpenVSplit = ""
let NERDTreeMapActivateNode = "i"
let NERDTreeMapOpenInTab = "o"
let NERDTreeMapPreview = ""
let NERDTreeMapCloseDir = "n"
let NERDTreeMapChangeRoot = "y"

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
set laststatus=2
set t_Co=256
set encoding=utf-8
set langmenu=zh_CN.UTF-8
let g:airline_theme='badwolf'
" let g:airline_theme='bubblegum'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#whitespace#symbol = '!'
nnoremap <C-M> :bn<CR>
nnoremap <C-N> :bp<CR>

Plug 'jiangmiao/auto-pairs'

Plug 'mattn/emmet-vim'

" Plug 'lervag/vimtex'
" let g:tex_flavor='latex'
" let g:vimtex_view_method='zathura'
" let g:vimtex_quickfix_mode=0
" set conceallevel=1
" let g:tex_conceal='abdmg'

" Plug 'sirver/ultisnips'
" let g:UltiSnipsExpandTrigger = '<tab>'
" let g:UltiSnipsJumpForwardTrigger = '<tab>'
" let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'

call plug#end()

filetype plugin indent on    " required

let mapleader=" "

nnoremap <F5>   <Esc>:w<CR>:!/opt/anaconda/bin/python3 %<CR>
nnoremap <C-F5>   <Esc>:w<CR>:!python3 %<CR>

nnoremap <F6>   <Esc>:w<CR>:!g++ -std=c++11 % -o /tmp/a.out && /tmp/a.out<CR>
nnoremap <C-F6> <Esc>:w<CR>:!g++ -std=c++11 -g % -o /tmp/a.out && gdb /tmp/a.out<CR>
nnoremap <F7>   <Esc>:w<CR>:!g++ -std=c++11 %<CR>

nnoremap <LEADER>m :call Calc()<CR>

nnoremap <LEADER><CR> :nohlsearch<CR>

inoremap <C-a> <esc>la

inoremap <C-u> <esc>gUiwea
inoremap jk <esc>
inoremap kj <esc>

nnoremap s :w<CR>
nnoremap S :wq<CR>
nnoremap Q :q<CR>

nnoremap <LEADER>sl :set splitright<CR>:vsplit<CR>
nnoremap <LEADER>sh :set nosplitright<CR>:vsplit<CR>
nnoremap <LEADER>sk :set nosplitbelow<CR>:split<CR>
nnoremap <LEADER>sj :set splitbelow<CR>:split<CR>

nnoremap <LEADER>l <C-w>l
nnoremap <LEADER>k <C-w>k
nnoremap <LEADER>j <C-w>j
nnoremap <LEADER>h <C-w>h

nnoremap <LEADER><up> :res -5<CR>
nnoremap <LEADER><down> :res +5<CR>
nnoremap <LEADER><left> :vertical resize+5<CR>
nnoremap <LEADER><right> :vertical resize-5<CR>

nnoremap <LEADER>nr :set norelativenumber<CR>
nnoremap <LEADER>rr :set relativenumber<CR>

nnoremap tu :tabe<CR> 
nnoremap tn :-tabnext<CR>
nnoremap tm :+tabnext<CR>

nnoremap <LEADER>sv <C-w>t<C-w>H
nnoremap <LEADER>sh <C-w>t<C-w>K

nnoremap <C-h> i**<Esc>
inoremap <C-h> **

nnoremap <LEADER>fd /\(\<\w\+\>\)\_s*\l
nnoremap <LEADER>sc :set spell!<CR>
noremap <C-x> ea<C-x>s
inoremap <C-x> <Esc>ea<C-x>s
inoremap <C-l> \\(\\)<Esc>hhha

" map <LEADER><LEADER> <Esc>/<++><CR>:nohlsearch<CR>c4l
noremap tx :r !figlet 

nnoremap <LEADER>ga :!git add %<CR><CR>
nnoremap <LEADER>gc :!git commit -m 
nnoremap <LEADER>gp :!git push -u origin master<CR>

inoremap <C-d> <Esc>dd

nnoremap <LEADER>hd ggi"""<CR>@author:<SPACE>Jonathan<SPACE>Wang<CR>@coding:<SPACE>utf-8<CR>@environment:<SPACE>Manjaro<SPACE>18.1.5<SPACE>Juhraya<CR>@date:<Esc>o<CR><Esc>i"""<Esc>

nnoremap <LEADER>ct ocategories:<CR>tags:<Esc>
