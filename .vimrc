if $VIM_PLUGINS != 'NO'
  if filereadable(expand('~/.vimbundle'))
    source ~/.vimbundle
  endif
  runtime! ftplugin/man.vim
endif

syntax on
filetype plugin indent on

set visualbell

set wildmenu
set wildmode=list:longest,full

set splitright
set splitbelow

set hidden

set guifont=Monaco:h16
set guioptions-=T guioptions-=e guioptions-=L guioptions-=r
set shell=bash

augroup vimrc
  autocmd!
  autocmd GuiEnter * set columns=120 lines=70 number
augroup END

set encoding=utf-8

" split/join plugin: allow it work inside methods
let g:splitjoin_ruby_curly_braces = 0
let g:splitjoin_ruby_hanging_args = 0

" adds vertical indentation guides
let g:indentLine_char = '⡇'
let g:indentLine_color_term = 10

" Add comma as leader
:nmap , \

map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l
map j gj
map k gk

" vim tab navigation
nnoremap th :tabfirst<CR>
nnoremap tj :tabprev<CR>
nnoremap tk :tabnext<CR>
nnoremap tl :tablast<CR>
nnoremap tc :tabclose<CR>
nnoremap tn :tabnew<CR>

" disable arrow navigation keys
inoremap  <Up>    <NOP>
inoremap  <Down>  <NOP>
inoremap  <Left>  <NOP>
inoremap  <Right> <NOP>
noremap   <Up>    <NOP>
noremap   <Down>  <NOP>
noremap   <Left>  <NOP>
noremap   <Right> <NOP>

" show line numbers
set number

" Quick write, quit, write + quit, quit all
nnoremap <Leader>w :w<CR>
nnoremap <Leader>q :q<CR>
nnoremap <Leader>x :x<CR>
nnoremap <Leader>Q :q!<CR>

" format JSON with jq
nnoremap <Leader>j :%!cat % <bar> jq '.'<CR>

" syntax highlighting for .ejs and .hamlc
au BufNewFile,BufRead *.ejs set filetype=html
au BufNewFile,BufRead *.hamlc set filetype=html

" Better search behavior
set hlsearch
set incsearch
set ignorecase
set smartcase

" Unhighlight search results
map <Leader><space> :nohl<cr>

" Don't scroll off the edge of the page
set scrolloff=5

" This uses Ack.vim to search for the word under the cursor
nnoremap <leader><bs> :Ack! '\b<c-r><c-w>\b'<cr>
nnoremap <leader>a :Ack

" uses ag under the Ack hood
let g:ackprg = 'ag --vimgrep'

"
cnoreabbrev Ack Ack!

" NERDTree configuration
let g:NERDTreeNodeDelimiter="\u00a0"
let NERDTreeIgnore=['\~$', 'tmp', '\.git', '\.bundle', '.DS_Store', 'tags', '.swp']
let NERDTreeShowHidden=1
let g:NERDTreeDirArrows=0
map <Leader>n :NERDTreeToggle<CR>
map <Leader>fnt :NERDTreeFind<CR>

" BufExplorer
noremap <leader>bb :BufExplorer<CR>

" split windows
nnoremap <C-w>- :spl<cr>
nnoremap <C-w><bar> :vsp<cr>

set softtabstop=2 shiftwidth=2 expandtab

" uses system clipboard when copying; allows you to copy from vim and paste
" into another application or term tab/window.
set clipboard=unnamed

" vp doesn't replace paste buffer
function! RestoreRegister()
  let @" = s:restore_reg
  return ''
endfunction
function! s:Repl()
  let s:restore_reg = @"
  return "p@=RestoreRegister()\<cr>"
endfunction
vmap <silent> <expr> p <sid>Repl()

" toggle quickfix with <Leader> c
let g:toggle_list_no_mappings=1
nmap <script> <silent> <Leader>c :call ToggleQuickfixList()<CR>

" toggle cursor
let g:togglecursor_default = 'block'
let g:togglecursor_insert = 'line'
let g:togglecursor_leave = 'block'

" fastfold config"
let g:ruby_fold = 1
set foldnestmax=20
set foldlevel=20

" ctrlp.vim config

if get(g:, 'loaded_ctrlp', 1)
  let g:ctrlp_match_window_reversed = 0
  let g:ctrlp_working_path_mode = 'a'
  let g:ctrlp_max_height = 20
  let g:ctrlp_match_window_bottom = 0
  let g:ctrlp_switch_buffer = 0
  if executable('ag')
    let g:ctrlp_user_command = 'ag %s
          \ --path-to-ignore ~/.ignore
          \ --files-with-matches
          \ --nocolor
          \ --filename-pattern ""'
  endif
endif

command! -nargs=0 -bar Qargs execute 'args' QuickfixFilenames()
function! QuickfixFilenames()
  " Building a hash ensures we get each buffer only once
  let buffer_numbers = {}
  for quickfix_item in getqflist()
    let buffer_numbers[quickfix_item['bufnr']] = bufname(quickfix_item['bufnr'])
  endfor
  return join(map(values(buffer_numbers), 'fnameescape(v:val)'))
endfunction

" Disable vim backups
set nobackup
set nowritebackup

" Disable swapfile
set noswapfile

" Detects changes to files that are made outside of vim.
set autoread

augroup local
  autocmd FocusGained,BufEnter,CursorHold,CursorHoldI *
        \ if mode() !~ '\v(c|r.?|!|t)' && getcmdwintype() == '' | checktime | endif
  autocmd FileChangedShellPost *
        \ silent !echo "File changed on disk. Buffer reloaded."
augroup END


" airline
let g:airline_powerline_fonts=1
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_symbols.space = "\ua0"

set novisualbell
