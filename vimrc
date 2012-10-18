" Load the bundles
source ~/.vim/bundles.vim

" auto source changed vimrc file
" if has("autocmd")
"    autocmd bufwritepost .vimrc source $MYVIMRC
" endif

"""""""""""""""""""""""""""""""""""""""
" General vim behaviour 
"""""""""""""""""""""""""""""""""""""""

" No annoying sound on errors 
set noerrorbells 
set novisualbell 
set t_vb= 
set tm=500

" Sets how much history and undo vim remembers  
set history=1000

" save all backupfiles in one place
set backupdir=~/.vim/tmp  
set directory=~/.vim/tmp 

" Persistent undo
if has('persistent_undo')
   set undodir=~/.vim/tmp
   set undofile
   set undolevels=1000 "maximum number of changes that can be undone
   set undoreload=10000 "maximum number lines to save for undo on a buffer reload
endif

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
set backspace=indent,eol,start 
set whichwrap=b,s,h,l,<,>,[,]

"swith on numbering 
set number

" Ignore compiled files 
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
syntax enable
set background=dark 
colorscheme peaksea

" use spaces instead of tabs
set expandtab

" Be smart when using tabs 
set smarttab

" 1 tab == 3 spaces
set shiftwidth=3
set tabstop=3

" cursor beyond last character
set virtualedit=onemore

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

