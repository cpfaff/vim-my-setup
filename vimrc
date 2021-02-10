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

" Be modern
set nocompatible

" Source bundles {{{
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

      " time out for key codes
      if !has('nvim') && &ttimeoutlen == -1
        set ttimeout
        set ttimeoutlen=100
      endif

      " prevents delays of the ui with coc.
      set updatetime=300

      " Save all files in one place
      set nobackup
      set backupdir=~/.vim/tmp
      " set noswapfile
      set directory=~/.vim/tmp
      set tags=~/.vim/tmp/

      " Disable vim startup message
      set shortmess+=filmnrxoOtTIac

      " Sets history size
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

      " A buffer becomes hidden when it is abandoned. Vim
      " will not ask you to save the current file if it has
      " non saved changes.
      set hidden

      " Configure backspace (through everything)
      set backspace=indent,eol,start

      " Wrap behavior
      set whichwrap=b,s,<,>,[,],h,l

      "swith on numbering on left side
      set number

      " relative numbering
      set relativenumber

      " Tab completion (display completion matches in a status line)
      set wildmenu

      " ignore cases when searching first
      set ignorecase

      " but be smart with cases
      set smartcase

      " highlight search results
      set hlsearch

      " search like in modern browsers
      set incsearch

      " don't redraw while executing macros (better performance)
      set lazyredraw

      " for regular expressions turn magic on
      set magic

      " do not start at first line (e.g. strg+d)
      set nostartofline

      " set colour scheme
      syntax on
      
      " set background=dark
      set background=dark
      let g:gruvbox_sign_column='bg0'
      let g:gruvbox_number_column='bg0'
      colorscheme gruvbox
      let g:gruvbox_inverse=0

      let g:lightline = {
      \ 'colorscheme': 'gruvbox',
      \ }

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

      " Limit pop-up menu height
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
      if &listchars ==# 'eol:$'
         set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+,eol:$
      endif

      " clipboard support
      set clipboard^=unnamed,unnamedplus

      " virtual edit in block mode
      set virtualedit=block

      " indent stuff
      set autoindent
      set smartindent

      " Set netrw options
      let g:netrw_browsex_viewer= "xdg-open"

      set ruler	" show the cursor position all the time
      set showcmd " display incomplete commands

      " Show @@@ in the last line if it is truncated.
      set display=truncate

      " Do not recognize octal numbers for Ctrl-A and Ctrl-X, most users find
      " it confusing.
      set nrformats-=octal
      set autoread
      set display+=lastline

      " Give more space for displaying messages.
      set cmdheight=2

      if has("patch-8.1.1564")
        " merge signcolumn and number column into one
        set signcolumn=number
      else
         " or always show signcolumn
        set signcolumn=yes
      endif

      " host programs: useful wen using virtual environments
      let g:ruby_host_prog='/home/ctpfaff/.rvm/rubies/ruby-2.3.8/bin/ruby'
      let g:python3_host_prog = '/usr/bin/python3'

   "}}}

   " Mappings {{{

      " Leader keys {{{

         " Set leader and local leader
         let g:mapleader = ","
         let maplocalleader = "."
      "}}}

      " Basic mappings {{{

         " Remove key functionality {{{

            " Remove help from f1
            noremap <F1> <nop>

            " Disable ZZ.
            nnoremap ZZ <Nop>

            " Disable arrow keys
            noremap <Up> <Nop>
            noremap <Down> <Nop>
            noremap <Left> <Nop>
            noremap <Right> <Nop>

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

            " space: search forward.
            noremap <space> /
            " ctrl-<Space>: search backward
            noremap <C-@> ?
            " leader space clear search
            noremap <leader><space> :noh<CR>

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
            set formatprg=par\ -w80
 
            noremap Q gwap

            " Easy undo/redo
            nnoremap U <C-r>

            " Improved block mode
            xmap I <Plug>(niceblock-I)
            xmap gI <Plug>(niceblock-gI)
            xmap A <Plug>(niceblock-A)

           " Move text left and right (indent)
            nnoremap <A-l> >>^
            nnoremap <A-h> <<^
            nnoremap <A-L> >ap^
            nnoremap <A-H> <ap^
            vnoremap <A-l> >gv^
            vnoremap <A-h> <gv^

            " Move text up and down (bubble)
            xmap <A-j> <Plug>(textmanip-move-down)
            nmap <A-j> <Plug>(textmanip-move-down)
            xmap <A-k> <Plug>(textmanip-move-up)
            nmap <A-k> <Plug>(textmanip-move-up)

            " Ultisnippets
            let g:UltiSnipsSnippetsDir = "~/.vim/UltiSnips"
            let g:UltiSnipsExpandTrigger = "<C-k>"
            let g:UltiSnipsJumpForwardTrigger = "<C-j>"
            let g:UltiSnipsJumpBackwardTrigger = "<C-l>"
            let g:UltiSnipsEditSplit = "vertical"


            " Make Y consistent with D and C commands which act on a whole line
            nnoremap Y y$

            " Toggle paste mode on and off
            set pastetoggle=<F3>

            " Allow repeat operator to be used with visible selection
            vnoremap . :normal .<CR>

            " change working dir to the current file
            " cmap cwd lcd %:p:h
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

            " (a)sterisk improved {{{

            " Description:
            " These mappings allow asterisk movements
            "
            " Mappings:
            "
               map * <Plug>(asterisk-gz*)
               map # <Plug>(asterisk-gz#)
               " map *  <Plug>(asterisk-z*)
               " map #  <Plug>(asterisk-z#)
               " map g* <Plug>(asterisk-gz*)
               " map g# <Plug>(asterisk-gz#)
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

               nnoremap [buffer_key]b :<C-u>:Buffers<CR>
               noremap [buffer_key]d :<C-u>bd!<CR>
               noremap [buffer_key]n :<C-u>tabnew<CR>
               noremap [buffer_key]o :<C-u>tabonly<CR>
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

               nnoremap [edit_key] <Nop>
               nmap <silent><leader>e [edit_key]

               nnoremap [edit_key]s :<C-u>UltiSnipsEdit<CR>
               nnoremap [edit_key]r :<C-u>UltiSnipsEdit!<CR>
            " }}}

            " (f)ind files, buffers etc. and do (unite) {{{

            " Description:
            "
            " Mappings to find files files and buffers as sources to pick from.
            "
            " Mappings:
            "
            " - [file_key]c  open files starting from current directory
            " - [file_key]h  open files that have been recently used 
            " - [file_key]g  open files by matches with ripgrep 

               nnoremap [file_key] <Nop>
               nmap <silent><leader>f [file_key]

               nnoremap [file_key]c :<C-u>:Files<CR>
               nnoremap [file_key]h :<C-u>:History<CR>
               nnoremap [file_key]g :<C-u>:Rg<CR>


               " nnoremap [file_key]g :<C-u>:GFiles<CR>
               " nnoremap [file_key]b :<C-u>:Buffers<CR>
               " Fzf
               " nnoremap <leader><leader> :GFiles<CR>
               " nnoremap <leader>fi       :Files<CR>
               " nnoremap <leader>C        :Colors<CR>
               " nnoremap <leader><CR>     :Buffers<CR>
               " nnoremap <leader>fl       :Lines<CR>
               " nnoremap <leader>ag       :Ag! <C-R><C-W><CR>
               " nnoremap <leader>m        :History<CR>



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
            " - [git_key]c   browse or show commits (for file, for range in vizual mode)
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
               nnoremap [git_key]i :<C-u>Gissues<CR>
               nnoremap [git_key]n :<C-u>Giadd<CR>
               nnoremap [git_key]c :<C-u>GV<CR>
               xnoremap <silent><leader>gc :GV<CR>
            " }}}

            " (g)undo (a nice undo tree) {{{
               let g:gundo_preview_bottom = 1
               let g:gundo_help = 0
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

            " (r)eplace visual selection {{{

            " Description:
            "
            " These mappings help to replace content in your files.
            "
            " Mappings:
            "
            " - [replace_key]    Works in vizual mode and replaces the current
            "                    marked text by a replacement defined by you.
            "
               vnoremap [replace_key] <Nop>
               vmap <silent><leader>r [replace_key]

               vnoremap [replace_key] :call VisualSelection('replace')<CR>
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
            " This mapping help you with file navigation.             "
            "
            " Mappings:
            "
            " - [toggle_key]t  Opens split windows like a file manager or the
            "   undo history (fimfiler, undotreetoggle) 
            "
               nnoremap [toggle_key] <Nop>
               nmap <silent><leader>t  [toggle_key]

               nnoremap [toggle_key]e :<C-u>VimFiler -buffer-name=explorer -split -simple -winwidth=35 -toggle -no-quit<CR>
               nnoremap [toggle_key]u :<C-u>:GundoToggle<CR>
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
               " map p <Plug>(miniyank-autoput)
               " map P <Plug>(miniyank-autoPut)
               " map <leader>n <Plug>(miniyank-cycle)
               " map <leader>N <Plug>(miniyank-cycleback)
            " }}}

            " (f10) to show current highlight group {{{

               " Description:
               "
               " This mappings help to detect the highlight group under the
               " cursor.
               "
               " Mappings:
               "
                  noremap <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
                  \ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
                  \ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>
            "}}}

      "}}}

   "}}}

   " Plugin configuration {{{
   

   " (c)oc plugin {{{
   
      " Deskription:
      "
      " neoclide coc configuration
      " autocmd FileType python let b:coc_root_patterns = ['.git', '.env', 'venv']

      " Make <CR> auto-select the first completion item and notify coc.nvim to
      " format on enter, <cr> could be remapped by other vim plugin
      inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
   
   " }}}


   " (e)asymotion {{{
      let g:EasyMotion_smartcase = 1
      let g:EasyMotion_startofline = 0 " keep cursor colum when JK motion
      nmap s <Plug>(easymotion-s)
      " nmap S <Plug>(easymotion-s)
      " nmap t <Plug>(easymotion-bd-t)
      " nmap T <Plug>(easymotion-bd-T)
      " nmap f <Plug>(easymotion-f)
      " nmap F <Plug>(easymotion-F)

      omap s <Plug>(easymotion-s)
      " omap S <Plug>(easymotion-s)
      " omap t <Plug>(easymotion-bd-t)
      " omap T <Plug>(easymotion-bd-T)
      " omap f <Plug>(easymotion-f)
      " omap F <Plug>(easymotion-F)

      vmap s <Plug>(easymotion-s)
      " vmap S <Plug>(easymotion-s)
      " vmap t <Plug>(easymotion-bd-t)
      " vmap T <Plug>(easymotion-bd-T)
      " vmap f <Plug>(easymotion-f)
      " vmap F <Plug>(easymotion-F)

   " }}}

      " (f)ugitive {{{
         "workaround for fugitive to open the preview window correctly
         set previewheight=3
         au BufEnter ?* call PreviewHeightWorkAround()
         func PreviewHeightWorkAround()
            if &previewwindow
               exec 'wincmd K'
               exec 'setlocal winheight='.&previewheight
            endif
         endfunc
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

   " (p)lug package manager {{{
      let g:plug_window = 'botright new'
   " }}}

   " (r)ails plugin {{{
      " let g:rubycomplete_buffer_loading = 1
   " }}}

   " (r)plugin {{{
      let R_in_buffer = 1
      let R_applescript = 0
      let R_rconsole_width = 0
      let R_rconsole_height = 17
      let R_assign = 0
      let R_parenblock = 0
      let g:rout_follow_colorscheme=1
      " let R_user_maps_only = 1
   " }}}

   " (g)it automcompletion (github-issues) {{{
      let g:gissues_async_omni = 1
   " }}}

   " (g)undo (a nice undo tree) {{{
      nnoremap <Leader>u :GundoToggle<CR>
      let g:gundo_preview_bottom = 1
      let g:gundo_help = 0
   " }}}

   " (s)yntastic {{{
      let g:syntastic_stl_format = '[%E{Err: %fe #%e}%B{, }%W{Warn: %fw #%w}]'  
      " ignore as lacheck for latex files seems a bit buggy
      let g:syntastic_ignore_files = ['/*.*.cls$']  
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
      let g:yankring_clipboard_monitor = 0
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

      function! TwiddleCase(str)
         if a:str ==# toupper(a:str)
            let result = tolower(a:str)
         elseif a:str ==# tolower(a:str)
            let result = substitute(a:str,'\(\<\w\+\>\)', '\u\1', 'g')
         else
            let result = toupper(a:str)
         endif
         return result
      endfunction

      vnoremap ~ y:call setreg('', TwiddleCase(@"), getregtype(''))<CR>gv""Pgv

      " Act on visual selection with the next two functions
      " e.g. search forward, backward or search and replace
      function! CmdLine(str)
         exe "menu Foo.Bar :" . a:str
         emenu Foo.Bar
         unmenu Foo
      endfunction
      "

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

   "}}}

   " Autogroups {{{
      augroup xml_filetypes 
         autocmd!
         autocmd BufNewFile,BufRead *.eml set filetype=xml
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
         autocmd BufWrite *.xsd :call DeleteTrailingWS()
      augroup END

      augroup resize_buffer_windows
         autocmd!
         autocmd WinEnter * let &winheight = &lines * 7 / 10
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
   " }}} 
