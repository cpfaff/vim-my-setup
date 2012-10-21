" File: vimrc
" Author: Claas-Thido Pfaff
" Description: This is my personal Vim setup
" Last Modified: Oktober 21, 2012

"""""""""""""""""""""""""""""""""""""""
"  Preparations 
"""""""""""""""""""""""""""""""""""""""

" Load vim bundles
source ~/.vim/bundles.vim

" auto source changed vimrc file
 "if has("autocmd")
    "autocmd bufwritepost .vimrc source $MYVIMRC
 "endif

"""""""""""""""""""""""""""""""""""""""
" Setup general behaviour 
"""""""""""""""""""""""""""""""""""""""

"{{{ 
" Set vim options

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
augroup last_cursor_position
   autocmd!
   autocmd BufReadPost *
      \ if line("'\"") > 0 && line("'\"") <= line("$") |
      \   exe "normal! g`\"" |
      \ endif
augroup END

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
   set statusline+=\ [%{getcwd()}] " current directory
   set statusline+=%#warningmsg#
   set statusline+=%{SyntasticStatuslineFlag()}
   "set statusline+=%*
   set statusline+=%=%-14.(%l,%c%V%)\ %p%% " Right aligned file nav info
endif

" Folding options
set nofoldenable
set foldmethod=marker
set foldnestmax=10

" Standard spelling en
set spelllang=en

" Toggle paste mode on and off
set pastetoggle=<F3>

" save/restore the view
" au BufWinLeave *.* silent! mkview "make vim save view (state) (folds, cursor, etc)
" au BufWinEnter *.* silent! loadview "make vim load view (state) (folds, cursor, etc)

" Set tag folder
set tags=~/.vim/tmp/

" Autosize windows
set winheight=30

" Short messages
" set shortmess+=filmnrxoOtT 

"}}}

"""""""""""""""""""""""""""""""""""""""
" Mappings
"""""""""""""""""""""""""""""""""""""""

" Mixed mappings 

" {{{
" Movement related 

   " Move one line
   noremap j gj
   noremap k gk

   " Easy move between windows
   noremap <C-j> <C-W>j
   noremap <C-k> <C-W>k
   noremap <C-h> <C-W>h
   noremap <C-l> <C-W>l

   " 0 to first non-blank character
   noremap 0 ^
   
   " Space search forward. Ctrl-<Space> backward, leader space clear search 
   noremap <space> /
   noremap <C-@> ? 
   noremap <leader><space> :noh<CR>

   " Visual mode pressing * or # searches for the current selection
   vnoremap <silent> * :call VisualSelection('b')<CR>
   vnoremap <silent> # :call VisualSelection('f')<CR>
"

" }}}

" {{{ 
" Editing related mappings

   " Exit visual/insert/command/select mode with kj 
   vnoremap kj <esc>
   inoremap kj <esc>
   cnoremap kj <esc> 
   snoremap kj <esc> 

   " easy undo 
   nnoremap U <C-r>

   " Move lines up and down (bubbling) left and right (indent)  
   nmap <A-k> [e
   nmap <A-j> ]e
   vmap <A-k> [egv
   vmap <A-j> ]egv
   nnoremap <A-l> >>
   nnoremap <A-h> <<
   vnoremap <A-l> >gv
   vnoremap <A-h> <gv

   " Necomplcache and neosnippet mappings
   imap <C-k> <Plug>(neosnippet_expand)
   smap <C-k> <Plug>(neosnippet_expand)
   imap <C-j> <Plug>(neosnippet_jump)
   smap <C-j> <Plug>(neosnippet_jump)

   inoremap <expr><CR> pumvisible() ? neocomplcache#close_popup() : "\<CR>"
   "inoremap <expr><C-y> neocomplcache#close_popup()
   inoremap <expr><C-l> neocomplcache#complete_common_string()
   inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
   inoremap <expr><s-TAB> pumvisible() ? "\<C-p>" : "\<TAB>"
   
"}}}

" {{{
" Remove key functionality 
 noremap <F1> <nop>
" }}}


" Leader key mappings