" Set look and info of status line
if has('statusline')
   set laststatus=2
   " in segments
   set statusline=%<%f\ " Filename
   set statusline+=%w%h%m%r " Options
   set statusline+=%{fugitive#statusline()} " Git 
   set statusline+=\ [%{&ff}/%Y] " filetype
   set statusline+=\ [%{getcwd()}] " current dir
   set statusline+=%=%-14.(%l,%c%V%)\ %p%% " Right aligned file nav info
endif

" Folding options
set nofoldenable
set foldmethod=marker
set foldnestmax=10

" Standard spelling en
set spelllang=en

" spell on if noweb file
autocmd BufNewFile,BufRead *.Rnw set spell

" Add $ to end of change range
au BufNewFile,BufRead * set cpoptions+=$

" Toggle paste mode on and off
set pastetoggle=<F3>

" save/restore the view
" au BufWinLeave *.* silent! mkview "make vim save view (state) (folds, cursor, etc)
" au BufWinEnter *.* silent! loadview "make vim load view (state) (folds, cursor, etc)

" Set tag folder
set tags=~/.vim/tmp/

" Autosize windows
set winheight=30
au VimResized * exe "normal! \<c-w>="
set winminheight=5


"""""""""""""""""""""""""""""""""""""""
" Vim mappings
"""""""""""""""""""""""""""""""""""""""

" Remove help from F1
 noremap <F1> <nop>

" Tagbar toggle
 "noremap <F1> :TagbarToggle<cr>

" Align with tabularize 
 nmap <Leader>a= :Tabularize /=<CR>
 vmap <Leader>a= :Tabularize /=<CR>
 nmap <Leader>a: :Tabularize /:<CR>
 vmap <Leader>a: :Tabularize /:<CR>
 nmap <Leader>a:: :Tabularize /:\zs<CR>
 vmap <Leader>a:: :Tabularize /:\zs<CR>
 nmap <Leader>a, :Tabularize /,<CR>
 vmap <Leader>a, :Tabularize /,<CR>
 nmap <Leader>a<Bar> :Tabularize /<Bar><CR>
 vmap <Leader>a<Bar> :Tabularize /<Bar><CR>
"

" Handle buffers
 noremap <leader>b :LustyJuggler<CR>
 noremap <leader>bn :tabnew<CR>
 noremap <leader>bd :bd!<CR>
 noremap <leader>bo :tabonly<CR>
"

" Nerd commenter remap
 map <leader>c <plug>NERDCommenterToggle
"

" Dump and display sessions 
 set sessionoptions=blank,buffers,curdir,folds,tabpages,winsize
 nmap <leader>dl :SessionList<CR>
 nmap <leader>ds :SessionSave<CR>
"

" Edit config files
 nnoremap <leader>ev :vsplit $MYVIMRC<cr>
 nnoremap <Leader>es :NeoSnippetEdit<CR>
 nnoremap <Leader>er :NeoComplCacheEditRuntimeSnippets<CR>
"

" Session handling
 nnoremap <leader>fs :mksession! session.vim<CR>
 nnoremap <leader>fr :source session.vim<CR>
" 

" Fugitive 
 nnoremap <silent> <leader>gs :Gstatus<CR>
 nnoremap <silent> <leader>gd :Gdiff<CR>
 nnoremap <silent> <leader>gc :Gcommit<CR>
 nnoremap <silent> <leader>gb :Gblame<CR>
 nnoremap <silent> <leader>gl :Glog<CR>
 nnoremap <silent> <leader>gp :Git push<CR><CR>
"

" Yankring plugin mappings
 nnoremap <silent> <leader>yy :YRShow<CR>
 nnoremap <silent> <leader>ys :YRPush '+'<CR>
"

" Treat long lines as break lines (useful when moving around in them)
 noremap j gj
 noremap k gk
" 

" type jk to exit visual/insert/command mode 
 vnoremap kj <esc>
 inoremap kj <esc>
 cnoremap kj <esc> 
"

" My makefile calls 
 nnoremap <silent> <leader>m :!make<CR>
 nnoremap <silent> <leader>ms :!make showpdf &> /dev/null <CR>
"

" Fast quit
 nnoremap <leader>q :q!<CR>
"

" Search and repace visual selection
 vnoremap <silent> <leader>r :call VisualSelection('replace')<CR>
"

" Spellchecking 
 noremap <leader>ss :setlocal spell!<CR>
 noremap <leader>sn ]s
 noremap <leader>sp [s
 noremap <leader>sg zg
 noremap <leader>se z=
 noremap <leader>sr 1z=
"
  
" Tag bar toggle 
 nnoremap <silent> <leader>tt :TagbarToggle<CR>
"

" Fast save and quit 
 nnoremap <leader>w :w!<CR>
 nnoremap <leader>wq :wq!<CR>
"

" Remap VIM 0 to first non-blank character
 noremap 0 ^
"

" reformat the current paragraph
 noremap Q gqap
"

" remap U to <C-r> for easier undo 
 nnoremap U <C-r>
"

" Move lines 
 nmap <A-k> [e
 nmap <A-j> ]e
 vmap <A-k> [egv
 vmap <A-j> ]egv
 nnoremap <A-l> >>
 nnoremap <A-h> <<
 vnoremap <A-l> >gv
 vnoremap <A-h> <gv
"

" Smart way to move between windows
 noremap <C-j> <C-W>j
 noremap <C-k> <C-W>k
 noremap <C-h> <C-W>h
 noremap <C-l> <C-W>l
"

" Necomplcache and neosnippet mappings
 imap <C-k> <Plug>(neosnippet_expand)
 smap <C-k> <Plug>(neosnippet_expand)
 imap <C-j> <Plug>(neosnippet_jump)
 smap <C-j> <Plug>(neosnippet_jump)

 inoremap <expr><CR> pumvisible() ? neocomplcache#close_popup() : "\<CR>"
 inoremap <expr><C-y> neocomplcache#close_popup()
 inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
 inoremap <expr><s-TAB> pumvisible() ? "\<C-p>" : "\<TAB>"
"

" Visual mode pressing * or # searches for the current selection
 vnoremap <silent> * :call VisualSelection('b')<CR>
 vnoremap <silent> # :call VisualSelection('f')<CR>
"
 
" Space forward search Ctrl-<Space> backward, leader space clear search 
 noremap <space> /
 noremap <C-@> ? 
 noremap <leader><space> :noh<CR>
"

" Switch CWD to the directory of the open buffer
" noremap <leader>cd :cd %:p:h<CR>:pwd<CR>

" set + and - for fast window resize
" nnoremap <silent> <C-+> :exe "resize " . (winheight(0) * 3/2)<CR>
" nnoremap <silent> <C--> :exe "resize " . (winheight(0) * 2/3)<CR>

" Shortcut to rapidly toggle `set list`
" nnoremap <leader>l :set list!<CR>

" Use the same symbols as TextMate for tabstops and EOLs
" set listchars=tab:▸\ ,eol:¬

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin specific options
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Tab guideline options 
 let g:indent_guides_auto_colors = 0
 let g:indent_guides_guide_size = 1 
 let g:indent_guides_start_level = 1
 hi IndentGuidesOdd  ctermbg=238 
 hi IndentGuidesEven ctermbg=243
"

" Lusty juggler options  
let g:LustyJugglerDefaultMappings = 0
"

" Yankring history folder
 let g:yankring_history_dir = '~/.vim/tmp'
"

" Ctrlp fuzzy finder 
 let g:ctrlp_map = '<leader>f'
 let g:ctrlp_custom_ignore = {
   \ 'dir': '\.git$\|\.hg$\|\.svn$',
   \ 'file': '\.exe$\|\.so$\|\.dll$' }
"

" Conque term options
 let g:ConqueTerm_SendFunctionKeys = 0
 let g:ConqueTerm_ExecFileKey = '<nop>'
 let g:ConqueTerm_SendFileKey = '<nop>'
 let g:ConqueTerm_SendVisKey = '<nop>'
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
"

" Tagbar options
 let g:tagbar_left = 1
" 

" neocomplcache 
 let g:neocomplcache_enable_at_startup = 1
 let g:neocomplcache_enable_camel_case_completion = 1
 let g:neocomplcache_enable_smart_case = 1
 let g:neocomplcache_enable_underbar_completion = 1
 let g:neocomplcache_min_syntax_length = 3
 let g:neocomplcache_enable_auto_delimiter = 1
 let g:neocomplcache_max_list = 15
 let g:neocomplcache_auto_completion_start_length = 3
 let g:neocomplcache_force_overwrite_completefunc = 1
 let g:neocomplcache_enable_auto_select = 1

 let g:neosnippet#snippets_directory='~/.vim/snippets/'
 
 " Define keyword.
 if !exists('g:neocomplcache_keyword_patterns')
    let g:neocomplcache_keyword_patterns = {}
 endif
 let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

 " Enable omni completion.
 autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
 autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
 autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
 autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
 autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
 autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete

 " Enable heavy omni completion.
 if !exists('g:neocomplcache_omni_patterns')
    let g:neocomplcache_omni_patterns = {}
 endif

 let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\h\w*\|\h\w*::'
 let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
 let g:neocomplcache_omni_patterns.c = '\%(\.\|->\)\h\w*'
 let g:neocomplcache_omni_patterns.cpp = '\h\w*\%(\.\|->\)\h\w*\|\h\w*::'

 " For snippet_complete marker.
 if has('conceal')
    set conceallevel=2 concealcursor=i
 endif
"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Function definitions and calls 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Delete trailing white space on save (Python and CoffeeScript)
 func! DeleteTrailingWS()
    exe "normal mz"
    %s/\s\+$//ge
    exe "normal `z"
 endfunc

 autocmd BufWrite *.py :call DeleteTrailingWS()
 autocmd BufWrite *.coffee :call DeleteTrailingWS()
"

"
 function! MyFoldText()
    "let nl = v:foldend - v:foldstart + 1
    let linetext = getline(v:foldstart + 1)
    let text =  linetext  
    return text
 endfunction

 set foldtext=MyFoldText()
"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Helper functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Small helper
 function! CmdLine(str)
    exe "menu Foo.Bar :" . a:str
    emenu Foo.Bar
    unmenu Foo
 endfunction
"

" Get visual selection
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
"

" Returns true if paste mode is enabled
 function! HasPaste()
    if &paste
       return 'PASTE MODE  '
    en
    return ''
 endfunction
"
