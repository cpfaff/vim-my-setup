"""""""""""""""""""""""""""""""""""""""
" Preparations 
"""""""""""""""""""""""""""""""""""""""

" Be improved 
set nocompatible
filetype off

" Setup vundle package manager
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'vim-scripts/CmdlineComplete.git'
Bundle 'wincent/Command-T.git'
Bundle 'vim-scripts/LustyJuggler.git'
Bundle 'honza/snipmate-snippets.git'
Bundle 'ervandew/supertab.git'
Bundle 'godlygeek/tabular.git'
Bundle 'tomtom/tlib_vim.git'
Bundle 'MarcWeber/vim-addon-mw-utils.git'
Bundle 'Townk/vim-autoclose.git'
Bundle 'altercation/vim-colors-solarized.git'
Bundle 'tpope/vim-commentary.git'
Bundle 'tpope/vim-fugitive.git'
Bundle 'edsono/vim-matchit.git'
Bundle 'tpope/vim-rails.git'
Bundle 'tpope/vim-repeat.git'
Bundle 'vim-scripts/Vim-R-plugin.git'
Bundle 'garbas/vim-snipmate.git'
Bundle 'tpope/vim-surround.git'
Bundle 'vim-scripts/taglist.vim.git'
Bundle 'tpope/vim-unimpaired.git'
Bundle 'sukima/xmledit.git'
Bundle 'vim-scripts/YankRing.vim.git'
Bundle 'rosenfeld/conque-term.git'

" auto source changed vimrc file
if has("autocmd")
  autocmd bufwritepost .vimrc source $MYVIMRC
endif

"""""""""""""""""""""""""""""""""""""""
" General vim behaviour 
"""""""""""""""""""""""""""""""""""""""

" No annoying sound on errors 
set noerrorbells 
set novisualbell 
set t_vb= 
set tm=500

" Sets how much history and undo vim remembers  
set history=700
set undolevels=100

" save all backupfiles in one place
set backupdir=~/.vim/tmp 
set directory=~/.vim/tmp

" Enable filetype plugins
filetype plugin on
filetype indent on

" With a map leader it's possible to do extra key combinations "
let mapleader = "," 
" let g:mapleader = ","
let maplocalleader = '.' 

" set this to have alt and meta key mappings
for i in range(97,122)
	let c = nr2char(i)
	exec "set <M-".c.">=\<Esc>".c
endfor

" A buffer becomes hidden when it is abandoned 
set hidden

" Configure backspace 
set backspace=eol,start,indent
set whichwrap+=<,>,h,l,[,]

"swith on numbering 
set number

" Ignore compiled files 
" set wildignore=*.o,*~,*.pyc
set wildignore=*tikzDiktionary*

" Ignore case when searching 
set ignorecase

" When searching try to be smart about cases 
set smartcase

" Highlight search results 
set hlsearch

" Makes search act like search in modern browsers 
set incsearch

" Don't redraw while executing macros (good performance config) 
set lazyredraw

" For regular expressions turn magic on 
set magic

" blink on mathing bracets 
set mat=2

" Enable better colours in console 
set t_Co=256

" Set colour scheme
" set background=dark 
" colorscheme peaksea
syntax enable
set background=dark
colorscheme solarized
" colorscheme peaksea

" use spaces instead of tabs
" set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 3 spaces
set shiftwidth=3
set tabstop=3

" Wrap and linebreak
set wrap
set linebreak
set nolist

set ai "Auto indent
set si "Smart indent

" set formating program to par with 80 col width call
" with gq and the vim internal formatting then with gw
set formatprg=par\ -w80

" Specify the behavior when switching between buffers 
try
  set switchbuf=useopen,usetab,newtab
  set stal=2
catch
endtry

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif

" Remember info about open buffers on close
set viminfo^=%

" Scroll options 
set scrolloff=8   
set sidescrolloff=15 
set sidescroll=1 

" Autocompletion
"
" Complete options (disable preview scratch window)
set completeopt=menu,menuone,longest
" Limit popup menu height
set pumheight=15

" Always show the status line
set laststatus=2

" Set look and infor in status line
set statusline=%F%m%r%h%w\ [CWD=%{getcwd()}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%04l,%04v][%p%%]\ [LEN=%L]

