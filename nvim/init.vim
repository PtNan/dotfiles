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
set syntax=off

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

lua require('plugins')
au BufWritePost plugins.lua PackerCompile
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif                        

" " coc.nvim
" " au
" let g:trigger_size = 0.5 * 1048576
" augroup hugefile
"   autocmd!
"   autocmd BufReadPre *
"         \ let size = getfsize(expand('<afile>')) |
"         \ if (size > g:trigger_size) || (size == -2) |
"         \   echohl WarningMsg | echomsg 'WARNING: altering options for this huge file!' | echohl None |
"         \   exec 'CocDisable' |
"         \ else |
"         \   exec 'CocEnable' |
"         \ endif |
"         \ unlet size
" augroup END
" au! CompleteDone * if pumvisible() == 0 | pclose | endif
" au BufWritePre *.go :silent call CocAction('runCommand', 'editor.action.organizeImport')
" "
" " TAB
" function! s:check_back_space() abort
"   let col = col('.') - 1
"   return !col || getline('.')[col - 1]  =~# '\s'
" endfunction

" inoremap <silent><expr> <TAB>
"       \ pumvisible() ? "\<C-n>" :
"       \ <SID>check_back_space() ? "\<TAB>" :
"       \ coc#refresh()
" inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
" " Enter
" inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
