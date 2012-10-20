"""""""""""""""""""""""""""""""""""""""
" Preparations 
"""""""""""""""""""""""""""""""""""""""

" No vi compatibility 
set nocompatible

" Filetype detection of 
filetype off

" Setup vundle package manager
set rtp+=~/.vim/bundle/neobundle/

call neobundle#rc(expand('~/.vim/bundle/'))

NeoBundle 'Shougo/neobundle.vim'

NeoBundle 'MarcWeber/vim-addon-mw-utils.git'
NeoBundle 'tomtom/tlib_vim.git'
NeoBundle 'chrisbra/SudoEdit.vim.git'


" Load bundles 
NeoBundle 'vim-scripts/CmdlineComplete.git'
NeoBundle 'vim-scripts/LustyJuggler.git'
NeoBundle 'godlygeek/tabular.git'
NeoBundle 'Townk/vim-autoclose.git'
NeoBundle 'altercation/vim-colors-solarized.git'
NeoBundle 'tpope/vim-fugitive.git'
NeoBundle 'tpope/vim-rails.git'
NeoBundle 'tpope/vim-repeat.git'
NeoBundle 'tpope/vim-surround.git'
NeoBundle 'tpope/vim-unimpaired.git'
NeoBundle 'tpope/vim-markdown.git'
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
NeoBundle 'kien/ctrlp.vim.git'
NeoBundle 'Shougo/neocomplcache.git'
NeoBundle 'Shougo/neosnippet.git'
NeoBundle 'Shougo/unite.vim.git'
NeoBundle 'scrooloose/nerdcommenter.git'
NeoBundle 'scrooloose/syntastic.git'
NeoBundle 'mileszs/ack.vim.git'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'jistr/vim-nerdtree-tabs'
NeoBundle 'guns/xterm-color-table.vim.git'
NeoBundle 'vim-scripts/sessionman.vim.git'
NeoBundle 'Lokaltog/vim-powerline.git'
NeoBundle 'cpfaff/vim-help.git'
NeoBundle 'henrik/vim-qargs.git'
NeoBundle 'tjennings/git-grep-vim.git'

" Disabled bundles
" NeoBundle 'honza/snipmate-snippets.git'
" NeoBundle 'tpope/vim-commentary.git'
" NeoBundle 'garbas/vim-snipmate.git'
" NeoBundle 'ervandew/supertab.git'
" NeoBundle 'wincent/Command-T.git'
" NeoBundle 'Rykka/colorv.vim.git'
" NeoBundle 'gmarik/vundle'