" Foldin options
set nofoldenable
set foldmethod=marker
"set foldmarker=  "\begin{figure*},end{\figure*}
"set foldtext=search("\\label{\w*:\w*}")
"set foldtext=getlinie(\\label{\w*:\w*})
set foldnestmax=10

" Standard spelling en
set spelllang=en

" spell on if noweb file
autocmd BufNewFile,BufRead *.Rnw set spell

" Add $ to end of change
au BufNewFile,BufRead * set cpoptions+=$

" Toggle paste mode on and off
set pastetoggle=<F3>

"""""""""""""""""""""""""""""""""""""""
" Vim mappings
"""""""""""""""""""""""""""""""""""""""

" Remove help from F1
noremap <F1> <nop>

" Fast save 
nnoremap <leader>w :w!<CR>

" Fast quit
nnoremap <leader>q :q!<CR>

" Fast quit and save
nnoremap <leader>wq :wq!<CR>

" Spellchecking 
noremap <leader>ss :setlocal spell!<CR>
noremap <leader>sn ]s
noremap <leader>sp [s
noremap <leader>sa zg
noremap <leader>s? z=
noremap <leader>sr 1z=

" edit vimrc
nnoremap <leader>ev :vsplit $MYVIMRC<cr>

" edit rnoweb snippet file
nnoremap <leader>es :vsplit ~/.vim/bundle/snipmate-snippets/snippets/rnoweb.snippets  <cr>

" simple make call 
nnoremap <silent> <leader>c :!make<CR>

" Show the pdf file
nnoremap <silent> <leader>cs :!make showpdf &> /dev/null <CR>

" Shortcut to rapidly toggle `set list`
" nnoremap <leader>l :set list!<CR>
 
" Use the same symbols as TextMate for tabstops and EOLs
" set listchars=tab:▸\ ,eol:¬

" reformat the current paragraph
noremap Q gqap

" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :call VisualSelection('b')<CR>
vnoremap <silent> # :call VisualSelection('f')<CR>

" Treat long lines as break lines (useful when moving around in them)
noremap j gj
noremap k gk

" Use lusty-juggler to switch between buffers "
let g:LustyJugglerDefaultMappings = 0
noremap <leader>b :LustyJuggler<CR>

" Map <Space> to / (search) and Ctrl-<Space> to ? (backwards search)
noremap <space> /
noremap <C-@> ? 

" Disable highlight when <leader><CR> is pressed
noremap <silent> <leader><CR> :noh<CR>

" Handle buffers
noremap <leader>bn :tabnew<CR>
noremap <leader>bd :bd!<CR>
noremap <leader>bo :tabonly<CR>

" Switch CWD to the directory of the open buffer
" noremap <leader>cd :cd %:p:h<CR>:pwd<CR>

"set + and - for fast window resize
nnoremap <silent> <C-+> :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <silent> <C--> :exe "resize " . (winheight(0) * 2/3)<CR>

set winheight=30
au VimResized * exe "normal! \<c-w>="
set winminheight=5

" remap U to <C-r> for easier redo
nnoremap U <C-r>

" Create a session file
nnoremap <leader>fs :mksession! session.vim<CR>

" Read the session file
nnoremap <leader>fr :source session.vim<CR>
 	
" Remap VIM 0 to first non-blank character
noremap 0 ^

" Bubble (move) single lines
nmap <A-k> [e
nmap <A-j> ]e
" Bubble (move) multiple lines
vmap <A-k> [egv
vmap <A-j> ]egv
" vertial indent
nnoremap <A-l> >>
nnoremap <A-h> <<
" the visual mapping could be advanced vertical indent and get visual
" selection again
vnoremap <A-l> >>
vnoremap <A-h> <<

" Smart way to move between windows
noremap <C-j> <C-W>j
noremap <C-k> <C-W>k
noremap <C-h> <C-W>h
noremap <C-l> <C-W>l

" type jk to exit the insert mode
vnoremap kj <esc>
inoremap kj <esc>

" When you press <leader>r you can search and replace the selected text
vnoremap <silent> <leader>r :call VisualSelection('replace')<CR>

" Vim fugitive mappings 
nnoremap <leader>gs :Gstatus<CR>
nnoremap <leader>gp :Git push<CR><CR>

" Taglist plugin mappings
noremap <F1> :TlistToggle<cr>
noremap <F2> :!ctags --extra=+f --exclude=.git --exclude=log -R * <CR><CR>

" Yankring plugin mappings
nnoremap <silent> <leader>y :YRShow<CR>
nnoremap <silent> <leader>ys :YRPush '+'<CR>

" Tabularize
if exists(":Tabularize")
  nnoremap <Leader>aa :Tabularize /&<CR>
  vnoremap <Leader>aa :Tabularize /&<CR>
  nnoremap <Leader>a: :Tabularize /:\zs<CR>
  vnoremap <Leader>a: :Tabularize /:\zs<CR>
endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin specific options
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Supertab options
let g:SuperTabDefaultCompletionType = "context"
let g:SuperTabNoCompleteAfter = ['^', '\s', '%', '"']

" Yankring history folder
let g:yankring_history_dir = '~/.vim/tmp'

" Add comment strings for unknown files
autocmd FileType rnoweb set commentstring=%\ %s

" Command-T fuzzy file finder
let g:CommandTAcceptSelectionMap = '<C-t>'
let g:CommandTAcceptSelectionTabMap = '<CR>'

" Conque term options
let g:ConqueTerm_SendFunctionKeys = 0
let g:ConqueTerm_ExecFileKey = '<nop>'
let g:ConqueTerm_SendFileKey = '<nop>'
let g:ConqueTerm_SendVisKey = '<nop>'

" let vimrplugin_tmux = 0
let vimrplugin_underscore = 0
let vimrplugin_rnowebchunk = 0
let vimrplugin_ca_ck = 0
let vimrplugin_applescript = 0
let vimrplugin_screenplugin = 0
let vimrplugin_conqueplugin = 1
let ConqueTerm_CWInsert = 1
let ConqueTerm_Color = 0
let ConqueTerm_ReadUnfocused = 1
let vimrplugin_conquevsplit = 0

" Taglist options (needs ctags program)
let Tlist_Ctags_Cmd = "/usr/bin/ctags"
let Tlist_WinWidth = 40


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Function definitions and calls 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Delete trailing white space on save, useful for Python and CoffeeScript ;)
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc

autocmd BufWrite *.py :call DeleteTrailingWS()
autocmd BufWrite *.coffee :call DeleteTrailingWS()

function! MyFoldText()
    "let nl = v:foldend - v:foldstart + 1
    let linetext = getline(v:foldstart + 1)
    let text =  linetext  
    return text
endfunction

set foldtext=MyFoldText()


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Helper functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! CmdLine(str)
    exe "menu Foo.Bar :" . a:str
    emenu Foo.Bar
    unmenu Foo
endfunction

function! VisualSelection(direction) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", '\\/.*$^~[]')
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'b'
        execute "normal ?" . l:pattern . "^M"
    elseif a:direction == 'gv'
        call CmdLine("vimgrep " . '/'. l:pattern . '/' . ' **/*.')
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    elseif a:direction == 'f'
        execute "normal /" . l:pattern . "^M"
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction

" Returns true if paste mode is enabled
function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    en
    return ''
endfunction

" Don't close window, when deleting a buffer
command! Bclose call <SID>BufcloseCloseIt()
function! <SID>BufcloseCloseIt()
   let l:currentBufNum = bufnr("%")
   let l:alternateBufNum = bufnr("#")

   if buflisted(l:alternateBufNum)
     buffer #
   else
     bnext
   endif

   if bufnr("%") == l:currentBufNum
     new
   endif

   if buflisted(l:currentBufNum)
     execute("bdelete! ".l:currentBufNum)
   endif
endfunction









"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Unused but potentially useful 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" When you press gv you vimgrep after the selected text
" vnoremap <silent> gv :call VisualSelection('gv')<CR>

" Open vimgrep and put the cursor in the right position
" noremap <leader>g :vimgrep // **/*.<left><left><left><left><left><left><left>

" Vimgreps in the current file
" noremap <leader><space> :vimgrep // <C-R>%<C-A><right><right><right><right><right><right><right><right><right>

" Do :help cope if you are unsure what cope is. It's super useful!
"
" When you search with vimgrep, display your results in cope by doing:
"   <leader>cc
"
"noremap <leader>cc       : botright cope<CR>
 





