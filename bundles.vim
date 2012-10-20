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
Bundle 'MarcWeber/vim-addon-mw-utils.git'
Bundle 'tomtom/tlib_vim.git'
Bundle 'chrisbra/SudoEdit.vim.git'

" Load bundles 
Bundle 'vim-scripts/CmdlineComplete.git'
Bundle 'vim-scripts/LustyJuggler.git'
Bundle 'godlygeek/tabular.git'
Bundle 'Townk/vim-autoclose.git'
Bundle 'altercation/vim-colors-solarized.git'
Bundle 'tpope/vim-fugitive.git'
Bundle 'tpope/vim-rails.git'
Bundle 'tpope/vim-repeat.git'
Bundle 'tpope/vim-surround.git'
Bundle 'tpope/vim-unimpaired.git'
Bundle 'tpope/vim-markdown.git'
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
Bundle 'scrooloose/nerdcommenter.git'
Bundle 'scrooloose/syntastic.git'
Bundle 'mileszs/ack.vim.git'
Bundle 'scrooloose/nerdtree'
Bundle 'jistr/vim-nerdtree-tabs'
Bundle 'guns/xterm-color-table.vim.git'
Bundle 'vim-scripts/sessionman.vim.git'
Bundle 'Lokaltog/vim-powerline.git'
Bundle 'cpfaff/vim-help.git'
Bundle 'henrik/vim-qargs.git'
Bundle 'tjennings/git-grep-vim.git'

" Disabled bundles
" Bundle 'honza/snipmate-snippets.git'
" Bundle 'tpope/vim-commentary.git'
" Bundle 'garbas/vim-snipmate.git'
" Bundle 'ervandew/supertab.git'
" Bundle 'wincent/Command-T.git'
" Bundle 'Rykka/colorv.vim.git'