" {{{
" (a)lign with tabularize 
 nnoremap [n_align_key] <Nop>
 nmap <leader>a [n_align_key]

 vnoremap [v_align_key] <Nop>
 vmap <leader>a [v_align_key]

 nnoremap [n_align_key]= :Tabularize /=<CR>
 vnoremap [v_align_key]= :Tabularize /=<CR>
 nnoremap [n_align_key]a :Tabularize /&<CR>
 vnoremap [v_align_key]a :Tabularize /&<CR>
 nnoremap [n_align_key]: :Tabularize /:<CR>
 vnoremap [v_align_key]: :Tabularize /:<CR>
 nnoremap [n_align_key]:: :Tabularize /:\zs<CR>
 vnoremap [v_align_key]:: :Tabularize /:\zs<CR>
 nnoremap [n_align_key], :Tabularize /,<CR>
 vnoremap [v_align_key], :Tabularize /,<CR>
 nnoremap [n_align_key]<Bar> :Tabularize /<Bar><CR>
 vnoremap [v_align_key]<Bar> :Tabularize /<Bar><CR>
" }}}

" {{{
" (b)uffer handling
 nnoremap [buffer_key] <Nop>
 nmap <leader>b [buffer_key]

 noremap [buffer_key] :LustyJuggler<CR>
 noremap [buffer_key]n :tabnew<CR>
 noremap [buffer_key]d :bd!<CR>
 noremap [buffer_key]o :tabonly<CR>
" }}}

" {{{
" (c)omment out
 nnoremap [comment_key] <Nop>
 nmap <leader>c [comment_key]
 
 map [comment_key] <plug>NERDCommenterToggle
" }}}

" {{{
" (d)ump and load sessions 
 nnoremap [dump_key] <Nop>
 nmap <leader>d [dump_key]

 set sessionoptions=blank,buffers,curdir,folds,tabpages,winsize
 nnoremap [dump_key]l :SessionList<CR>
 nnoremap [dump_key]s :SessionSave<CR>
" }}}

" {{{
" (e)dit config files
 nnoremap [edit_key] <Nop>
 nmap <leader>e [edit_key]

 nnoremap [edit_key]v :vsplit $MYVIMRC<cr>
 nnoremap [edit_key]s :NeoSnippetEdit<CR>
 nnoremap [edit_key]r :NeoComplCacheEditRuntimeSnippets<CR>
" }}}

"{{{
" (f)ind files, buffers etc and do (unite)
   nnoremap [unite] <Nop>
   nmap <leader>f [unite]

   nnoremap <silent> [unite]c  :<C-u>UniteWithCurrentDir
          \ -buffer-name=files buffer file_mru bookmark file<CR>
   nnoremap <silent> [unite]b  :<C-u>UniteWithBufferDir
          \ -buffer-name=files -prompt=%\  buffer file_mru bookmark file<CR>
   nnoremap <silent> [unite]r  :<C-u>Unite
          \ -buffer-name=register register<CR>
   nnoremap <silent> [unite]o  :<C-u>Unite outline<CR>
   nnoremap <silent> [unite]f
          \ :<C-u>Unite -buffer-name=resume resume<CR>
   nnoremap <silent> [unite]d
          \ :<C-u>Unite -buffer-name=files -default-action=lcd directory_mru<CR>
   nnoremap <silent> [unite]ma
          \ :<C-u>Unite mapping<CR>
   nnoremap <silent> [unite]me
          \ :<C-u>Unite output:message<CR>
   nnoremap  [unite]f  :<C-u>Unite source<CR>

   nnoremap <silent> [unite]s
          \ :<C-u>Unite -buffer-name=files -no-split
          \ jump_point file_point buffer_tab
          \ file_rec:! file file/new file_mru<CR>
"}}}

" {{{
" (g)it version control (Fugitive) 
 nnoremap [git_key] <Nop>
 nmap <silent> <leader>g [git_key]

 nnoremap [git_key]s :Gstatus<CR>
 nnoremap [git_key]d :Gdiff<CR>
 nnoremap [git_key]c :Gcommit<CR>
 nnoremap [git_key]b :Gblame<CR>
 nnoremap [git_key]l :Glog<CR>
 nnoremap [git_key]p :Git push<CR><CR>
" }}}

"{{{
" (p)aragraph formatting
   nnoremap [paragraph_key] <Nop>
   nmap <leader>p [paragraph_key]

   noremap [paragraph_key] gqap
"}}}

" {{{
" (m)ake call a task 
 nnoremap [make_key] <Nop>
 nmap <silent> <leader>m [make_key]
 
 nnoremap [make_key]  :!make <CR>
 nnoremap [make_key]s :!make showpdf &> /dev/null <CR>
" }}}

" {{{
" (q)quit fast
 nnoremap [quit_key] <Nop>
 nmap <leader>q [quit_key]

 nnoremap [quit_key] :q!<CR>
" }}}

" {{{ 
" (r) eplace search visual selection
 vnoremap [replace_key] <Nop>
 vmap <silent> <leader>r [replace_key]
 
 vnoremap [replace_key] :call VisualSelection('replace')<CR>
 vnoremap [replace_key]s :call VisualSelection('acksearch')<CR>
 vnoremap [replace_key]a :call VisualSelection('quickfixdo')<CR> 
