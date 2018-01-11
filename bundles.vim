" =================================================== 
" Bundle list
" ===================================================

call plug#begin('~/.vim/plugged')

Plug 'Shougo/vimproc.vim', { 'do': 'make' }
Plug 'Shougo/unite.vim'

" Plug 'Shougo/neocomplete' 
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif

Plug 'Shougo/vimfiler'
Plug 'Shougo/context_filetype.vim'
Plug 'Shougo/neomru.vim'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

Plug 'tpope/vim-rails'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-abolish' 
Plug 'tpope/vim-sleuth' 
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-fugitive'

Plug 'junegunn/gv.vim'
Plug 'junegunn/vim-easy-align'
Plug 'jaxbot/github-issues.vim'

Plug 'vim-scripts/renamer.vim'
Plug 'vim-scripts/YankRing.vim'
Plug 'vim-scripts/camelcasemotion'
Plug 'vim-scripts/matchit.zip'
Plug 'vim-scripts/CmdlineComplete'

" Plug 'jalvesaq/Nvim-R', { 'tag': 'v0.9.10' }
Plug 'jalvesaq/Nvim-R'

Plug 'cpfaff/googurl.vim'

Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/syntastic'

Plug 'mhinz/vim-signify'

Plug 'Lokaltog/vim-easymotion'

Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'Raimondi/delimitMate'
Plug 'sukima/xmledit'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'altercation/vim-colors-solarized'
Plug 'skwp/greplace.vim'
Plug 'kana/vim-niceblock'
Plug 't9md/vim-textmanip'
Plug 'ervandew/screen'
Plug 'sjl/gundo.vim'

if has('nvim')
else
  Plug 'drmikehenry/vim-fixkey'
endif

Plug 'niklasl/vim-rdf'
Plug 'oplatek/Conque-Shell'
Plug 'chrisbra/csv.vim'
Plug 'haya14busa/vim-asterisk'

Plug 'wellle/tmux-complete.vim'
Plug 'ap/vim-css-color'


Plug 'coderifous/textobj-word-column.vim'
" language files
Plug 'sheerun/vim-polyglot'
Plug 'farmergreg/vim-lastplace'

call plug#end()


" neosnippet
" Plug 'Shougo/neosnippet.git'
" Plug 'Shougo/neosnippet-snippets.git'
"
" testing
" Plug 'zhaocai/GoldenView.Vim'
" Plug 'gregsexton/gitv'
" Plug 'Olical/vim-enmasse'
" Plug 'tommcdo/vim-exchange'
" Plug 'haya14busa/incsearch.vim'
" Plug 'sk1418/Join'
" Plug 'AndrewRadev/splitjoin.vim'
" Plug 'Konfekt/FastFold'
" Plug 'vim-scripts/DrawIt'
" Plug 'airblade/vim-rooter'

" Other useful bundles 

" Plug 'lifepillar/vim-solarized8'
" Plug 'airblade/vim-gitgutter' 
" Plug 'cpfaff/tex.vim--Tanzler'
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
