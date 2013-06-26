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
         
NeoBundle 'Shougo/neocomplcache.git' 
" NeoBundle 'Shougo/neocomplete.git'
NeoBundle 'Shougo/neosnippet.git'
NeoBundle 'Shougo/unite-build.git'
NeoBundle 'Shougo/vimfiler.git'
NeoBundle 'Shougo/unite.vim.git'
NeoBundle 'Shougo/unite-outline.git'
" NeoBundle 'Shougo/context_filetype.vim.git'
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
NeoBundle 'vim-scripts/sessionman.vim.git'
NeoBundle 'vim-scripts/Vim-R-plugin.git'
NeoBundle 'vim-scripts/tex.vim--Tanzler'
NeoBundle 'vim-scripts/camelcasemotion.git'

NeoBundle 'scrooloose/nerdcommenter.git'
NeoBundle 'scrooloose/syntastic.git'

NeoBundle 'Lokaltog/vim-easymotion'
NeoBundle 'Lokaltog/vim-powerline.git'

NeoBundle 'airblade/vim-gitgutter.git' 

NeoBundle 'godlygeek/tabular.git'
NeoBundle 'Townk/vim-autoclose.git'
NeoBundle 'edsono/vim-matchit.git'
NeoBundle 'majutsushi/tagbar.git'
NeoBundle 'sukima/xmledit.git'
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'mutewinter/vim-indent-guides'
NeoBundle 'mileszs/ack.vim.git'
NeoBundle 'tjennings/git-grep-vim.git'
NeoBundle 'henrik/vim-qargs.git'
NeoBundle 'altercation/vim-colors-solarized.git'
NeoBundle 'ervandew/screen.git'
NeoBundle 'jamiebikies/greplace.vim.git'

NeoBundle 'kana/vim-niceblock.git'

" Other useful bundles
" NeoBundle 'kmnk/vim-unite-giti.git'
" NeoBundle 'Raimondi/delimitMate.git'
" NeoBundle 'vim-scripts/peaksea.git'
" NeoBundle 'guns/xterm-color-table.vim.git'
" NeoBundle 'honza/snipmate-snippets.git'
" NeoBundle 'Rykka/colorv.vim.git'
" NeoBundle 'chriskempson/base16-vim.git'
" NeoBundle 'chriskempson/vim-tomorrow-theme.git'
