""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                               My Bundle List                               "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""
"  Manage Bundle With Plug  "
"""""""""""""""""""""""""""""

call plug#begin('~/.vim/plugged')

" completion framework
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" fuzzy finder
Plug 'junegunn/fzf.vim'

" compatibility layer
if !has('nvim')
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
  Plug 'drmikehenry/vim-fixkey'
endif

" A better vim file explorer
Plug 'Shougo/vimfiler'

" Unite interface (dependency for vimfiler)
Plug 'Shougo/unite.vim'

" Vimproc is a great asynchronous execution library for Vim
Plug 'Shougo/vimproc.vim', { 'do': 'make' }

" UltiSnips is the ultimate solution for snippets in Vim.
Plug 'SirVer/ultisnips'

" A very fast, multi-syntax context-sensitive color name highlighter
" Plug 'ap/vim-css-color'

" Far.vim makes it easier to find and replace text through multiple files.
Plug 'brooth/far.vim'

" This plugin is used for handling column separated data with Vim.
Plug 'chrisbra/csv.vim'

" Extend % for mathing more keywords
Plug 'chrisbra/matchit'

" Adds ic, ac, iC, and aC as column text-objects.
Plug 'coderifous/textobj-word-column.vim'

" A kill ring for vim 
Plug 'cpfaff/YankRing.vim'

" A url shortener
Plug 'cpfaff/googurl.vim'

" The gruvbox color schema
Plug 'cpfaff/gruvbox'

" Vim motions on speed
Plug 'easymotion/vim-easymotion'

" Intelligently reopen files at your last edit position.
Plug 'farmergreg/vim-lastplace'

" Rainbow parenthesis
Plug 'frazrepo/vim-rainbow' 

" Asterisk.vim provides improved * motions.
Plug 'haya14busa/vim-asterisk'

" Snippets for fim
Plug 'honza/vim-snippets'

" A better status line
Plug 'itchyny/lightline.vim'
Plug 'shinchu/lightline-gruvbox.vim'

" Vim R support
Plug 'jalvesaq/Nvim-R', {'branch': 'stable'}

" A git commit browser
Plug 'junegunn/gv.vim' 

" Align table like
Plug 'junegunn/vim-easy-align'

" Improved visual block mode
Plug 'kana/vim-niceblock'

" sign column to indicate added, modified and removed lines 
Plug 'mhinz/vim-signify'

" Display indentation levels
Plug 'nathanaelkane/vim-indent-guides'

" A filetype plugin for rdf files
Plug 'niklasl/vim-rdf'

" Comment functions so powerful—no comment necessary.
Plug 'preservim/nerdcommenter'

" A collection of language packs for Vim.
"
" as polyglot requires variables to be set before loading 
" the package itsel the configuration is here 
let g:polyglot_disabled = ['markdown']
Plug 'sheerun/vim-polyglot'

" A nice undo history
Plug 'sjl/gundo.vim'

" a filetype plugin for xml
" Plug 'sukima/xmledit'

" Move selected lines or block area to specified direction
Plug 't9md/vim-textmanip'

" An improve substitution command 
Plug 'tpope/vim-abolish' 

" A git integration for vim
Plug 'tpope/vim-fugitive'

" This is a Vim plugin for editing Ruby on Rails
Plug 'tpope/vim-rails'

" Repeat.vim remaps . in a way that plugins can tap into it.
Plug 'tpope/vim-repeat'

" Adjusts 'shiftwidth' and 'expandtab' heuristically based on the current file
Plug 'tpope/vim-sleuth' 

" add and change surroundings like parenthesis 
Plug 'tpope/vim-surround'

" complete the command line 
Plug 'vim-scripts/CmdlineComplete'

" adds motions for camel and snake case
Plug 'vim-scripts/camelcasemotion'

" tmux as completion source
Plug 'wellle/tmux-complete.vim'

"""""""""""""""""""""""""""""
"  Manage Bundle With Plug  "
"""""""""""""""""""""""""""""

call plug#end()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                            Unused At The Moment                            "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""
"  Check if you still need these  "
"""""""""""""""""""""""""""""""""""

" better syntax highlighting for python

" Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}
" function MyHighlights()
  " hi semshiLocal           ctermfg=209 guifg=#ff875f
  " hi semshiGlobal          ctermfg=214 guifg=#ffaf00
  " hi semshiImported        ctermfg=214 guifg=#ffaf00 cterm=bold gui=bold
  " hi semshiParameter       ctermfg=75  guifg=#5fafff
  " hi semshiParameterUnused ctermfg=117 guifg=#87d7ff cterm=underline gui=underline
  " hi semshiFree            ctermfg=218 guifg=#ffafd7
  " hi semshiBuiltin         ctermfg=207 guifg=#ff5fff
  " hi semshiAttribute       ctermfg=49  guifg=#00ffaf
  " hi semshiSelf            ctermfg=249 guifg=#b2b2b2
  " hi semshiUnresolved      ctermfg=226 guifg=#ffff00 cterm=underline gui=underline
  " hi semshiSelected        ctermfg=231 guifg=#ffffff ctermbg=237 cterm=bold guibg=#d7005f
  " hi semshiErrorSign       ctermfg=231 guifg=#ffffff ctermbg=160 guibg=#d70000
  " hi semshiErrorChar       ctermfg=231 guifg=#ffffff ctermbg=160 guibg=#d70000
" endfunction

" augroup MyColors
    " autocmd!
    " autocmd ColorScheme * call MyHighlights()
    " autocmd FileType python call MyHighlights()
" augroup END



" Plug 'dpelle/vim-LanguageTool'
" 
" Grammar checker
" Plug 'rhysd/vim-grammarous'

" this is just a reminder to myself. if csv vim is broken for some reason
" use this commit to install it.
" Plug 'chrisbra/csv.vim', { 'commit': '7aa17f00a6cc96b9c9c364c6786c24f97c04605b' }

" impmroved terminal support in neovim
" Plug 'kassio/neoterm'

" version mangement and signs
" Plug 'jaxbot/github-issues.vim'
" Plug 'scrooloose/syntastic'
" Plug 'w0rp/ale'

" handle yank history
" Plug 'bfredl/nvim-miniyank'

" Plug 'Shougo/deoplete.nvim'
" 
" context filetpes
" Plug 'Shougo/context_filetype.vim'
"

" Unite source for recently used files
" Plug 'Shougo/neomru.vim'

