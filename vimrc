" store swap files in one location
" set directory=~/.vim/swap,.
set noswapfile
set backup
set backupdir=~/.janus/backup
set directory=~/.janus/tmp
" set rnu " use relative numbering

" ---------------------------------------------------------------------------
" Core
" ---------------------------------------------------------------------------
" make searches case-sensitive only if they contain upper-case characters
set ignorecase smartcase

" ----------------------------------------------------------------------------
" COLOR
" ----------------------------------------------------------------------------
:set t_Co=256 " 256 colors
:set background=dark
:color grb256

" ----------------------------------------------------------------------------
"  Remapping
" ----------------------------------------------------------------------------
" Clear the search buffer when hitting return
function! MapCR()
  nnoremap <cr> :nohlsearch<cr>
endfunction
call MapCR()
" easy switch to last buffer
nnoremap <leader><leader> <c-^>
" let mapleader = 'g'

" alias leader in normal mode
let mapleader=","

map <F8> "+p
nmap <leader>q :q<CR>
nmap <leader>f /

" reflow paragraph with Q in normal and visual mode
nnoremap Q gqap
vnoremap Q gq

" sane movement with wrap turned on
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk
nnoremap <Down> gj
nnoremap <Up> gk
vnoremap <Down> gj
vnoremap <Up> gk
inoremap <Down> <C-o>gj
inoremap <Up> <C-o>gk

" remap window navigation
noremap <C-J> <C-W>j
noremap <C-K> <C-W>k
noremap <C-H> <C-W>h
noremap <C-L> <C-W>n

" close buffer
nnoremap <leader>dd :bd<CR>

" Quickly edit/reload the vimrc file
nmap <silent> <leader>evb :e $MYVIMRC.before<CR>
nmap <silent> <leader>eva :e $MYVIMRC.after<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

