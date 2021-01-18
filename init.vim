" Basics
set ambiwidth=double
set autoindent
set autoread
set autowrite
set cmdheight=2
set diffopt+=vertical
set encoding=UTF-8
set expandtab
set fileencodings=utf8
set grepprg=rg\ --vimgrep\ --no-heading\ --smart-case
set hidden
set history=256
set ignorecase
set incsearch 
set nobackup
set nowritebackup
set noswapfile
set lazyredraw
set magic
set matchtime=2
set mouse=a
set mousehide
set noerrorbells
set nomodeline
set noshowcmd
set nospell
set novisualbell
set nrformats=alpha,octal,hex
set pumheight=15
set ruler
set relativenumber
set shell=/bin/sh
set shiftwidth=4
set shortmess=atI
set shortmess+=c
set showmatch
set showtabline=1
set smartcase
set smarttab
set signcolumn=yes
set smartindent
set splitbelow
set splitright
set switchbuf=useopen
set tabstop=4
set termencoding=utf-8
set termguicolors
set title
set t_ti= t_te=
set t_vb=
set ttyfast
set updatetime=300
set undoreload=256
set undofile
set undodir=~/.local/share/nvim/undo/
set undolevels=1000
set virtualedit=onemore
set wildignore=*.so,*.swp,*.bak,*.pyc,*.pyo,*.class,*.zip
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
set wildmenu
set wildoptions=pum
set wrap
set clipboard=unnamed


if !isdirectory(expand("~/.local/share/nvim/undo"))
    call mkdir($HOME . "/.local/share/nvim/undo", "p")
endif

let mapleader = "\<Space>"
inoremap jk _
nnoremap U <C-r>
nnoremap <silent> n nzz
nnoremap <silent> N Nzz
nnoremap <silent> * *zz
nnoremap <silent> # #zz
nnoremap <silent> j gjzz
nnoremap <silent> k gkzz
nnoremap <silent> g* g*zz
nnoremap <silent> <BS> :noh<CR>
vnoremap < <gv
vnoremap > >gv

let g:trigger_size = 0.5 * 1048576
augroup hugefile
  autocmd!
  autocmd BufReadPre *
        \ let size = getfsize(expand('<afile>')) |
        \ if (size > g:trigger_size) || (size == -2) |
        \   echohl WarningMsg | echomsg 'WARNING: altering options for this huge file!' | echohl None |
        \   exec 'CocDisable' |
        \ else |
        \   exec 'CocEnable' |
        \ endif |
        \ unlet size
augroup END

au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif  
au InsertEnter * :set norelativenumber number
au InsertLeave * :set relativenumber
aug QFClose
  au!
  au WinEnter * if winnr('$') == 1 && getbufvar(winbufnr(winnr()), "&buftype") == "quickfix"|q|endif
aug END

if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs 
    \https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Plugin list
call plug#begin('~/.local/share/nvim/plugged')

" Theme
Plug 'phanviet/vim-monokai-pro'

" Plug
Plug 'airblade/vim-rooter'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'Yggdroot/indentLine'
Plug 'itchyny/lightline.vim'
Plug 'luochen1990/rainbow'
Plug 'tpope/vim-commentary'
Plug 'simnalamburt/vim-mundo'
Plug 'tpope/vim-repeat'
Plug 'justinmk/vim-sneak'
Plug 'tpope/vim-surround'
Plug 'mg979/vim-visual-multi'
Plug 'junegunn/fzf.vim' 
Plug 'antoinemadec/coc-fzf'
Plug 'junegunn/fzf', {'dir': '~/.fzf','do': './install --all'}
call plug#end()


" scheme
set background=light
colorscheme monokai_pro

" Plugin Config
nnoremap <Leader>p :PlugUpdate<CR>

" coc.nvim
" au
au! CompleteDone * if pumvisible() == 0 | pclose | endif
au BufWritePre *.go :silent call CocAction('runCommand', 'editor.action.organizeImport')
" common
imap <C-j> <Plug>(coc-snippets-expand-jump)
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> [d <Plug>(coc-diagnostic-prev)
nmap <silent> ]d <Plug>(coc-diagnostic-next)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> <F2> <plug>(coc-rename)
" CocList
nnoremap <Leader>f :<C-u>CocFzfList files<CR>
nnoremap <Leader><Leader> :<C-u>CocFzfList 
nnoremap <Leader>m :<C-u>CocFzfList mru<CR>
" TAB
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
" Enter
if has('patch8.1.1068')
  " Use `complete_info` if your (Neo)Vim version supports it.
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  imap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif
" hover
nnoremap <silent> gh :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction
" grep
nnoremap <Leader>g :CocList grep<CR>
nnoremap <silent> <Leader>w  :exe 'CocList -I --normal --input='.expand('<cword>').' words'<CR>
" coc-explorer
let g:coc_explorer_global_presets = {
\   '.vim': {
\      'root-uri': '~/.vim',
\   },
\   'floating': {
\      'position': 'floating',
\   },
\   'floatingLeftside': {
\      'position': 'floating',
\      'floating-position': 'left-center',
\      'floating-width': 50,
\   },
\   'floatingRightside': {
\      'position': 'floating',
\      'floating-position': 'left-center',
\      'floating-width': 50,
\   },
\   'simplify': {
\     'file.child.template': '[selection | clip | 1] [indent][icon | 1] [filename omitCenter 1]'
\   }
\ }
nnoremap ge :CocCommand explorer<CR>


" indentLine
let g:indentLine_setConceal = 0


" lightline.vim
let g:lightline = {
    \  'colorscheme': 'monokai_pro',
    \  'active': {
    \    'left': [
    \      [ 'mode', 'paste' ],
    \      [ 'ctrlpmark', 'git', 'diagnostic', 'cocstatus', 'filename', 'method' ]
    \    ],
    \    'right':[
    \      [ 'filetype', 'fileencoding', 'lineinfo', 'percent' ],
    \      [ 'blame' ]
    \    ],
    \  },
    \  'component_function': {
    \    'cocstatus': 'coc#status' 
    \  }
    \  }


" nerdcommenter
let NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1
let g:NERDDefaultAlign = 'left'
let g:NERDTrimTrailingWhitespace = 1


" rainbow
 let g:rainbow_active = 1
 let g:rainbow_conf = {
    \  'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick'],
    \  'ctermfgs': ['lightblue', 'lightyellow', 'lightcyan', 'lightmagenta'],
    \  'operators': '_,_',
    \  'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
    \  'separately': {
    \    '*': {},
    \    'tex': {
    \    'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/'],
    \    },
    \    'vim': {
    \    'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/', 'start=/{/ end=/}/ fold', 'start=/(/ end=/)/ containedin=vimFuncBody', 'start=/\[/ end=/\]/ containedin=vimFuncBody', 'start=/{/ end=/}/ fold containedin=vimFuncBody'],
    \    },
    \  'css': 0,
    \  }
    \  }

 " rooter
 let g:rooter_patterns = ['.git']
