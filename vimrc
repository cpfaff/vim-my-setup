" ================================================
"   MMMM   MMMM    VVV           VVV    SSSSSS
"  MMMM MMM MMMM   VVVV         VVVV   SSSSSSSS
"  MMMM  M  MMMM    VVVV       VVVV    SSSS
"  MMMM     MMMM     VVVV     VVVV     SSSSSSS 
"  MMMM     MMMM      VVVV   VVVV          SSSS
"  MMMM     MMMM       VVVV VVVV       SSSSSSSS
"  MMMM     MMMM y       VVVVV  im      SSSSSS etup
" ================================================
" 
" File: vimrc
" Maintainer: Claas-Thido Pfaff
" Description: This is my personal Vim setup.

" Include bundles and autosource {{{

   " Load vim bundles
   source ~/.vim/bundles.vim

   " auto source changed vimrc file
   "if has("autocmd")
      "autocmd bufwritepost .vimrc source $MYVIMRC
   "endif

"}}}

" General Vim behaviour {{{ 
 
   " Disable vim error behavior
   set noerrorbells
   set novisualbell 
   set t_vb= 
   set tm=500

   " Sets how much history and undo vim remembers  
   set history=1000

   " Save files in one place
   set backupdir=~/.vim/tmp  
   set directory=~/.vim/tmp 
   set tags=~/.vim/tmp/

   " Persistent undo
   if has('persistent_undo')
      set undodir=~/.vim/tmp
      set undofile
      set undolevels=1000 
      set undoreload=10000 
   endif

   " Enable filetype plugins
   filetype plugin on
   filetype indent on

   " A buffer becomes hidden when it is abandoned 
   set hidden

   " Configure backspace and wrap behavior 
   set backspace=indent,eol,start 
   set whichwrap=b,s,h,l,<,>,[,]

   "swith on numbering on left side
   set number

   " Ignore compiled files 
   set wildmenu
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
   set matchtime=2

   " Enable better colours in console 
   set t_Co=256

   " Set colour scheme
   syntax enable
   set background=dark
   colorscheme solarized
   " colorscheme peaksea

   " use spaces instead of tabs
   set expandtab

   " Be smart when using tabs 
   set smarttab

   " 1 tab == 3 spaces
   set shiftwidth=3
   set tabstop=3

   " let cursor beyond last character
   "set virtualedit=onemore

   " wrap and linebreak
   set wrap 
   set linebreak
   set nolist
   
   "Auto indent
   set autoindent 
   
   "Smart indent
   set smartindent 

   " set format program to par with 80 col width 
   set formatprg=par\ -w80

   " Specify the behavior when switching buffers 
   try
     set switchbuf=useopen,usetab,newtab
     set showtabline=2
   catch
   endtry

   " Remember info about open buffers on close
   " set viminfo^=%

   " Scroll options 
   set scrolloff=8   
   set sidescrolloff=15 
   set sidescroll=1 

   " Autocompletion
   set completeopt=menu,menuone,longest
    
   " Limit popup menu height
   set pumheight=15

   " Set information of status line
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
      set statusline+=%*
      set statusline+=%=%-14.(%l,%c%V%)\ %p%% " Right aligned file nav info
   endif

   " Folding options
   "set nofoldenable
   set foldmethod=marker
   set foldnestmax=10

   " Standard spelling en
   set spelllang=en

   " Toggle paste mode on and off
   set pastetoggle=<F3>

   " Autosize windows
   set winheight=30

"}}}