"align plugin mappings
vmap <silent> <Leader>i= <ESC>:'<,'>Align =<CR>
vmap <silent> <Leader>i\| <ESC>:'<,'>Align \|<CR>
vmap <silent> <Leader>i, <ESC>:'<,'>Align ,<CR>
vmap <silent> <Leader>i( <ESC>:'<,'>Align (<CR>
vmap <Leader>i <ESC>:'<,'>Align 

nmap <silent> <Leader>p :NERDTreeFind<CR>

"CtrlP mappings/config
let g:ctrlp_map = '<leader>o'
let g:ctrlp_match_window_reversed = 0 " show listings top down
let g:ctrlp_match_window_bottom = 0 " show at top
set wildignore+=*/tmp/*,*/bin/*

"make Y consistent with C and D
nnoremap Y y$

"key mapping for vimgrep result navigation
map <A-o> :copen<CR>
map <A-q> :cclose<CR>
map <A-j> :cnext<CR>
map <A-k> :cprevious<CR>

" remap ga to vim-rails alternate file command
nmap <leader>a :A<CR>
" nmap gr :R<CR>

" For local replace
nnoremap <F2> gd[{V%:s/<C-R>///gc<left><left><left>

" For global replace
nnoremap <leader>R gD:%s/<C-R>///gc<left><left><left>}

" ArgumentReWrap plugin
nnoremap <silent> <leader>a :call argumentrewrap#RewrapArguments()<CR>

" ---------------------------------------------------------------------------
" OPEN FILES IN DIRECTORY OF CURRENT FILE
" ---------------------------------------------------------------------------
cnoremap %% <C-R>=expand('%:h').'/'<cr>
map <leader>e :edit %%
map <leader>v :view %%

" ---------------------------------------------------------------------------
" RUNNING TESTS - thank you gary bernhardt
" ---------------------------------------------------------------------------
map <leader>t :call RunTestFile()<cr>
map <leader>T :call RunNearestTest()<cr>
map <leader>a :call RunTests('')<cr>
map <leader>c :w\|:!script/features<cr>
map <leader>w :w\|:!script/features --profile wip<cr>
function! RunTestFile(...)
  if a:0
    let command_suffix = a:1 
  else 
    let command_suffix = "" 
  endif 
  " Run the tests for the previously-marked file.
  let in_test_file = match(expand("%"), '\(.feature\|_spec.rb\)$') != -1
  if in_test_file
    call SetTestFile()
  elseif !exists("t:grb_test_file")
    return
  end
  call RunTests(t:grb_test_file . command_suffix)
endfunction

function! RunNearestTest()
  let spec_line_number = line('.')
  call RunTestFile(":" . spec_line_number . " -b")
endfunction

function! SetTestFile()
  " Set the spec file that tests will be run for.
  let t:grb_test_file=@%
endfunction

function! RunTests(filename)
  " Write the file and run tests for the given filename
  :w
  :silent !echo;echo;echo;echo;echo;echo;echo;echo;echo;echo
  :silent !echo;echo;echo;echo;echo;echo;echo;echo;echo;echo
  :silent !echo;echo;echo;echo;echo;echo;echo;echo;echo;echo
  :silent !echo;echo;echo;echo;echo;echo;echo;echo;echo;echo
  :silent !echo;echo;echo;echo;echo;echo;echo;echo;echo;echo
  :silent !echo;echo;echo;echo;echo;echo;echo;echo;echo;echo
  if match(a:filename, '\.feature$') != -1
    exec ":!script/features " . a:filename
  else
    if filereadable("script/test")
      exec ":!script/test " . a:filename
    elseif filereadable("Gemfile")
      exec ":!bundle exec rspec --color " . a:filename
    else
      exec ":!rspec --color " . a:filename
    end
  end
endfunction
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

map <leader>h              :call WinMove('h')<cr>
map <leader>k              :call WinMove('k')<cr>
map <leader>l              :call WinMove('l')<cr>
map <leader>j              :call WinMove('j')<cr>

" closing, rotating, and moving
map <leader>H              :wincmd H<cr>
map <leader>K              :wincmd K<cr>
map <leader>L              :wincmd L<cr>
map <leader>J              :wincmd J<cr>

" move load from right pinky and ring finger to index fingers
nmap <leader>w :w<CR>
" nmap 6 :
" imap 7 _
" nmap 8 "
" imap 8 "
" nmap * '
" imap * '
" imap jv {
" imap fn }
imap ` <BS>
" nmap <leader>r p

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

" disable vimwiki
call janus#disable_plugin('vimwiki')
call janus#disable_plugin('buffergator')

" ---------------------------------------------------------------------------
" White space management
" ---------------------------------------------------------------------------

function! StripWhitespace ()
    exec ':%s/ \+$//gc'
endfunction
nmap <leader>sw :call StripWhitespace ()<CR>

" ---------------------------------------------------------------------------
" Syntax highlighting
" ---------------------------------------------------------------------------
au BufRead,BufNewFile *.hamlc set ft=haml

" ----------------------------------------------------------------------------
" smart inserting
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

" ----------------------------------------------------------------------------
" NERDTree
" ----------------------------------------------------------------------------

let NERDTreeQuitOnOpen = 1

" ---------------------------------------------------------------------------
" NerdCommenter
" ---------------------------------------------------------------------------

let NERDSpaceDelims = 1

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
" add keystrokes to status line
set showcmd

" customize buffer gator
nnoremap <leader>u :BuffergatorToggle<CR>

" unmap janus included mapping to speed up open times. This was mapped to
" :nohls
unmap <leader>ul
nnoremap <leader>ee :nohlsearch<CR>

" overide built in ack mapping
unmap <leader>f
map <C-f> :Ack<space>

let g:EasyMotion_leader_key = '<Leader>'

" configure mapit
"
runtime macros/matchit.vim

" tired of hitting shift, remap symbols and numbers
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

" " swap () with []
" inoremap 9 [
" inoremap 0 ]
" inoremap [ (
" inoremap ] )

" pinky is getting really tired, map ; to : to save shifts
nnoremap ; :
vnoremap ; :
