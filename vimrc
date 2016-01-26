" ===================================================
"   MMMM   MMMM    VVV           VVV    SSSSSS
"  MMMM MMM MMMM   VVVV         VVVV   SSSSSSSS
"  MMMM  M  MMMM    VVVV       VVVV    SSSS
"  MMMM     MMMM     VVVV     VVVV     SSSSSSS
"  MMMM     MMMM      VVVV   VVVV          SSSS
"  MMMM     MMMM       VVVV VVVV       SSSSSSSS
"  MMMM     MMMM y       VVVVV  im      SSSSSS etup
" ===================================================

" File: vimrc
" Maintainer: Claas-Thido Pfaff
" Description: This is my personal Vim setup.

" Include bundles {{{
   if filereadable(glob("~/.vim/bundles.vim")) 
      source ~/.vim/bundles.vim
   endif
" }}}

" Source local vimrc {{{
   if filereadable(glob("~/.vim/vimrc.local")) 
      source ~/.vim/vimrc.local
   endif
" }}}

   " General Vim behaviour {{{

      " Disable vim error behavior
      set noerrorbells
      set novisualbell
      set t_vb=
      set timeoutlen=500

      " Save all files in one place
      set nobackup
      " set backupdir=~/.vim/tmp
      set noswapfile
      set directory=~/.vim/tmp
      set tags=~/.vim/tmp/

      " Disable vim startup message
      set shortmess+=filmnrxoOtTI
      " Sets how much history and undo vim remembers
      set history=1000

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

      " Configure backspace
      set backspace=indent,eol,start

      " Wrap behavior
      set whichwrap=b,s,<,>,[,],h,l

      "swith on numbering on left side
      set number 

      " Tab completion
      set wildmenu
      " set wildignore=*tikzDiktionary*

      " ignore cases (unite uses this as well)
      set ignorecase

      " but be smart about cases
      set smartcase

      " highlight search results
      set hlsearch

      " makes search act like search in modern browsers
      set incsearch

      " don't redraw while executing macros (better performance)
      set lazyredraw

      " for regular expressions turn magic on
      set magic

      " enable better colours in console
      set t_Co=256

      " set colour scheme 
      syntax on
      set background=dark
      let g:solarized_contrast="normal"
      colorscheme solarized 
      
      
      " relative numbering
      set relativenumber

      highlight clear SignColumn 
 
      " completion popup
      hi Pmenu guifg=#000000 guibg=#F8F8F8 ctermfg=black ctermbg=Lightgray
      hi PmenuSbar guifg=#8A95A7 guibg=#F8F8F8 gui=NONE ctermfg=darkcyan ctermbg=lightgray cterm=NONE
      hi PmenuThumb guifg=#F8F8F8 guibg=#8A95A7 gui=NONE ctermfg=lightgray ctermbg=darkcyan cterm=NONE   

      " search highlight
      hi Search guifg=#000000 guibg=#F8F8F8 ctermfg=black ctermbg=Lightgray
      hi IncSearch guifg=#000000 guibg=#F8F8F8 ctermfg=black ctermbg=Lightgray 

      " wrap and line break
      set wrap
      set linebreak
      set nolist

      " search for modeline
      set modeline
      set modelines=4

      " Specify the behavior of tabs
      set switchbuf=useopen,usetab,newtab
      set showtabline=1

      " Adjust scroll of screen when cursor is moved
      set scrolloff=8
      set sidescrolloff=15
      set sidescroll=1

      " Completion
      set completeopt=menu,menuone,longest

      " Limit popup menu height
      set pumheight=15

      " Set status line information
      set laststatus=2

      " no double space after punctuation on join
      set nojoinspaces

      " folding options
      set foldmethod=marker
      set foldnestmax=10

      " standard spelling en
      set spelllang=en

      " concealment behaviour (e.g LaTeX)
      set conceallevel=0
      let g:tex_conceal=''
      let g:tex_indent_brace = 0
      let g:tex_indent_items = 1 

      " fast terminal reduces lags
      set ttyfast

      " set chars for visualization 
      set listchars=trail:·,eol:$

      " clipboard support
      " if has ('x') && has ('gui')
      set clipboard=unnamedplus
      " elseif has ('gui')
         " set clipboard=unnamed
      " endif
      
      " virtual edit in block mode
      set virtualedit=block

      " indent stuff
      set autoindent
      set smartindent

      " showcmd (testing)
      set showcmd

   "}}}

   " Mappings {{{

      " Leader keys {{{

         " Set leader and local leader
         let g:mapleader = ","
         " let maplocalleader = "."
         let maplocalleader = "-"

      "}}}

      " Basic mappings {{{

         " Remove key functionality {{{

            " Remove help from f1
            noremap <F1> <nop>

            " Disable ZZ.
            nnoremap ZZ <Nop>
         "}}}

         " Movement related {{{

            " move always only one line up/down
            noremap j gj
            noremap k gk

            " move between windows
            noremap <C-j> <C-W>j
            noremap <C-k> <C-W>k
            noremap <C-h> <C-W>h
            noremap <C-l> <C-W>l

            " fast navigation start/end of line and first char
            nnoremap H ^
            nnoremap HH 0
            nnoremap L $

            " space: search forward. ctrl-<Space>: search backward, leader space clear search
            noremap <space> /
            " map <space> <Plug>(incsearch-forward)
            noremap <C-@> ?
            " map <C-@> <Plug>(incsearch-backward)
            noremap <leader><space> :noh<CR>

            " The * or # commands extended for vizual selection
            vnoremap <silent> * :call VisualSelection('b')<CR>
            vnoremap <silent> # :call VisualSelection('f')<CR>
    
            " Alternative movement for camel and snake case notation
            nmap <silent> <M-w> <Plug>CamelCaseMotion_w
            xmap <silent> <M-w> <Plug>CamelCaseMotion_w
            omap <silent> <M-w> <Plug>CamelCaseMotion_w
            nmap <silent> <M-b> <Plug>CamelCaseMotion_b
            xmap <silent> <M-b> <Plug>CamelCaseMotion_b
            omap <silent> <M-b> <Plug>CamelCaseMotion_b
            nmap <silent> <M-e> <Plug>CamelCaseMotion_e
            xmap <silent> <M-e> <Plug>CamelCaseMotion_e
            omap <silent> <M-e> <Plug>CamelCaseMotion_e

         " }}}

         " Editing related mappings {{{

            " Exit visual/insert/command/select mode with kj
            vnoremap kj <esc>
            inoremap kj <esc>
            cnoremap kj <esc>
            snoremap kj <esc>

            " format the current paragraph
            noremap Q gwap

            " Easy undo/redo
            nnoremap U <C-r>

            " Improved block mode
            xmap I <Plug>(niceblock-I)
            xmap gI <Plug>(niceblock-gI)
            xmap A <Plug>(niceblock-A)

            " Move text left and right (indent)
            nnoremap <A-l> >>
            nnoremap <A-h> <<
            vnoremap <A-l> >gv^
            vnoremap <A-h> <gv^

            " Move text up and down (bubble)
            xmap <A-j> <Plug>(textmanip-move-down)
            nmap <A-j> <Plug>(textmanip-move-down)
            xmap <A-k> <Plug>(textmanip-move-up)
            nmap <A-k> <Plug>(textmanip-move-up)

            " Necomplcache and neosnippet mappings
            imap <C-k> <Plug>(neosnippet_expand)
            smap <C-k> <Plug>(neosnippet_expand)
            xmap <C-k> <Plug>(neosnippet_expand_target)
            imap <C-j> <Plug>(neosnippet_jump)
            smap <C-j> <Plug>(neosnippet_jump)
            
            " inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
            " inoremap <expr><s-TAB> pumvisible() ? "\<C-p>" : "\<TAB>" 

            inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>

            " For no inserting <CR> key.
            function! s:my_cr_function()
              return neocomplete#close_popup() . "\<CR>"
            endfunction

            inoremap <expr><C-l> neocomplete#complete_common_string()

            " Make Y consistent with D and C commands which act on a whole line
            nnoremap Y y$

            " Toggle paste mode on and off
            " set pastetoggle=<F3>
            
            " Allow repeat operator to be used with visible selection
            vnoremap . :normal .<CR>

            " change working dir to the current file
            cmap cwd lcd %:p:h

            " write the file when forgot to sudo
            cmap w!! w !sudo tee % >/dev/null

         "}}}

      "}}}

      " Sorted key mappings {{{
     
            " (a)lign with easy align {{{

            " Description:
            "  This mappings align text with the tabularize plugin.
            "  You can call them in vizual and in normal mode. For example
            "  to allign text by the & character you can issue <leader>aa.
            "
            " Mappings:
            "
               xmap ga <Plug>(EasyAlign)
               nmap ga <Plug>(EasyAlign)

            "}}}

            " (b)uffer handling {{{

            " Description:
            "
            " All buffer related mappings
            "
            " Mappings:
            "
            "  - [buffer_key]b   show open buffers (buffer swither)
            "  - [buffer_key]d   closes the active buffer
            "  - [buffer_key]n   opens a new tab
            "  - [buffer_key]o   closes all but the active buffer

               nnoremap [buffer_key] <Nop>
               nmap <silent><leader>b [buffer_key]

               noremap [buffer_key]d :<C-u>bd!<CR>
               noremap [buffer_key]n :<C-u>tabnew<CR>
               noremap [buffer_key]o :<C-u>tabonly<CR>
               nnoremap [buffer_key] :<C-u>Unite -buffer-name=buffers buffer -input=!vimfiler -quick-match<CR>
            " }}}

            " (c)omment handling {{{

            " Description:
            "
            " This mappings comment lines in and out with the
            " NERDCommenter plug-in. The combination <leader>c calls the comment
            " toggle of nerd commenter which comments the line in or out. This
            " mapping works in visual and normal mode.
            "
            " Mappings:
            "
            " - [comment_key]    toggles comments
            " - [comment_key]a   change to alternative delimiter set
            " - [comment_key]y   yank text then comment out

               nnoremap [comment_key] <nop>
               map <silent><leader>c [comment_key]

               map [comment_key] <plug>NERDCommenterToggle
               map [comment_key]a <plug>NERDCommenterAltDelims
               map [comment_key]y <plug>NERDCommenterYank
            " }}}

            " (d)ump and load sessions {{{

            " Description:
            "
            " This mappings make use of the Vim sessionman plug-in to handle sessions. If
            " you store a session all things defined under "sessionoptions" will be
            " stored.
            "
            " Mappings:
            "
            " - [dump_key]l   lists all stored sessions
            " - [dump_key]s   to save a session

               " nnoremap [dump_key] <Nop>
               " nmap <silent><leader>d [dump_key]

               " nnoremap [dump_key]l :<C-u>SessionList<CR>
               " nnoremap [dump_key]s :<C-u>SessionSave<CR>
            " }}}

            " (e)dit config and snippet files {{{

            " Description:
            "
            " This mappings enable fast access to important configuration
            " and snippet files.
            "
            " Mappings:
            "
            " - [edit_key]r   edit the neosnippet builtin snippets for [filetype]
            " - [edit_key]s   edit your personal snippet file for [filetype]
            " - [edit_key]v   edit the vimrc file in vertical split

               nnoremap [edit_key] <Nop>
               nmap <silent><leader>e [edit_key]

               nnoremap [edit_key]r :<C-u>NeoSnippetEdit -runtime<CR>
               nnoremap [edit_key]s :<C-u>NeoSnippetEdit<CR>
               nnoremap [edit_key]v :<C-u>vsplit $MYVIMRC<cr>
            " }}}

            " (f)ind files, buffers etc. and do (unite) {{{

            " Description:
            "
            " Mappings based on the unite vim plugin to find files and buffers
            " as sources to pick from.
            "
            " Mappings:
            "
            " - [unite_key]c  open files recursively starting from current directory
            " - [unite_key]f  open unite vim in sources overview
            " - [unite_key]g  open files recursively starting from the root of
            "                 a project folder (e.g. git repository)
            " - [unite_key]r  open a list of recently used files
            " - {unite_key]u  update all plugins

               nnoremap [unite_key] <Nop>
               nmap <silent><leader>f [unite_key]

               nnoremap [unite_key]c :<C-u>Unite -buffer-name=files file_rec/async<CR>
               nnoremap [unite_key]f :<C-u>Unite -buffer-name=sources source<CR>
               nnoremap [unite_key]g :<C-u>Unite -buffer-name=files file_rec/async:!<CR>
               nnoremap [unite_key]r :<C-u>Unite -buffer-name=files file_mru<CR>
               nnoremap [unite_key]u :<C-u>Unite -log -buffer-name=update neobundle/update<CR>

            "}}}

            " (g)it version control (Fugitive) {{{

            " Description:
            "
            " This mappings cover common git tasks via the Vim
            " plug-in fugitive.
            "
            " Mappings:
            "
            " - [git_key]b   open a git blame in split view
            " - [git_key]c   commit your changes
            " - [git_key]d   opens a git diff in split view of the file
            " - [git_key]l   show a git log
            " - [git_key]o   only to close all but the active diff split
            " - [git_key]p   push to your remote repository
            " - [git_key]s   open the interactive git status window
            
               nnoremap [git_key] <Nop>
               nmap <silent><leader>g [git_key]

               nnoremap [git_key]s :<C-u>Gstatus<CR><C-w>15+
               nnoremap [git_key]d :<C-u>Gvdiff<CR>
               nnoremap [git_key]c :<C-u>Gcommit<CR>
               nnoremap [git_key]b :<C-u>Gblame<CR>
               nnoremap [git_key]l :<C-u>Glog<CR>
               nnoremap [git_key]p :<C-u>Git push<CR><CR>
               nnoremap [git_key]r :<C-u>Gread<CR><CR>
               nnoremap [git_key]w :<C-u>Gwrite<CR><CR>
               nnoremap [git_key]o :<C-u>only<CR><CR>
            " }}}
            
            " (m)ake call a task {{{

            " Description:
            "
            " This mappings help to call make tasks.
            "
            " Mappings:
            "
            " - [make_key]   opens a unite window and starts a plain make call.
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
               nmap <silent><leader>m [make_key]

               nnoremap [make_key]  :<C-u>Unite -input=error build<CR>
               nnoremap [make_key]s :<C-u>Unite -no-empty build:make:showpdf<CR>
               nnoremap [make_key]c :<C-u>Unite -no-empty build:make:clean<CR>

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
               nmap <silent><leader>q [quit_key]

               nnoremap [quit_key] :<C-u>q!<CR>
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
            " - [replace_key]a   You can mark text in vizual mode and then call
            "                    this mapping. Does a quickfixdo which opens all the files
            "                    whith the occurence of the string you grepped
            "                    for in the quickfix window. It changes all
            "                    strings to a string defined by you and saves the
            "                    files.
            "
            " - [replace_key]s   Is also a vizal mode mapping and Calls grep (ack) from current direcotry
            "                    recursive on its contents to find the currently
            "                    marked text. The results end up in a quickfix
            "                    window. This is really helpful when you like to
            "                    replace a string in all your project files. You
            "                    can combine it with the next command for
            "                    replacment.
            "
               vnoremap [replace_key] <Nop>
               vmap <silent><leader>r [replace_key]

               vnoremap [replace_key] :call VisualSelection('replace')<CR>
               " vnoremap [replace_key]a :call VisualSelection('quickfixdo')<CR>
               " vnoremap [replace_key]s :call VisualSelection('acksearch')<CR>
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
            " - [spell_key]w     Mark a word as wrong
            "
            " - [spell_key]l     Show a list of items which are suggested for the
            "                    misspelled word.
            "
            " - [spell_key]r     Chose the first entry from list and replace the
            "                    misspelled word.

               nnoremap [spell_key] <Nop>
               nmap <silent><leader>s [spell_key]

               noremap [spell_key]s :<C-u>setlocal spell!<CR>
               noremap [spell_key]n ]s
               noremap [spell_key]p [s
               noremap [spell_key]g zg
               noremap [spell_key]w zw
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
            " - [toggle_key]t  Opens a tagbar on the left side of a screen. In
            "                  this window you can navigate beween the functions
            "                  in your sourcecode.
            "
            " - [toggle_key]f  Opens a file manager on the left side of the
            "                  screen (VimFiler)
            "
               nnoremap [toggle_key] <Nop>
               nmap <silent><leader>t  [toggle_key]

               " nnoremap [toggle_key]t :<C-u>TagbarToggle<CR>
               nnoremap [toggle_key]f :<C-u>VimFiler -buffer-name=explorer -split -simple -winwidth=35 -toggle -no-quit<CR>
            "}}}

            " (v)izualize {{{

            " Description:
            "
            " This mappings help to vizualize tabs and other usually invisible
            " characters. Especially the tab vizualization is very helpful in
            " checking the indent of code for files that are tab indented.
            "
            " Mappings:
            "
            " - [vizualize_key]     Vizualizes the indent with guide lines.

               nnoremap [vizualize_key] <Nop>
               nmap <silent><Leader>v  [vizualize_key]

               nnoremap [vizualize_key] :<C-u>IndentGuidesToggle <BAR> set list! <CR>

            "}}}

            " (w)rite and quit fast {{{

            " Description:
            "
            " This mappings help to write and to write and quit buffer fast.
            "
            " Mappings:
            "
            " - [write_key]      Write your document to file.
            "
            " - [write_key]q     Write document and then quit Vim.

               nnoremap [write_key] <Nop>
               nmap <silent><Leader>w  [write_key]

               nnoremap [write_key] :<C-u>w!<CR>
               nnoremap [write_key]q :<C-u>wq!<CR>
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
            " - [yank_key]s     Copy text from system Clipboard (Linux). After that you
            "                   can simply paste it by pressing 'p' in normal mode.

               nnoremap [yank_key] <Nop>
               nmap <silent><leader>y [yank_key]

               nnoremap [yank_key]y :<C-u>YRShow<CR>
               nnoremap [yank_key]s :<C-u>YRPush '+'<CR>
            " }}}

      "}}}

   "}}}

   " Plugin configuration {{{
   
      " (g)it gutter {{{
         " plugin variables 
         let g:gitgutter_max_signs = 5000    
         let g:gitgutter_map_keys = 0
      " }}}

      " (n)eo complete {{{
         " plugin variables 
         let g:acp_enableAtStartup = 0
         let g:neocomplete#enable_at_startup = 1
         let g:neocomplete#enable_smart_case = 1
         let g:neocomplete#sources#syntax#min_keyword_length = 2
         let g:neocomplete#enable_auto_delimiter = 1
         let g:neosnippet#snippets_directory = '~/.vim/snippets/'
         let g:neocomplete#data_directory = '~/.vim/tmp/neocomplete'

         " simple omni completion
         augroup neocomplete
            autocmd!
            autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
            autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
            autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
            autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
            autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
            autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
         augroup END

         " heavy omni completion.
         if !exists('g:neocomplete#sources#omni#input_patterns')
            let g:neocomplete#sources#omni#input_patterns = {}
         endif
         if !exists('g:neocomplete#force_omni_input_patterns')
            let g:neocomplete#force_omni_input_patterns = {}
         endif

         let g:neocomplete#sources#omni#input_patterns.ruby = '[^. *\t]\.\h\w*\|\h\w*::'
         let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\%(\h\w*\)\?\|\h\w*::\%(\h\w*\)\?'
         let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)\%(\h\w*\)\?'
         let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\%(\h\w*\)\?\|\h\w*::\%(\h\w*\)\?'
         let g:neocomplete#sources#omni#input_patterns.perl = '[^. \t]->\%(\h\w*\)\?\|\h\w*::\%(\h\w*\)\?'

      " }}} 

   " (n)erd commenter {{{
      let g:NERDCreateDefaultMappings = 0
      let g:NERDSpaceDelims = 1

      let g:NERDCustomDelimiters = {
               \ 'snippet': {'left': '#'},
               \ 'rnoweb' : {'left': '%', 'leftAlt': '#'},
               \ 'text' : {'left': '#'},
               \ 'r' : {'left': '#', 'leftAlt': "#'"}
               \ }
   " }}}

   " (p)owerline plugin {{{
      let g:airline_powerline_fonts = 1
      let g:airline_theme = 'solarized'
   " }}}

   " (r)ails plugin {{{
      let g:rubycomplete_buffer_loading = 1
   " }}}

   " (r)plugin {{{
      let vimrplugin_vsplit = 1
      let ScreenImpl = 'Tmux'
      let vimrplugin_vsplit = 0
      let vimrplugin_assign = 0
   " }}}

   " (g)it automcompletion (github-issues) {{{
      let g:gissues_async_omni = 1
   " }}}

   " (g)undo (a nice undo tree) {{{
      nnoremap <Leader>u :GundoToggle<CR>
      let g:gundo_preview_bottom = 1
      let g:gundo_help = 0
   " }}}

   " (s)essionman session plugin {{{
      " set sessionoptions=blank,buffers,curdir,folds,tabpages,winsize
   " }}}

   " (s)yntastic {{{
      let g:syntastic_stl_format = '[%E{Err: %fe #%e}%B{, }%W{Warn: %fw #%w}]'  
      " ignore as lacheck for latex files seems a bit buggy
      let g:syntastic_ignore_files = ['/*.*.cls$']  
   " }}}

   " (t)agbar options {{{
      " let g:tagbar_left = 0
   " }}}

   " (t)mux complete {{{
      let g:tmuxcomplete#trigger = ''
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
      let g:unite_enable_start_insert = 1
      let g:unite_source_file_mru_limit = 200
      let g:unite_cursor_line_highlight = 'TabLineSel'
      let g:unite_abbr_highlight = 'TabLine'
      let g:unite_split_rule='belowright'
      let g:unite_source_file_mru_filename_format = ''
      let g:unite_enable_ignore_case=1 

      let g:unite_marked_icon = '*'
      let g:unite_prompt = '» '

      " the grep command
      if executable('ag')
          let g:unite_source_grep_command='ag'
          let g:unite_source_grep_default_opts='--nocolor --nogroup --hidden'
          let g:unite_source_grep_recursive_opt=''
      elseif executable('ack')
          let g:unite_source_grep_command='ack'
          let g:unite_source_grep_default_opts='--no-heading --no-color -a'
          let g:unite_source_grep_recursive_opt=''
      endif

      " Overwrite settings of unite window
      augroup unite_settings
         autocmd!
         autocmd FileType unite call s:unite_my_settings()
      augroup END

      function! s:unite_my_settings()
         imap <buffer> kj <Plug>(unite_insert_leave)
         nmap <buffer><leader>bd <Plug>(unite_all_exit)
         let unite = unite#get_current_unite()
      endfunction
   " }}}

   " (v)imfiler plugin {{{
      let g:vimfiler_as_default_explorer = 1
      let g:vimfiler_safe_mode_by_default = 0
      let g:vimfiler_data_directory = '~/.vim/tmp/vimfiler'
      let g:vimfiler_tree_leaf_icon = ' '
      let g:vimfiler_tree_opened_icon = '▾'
      let g:vimfiler_tree_closed_icon = '▸'
      let g:vimfiler_file_icon = '-'
      let g:vimfiler_marked_file_icon = '*'

      " set setting for vimfiler buffer
      augroup vimfiler_settings
         autocmd!
         autocmd FileType vimfiler call s:vimfiler_settings()
      augroup END

      function! s:vimfiler_settings()
         nmap <buffer> <C-l> <Plug>(vimfiler_switch_to_other_window)
      endfunction
   " }}}

   " (y)ankring {{{
      let g:yankring_history_dir = '~/.vim/tmp'
   " }}}

   " (e)asymotion {{{
      let g:EasyMotion_smartcase = 1
      let g:EasyMotion_startofline = 0 " keep cursor colum when JK motion
      nmap s <Plug>(easymotion-s)
      nmap S <Plug>(easymotion-s)
      nmap t <Plug>(easymotion-t)
      nmap T <Plug>(easymotion-T)
      nmap f <Plug>(easymotion-f)
      nmap F <Plug>(easymotion-F)

      omap s <Plug>(easymotion-s)
      omap S <Plug>(easymotion-s)
      omap t <Plug>(easymotion-t)
      omap T <Plug>(easymotion-T)
      omap f <Plug>(easymotion-f)
      omap F <Plug>(easymotion-F)

      vmap s <Plug>(easymotion-s)
      vmap S <Plug>(easymotion-s)
      vmap t <Plug>(easymotion-t)
      vmap T <Plug>(easymotion-T)
      vmap f <Plug>(easymotion-f)
      vmap F <Plug>(easymotion-F)

   " }}}

   "}}}

   " Functions {{{
      " spotify url to uri converter
      nnoremap ctu :call SpotifyUrlToUri()<CR>

      function! SpotifyUrlToUri()
          normal ^vt.alxwr:wvwxwr:kjj
      endfunction

      " Delete trailing white space on save
       function! DeleteTrailingWS()
          let l = line(".")
          let c = col(".")
          %s/\s\+$//ge
          call cursor(l,c)
       endfunction
      "

      " Small helper
       function! CmdLine(str)
          exe "menu Foo.Bar :" . a:str
          emenu Foo.Bar
          unmenu Foo
       endfunction
      "

      " Act on visual selection
       function! VisualSelection(direction) range
          let l:saved_reg = @"
          execute "normal! vgvy"
          let l:pattern = escape(@", '\\/.*$^~[]')
          let l:pattern = substitute(l:pattern, "\n$", "", "")
          if a:direction == 'b'
             execute "normal ?" . l:pattern . "^M"
          elseif a:direction == 'f'
             execute "normal /" . l:pattern . "^M"
          elseif a:direction == 'replace'
             call CmdLine("%s" . '/'. l:pattern . '/')
         " elseif a:direction == 'gv'
          " call CmdLine("vimgrep " . '/'. l:pattern . '/' . ' **/*.')
         " elseif a:direction == 'acksearch'
          " call CmdLine("Ack " . l:pattern . ' *')
         " elseif a:direction == 'quickfixdo'
          " call CmdLine("Qdo " . '%s/' . l:pattern . '/' . '/gc ' . '\|' . 'update')
          endif
          let @/ = l:pattern
          let @" = l:saved_reg
       endfunction
      "

      " Format XML 
      function! DoPrettyXML()
         " save the filetype so we can restore it later
         let l:origft = &ft
         set ft=
         " delete the xml header if it exists. This will
         " permit us to surround the document with fake tags
         " without creating invalid xml.
         1s/<?xml .*?>//e
         " insert fake tags around the entire document.
         " This will permit us to pretty-format excerpts of
         " XML that may contain multiple top-level elements.
         0put ='<PrettyXML>'
         $put ='</PrettyXML>'
         silent %!xmllint --format -
         " xmllint will insert an <?xml?> header. it's easy enough to delete
         " if you don't want it.
         " delete the fake tags
         2d
         $d
         " restore the 'normal' indentation, which is one extra level
         " too deep due to the extra tags we wrapped around the document.
         silent %<
         " back to home
         1
         " restore the filetype
         exe "set ft=" . l:origft
      endfunction
      command! PrettyXML call DoPrettyXML()

   "}}}

   " Autogroups {{{
      " Return to last edit position when opening files
      augroup last_cursor_position
         autocmd!
        au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
         " autocmd BufReadPost *
            " \ if line("'\"") > 0 && line("'\"") <= line("$") |
            " \  exe "normal! g`\"" |
            " \ endif
            "
      augroup END

      "Remove trailing whilespaces
      augroup remove_trailing_spaces
         autocmd!
         autocmd BufWrite *.py :call DeleteTrailingWS()
         autocmd BufWrite *.coffee :call DeleteTrailingWS()
         autocmd BufWrite *.rb :call DeleteTrailingWS()
         autocmd BufWrite *.haml :call DeleteTrailingWS()
         autocmd BufWrite *.md :call DeleteTrailingWS()
         autocmd BufWrite *.R :call DeleteTrailingWS()
         autocmd BufWrite *.tex :call DeleteTrailingWS()
         autocmd BufWrite *.txt :call DeleteTrailingWS()
      augroup END

      " augroup csv_editing 
         " au!
         " au BufRead,BufWritePost *.csv :%ArrangeColumn
         " au BufWritePre *.csv :%UnArrangeColumn
      " augroup END 

      augroup resize_buffer_windows
         autocmd!
         autocmd WinEnter * let &winheight = &lines * 7 / 10
      augroup END

      " Tex files
      augroup tex_file_options
        autocmd!
        autocmd BufNewFile,BufRead *.tex set ft=tex
      augroup END

      " Rnw files
      augroup rnw_file_options
         autocmd!
         autocmd BufNewFile,BufRead *.Rnw set spell
         autocmd FileType gitcommit set spell
      augroup END

      " Add $ to schow the end of change text range
      augroup set_cp_options
         autocmd!
         autocmd BufNewFile,BufRead * set cpoptions+=$
      augroup END

      " On insert leave
      augroup on_insert_leave
         autocmd!
         autocmd InsertLeave * set nopaste
      augroup END


      augroup ruby_and_rails_settings
         autocmd!
         autocmd FileType ruby,haml call s:my_ruby_and_rails_setting()
      augroup END

      function! s:my_ruby_and_rails_setting()
         set re=1
         set tabstop=3
      endfunction

      augroup tex_settings 
         autocmd!
         autocmd FileType tex call s:my_tex_settings()
      augroup END

      function! s:my_tex_settings()
         set re=1
         set tabstop=3
      endfunction

      augroup r_and_r_markdown_settings 
         autocmd!
         autocmd FileType r call s:my_tex_settings()
      augroup END

      function! s:my_r_and_r_markdown_settings()
         set re=1
         set tabstop=3
      endfunction

      augroup markdown_settings
         autocmd!
         autocmd FileType markdown,md call s:my_markdown_setting()
      augroup END

      function! s:my_markdown_setting()
         set re=1
         set tabstop=3
      endfunction

      augroup email_settings_mutt
         autocmd!
         autocmd BufRead /tmp/mutt-* execute "normal gg"
         autocmd BufRead /tmp/mutt-* execute "normal i"
      augroup END

   " }}} 