" }}}

" {{{
" (s)pellchecking 
   nnoremap [spell_key] <Nop>
   nmap <leader>s [spell_key]

   noremap [spell_key]s :setlocal spell!<CR>
   noremap [spell_key]n ]s
   noremap [spell_key]p [s
   noremap [spell_key]g zg
   noremap [spell_key]e z=
   noremap [spell_key]r 1z=
" }}}
  
"{{{
" (t)tag navigation 
   nnoremap [tag_key] <Nop>
   nmap <silent> <leader>t  [tag_key]

   nnoremap [tag_key] :TagbarToggle<CR>
"}}}

"{{{
" (v)izualize 
   nnoremap [vizualize_key] <Nop>
   nmap <Leader>v  [vizualize_key]

   nnoremap [vizualize_key] :IndentGuidesToggle<CR>
"}}}

"{{{
" (w)rite and quit fast 
   nnoremap [write_key] <Nop>
   nmap <Leader>w  [write_key]

   nnoremap [write_key] :w!<CR>
   nnoremap [write_key]q :wq!<CR>
"}}}

"{{{ 
" (x)ecute a shell with something  
   nnoremap [execute_key] <Nop>
   nmap <Leader>x  [execute_key]

   nnoremap [execute_key]b :ConqueTermSplit bash<CR>
"}}}

" {{{
" (y)ank and paste management (Yankring)
 nnoremap [yank_key] <Nop>
 nmap <silent> <leader>y [yank_key]

 nnoremap [yank_key]y :YRShow<CR>
 nnoremap [yank_key]s :YRPush '+'<CR>
" }}}


" set + and - for fast window resize
"nnoremap <silent> <C-+> :exe "resize " . (winheight(0) * 3/2)<CR>
"nnoremap <silent> <C--> :exe "resize " . (winheight(0) * 2/3)<CR>

" Shortcut to rapidly toggle `set list`
" nnoremap <leader>l :set list!<CR>

" Use the same symbols as TextMate for tabstops and EOLs
" set listchacksearch=tab:▸\ ,eol:¬

" Nertree toggle 
" nnoremap <leader>n :NERDTreeToggle <CR>
"

" Switch CWD to the directory of the open buffer
" noremap <leader>cd :cd %:p:h<CR>:pwd<CR>


"{{{
" Plugin specific options

" {{{
" tab guideline  
 let g:indent_guides_enable_on_vim_startup = 0
 let g:indent_guides_auto_colors = 0
 let g:indent_guides_guide_size = 1 
 let g:indent_guides_start_level = 1
 hi IndentGuidesOdd  ctermbg=238 
 hi IndentGuidesEven ctermbg=243
" }}}

" {{{
" nerd commenter
let g:NERDCustomDelimiters = {
   \ 'snippet': {'left': '#'}
 \ }
" }}}

" {{{
" syntastic 
 let g:syntastic_stl_format = '[%E{Err: %fe #%e}%B{, }%W{Warn: %fw #%w}]'
" }}}

" {{{
" lusty juggler
let g:LustyJugglerDefaultMappings = 0
" }}}

" {{{ 
" yankring 
 let g:yankring_history_dir = '~/.vim/tmp'
" }}}

" {{{
" nerd tree
 "let NERDTreeShowBookmarks=1
 "let NERDTreeIgnore=['\.pyc', '\~$', '\.swo$', '\.swp$', '\.git', '\.hg', '\.svn', '\.bzr']
 "let NERDTreeChDirMode=0
 "let NERDTreeQuitOnOpen=1
 "let NERDTreeShowHidden=1
 "let NERDTreeKeepTreeInNewTab=1
 "let g:nerdtree_tabs_open_on_gui_startup=0
" }}}

" {{{
" ctrlp fuzzy finder
 "let g:ctrlp_map = '<leader>f'
 "let g:ctrlp_custom_ignore = {
   "\ 'dir': '\.git$\|\.hg$\|\.svn$',
   "\ 'file': '\.exe$\|\.so$\|\.dll$' }
" }}}

" {{{
" rails plugin
let g:rubycomplete_buffer_loading = 1
" }}}

" {{{
" conque term 
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
" }}}

" {{{ 
" tagbar options
 let g:tagbar_left = 0
" }}}

" {{{
" unite vim
 
imap <expr> -  pumvisible() ? 
        \ "\<Plug>(neocomplcache_start_unite_quick_match)" : '-' 

" Start insert.
 let g:unite_enable_start_insert = 1
 "let g:unite_enable_short_source_names = 1
 "

 autocmd FileType unite call s:unite_my_settings()
 function! s:unite_my_settings()
    " Overwrite settings.
 
    nmap <buffer> <ESC>      <Plug>(unite_exit)
    imap <buffer>  kj      <Plug>(unite_insert_leave)
    "imap <buffer> <C-w>     <Plug>(unite_delete_backward_path)
    imap <buffer><expr> j unite#smart_map('j', '')
    imap <buffer> <TAB>   <Plug>(unite_select_next_line)
    imap <buffer> <C-w>     <Plug>(unite_delete_backward_path)
    imap <buffer> - <Plug>(unite_quick_match_default_action)
    nmap <buffer> - <Plug>(unite_quick_match_default_action)
    imap <buffer><expr> x
             \ unite#smart_map('x', "\<Plug>(unite_quick_match_choose_action)")
    nmap <buffer> x     <Plug>(unite_quick_match_choose_action)
    nmap <buffer> <C-z>     <Plug>(unite_toggle_transpose_window)
    imap <buffer> <C-z>     <Plug>(unite_toggle_transpose_window)
    imap <buffer> <C-y>     <Plug>(unite_narrowing_path)
    nmap <buffer> <C-y>     <Plug>(unite_narrowing_path)
    "nmap <buffer> <C-j>     <Plug>(unite_toggle_auto_preview)
    nmap <buffer> <C-r>     <Plug>(unite_narrowing_input_history)
    imap <buffer> <C-r>     <Plug>(unite_narrowing_input_history)

    nnoremap <silent><buffer><expr> l
             \ unite#smart_map('l', unite#do_action('default'))
 
    let unite = unite#get_current_unite()
    if unite.buffer_name =~# '^search'
       nnoremap <silent><buffer><expr> r     unite#do_action('replace')
    else
       nnoremap <silent><buffer><expr> r     unite#do_action('rename')
    endif
 
    nnoremap <silent><buffer><expr> cd     unite#do_action('lcd')
    nnoremap <buffer><expr> S      unite#mappings#set_current_filters(
             \ empty(unite#mappings#get_current_filters()) ? ['sorter_reverse'] : [])
 endfunction
 
 let g:unite_source_file_mru_limit = 200
 let g:unite_cursor_line_highlight = 'TabLineSel'
 let g:unite_abbr_highlight = 'TabLine'
 
 " For optimize.
 let g:unite_source_file_mru_filename_format = ''
 
 " For ack.
 if executable('ack-grep')
    let g:unite_source_grep_command = 'ack-grep'
    let g:unite_source_grep_default_opts = '--no-heading --no-color -a'
    let g:unite_source_grep_recursive_opt = ''
 endif
" }}}

" {{{ 
" neocomplcache and neosnippet 
 let g:neocomplcache_enable_at_startup = 1
 let g:neocomplcache_temporary_dir = '~/.vim/tmp/'
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
 augroup neocomplcache_omni_completion
    autocmd!
    autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
    autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
    autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
    autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
    autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
    autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
 augroup END

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

 let g:header_author = "Claas-Thido Pfaff"
" }}}

"}}}

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Function definitions and calls 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Delete trailing white space on save (Python and CoffeeScript)
 func! DeleteTrailingWS()
    exe "normal mz"
    %s/\s\+$//ge
    exe "normal `z"
 endfunc

 augroup remove_trailing_spaces
    autocmd!
    autocmd BufWrite *.py :call DeleteTrailingWS()
    autocmd BufWrite *.coffee :call DeleteTrailingWS()
 augroup END 
"

" My fold text
 function! MyFoldText()
    "let nl = v:foldend - v:foldstart + 1
    let linetext = getline(v:foldstart + 1)
    let text =  linetext  
    return text
 endfunction

 set foldtext=MyFoldText()
"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Filetype specific autogroups
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Set filetype specific options
augroup set_filetypes_options
   autocmd!
   autocmd BufNewFile,BufRead *.tex set ft=tex
augroup END

augroup rnw_specific_options
   autocmd!
   autocmd BufNewFile,BufRead *.Rnw set spell
augroup END

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
    elseif a:direction == 'acksearch'
       call CmdLine("Ack " . l:pattern . ' *')
    elseif a:direction == 'quickfixdo'
       call CmdLine("Qdo " . '%s/' . l:pattern . '/' . '/gc ' . '\|' . 'update')
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

" Add $ to end of change range
au BufNewFile,BufRead * set cpoptions+=$
