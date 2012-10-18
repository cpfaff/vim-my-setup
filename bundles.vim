"""""""""""""""""""""""""""""""""""""""
" Preparations 
"""""""""""""""""""""""""""""""""""""""

" No vi compatibility 
set nocompatible

" Filetype detection of 
filetype off

" Setup vundle package manager
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'

" Load bundles 
Bundle 'vim-scripts/CmdlineComplete.git'
Bundle 'vim-scripts/LustyJuggler.git'
Bundle 'godlygeek/tabular.git'
Bundle 'tomtom/tlib_vim.git'
Bundle 'MarcWeber/vim-addon-mw-utils.git'
Bundle 'Townk/vim-autoclose.git'
Bundle 'altercation/vim-colors-solarized.git'
Bundle 'tpope/vim-fugitive.git'
Bundle 'tpope/vim-rails.git'
Bundle 'tpope/vim-repeat.git'
Bundle 'tpope/vim-surround.git'
Bundle 'tpope/vim-unimpaired.git'
Bundle 'edsono/vim-matchit.git'
Bundle 'majutsushi/tagbar.git'
Bundle 'vim-scripts/Vim-R-plugin.git'
Bundle 'sukima/xmledit.git'
Bundle 'vim-scripts/YankRing.vim.git'
Bundle 'rosenfeld/conque-term.git'
Bundle 'vim-scripts/tex.vim--Tanzler'
Bundle 'vim-scripts/peaksea.git'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'mutewinter/vim-indent-guides'
Bundle 'kien/ctrlp.vim.git'
Bundle 'Shougo/neocomplcache.git'
Bundle 'Shougo/neocomplcache-snippets-complete.git'
Bundle 'honza/snipmate-snippets.git'
Bundle 'scrooloose/nerdcommenter.git'
Bundle 'guns/xterm-color-table.vim.git'
Bundle 'vim-scripts/sessionman.vim.git'
Bundle 'Lokaltog/vim-powerline.git'

" Disabled bundles
" Bundle 'tpope/vim-commentary.git'
" Bundle 'garbas/vim-snipmate.git'
" Bundle 'ervandew/supertab.git'
" Bundle 'wincent/Command-T.git'
" Bundle 'Rykka/colorv.vim.git'
