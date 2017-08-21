" =================================================== 
" Bundle list
" ===================================================

set nocompatible

if has('vim_starting')
   set nocompatible
   set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#begin(expand('~/.vim/bundle/'))

NeoBundleFetch 'Shougo/neobundle.vim' 

NeoBundle 'Shougo/vimproc.git', {
        \ 'build' : {
        \     'unix' : 'make -f make_unix.mak',
        \    },
        \ } 
         
NeoBundle 'Shougo/unite.vim.git'
NeoBundle 'Shougo/neocomplete'
" NeoBundle 'Shougo/neosnippet.git'
" NeoBundle 'Shougo/neosnippet-snippets.git'
NeoBundle 'SirVer/ultisnips'
NeoBundle 'honza/vim-snippets'
NeoBundle 'Shougo/vimfiler.git'
NeoBundle 'Shougo/context_filetype.vim.git'
NeoBundle 'Shougo/neomru.vim'
NeoBundle 'tpope/vim-rails.git'
NeoBundle 'tpope/vim-repeat.git'
NeoBundle 'tpope/vim-surround.git'
NeoBundle 'tpope/vim-abolish.git' 
NeoBundle 'tpope/vim-sleuth.git' 
NeoBundle 'tpope/vim-endwise'
NeoBundle 'tpope/vim-fugitive.git'
NeoBundle 'junegunn/gv.vim'
NeoBundle 'jaxbot/github-issues.vim'

NeoBundle 'vim-scripts/YankRing.vim.git'
NeoBundle 'vim-scripts/Vim-R-plugin.git'
" NeoBundle 'jalvesaq/Nvim-R'
NeoBundle 'cpfaff/tex.vim--Tanzler'
NeoBundle 'scrooloose/nerdcommenter.git'
NeoBundle 'scrooloose/syntastic.git'
NeoBundle 'Lokaltog/vim-easymotion'
NeoBundle 'vim-scripts/camelcasemotion.git'
NeoBundle 'bling/vim-airline'
NeoBundle 'vim-airline/vim-airline-themes'
NeoBundle 'airblade/vim-gitgutter.git' 
NeoBundle 'junegunn/vim-easy-align'
NeoBundle 'Raimondi/delimitMate'
NeoBundle 'vim-scripts/matchit.zip'
NeoBundle 'sukima/xmledit.git'
NeoBundle 'nathanaelkane/vim-indent-guides'
NeoBundle 'altercation/vim-colors-solarized.git'
NeoBundle 'skwp/greplace.vim'
NeoBundle 'kana/vim-niceblock.git'
NeoBundle 't9md/vim-textmanip'
NeoBundle 'ervandew/screen.git'
NeoBundle 'sjl/gundo.vim'
NeoBundle 'vim-scripts/CmdlineComplete.git'
NeoBundle 'drmikehenry/vim-fixkey'
NeoBundle 'cpfaff/googurl.vim'
NeoBundle 'niklasl/vim-rdf'
NeoBundle 'oplatek/Conque-Shell'
NeoBundle 'chrisbra/csv.vim'

 " testing
 " NeoBundle 'zhaocai/GoldenView.Vim'
 " NeoBundle 'gregsexton/gitv'
 " NeoBundle 'wellle/tmux-complete.vim'
 " NeoBundle 'Olical/vim-enmasse'
 " NeoBundle 'tommcdo/vim-exchange'
 " NeoBundle 'haya14busa/incsearch.vim'
 " NeoBundle 'sk1418/Join'
 " NeoBundle 'AndrewRadev/splitjoin.vim'
 NeoBundle 'Konfekt/FastFold'
 " NeoBundle 'vim-scripts/DrawIt'
 " NeoBundle 'airblade/vim-rooter'

 
 call neobundle#end()
 NeoBundleCheck
 
 " Other useful bundles 
" NeoBundle 'osyo-manga/vim-over'
" NeoBundle 'basyura/bitly.vim'
" NeoBundle 'benmills/vimux' 
" NeoBundle 'matze/vim-move' 
" NeoBundle 'Townk/vim-autoclose.git' 
" NeoBundle 'christoomey/vim-tmux-navigator'
" NeoBundle 'godlygeek/tabular.git'
" NeoBundle 'jamiebikies/greplace.vim.git'
" NeoBundle 'Shougo/unite-outline.git'
" NeoBundle 'tpope/vim-markdown.git'
" NeoBundle 'tpope/vim-rhubarb'
" NeoBundle 'gelguy/Cmd2.vim'
" NeoBundle 'Shougo/unite-build.git'
" NeoBundle 'majutsushi/tagbar.git'
" NeoBundle 'Raimondi/delimitMate'
" NeoBundle 'tpope/vim-unimpaired.git'
" NeoBundle 'sjl/clam.vim.git'
" NeoBundle 'sjl/splice.vim.git'
" NeoBundle 'mattn/gist-vim' 
" NeoBundle 'zef/vim-cycle.git'
" NeoBundle 'kchmck/vim-coffee-script'
" NeoBundle 'mutewinter/vim-indent-guides' 
" NeoBundle 'vim-scripts/sessionman.vim.git'
" NeoBundle 'henrik/vim-qargs.git'
" NeoBundle 'kmnk/vim-unite-giti.git'
" NeoBundle 'vim-scripts/peaksea.git'
" NeoBundle 'guns/xterm-color-table.vim.git'
" NeoBundle 'honza/snipmate-snippets.git'
" NeoBundle 'Rykka/colorv.vim.git'
" NeoBundle 'chriskempson/base16-vim.git'
" NeoBundle 'chriskempson/vim-tomorrow-theme.git'
" NeoBundle 'lambdalisue/vim-gista'