" Mappings {{{

   " Preparations {{{

      " set leader and local leader
      let mapleader = "," 
      let maplocalleader = '.' 

      " setup for alt and meta key mappings 
      for i in range(97,122)
         let c = nr2char(i)
         exec "set <M-".c.">=\<Esc>".c
      endfor

   "}}}

   " Basic mappings {{{
         
      " Remove key functionality {{{

         " Remove help from f1
         noremap <F1> <nop>
      "}}}

      " Movement related {{{

         " move always one line up/down
         noremap j gj
         noremap k gk

         " move between windows
         noremap <C-j> <C-W>j
         noremap <C-k> <C-W>k
         noremap <C-h> <C-W>h
         noremap <C-l> <C-W>l

         " 0 to first non-blank character
         noremap 0 ^
         
         " space: search forward. ctrl-<Space>: search backward, leader space clear search 
         noremap <space> /
         noremap <C-@> ? 
         noremap <leader><space> :noh<CR>

         " Visual mode pressing * or # searches for the current selection
         vnoremap <silent> * :call VisualSelection('b')<CR>
         vnoremap <silent> # :call VisualSelection('f')<CR>
      "

      " }}}

      " Edit related mappings {{{ 

         " Exit visual/insert/command/select mode with kj 
         vnoremap kj <esc>
         inoremap kj <esc>
         cnoremap kj <esc> 
         snoremap kj <esc> 
         
         " format the current paragraph with par
         noremap Q gqap

         " Easy undo 
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
         xmap <C-k> <Plug>(neosnippet_start_unite_snippet_target)
         imap <C-j> <Plug>(neosnippet_jump)
         smap <C-j> <Plug>(neosnippet_jump)
         
         inoremap <expr><CR> pumvisible() ? neocomplcache#close_popup() : "\<CR>"
         inoremap <expr><C-l> neocomplcache#complete_common_string()
         inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
         inoremap <expr><s-TAB> pumvisible() ? "\<C-p>" : "\<TAB>"
         
      "}}}

   "}}}

   " Sorted key mappings {{{

         " (a)lign with tabularize {{{
         
         " Description:
         "  This mappings help to align text with the tabularize plugin.
         "  You can call them in vizual and in normal mode. For example
         "  to allign text by the & character you can issue <leader>aa.
         "
         " Mappings:
         "
         "  - <leader>a=    align by  =
         "  - <leader>aa    align by  &
         "  - <leader>a:    align by  :
         "  - <leader>a::   align by  ::
         "  - <leader>a,    align by  ,
        
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
         "}}}

         " (b)uffer handling {{{
         
         " Description:
         "
         " This mappings do the buffer handling. Fast buffer switching is
         " realized with the LustyJuggler plugin. You can switch betwenn buffers
         " with the combination <leader>b which opens up LustyJuggler. Then
         " you can switch to the buffer you like with a key of the homerow of
         " your keyboard starting with a for the first buffer, s for the second
         " and so on. On tap on the key highlights the corresponding buffer, a
         " second key stroke switches to that buffer. 
         " 
         " Mappings:
         " 
         "  - [buffer_key]d   closes the active buffer 
         "  - [buffer_key]n   opens a new tab 
         "  - [buffer_key]o   closes all but the active buffer 

            nnoremap [buffer_key] <Nop>
            nmap <leader>b [buffer_key]

            noremap [buffer_key] :LustyJuggler<CR>
            noremap [buffer_key]n :tabnew<CR>
            noremap [buffer_key]d :bd!<CR>
            noremap [buffer_key]o :tabonly<CR>
         " }}}

         " (c)omment handling {{{
         
         " Description:
         "
         " This mappings handle commenting lines in and out with the
         " NERDCommenter plugin. They combination <leader>c calls the comment
         " toggle of nerd commter which comments the line in or out. This
         " mapping works in vizal and normal mode.
         "
         " Mappings:
         "
         " - [comment_key]    toggles the nerd commenter
         " - [comment_key]y   yank text then comment out 
         " - [comment_key]a   change to alternative delimiter set 

            nnoremap [comment_key] <nop>
            map <leader>c [comment_key]
            
            map [comment_key] <plug>NERDCommenterToggle
            map [comment_key]y <plug>NERDCommenterYank
            map [comment_key]a <plug>NERDCommenterAltDelims
         " }}}

         " (d)ump and load sessions {{{
         
         " Description:
         "
         " This mappings use the vim sessionman plugin to handle sessions. If
         " you store a session all things defined under sessionoptions will be
         " stored.
         "
         " Mappings:
         "
         " - [dump_key]l   lists all stored sessions 
         " - [dump_key]s   to save a session
        
            nnoremap [dump_key] <Nop>
            nmap <leader>d [dump_key]

            nnoremap [dump_key]s :SessionSave<CR>
            nnoremap [dump_key]l :SessionList<CR>
         " }}}

         " (e)dit config files {{{
         
         " Description:
         "
         " This mappings use enable fast access to important configuration
         " and snippet files. 
         "
         " Mappings:
         "
         " - [edit_key]v   edit the vimrc file in vertical split
         " - [edit_key]r   edit the neosnippet runtime snippets for [filetype] 
         " - [edit_key]s   edit your personal snippet for [filetype]
         
            nnoremap [edit_key] <Nop>
            nmap <leader>e [edit_key]
            
            nnoremap [edit_key]v :vsplit $MYVIMRC<cr>
            nnoremap [edit_key]r :NeoSnippetEdit -runtime<CR>
            nnoremap [edit_key]s :NeoSnippetEdit<CR>
         " }}}

         " (f)ind files, buffers etc. and do (unite) {{{

         " Description:
         "
         " This are the mappings use the unite plug-in to search in files,
         " buffers etc. 
         "
         " Mappings:
         "
         " - [unite_key]c  open files recursively starting from current directory
         " - [unite_key]r  open recently used files   
         " - [unite_key]f  open unite with sources overview to chose from actions
            
            nnoremap [unite_key] <Nop>
            nmap <leader>f [unite_key]
           
            nnoremap <silent> [unite_key]c :<C-u>Unite -buffer-name=files file_rec:!<CR>
            nnoremap <silent> [unite_key]r :<C-u>Unite -buffer-name=files file_mru<CR>
            nnoremap <silent> [unite_key]f :<C-u>Unite -buffer-name=sources source<CR>

         "}}}

         " (g)it version control (Fugitive) {{{

         " Description:
         "
         " This mappings cover common git tasks with the help of the Vim
         " plug-in fugitive.
         "
         " Mappings:
         "
         " - [git_key]s   open the interactive git status window            
         " - [git_key]d   opens a git diff in split view of the file  
         " - [git_key]c   commit your changes
         " - [git_key]b   open a git blame in split view        
         " - [git_key]l   show a git log         
         " - [git_key]p   push to your remote repository        
         
            nnoremap [git_key] <Nop>
            nmap <silent> <leader>g [git_key]

            nnoremap [git_key]s :Gstatus<CR>
            nnoremap [git_key]d :Gdiff<CR>
            nnoremap [git_key]c :Gcommit<CR>
            nnoremap [git_key]b :Gblame<CR>
            nnoremap [git_key]l :Glog<CR>
            nnoremap [git_key]p :Git push<CR><CR>
         " }}}

         " (m)ake call a task {{{

         " Description:
         "
         " This mappings help to call make tasks.
         "
         " Mappings:
         "
         " - [make_key]   opens a unite window and starte a plain make call.
         "                the filter in the file is set to error so it will
         "                display all errors in the make run output. You can
         "                specify it to your needs or to multiple statements
         "                if you like. Another solution is to delete the
         "                filter and type in the interactive unite window to 
         "                narrow down the output.
         "
         " - [make_key]s  This is an exaple makefile call which calls make directly to
         "                execute a task defined in the makefile. I would also do this with
         "                unite in future versions of this configuration but I have a unicode
         "                problem with it at them moment. The example calls
         "                the make task showpdf. You can extend this to you
         "                needs.

            nnoremap [make_key] <Nop>
            nmap <silent> <leader>m [make_key]

            nnoremap [make_key]  :Unite -input=error build <CR>
            nnoremap [make_key]s :Unite -no-empty build:make:showpdf <CR>
         " }}}
         
         " (q)quit fast {{{
         
         " Description:
         "
         " Fast quit your document 
         "
         " Mappings:
         "
         " [quit_key] close your document.
         "
            nnoremap [quit_key] <Nop>
            nmap <leader>q [quit_key]

            nnoremap [quit_key] :q!<CR>
         " }}}

         " (r)eplace search visual selection {{{ 
 
         " Description:
         "
         " These mappings help to search and replace content in your files. 
         " 
         " Mappings:
         "
         " - [replace_key]    Works in vizual mode and replaces the current
         "                    marked text by a replacement defined by you.
         "
         " - [replace_key]s   Is also a vizal mode mapping and Calls grep (ack) from current direcotry
         "                    recursive on its contents to find the currently
         "                    marked text. The results end up in a quickfix
         "                    window. This is really helpful when you like to 
         "                    replace a string in all your project files. You
         "                    can combine it with the next command for
         "                    replacment.
         "
         " - [replace_key]a   You can mark text in vizual mode and then call
         "                    this mapping. Does a quickfixdo which opens all the files
         "                    whith the occurence of the string you grepped
         "                    for in the quickfix window. It changes all
         "                    strings to a string defined by you and saves the
         "                    files.
         
            vnoremap [replace_key] <Nop>
            vmap <silent> <leader>r [replace_key]

            vnoremap [replace_key] :call VisualSelection('replace')<CR>
            vnoremap [replace_key]s :call VisualSelection('acksearch')<CR>
            vnoremap [replace_key]a :call VisualSelection('quickfixdo')<CR> 
         " }}}

         " (s)pellchecking {{{

         " Description:
         "
         " This mappings help to spell check your files. 
         " 
         " Mappings:
         " 
         " - [spell_key]s     enables the spelling for the file. If you like to
         "                    auto enable spelling for a certain file type you
         "                    should have a look into the auto command section
         "                    below.
         " 
         " - [spell_key]n     Go to the next spelling error in the file.
         " 
         " - [spell_key]p     Go to the previous spelling error in file.
         " 
         " - [spell_key]g     Mark a word as good.
         " 
         " - [spell_key]l     Show a list of items which are suggested for the
         "                    misspelled word.
         " 
         " - [spell_key]r     Chose the first entry from list and replace the
         "                    misspelled word.
            
            nnoremap [spell_key] <Nop>
            nmap <leader>s [spell_key]

            noremap [spell_key]s :setlocal spell!<CR>
            noremap [spell_key]n ]s
            noremap [spell_key]p [s
            noremap [spell_key]g zg
            noremap [spell_key]l z=
            noremap [spell_key]r 1z=
         " }}}
           
         " (t)toggle windows {{{

         " Description:
         "
         " This mappings help you with file and tag navigation. They use the
         " plugin tagbar on one hand and on the other the vimfiler for file
         " navigation. The tagbar requires in background a working installation
         " of the ctags program.
         " 
         " Mappings:
         " 
         " - [toggle_key]     opens a tagbar on the left side of a screen. In
         "                 this window you can navigate beween the functions
         "                 in your sourcecode. 
         
            nnoremap [toggle_key] <Nop>
            nmap <silent> <leader>t  [toggle_key]

            nnoremap [toggle_key]t :TagbarToggle<CR>
            nnoremap [toggle_key]f :VimFiler -buffer-name=explorer -split -simple -winwidth=35 -toggle -no-quit<CR>
         "}}}

         " (v)izualize {{{

         " Description:
         "
         " This mappings help to vizualize tabs and other invisivle
         " characters. Especially the tab vizualization is very helpful in 
         " checking the indent of code. 
         "  
         " Mappings:
         " 
         " - [vizualize_key]     Vizualizes the indent with guide lines. 
            
            nnoremap [vizualize_key] <Nop>
            nmap <Leader>v  [vizualize_key]

            nnoremap [vizualize_key] :IndentGuidesToggle<CR>
         "}}}

         " (w)rite and quit fast {{{
 
         " Description:
         "
         " This mappings help to write and to write and quit fast.
         "  
         " Mappings:
         " 
         " - [write_key]      Write your document to file.
         "
         " - [write_key]q     Write document and then quit Vim.
         
            nnoremap [write_key] <Nop>
            nmap <Leader>w  [write_key]

            nnoremap [write_key] :w!<CR>
            nnoremap [write_key]q :wq!<CR>
         "}}}

         " (x)ecute a shell with interpreter {{{
 
         " Description:
         "
         " The mappings around the letter x are thought to execute 
         " shells with a certain interpreter.
         "  
         " Mappings:
         " 
         " todo: rework this mappings
         
            nnoremap [execute_key] <Nop>
            nmap <Leader>x  [execute_key]
            
            " Send to shell
            nnoremap [execute_key]s :VimShellSendString<CR> 
            vnoremap [execute_key]s :VimShellSendString<CR>
          
            " Start shell or shell with interpreter
            nnoremap [execute_key]b :ConqueTermSplit bash<CR>
            nnoremap [execute_key]r :ConqueTermSplit R<CR>
            nnoremap [execute_key]c :ConqueTermSplit rails console<CR>
         "}}}

         " (y)ank and paste management (Yankring) {{{
         
         " Description:
         "
         " This mappings help you to deal with yanked text. They use the
         " yankring plugin. The yankring plugin maintains a yank history 
         " which survives a Vim session.
         "  
         " Mappings:
         " 
         " - [yank_key]y     Opens the yankring window where you can chose
         "                   which text you like to paste.
         " 
         " - [yank_key]s     Copy text from system Clipboard. After that you 
         "                   can simply paste it by pressin p in normal mode.

            nnoremap [yank_key] <Nop>
            nmap <silent> <leader>y [yank_key]

            nnoremap [yank_key]y :YRShow<CR>
            nnoremap [yank_key]s :YRPush '+'<CR>
         " }}}

   "}}}

"}}}

" Plugin configuration {{{

   " (c)onque term {{{
      let g:ConqueTerm_CWInsert = 1
      let g:ConqueTerm_FastMode = 1
      let g:ConqueTerm_ReadUnfocused = 1
      
      " let g:ConqueTerm_TERM = 'xterm'
      " let g:ConqueTerm_ExecFileKey = '<nop>'
      " let g:ConqueTerm_SendFileKey = '<nop>'
      " let g:ConqueTerm_SendVisKey = '<nop>' 
   " }}}

   " (l)usty juggler {{{
      let g:LustyJugglerDefaultMappings = 0
   " }}}

   " (n)eocomplcache and neosnippet {{{ 
      
      " Set options
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
     
      " Compatibility setting for LustyJuggler
      let g:neosnippet#disable_select_mode_mappings = 0

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

   " (n)erd commenter {{{
      let g:NERDCreateDefaultMappings = 0
      let g:NERDSpaceDelims = 1

      let g:NERDCustomDelimiters = {
         \ 'snippet': {'left': '#'},
         \ 'rnoweb' : {'left': '%', 'leftAlt': '#'}
       \ }
   " }}}

   " (p)owerline plugin {{{
      let g:Powerline_symbols = 'fancy'
   " }}}

   " (r)ails plugin {{{
      let g:rubycomplete_buffer_loading = 1
   " }}}

   " (r)-plugin {{{
      let vimrplugin_ca_ck = 0
      let vimrplugin_applescript = 0
      let vimrplugin_screenplugin = 0
      let vimrplugin_conqueplugin = 1
   " }}}

   " (s)essionman session plugin {{{
      set sessionoptions=blank,buffers,curdir,folds,tabpages,winsize
   " }}}

   " (s)yntastic {{{
      let g:syntastic_stl_format = '[%E{Err: %fe #%e}%B{, }%W{Warn: %fw #%w}]'
   " }}}

   " (t)agbar options {{{ 
      let g:tagbar_left = 0
   " }}}

   " (t)ab guideline {{{
      let g:indent_guides_enable_on_vim_startup = 0
      let g:indent_guides_auto_colors = 0
      let g:indent_guides_guide_size = 1 
      let g:indent_guides_start_level = 1
      hi IndentGuidesOdd  ctermbg=238 
      hi IndentGuidesEven ctermbg=243
   " }}}

   " (u)nite vim {{{
      " TODO: rework this configuration 
      " Start insert.
      let g:unite_enable_start_insert = 1
      let g:unite_source_file_mru_limit = 200
      let g:unite_cursor_line_highlight = 'TabLineSel'
      let g:unite_abbr_highlight = 'TabLine'
      let g:unite_split_rule='belowright'     
      
      " For optimize.
      let g:unite_source_file_mru_filename_format = ''

      " For ack.
      if executable('ack-grep')
         let g:unite_source_grep_command = 'ack-grep'
         let g:unite_source_grep_default_opts = '--no-heading --no-color -a'
         let g:unite_source_grep_recursive_opt = ''
      endif

      autocmd FileType unite call s:unite_my_settings()
      
      function! s:unite_my_settings()
         " Overwrite settings.

         nmap <buffer> <ESC>      <Plug>(unite_exit)
         imap <buffer>  kj      <Plug>(unite_insert_leave)
         imap <buffer> <TAB>   <Plug>(unite_select_next_line)
         "nmap <buffer> <C-j>     <Plug>(unite_toggle_auto_preview)

         nnoremap <silent><buffer><expr> l
                  \ unite#smart_map('l', unite#do_action('default'))

         let unite = unite#get_current_unite()

         if unite.buffer_name =~# '^search'
            nnoremap <silent><buffer><expr> r     unite#do_action('replace')
         else
            nnoremap <silent><buffer><expr> r     unite#do_action('rename')
         endif
         
         "imap <expr> -  pumvisible() ? 
           "\ "\<Plug>(neocomplcache_start_unite_quick_match)" : '-' 
         "imap <buffer> <C-w>     <Plug>(unite_delete_backward_path)
         "imap <buffer><expr> j unite#smart_map('j', '')
         "imap <buffer> <C-w>     <Plug>(unite_delete_backward_path)
         "imap <buffer> - <Plug>(unite_quick_match_default_action)
         "nmap <buffer> - <Plug>(unite_quick_match_default_action)
         "imap <buffer><expr> x
         "\ unite#smart_map('x', "\<Plug>(unite_quick_match_choose_action)")
         "nmap <buffer> x     <Plug>(unite_quick_match_choose_action)
         "nmap <buffer> <C-z>     <Plug>(unite_toggle_transpose_window)
         "imap <buffer> <C-z>     <Plug>(unite_toggle_transpose_window)
         "imap <buffer> <C-y>     <Plug>(unite_narrowing_path)
         "nmap <buffer> <C-y>     <Plug>(unite_narrowing_path)
         "nmap <buffer> <C-r>     <Plug>(unite_narrowing_input_history)
         "imap <buffer> <C-r>     <Plug>(unite_narrowing_input_history)
         "nnoremap <silent><buffer><expr> cd     unite#do_action('lcd')
         "nnoremap <buffer><expr> S      unite#mappings#set_current_filters(
         "\ empty(unite#mappings#get_current_filters()) ? ['sorter_reverse'] : [])
      endfunction

   " }}}

   " (v)imshell {{{
      " Global options
      let g:vimshell_split_command='belowright split' 
      let g:vimshell_no_default_keymappings=1
      let g:vimshell_temporary_directory='~/.vim/tmp/'

      " Buffer specific remapping
      
      " For all vimshells 
      autocmd FileType int-* call s:vimshell_all_my_settings()
      function! s:vimshell_all_my_settings()
         imap <buffer> <CR> <Plug>(vimshell_int_execute_line)

         nmap <buffer> <up>	<Plug>(vimshell_int_previous_prompt)
         nmap <buffer> <down>	<Plug>(vimshell_int_next_prompt)
         nmap <buffer> <CR> 	<Plug>(vimshell_int_execute_line)
         nmap <buffer> <C-y>	<Plug>(vimshell_int_paste_prompt)
         nmap <buffer> <C-z>	<Plug>(vimshell_int_restart_command)
         nmap <buffer> <C-c>	<Plug>(vimshell_int_interrupt)
         nmap <buffer> q	 <Plug>(vimshell_int_exit)
         nmap <buffer> cc	 <Plug>(vimshell_int_change_line)
         nmap <buffer> dd	 <Plug>(vimshell_int_delete_line)
         nmap <buffer> I	 <Plug>(vimshell_int_insert_head)
         nmap <buffer> A	 <Plug>(vimshell_int_append_end)
         nmap <buffer> i	 <Plug>(vimshell_int_insert_enter)
         nmap <buffer> a	 <Plug>(vimshell_int_append_enter)
         nmap <buffer> <C-l>	<Plug>(vimshell_int_clear)

         " imap <buffer> <C-h>	<Plug>(vimshell_int_delete_backward_char)
         " imap <buffer> <BS>	<Plug>(vimshell_int_delete_backward_char)
         " imap <buffer> <C-a>	<Plug>(vimshell_int_move_head)
         " imap <buffer> <C-u>	<Plug>(vimshell_int_delete_backward_line)
         " imap <buffer> <C-w>	<Plug>(vimshell_int_delete_backward_word)
         " imap <buffer> <C-k>	<Plug>(vimshell_int_delete_forward_line)
         " imap <buffer> <CR>	<Plug>(vimshell_int_execute_line)
         " imap <buffer> <C-c>	<Plug>(vimshell_int_interrupt)
         " imap <buffer> <C-l>	Start vimshell/history source
         " imap <buffer> <C-v>	<Plug>(vimshell_int_send_input)
         " imap <buffer> <C-n>	<C-n>
         " imap <buffer> <TAB>	Select candidate or start completion
      endfunction


      " This can be done to have interpreter specific mappings
      "autocmd FileType int-R call s:vimshell_R_my_settings()
      "function! s:vimshell_R_my_settings()
         "imap <buffer> <CR> <Plug>(vimshell_int_execute_line)
      "endfunction
      
   "}}}

   " (v)imfiler plugin {{{
      let g:vimfiler_as_default_explorer = 1
      " let g:vimfiler_no_default_key_mappings = 1
      let g:vimfiler_tree_leaf_icon = ' '
      let g:vimfiler_tree_opened_icon = '▾'
      let g:vimfiler_tree_closed_icon = '▸'
      let g:vimfiler_file_icon = '-'
      let g:vimfiler_marked_file_icon = '*'

      " For fll vimfiler 
      autocmd FileType vimfiler call s:vimfiler_all_my_settings()
      function! s:vimfiler_all_my_settings()
         nmap <buffer> <C-l> <Plug>(vimfiler_switch_to_other_window)
      endfunction
   " }}}

   " (y)ankring {{{ 
      let g:yankring_history_dir = '~/.vim/tmp'
   " }}}

"}}}

" Functions {{{

   " Delete trailing white space on save (Python and CoffeeScript)
    func! DeleteTrailingWS()
       exe "normal mz"
       %s/\s\+$//ge
       exe "normal `z"
    endfunc
   "

   " My fold text
    "function! MyFoldText()
       ""let nl = v:foldend - v:foldstart + 1
       "let linetext = getline(v:foldstart + 1)
       "let text =  linetext  
       "return text
    "endfunction

    "set foldtext=MyFoldText()
   "

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

"}}}

" Autogroups {{{

   " Return to last edit position when opening files
   augroup last_cursor_position
      autocmd!
      autocmd BufReadPost *
         \ if line("'\"") > 0 && line("'\"") <= line("$") |
         \  exe "normal! g`\"" |
         \ endif
   augroup END

   "Remove trailing whilespaces
   augroup remove_trailing_spaces
      autocmd!
      autocmd BufWrite *.py :call DeleteTrailingWS()
      autocmd BufWrite *.coffee :call DeleteTrailingWS()
   augroup END 

   " Rnw files
   augroup rnw_file_options
      autocmd!
      autocmd BufNewFile,BufRead *.Rnw set spell
   augroup END

   " Add $ to options
   augroup set_cp_options
      autocmd!
      autocmd BufNewFile,BufRead * set cpoptions+=$
   augroup END

"}}}
