"""""""""""""""""""""""""""""""""""""""
" Vim-Bundles 
"""""""""""""""""""""""""""""""""""""""

" No vi compatibility 
set nocompatible

" Filetype detection of 
filetype off

" Setup vundle package manager
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
NeoBundle 'Shougo/vimshell.git'
NeoBundle 'Shougo/neocomplcache.git'
NeoBundle 'Shougo/neosnippet.git'
NeoBundle 'Shougo/unite-build.git'
NeoBundle 'Shougo/vimfiler.git'

NeoBundle 'Shougo/unite.vim.git'
NeoBundle 'h1mesuke/unite-outline.git'

NeoBundle 'tpope/vim-fugitive.git'
NeoBundle 'tpope/vim-rails.git'
NeoBundle 'tpope/vim-repeat.git'
NeoBundle 'tpope/vim-surround.git'
NeoBundle 'tpope/vim-unimpaired.git'
NeoBundle 'tpope/vim-markdown.git'
NeoBundle 'tpope/vim-abolish.git'

NeoBundle 'scrooloose/nerdcommenter.git'
NeoBundle 'scrooloose/syntastic.git'

NeoBundle 'vim-scripts/CmdlineComplete.git'
NeoBundle 'vim-scripts/LustyJuggler.git'
NeoBundle 'godlygeek/tabular.git'
NeoBundle 'Townk/vim-autoclose.git'
NeoBundle 'edsono/vim-matchit.git'
NeoBundle 'majutsushi/tagbar.git'
NeoBundle 'vim-scripts/Vim-R-plugin.git'
NeoBundle 'sukima/xmledit.git'
NeoBundle 'vim-scripts/YankRing.vim.git'
NeoBundle 'rosenfeld/conque-term.git'
NeoBundle 'vim-scripts/tex.vim--Tanzler'
NeoBundle 'vim-scripts/peaksea.git'

NeoBundle 'Lokaltog/vim-easymotion'
NeoBundle 'mutewinter/vim-indent-guides'

NeoBundle 'mileszs/ack.vim.git'
NeoBundle 'tjennings/git-grep-vim.git'

NeoBundle 'vim-scripts/sessionman.vim.git'
NeoBundle 'Lokaltog/vim-powerline.git'
NeoBundle 'cpfaff/vim-help.git'
NeoBundle 'henrik/vim-qargs.git'
NeoBundle 'guns/xterm-color-table.vim.git'

NeoBundle 'altercation/vim-colors-solarized.git'

" Required!
filetype plugin indent on     

" Installation check.
"if neobundle#exists_not_installed_bundles()
  "echomsg 'Not installed bundles : ' .
        "\ string(neobundle#get_not_installed_bundle_names())
  "echomsg 'Please execute ":NeoBundleInstall" command.'
  ""finish
"endif

" Disabled bundles
" NeoBundle 'honza/snipmate-snippets.git'
" NeoBundle 'tpope/vim-commentary.git'
" NeoBundle 'garbas/vim-snipmate.git'
" NeoBundle 'ervandew/supertab.git'
" NeoBundle 'wincent/Command-T.git'
" NeoBundle 'Rykka/colorv.vim.git'
" NeoBundle 'gmarik/vundle'
" NeoBundle 'MarcWeber/vim-addon-mw-utils.git'
" NeoBundle 'tomtom/tlib_vim.git'
" NeoBundle 'chrisbra/SudoEdit.vim.git'
" NeoBundle 'kien/ctrlp.vim.git'
" NeoBundle 'jistr/vim-nerdtree-tabs'
" NeoBundle 'scrooloose/nerdtree'
" NeoBundle 'chriskempson/base16-vim.git'
" NeoBundle 'chriskempson/vim-tomorrow-theme.git'
