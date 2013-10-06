" =================================================== 
" Bundle list
" ===================================================

set nocompatible

if has('vim_starting')
   set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#rc(expand('~/.vim/bundle/'))

NeoBundleFetch 'Shougo/neobundle.vim' 

NeoBundle 'Shougo/vimproc.git', {
        \ 'build' : {
        \     'unix' : 'make -f make_unix.mak',
        \    },
        \ } 
         
NeoBundle 'Shougo/unite.vim.git'

if !has('lua') || v:version < 703 || (v:version == 703 && !has('patch885'))  
  NeoBundle 'Shougo/neocomplcache.git' 
else 
  NeoBundle 'Shougo/neocomplete'
endif

NeoBundle 'https://github.com/cpfaff/neocomplete.vim.git'
NeoBundle 'Shougo/neosnippet.git'
NeoBundle 'Shougo/unite-build.git'
NeoBundle 'Shougo/vimfiler.git'
NeoBundle 'Shougo/unite-outline.git'
NeoBundle 'Shougo/context_filetype.vim.git'
NeoBundle 'tpope/vim-fugitive.git'
NeoBundle 'tpope/vim-rails.git'
NeoBundle 'tpope/vim-repeat.git'
NeoBundle 'tpope/vim-surround.git'
NeoBundle 'tpope/vim-unimpaired.git'
NeoBundle 'tpope/vim-markdown.git'
NeoBundle 'tpope/vim-abolish.git' 
NeoBundle 'tpope/vim-sleuth.git' 
NeoBundle 'tpope/vim-rhubarb.git' 

NeoBundle 'vim-scripts/CmdlineComplete.git'
NeoBundle 'vim-scripts/YankRing.vim.git'
NeoBundle 'vim-scripts/Vim-R-plugin.git'
NeoBundle 'vim-scripts/tex.vim--Tanzler'
NeoBundle 'vim-scripts/camelcasemotion.git'

NeoBundle 'scrooloose/nerdcommenter.git'
NeoBundle 'scrooloose/syntastic.git'

NeoBundle 'Lokaltog/vim-easymotion'
NeoBundle 'Lokaltog/vim-powerline.git'

NeoBundle 'airblade/vim-gitgutter.git' 

NeoBundle 'matze/vim-move' 
NeoBundle 'chrisbra/csv.vim'
NeoBundle 'sk1418/Join.git'
NeoBundle 'majutsushi/tagbar.git'
NeoBundle 'godlygeek/tabular.git'
NeoBundle 'Townk/vim-autoclose.git'
NeoBundle 'edsono/vim-matchit.git'
NeoBundle 'sukima/xmledit.git'
NeoBundle 'kchmck/vim-coffee-script'
" NeoBundle 'mutewinter/vim-indent-guides' 
NeoBundle 'nathanaelkane/vim-indent-guides'
NeoBundle 'altercation/vim-colors-solarized.git'
NeoBundle 'ervandew/screen.git'
NeoBundle 'jamiebikies/greplace.vim.git'

NeoBundle 'kana/vim-niceblock.git'

" Testing 
" This one improves the f and t with a 
" repeat functionality
NeoBundle 'rhysd/clever-f.vim'

" NeoBundle 'sjl/clam.vim.git'
" NeoBundle 'sjl/splice.vim.git'

" Other useful bundles 

" NeoBundle 'mattn/gist-vim' 
" NeoBundle 'zef/vim-cycle.git'

" NeoBundle 'vim-scripts/sessionman.vim.git'
" NeoBundle 'henrik/vim-qargs.git'
" NeoBundle 'kmnk/vim-unite-giti.git'
" NeoBundle 'Raimondi/delimitMate.git'
" NeoBundle 'vim-scripts/peaksea.git'
" NeoBundle 'guns/xterm-color-table.vim.git'
" NeoBundle 'honza/snipmate-snippets.git'
" NeoBundle 'Rykka/colorv.vim.git'
" NeoBundle 'chriskempson/base16-vim.git'
" NeoBundle 'chriskempson/vim-tomorrow-theme.git'
