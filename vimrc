set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'

" My Bundles here
" text objects
Bundle 'kana/vim-textobj-user'
Bundle 'kana/vim-textobj-line'
Bundle 'kana/vim-textobj-entire'
Bundle 'kana/vim-textobj-indent'
Bundle 'nelstrom/vim-textobj-rubyblock'
Bundle 'terryma/vim-expand-region'
Bundle 'camelcasemotion'

" plugins
Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
Bundle 'tpope/vim-rails.git'
Bundle 'tomtom/tcomment_vim.git'
Bundle 'kien/ctrlp.vim'
Bundle 'vim-scripts/bufkill.vim'
Bundle 'scrooloose/nerdtree.git'
Bundle 'Valloric/YouCompleteMe'

" integration
"   git
Bundle 'tpope/vim-fugitive'
Bundle 'airblade/vim-gitgutter'
"   testing
Bundle 'skalnik/vim-vroom'
"   screen + tmux
Bundle 'ervandew/screen'
"   search
Bundle 'mileszs/ack.vim'
Bundle 'rking/ag.vim'

" syntax
Bundle 'kchmck/vim-coffee-script'
Bundle 'vim-ruby/vim-ruby'
Bundle 'tpope/vim-haml.git'
" Bundle 'skammer/vim-css-color'

" training
Bundle 'kbarrette/mediummode'

" motions
Bundle 'goldfeld/vim-seek'
Bundle 'Lokaltog/vim-easymotion'

"  manipulators
Bundle 'AndrewRadev/switch.vim'
Bundle 'AndrewRadev/splitjoin.vim'
Bundle 'AndrewRadev/sideways.vim'
Bundle 'godlygeek/tabular'
Bundle 'tpope/vim-surround.git'

" auto manipulators
Bundle 'tpope/vim-endwise'

" themes
Bundle 'thedeeno/molokai'
" Bundle 'flazz/vim-colorschemes'
" Bundle 'altercation/vim-colors-solarized'


" vim-scripts repos

" non github repos
" Bundle 'git://git.wincent.com/command-t.git'

" ---------------------------------------------------------------------------
" Matchit (ruby-textobject support)
" ---------------------------------------------------------------------------
runtime macros/matchit.vim

nnoremap ,w W

" ---------------------------------------------------------------------------
" Ruby Path
" ---------------------------------------------------------------------------
" This is a work around for ftplugin/ruby.vim. If it doesn't know the ruby
" path it'll make a slow system call to look it up. Instead, let's just
" tell it where it is from the get go. This is literally 200x faster.
" test with: vim --startuptime /path/to/perf.log /path/to/ruby/file
"
" path to rbenv ruby
let g:ruby_path = system('echo $HOME/.rbenv/shims')

" ---------------------------------------------------------------------------
" Core
" ---------------------------------------------------------------------------

set relativenumber    " Show relative line numbers
set ruler             " Show line and column number
syntax enable         " Turn on syntax highlighting allowing local overrides
set encoding=utf-8    " Set default encoding to UTF-8

" store swap files in one location
" set directory=~/.vim/swap,.
set noswapfile
set backup
set backupdir=~/.vim/backup
set directory=~/.vim/tmp
" make searches case-sensitive only if they contain upper-case characters
set ignorecase smartcase
set hidden
" use relative numbering
" set rnu
" add keystrokes to status line
set showcmd
set nocursorline

