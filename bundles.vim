"""""""""""""""""""""""""""""""""""""""
" Vim-Bundles 
"""""""""""""""""""""""""""""""""""""""

" No vi compatibility 
set nocompatible

" Filetype detection of 
filetype off

" Setup for neobundle package manager
if has('vim_starting')
   set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#rc(expand('~/.vim/bundle/'))

" Load bundles 
NeoBundle 'Shougo/neobundle.vim'
NeoBundle 'Shougo/vimproc.git', {
         \ 'build' : {
         \     'unix' : 'make -f make_unix.mak',
         \    },
         \ }

NeoBundle 'vim-scripts/LustyJuggler.git'
NeoBundle 'Shougo/neocomplcache.git'
NeoBundle 'Shougo/neosnippet.git'
NeoBundle 'Shougo/unite-build.git'
NeoBundle 'Shougo/vimfiler.git'
NeoBundle 'Shougo/unite.vim.git'
NeoBundle 'Shougo/unite-outline.git'

NeoBundle 'tpope/vim-fugitive.git'
NeoBundle 'tpope/vim-rails.git'
NeoBundle 'tpope/vim-repeat.git'
NeoBundle 'tpope/vim-surround.git'
NeoBundle 'tpope/vim-unimpaired.git'
NeoBundle 'tpope/vim-markdown.git'
NeoBundle 'tpope/vim-abolish.git' 
NeoBundle 'tpope/vim-sleuth.git' 

NeoBundle 'scrooloose/nerdcommenter.git'
NeoBundle 'scrooloose/syntastic.git'

NeoBundle 'vim-scripts/CmdlineComplete.git'
NeoBundle 'godlygeek/tabular.git'
NeoBundle 'Townk/vim-autoclose.git'
NeoBundle 'edsono/vim-matchit.git'
NeoBundle 'majutsushi/tagbar.git'
NeoBundle 'sukima/xmledit.git'
NeoBundle 'vim-scripts/YankRing.vim.git'

NeoBundle 'vim-scripts/Vim-R-plugin.git'
NeoBundle 'vim-scripts/tex.vim--Tanzler'
NeoBundle 'kchmck/vim-coffee-script'

NeoBundle 'Lokaltog/vim-easymotion'
NeoBundle 'mutewinter/vim-indent-guides'

NeoBundle 'mileszs/ack.vim.git'
NeoBundle 'tjennings/git-grep-vim.git'
NeoBundle 'henrik/vim-qargs.git'

NeoBundle 'vim-scripts/sessionman.vim.git'
NeoBundle 'Lokaltog/vim-powerline.git'

NeoBundle 'altercation/vim-colors-solarized.git'

NeoBundle 'ervandew/screen.git'

" Other useful bundles

" NeoBundle 'vim-scripts/peaksea.git'
" NeoBundle 'benmills/vimux'
" NeoBundle 'jgdavey/vim-turbux.git'
" NeoBundle 'guns/xterm-color-table.vim.git'
" NeoBundle 'Shougo/vimshell.git'
" NeoBundle 'rosenfeld/conque-term.git'
" NeoBundle 'honza/snipmate-snippets.git'
" NeoBundle 'garbas/vim-snipmate.git'
" NeoBundle 'ervandew/supertab.git'
" NeoBundle 'wincent/Command-T.git'
" NeoBundle 'Rykka/colorv.vim.git'
" NeoBundle 'kien/ctrlp.vim.git'
" NeoBundle 'jistr/vim-nerdtree-tabs'
" NeoBundle 'scrooloose/nerdtree'
" NeoBundle 'chriskempson/base16-vim.git'
" NeoBundle 'chriskempson/vim-tomorrow-theme.git'
