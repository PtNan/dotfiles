{ config, pkgs, ... }:

{
  home.username = "ptnan";
  home.homeDirectory = "/Users/ptnan";

  programs.home-manager.enable = true;
  programs.vscode = {
        enable = true;
        package = pkgs.vscode;
  };

  home.packages = [
    pkgs.ripgrep
    pkgs.starship
  ];

  programs.git = {
    package = pkgs.gitAndTools.gitFull;
    enable = true;
    userName = "xujingnan";
    userEmail = "xujingnan@bilibili.com";
  };
  programs.neovim = {
    enable = true; 
    extraConfig = ''
	set autoindent
	set autoread
	set cmdheight=2
	set diffopt+=vertical
	set expandtab
	set fileencodings=utf8
	set grepprg=rg\ --vimgrep\ --no-heading\ --smart-case
	set history=256
	set ignorecase
	set incsearch 
	set nobackup
	set nowritebackup
	set noswapfile
	set lazyredraw
	set magic
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
	set shortmess=atIc
	set showmatch
	set showtabline=1
	set smartcase
	set smarttab
	set smartindent
	set splitbelow
	set splitright
	set tabstop=4
	set termencoding=utf-8
	set termguicolors
	set t_ti= t_te=
	set t_vb=
	set ttyfast
	set updatetime=300
	set undoreload=256
	set undofile
	set undolevels=1000
	set virtualedit=onemore
	set wildignore=*.so,*.swp,*.bak,*.pyc,*.pyo,*.class,*.zip
	set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
	set wildignorecase
	set wildmenu
	set wildoptions=pum
	set clipboard=unnamed
	set completeopt=menuone,noselect
	syntax off

	let mapleader = "\<Space>"
	inoremap jk _
	nnoremap U <C-r>
	nnoremap <silent> j gj
	nnoremap <silent> k gk
	nnoremap <silent> <BS> :noh<CR>
	vnoremap < <gv
	vnoremap > >gv

	au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif                        
	lua require('plugins')
    '';	
  };
}
