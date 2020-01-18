syntax on
filetype off                  " required

set ts=4
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

call plug#begin('~/.vim/plugged')
Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'theniceboy/vim-calc'
silent! au BufEnter,BufRead,BufNewFile * silent! unmap if
let g:coc_global_extensions = ['coc-python', 'coc-vimlsp', 'coc-html', 'coc-json', 'coc-css', 'coc-tsserver', 'coc-yank', 'coc-lists', 'coc-gitignore', 'coc-vimlsp', 'coc-tailwindcss', 'coc-stylelint']
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}
" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
	let col = col('.') - 1
	return !col || getline('.')[col - 1]	=~ '\s'
endfunction
inoremap <silent><expr> <Tab>
			\ pumvisible() ? "\<C-n>" :
			\ <SID>check_back_space() ? "\<Tab>" :
			\ coc#refresh()
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <silent><expr> <c-space> coc#refresh()
" Useful commands
nnoremap <silent> <space>y :<C-u>CocList -A --normal yank<cr>
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <leader>rn <Plug>(coc-rename)

Plugin 'iamcco/mathjax-support-for-mkdp'
Plugin 'iamcco/markdown-preview.vim'
" let g:mkdp_auto_start = 0
" let g:mkdp_auto_close = 1
" let g:mkdp_refresh_slow = 0
" let g:mkdp_command_for_global = 0
" let g:mkdp_open_to_the_world = 0
" let g:mkdp_open_ip = ''
" let g:mkdp_browser = 'falkon'
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

Plugin 'kshenoy/vim-signature'
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

Plugin 'junegunn/goyo.vim'
map <LEADER>yo :Goyo<CR>

Plugin 'luochen1990/rainbow'
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

Plugin 'mbbill/undotree'
let g:undotree_DiffAutoOpen = 0
set undodir=~/.undodir/
set undofile
nnoremap tt :UndotreeToggle<CR>

Plugin 'scrooloose/nerdtree'
let g:NERDTreeWinPos='left'
let g:NERDTreeSize=30
let g:NERDTreeShowLineNumbers=1
let g:NERDTreeHidden=0
map ff :NERDTreeToggle<CR>
Plugin 'scrooloose/nerdcommenter'
Plugin 'Xuyuanp/nerdtree-git-plugin'
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

Plugin 'https://github.com/vim-scripts/fcitx.vim.git'

Plugin 'junegunn/vim-easy-align'
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
set laststatus=2
set t_Co=256
set encoding=utf-8
set langmenu=zh_CN.UTF-8
" let g:airline_theme='badwolf'
let g:airline_theme='bubblegum'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#whitespace#symbol = '!'
nnoremap <C-M> :bn<CR>
nnoremap <C-N> :bp<CR>
Plugin 'jiangmiao/auto-pairs'
call vundle#end()            " required
filetype plugin indent on    " required

let mapleader=" "

nnoremap <F5>   <Esc>:w<CR>:!g++ -std=c++11 % -o /tmp/a.out && /tmp/a.out<CR>
nnoremap <C-F5>   <Esc>:w<CR>:!/opt/anaconda/bin/python3 %<CR>
nnoremap <F6> <Esc>:w<CR>:!g++ -std=c++11 -g % -o /tmp/a.out && gdb /tmp/a.out<CR>
nnoremap <F7>   <Esc>:w<CR>:!g++ -std=c++11 %<CR>

nnoremap <LEADER>m :call Calc()<CR>

nnoremap <LEADER><CR> :nohlsearch<CR>

inoremap <C-u> <esc>gUiwea
inoremap jk <esc>
inoremap kj <esc>

nnoremap s :w<CR>
nnoremap S :wq<CR>
nnoremap Q :q<CR>

nnoremap sl :set splitright<CR>:vsplit<CR>
nnoremap sh :set nosplitright<CR>:vsplit<CR>
nnoremap sk :set nosplitbelow<CR>:split<CR>
nnoremap sj :set splitbelow<CR>:split<CR>

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

nnoremap <LEADER>fd /\(\<\w\+\>\)\_s*\l
nnoremap <LEADER>sc :set spell!<CR>
noremap <C-x> ea<C-x>s
inoremap <C-x> <Esc>ea<C-x>s

" map <LEADER><LEADER> <Esc>/<++><CR>:nohlsearch<CR>c4l
noremap tx :r !figlet 

nnoremap <LEADER>ga :!git add %<CR><CR>
nnoremap <LEADER>gc :!git commit -m 
nnoremap <LEADER>gp :!git push -u origin master<CR>

inoremap <C-d> <Esc>dd