" ----------------------------------------------------------------------------
" Status Line
" ----------------------------------------------------------------------------
if has("statusline") && !&cp
  set laststatus=2  " always show the status bar

  " Start the status line
  set statusline=%f\ %m\ %r
  set statusline+=%{fugitive#statusline()}
  set statusline+=\ Line:%l/%L[%p%%]
  set statusline+=\ Col:%v
  set statusline+=\ Buf:#%n
endif


" ----------------------------------------------------------------------------
" Search
" ----------------------------------------------------------------------------

set nohlsearch  " don't highlight matches
set incsearch   " incremental searching
set ignorecase  " searches are case insensitive...
set smartcase   " ... unless they contain at least one capital letter

" Clear the search buffer when hitting return
" nmap <cr> :nohlsearch<cr>

" ----------------------------------------------------------------------------
" Wild settings
" ----------------------------------------------------------------------------

" TODO: Investigate the precise meaning of these settings
" set wildmode=list:longest,list:full

" Disable output and VCS files
set wildignore+=*.o,*.out,*.obj,.git,*.rbc,*.rbo,*.class,.svn,*.gem

" Disable archive files
set wildignore+=*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz

" Ignore bundler and sass cache
set wildignore+=*/vendor/gems/*,*/vendor/cache/*,*/.bundle/*,*/.sass-cache/*

" Disable temp and backup files
set wildignore+=*.swp,*~,._*

" Ignore tmp dir
set wildignore+=*/tmp/*,*/servers/*

" ----------------------------------------------------------------------------
" File Types
" ----------------------------------------------------------------------------

" Some file types should wrap their text
function! s:setupWrapping()
" retrain write muscle memory
  set wrap
  set linebreak
  set textwidth=72
  set nolist
endfunction

" Turn on filetype plugins (:help filetype-plugin)
filetype plugin indent on

if has("autocmd")
  " In Makefiles, use real tabs, not tabs expanded to spaces
  au FileType make setlocal noexpandtab

  " Make sure all mardown files have the correct filetype set and setup wrapping
  au BufRead,BufNewFile *.{md,markdown,mdown,mkd,mkdn,txt} setf markdown | call s:setupWrapping()

  " Treat JSON files like JavaScript
  au BufNewFile,BufRead *.json set ft=javascript

  " make Python follow PEP8 for whitespace ( http://www.python.org/dev/peps/pep-0008/ )
  au FileType python setlocal softtabstop=4 tabstop=4 shiftwidth=4

  " Remember last location in file, but not for commit messages.
  " see :help last-position-jump
  au BufReadPost * if &filetype !~ '^git\c' && line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g`\"" | endif
endif

" ----------------------------------------------------------------------------
" Terminal Discovery
" ----------------------------------------------------------------------------
set t_Co=256
set term=screen-256color
set ttyfast

" ----------------------------------------------------------------------------
" COLOR
" ----------------------------------------------------------------------------
syntax enable
if has('gui_running')
  set background=light
else
  set background=dark
endif
colorscheme molokai
" :color grb256

" ----------------------------------------------------------------------------
" GUI options
" ----------------------------------------------------------------------------
if has('gui_running')
  " set guioptions-=T          " turn off tool bar in gvim/mvim
  set guioptions=agim        " work around text rendering bug (nerd tree causes text to disappear)
  " set guioptions-=m          " turn off menu bar in gvim/mvim
  set showtabline=0          " never show the tab bar

  " configure indent guides
  let g:indent_guides_start_level = 1
  let g:indent_guides_guide_size  = 2
  " let g:indent_guides_auto_colors = 0
  " autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=#222827 ctermbg=3
  " autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=#1E1D1B ctermbg=4
endif

" ----------------------------------------------------------------------------
"  Remapping
" ----------------------------------------------------------------------------
" make esc insta fire (I don't expect to use keycodes)
set ttimeoutlen=50

" ----------------------------------------------------------------------------
"  Mappings
" ----------------------------------------------------------------------------
" file name form command line
cnoremap <leader>fn <C-R>=expand("%")<CR>

" easy switch to last buffer
" nnoremap <leader><leader> <c-^>
" let mapleader = 'g'
nnoremap g6 ^
nnoremap g4 $

nnoremap <C-F> :%s/

" alias leader in normal mode
let mapleader=","

" The Smash Escape - also without cursor movement
inoremap jk <Esc>`^:w<CR>
inoremap kj <Esc>`^:w<CR>

nnoremap <leader>p "+p

" CR escape
" inoremap <CR> <ESC>`^
imap <expr> <CR> col('.') == col('$') ? '<CR><Plug>DiscretionaryEnd' : '<Esc>`^'
inoremap <C-CR> <CR>

cnoremap <silent>jk <CR>
cnoremap <silent>kj <CR>

" insert line below and above
nnoremap <c-j> mao<esc>`a
nnoremap <C-K> maO<ESC>`a

" search mappings
nnoremap <silent> <leader>s /
nnoremap <silent> <leader>S ?
nnoremap <silent> <leader>8 g*
nnoremap <silent> <leader>3 g#

" select all
nmap <C-a> ggVG

map <F8> "+p
nmap <leader>q :q<CR>

" nmap <leader>n :e.<CR>
nmap <leader>n :NERDTreeToggle<CR>

" overide built in ack mapping
map <C-f> :Ag<space>

" ctrl-P
nnoremap <silent> gu :CtrlPBuffer<CR>
nnoremap <silent> go :CtrlP<CR>
nnoremap <silent> gr :CtrlPMRU<CR>

" repeat last command almost like dot
nnoremap <silent> g. @:

" fugative
nnoremap gs :Gstatus<CR>
nnoremap gl :Gstatus<CR>
nnoremap gm :Gmove 

" reflow paragraph with Q in normal and visual mode
nnoremap Q gqap
vnoremap Q gq

" sane movement with wrap turned on
" nnoremap j gj
" nnoremap k gk
" vnoremap j gj
" vnoremap k gk

" close buffer
nnoremap <leader>dd :bd<CR>

" quickly edit/reload the vimrc file
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

" align plugin mappings
vmap <Leader>i <C-c>:'<,'>Align

" make Y consistent with C and D
nnoremap Y y$

" key mapping for vimgrep result navigation
map <A-o> :copen<CR>
map <A-q> :cclose<CR>
map <A-j> :cnext<CR>
map <A-k> :cprevious<CR>

" remap ga to vim-rails alternate file command
nmap <leader>a :A<CR>
nmap <leader>A gl:q<CR>gh:A<CR>
nmap <leader>ra :A<CR>
" nmap gr :R<CR>

" for local replace
nnoremap <F2> gd[{V%:s/<C-R>///gc<left><left><left>

" for global replace
nnoremap <leader>R gD:%s/<C-R>///gc<left><left><left>}

" ArgumentReWrap plugin
" nnoremap <silent> <leader>a :call argumentrewrap#RewrapArguments()<CR>

" map ; to : to save shifts
nnoremap ; :
vnoremap ; :

" write file easier
nmap <leader>w :write<CR>
nmap <CR> :write<CR>

nnoremap vv V
nnoremap g4 $
nnoremap g6 ^
" shift symbols
" nmap 6 :
" imap 7 _
" nmap 8 "
" imap 8 "
" nmap * '
" imap * '
" imap jv {
" imap fn }

" inoremap 1 !
" inoremap 2 @
" inoremap 3 #
" inoremap 4 $
" inoremap 5 %
" inoremap 6 ^
" inoremap 7 &
" inoremap 8 *
" inoremap 9 [
" inoremap 0 ]

" inoremap ! 1
" inoremap @ 2
" inoremap # 3
" inoremap $ 4
" inoremap % 5
" inoremap ^ 6
" inoremap & 7
" inoremap * 8
" inoremap ( 9
" inoremap ) 0
"


" ---------------------------------------------------------------------------
" Operator-mappings
" ---------------------------------------------------------------------------

" dot
" xnoremap <silent>.  f<SPACE>oT<SPACE>so
" xnoremap <silent>i. f<SPACE>oF<SPACE>so
" xnoremap <silent>a. t<SPACE>oT<SPACE>o
" 
" onoremap <silent>.  :<C-u>exec 'normal v' . v:count1 . '.'<CR>
" onoremap <silent>a. :<C-u>exec 'normal v' . v:count1 . 'a<SPACE>'<CR>
" onoremap <silent>i. :<C-u>exec 'normal v' . v:count1 . 'i<SPACE>'<CR>

" space
" xnoremap <silent>  f.oT.o
" xnoremap <silent>a. f.oF.o
" xnoremap <silent>i. t.oT.o
" 
" onoremap <silent>.  :<C-u>exec 'normal v' . v:count1 . '.'<CR>
" onoremap <silent>a. :<C-u>exec 'normal v' . v:count1 . 'a.'<CR>
" onoremap <silent>i. :<C-u>exec 'normal v' . v:count1 . 'i.'<CR>

" ---------------------------------------------------------------------------
" Whitespace 
" ---------------------------------------------------------------------------

set nowrap                        " don't wrap lines
set tabstop=2                     " a tab is two spaces
set shiftwidth=2                  " an autoindent (with <<) is two spaces
set expandtab                     " use spaces, not tabs
set list                          " Show invisible characters
set backspace=indent,eol,start    " backspace through everything in insert mode

if exists("g:enable_mvim_shift_arrow")
  let macvim_hig_shift_movement = 1 " mvim shift-arrow-keys
endif

" List chars
set listchars=""                  " Reset the listchars
set listchars=tab:\ \             " a tab should display as "  ", trailing whitespace as "."
set listchars+=trail:.            " show trailing spaces as dots
set listchars+=extends:>          " The character to show in the last column when wrap is
                                  " off and the line continues beyond the right of the screen
set listchars+=precedes:<         " The character to show in the last column when wrap is
                                  " off and the line continues beyond the right of the screen
function! StripWhitespace ()
    exec ':%s/ \+$//gc'
endfunction
nmap <leader><leader>st :call StripWhitespace ()<CR>

" ---------------------------------------------------------------------------
" OPEN FILES IN DIRECTORY OF CURRENT FILE
" ---------------------------------------------------------------------------
cnoremap %% <C-R>=expand('%:h').'/'<cr>
map <leader>e :edit %%
map <leader>v :view %%

" ---------------------------------------------------------------------------
" Window Management
" ---------------------------------------------------------------------------
" opening and switching
function! WinMove(key) 
  let t:curwin = winnr()
  exec "wincmd ".a:key
  if (t:curwin == winnr()) "we havent moved
    if (match(a:key,'[jk]')) "were we going up/down
      wincmd v
    else 
      wincmd s
    endif
    exec "wincmd ".a:key
  endif
endfunction

" window navigation
nnoremap gh :call WinMove('h')<cr>
nnoremap gl :call WinMove('l')<cr>
nnoremap gj :call WinMove('j')<cr>
nnoremap gk :call WinMove('k')<cr>

" closing, rotating, and moving
nnoremap gH              :wincmd H<cr>
nnoremap gK              :wincmd K<cr>
nnoremap gL              :wincmd L<cr>
nnoremap gJ              :wincmd J<cr>

" ---------------------------------------------------------------------------
" Syntax highlighting
" ---------------------------------------------------------------------------
au BufRead,BufNewFile *.hamlc set ft=haml

" Show syntax highlighting groups for word under cursor
" nmap <C-y> :call <SID>SynStack()<CR>
function! <SID>SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val,"name")')
endfunc

" ----------------------------------------------------------------------------
" Smart Inserting
" ----------------------------------------------------------------------------
set formatoptions-=o "dont continue comments when pushing o/O

"smart indent when entering insert mode with i on empty lines
function! IndentWithI()
    if len(getline('.')) == 0
        return "\"_ddO"
    else
        return "i"
    endif
endfunction
nnoremap <expr> i IndentWithI()

"jump to last cursor position when opening a file
"dont do it when writing a commit log entry
autocmd BufReadPost * call SetCursorPosition()
function! SetCursorPosition()
    if &filetype !~ 'commit\c'
        if line("'\"") > 0 && line("'\"") <= line("$")
            exe "normal! g`\""
            normal! zz
        endif
    end
endfunction

"define :HighlightLongLines command to highlight the offending parts of
"lines that are longer than the specified length (defaulting to 80)
command! -nargs=? HighlightLongLines call s:HighlightLongLines('<args>')
function! s:HighlightLongLines(width)
    let targetWidth = a:width != '' ? a:width : 79
    if targetWidth > 0
        exec 'match Todo /\%>' . (targetWidth) . 'v/'
    else
        echomsg "Usage: HighlightLongLines [natural number]"
    endif
endfunction

" ---------------------------------------------------------------------------
" Speed
" ---------------------------------------------------------------------------
" Turn off active error checking for slow-to-compile languages
"
" there may be a way to speed up the checking but this fix works and I care 
" more about fast buffer switching than syntax checking. 
" ---------------------------------------------------------------------------
let g:syntastic_mode_map = { 'mode': 'active',
                           \ 'active_filetypes': [],
                           \ 'passive_filetypes': ['haml', 'scss', 'sass'] }

" ---------------------------------------------------------------------------
" CSS
" ---------------------------------------------------------------------------
" alphabetize a css file
:command! SortCSSBraceContents :g#\({\n\)\@<=#.,/}/sort

" ---------------------------------------------------------------------------
" Vroom config
" ---------------------------------------------------------------------------
let g:vroom_map_keys = 0
let g:vroom_cucumber_path = "cucumber"
let g:vroom_use_bundle_exec = 0
let g:vroom_spec_command = "rspec"

map <Leader>t :VroomRunTestFile<CR>
" focus
map <Leader>f :VroomRunNearestTest<CR>
map <F7> :VroomRunNearestTest<CR>

" ----------------------------------------------------------------------------
" auto commands
" ----------------------------------------------------------------------------
" automatically reload vimrc when it's saved
" au BufWritePost .vimrc so ~/.vimrc

" ----------------------------------------------------------------------------
" under persistence
" ----------------------------------------------------------------------------
if exists("+undofile")
  " undofile - This allows you to use usdos after exiting and restarting
  " This, like swap and backups, uses .vim-undo first, then ~/.vim/undo
  " :help undo-persistence
  " This is only present in 7.3+
  if isdirectory($HOME . '/.vim/undo') == 0
    :silent !mkdir -p ~/.vim/undo > /dev/null 2>&1
  endif
  set undodir=./.vim-undo//
  set undodir+=~/.vim/undo//
  set undofile
endif

" ----------------------------------------------------------------------------
" easymotion
" ----------------------------------------------------------------------------
let g:EasyMotion_leader_key = '<space>'
let g:EasyMotion_keys = 'abcdefghijklmnopqrstuvwxyz'

" ----------------------------------------------------------------------------
" scrolling at edges
" ----------------------------------------------------------------------------
set scrolloff=8      " Number of lines from vertical edge to start scrolling
set sidescrolloff=15 " Number of cols from horizontal edge to start scrolling
set sidescroll=1     " Number of cols to scroll at a time

" ----------------------------------------------------------------------------
" tabular helpers
" ----------------------------------------------------------------------------

inoremap <silent> <Bar>   <Bar><Esc>:call <SID>align()<CR>a

function! s:align()
  let p = '^\s*|\s.*\s|\s*$'
  if exists(':Tabularize') && getline('.') =~# '^\s*|' && (getline(line('.')-1) =~# p || getline(line('.')+1) =~# p)
    let column = strlen(substitute(getline('.')[0:col('.')],'[^|]','','g'))
    let position = strlen(matchstr(getline('.')[0:col('.')],'.*|\s*\zs.*'))
    Tabularize/|/l1
    normal! 0
    call search(repeat('[^|]*|',column).'\s\{-\}'.repeat('.',position),'ce',line('.'))
  endif
endfunction

" Show syntax highlighting groups for word under cursor
nmap <leader><leader>z :so $VIMRUNTIME/syntax/hitest.vim

" ---------------------------------------------------------------------------
" Retraining
" ---------------------------------------------------------------------------
" put all the nopes here until you're retrained

" retraining for smash escape
" inoremap <esc> <nop>
" cnoremap <esc> <nop>

" ---------------------------------------------------------------------------
" Switch
" ---------------------------------------------------------------------------
nnoremap - :Switch<CR>
let g:switch_custom_definitions =
    \ [
    \   { '\(\k\+\)(&:\(\S\+\))': '\1 { |x| x\.\2 }' },
    \   { '\(\k\+\)\s\={ |\(\k\+\)| \2.\(\S\+\) }': '\1(&:\3)' },
    \ ]

" ---------------------------------------------------------------------------
" SplitJoin
" ---------------------------------------------------------------------------
let g:splitjoin_split_mapping = '<leader>j'
let g:splitjoin_join_mapping = '<leader>k'

" ---------------------------------------------------------------------------
" Helpers
" ---------------------------------------------------------------------------
nnoremap ,ds :?.?+1,/./-1join!<CR>

" ---------------------------------------------------------------------------
" Fugative Helpers
" ---------------------------------------------------------------------------
function! CloseDiff()
  if (&diff == 0 || getbufvar('#', '&diff') == 0)
        \ && (bufname('%') !~ '^fugitive:' && bufname('#') !~ '^fugitive:')
    echom "Not in diff view."
    return
  endif

  " close current buffer if alternate is not fugitive but current one is
  if bufname('#') !~ '^fugitive:' && bufname('%') =~ '^fugitive:'
    if bufwinnr("#") == -1
      b #
      bd #
    else
      bd
    endif
  else
    bd #
  endif
endfunction
nnoremap <Leader>gD :call CloseDiff()<cr>

" ---------------------------------------------------------------------------
" Sideways mappings
" ---------------------------------------------------------------------------
nnoremap <C-l> :SidewaysRight<CR>
nnoremap <C-h> :SidewaysLeft<CR>

" ---------------------------------------------------------------------------
" Smooth Srolling
" ---------------------------------------------------------------------------
function! SmoothScroll(up)
    if a:up
        " let scrollaction="3"
        let scrollaction="4k"
    else
        " let scrollaction="3"
        let scrollaction="4j"
    endif
    exec "normal " . scrollaction
    redraw
    let counter=1
    while counter<&scroll/4
        let counter+=1
        sleep 6m
        redraw
        exec "normal " . scrollaction
        exec "normal zz"
    endwhile
endfunction

nnoremap K :call SmoothScroll(1)<Enter>
nnoremap J :call SmoothScroll(0)<Enter>

" ---------------------------------------------------------------------------
" Screen Settings
" ---------------------------------------------------------------------------
let g:ScreenImpl = 'Tmux'
let g:ScreenShellTmuxInitArgs = '-2'
let g:ScreenShellInitialFocus = 'shell'
let g:ScreenShellQuitOnVimExit = 0
map <F10> :ScreenShellVertical<CR>
command -nargs=? -complete=shellcmd W  :w | :call ScreenShellSend("load '".@%."';")
map <Leader>rf :w<CR> :call ScreenShellSend("rspec ".@% . ':' . line('.'))<CR>
map <Leader>ef :w<CR> :call ScreenShellSend("cucumber --format=pretty ".@% . ':' . line('.'))<CR>
map <Leader>b :w<CR> :call ScreenShellSend("break ".@% . ':' . line('.'))<CR>
