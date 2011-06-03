" .vimrc
" Author: Steve Losh <steve@stevelosh.com>
" Source: http://bitbucket.org/sjl/dotfiles/src/tip/vim/
"
" This file changes a lot.  I'll try to document pieces of it whenever I have
" a few minutes to kill.

" Preamble -------------------------------------------------------------------- {{{

filetype off
call pathogen#runtime_append_all_bundles()
filetype plugin indent on
set nocompatible

" }}}
" Basic options --------------------------------------------------------------- {{{

set encoding=utf-8
set modelines=0
set scrolloff=3
set autoindent
set showmode
set showcmd
set hidden
set wildmenu
set wildmode=list:longest
set visualbell
set cursorline
set ttyfast
set ruler
set backspace=indent,eol,start
" set nonumber
set number

set norelativenumber
set laststatus=2
set history=1000
set undofile
set undoreload=10000
set cpoptions+=J
set list
set listchars=tab:▸\ ,eol:¬
set shell=/bin/bash
set lazyredraw
set wildignore+=*.pyc,.hg,.git
set matchtime=3
set showbreak=↪

" Save when losing focus
" au FocusLost * :wa
au FocusLost silent! :wa
"

" Tabs, spaces, wrapping {{{

set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set nowrap
set textwidth=100
set formatoptions=qrn1
set colorcolumn=+1

" }}}
" Status line {{{


set statusline=[%n]\ %<%.99f\ %h%w%m%r%y\ %{fugitive#statusline()}%{exists('*CapsLockStatusline')?CapsLockStatusline():''}%=%-16(\ %l,%c-%v\ %)%P
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_enable_signs=1




let g:syntastic_enable_signs=1


" }}}
" Backups {{{
set undodir=~/.vim/tmp/undo//     " undo files
set backupdir=~/.vim/tmp/backup// " backups
set directory=~/.vim/tmp/swap//   " swap files
set backup                        " enable backups
" }}}
" Leader {{{
let mapleader = ";"
let maplocalleader = "\\"
" }}}
" Color scheme {{{

syntax on
set background=dark
" colorscheme molokai
colorscheme wombat
" set background=dark
" colorscheme solarized

" my
set numberwidth=5
set cursorline
hi CursorLine cterm=NONE ctermbg=black
" }}}

" }}}
" Useful abbreviations -------------------------------------------------------- {{{

" iabbrev ldis ಠ_ಠ
" iabbrev sl/ http://stevelosh.com/
" iabbrev bb/ http://bitbucket.org/
" iabbrev bbs/ http://bitbucket.org/sjl/
" iabbrev sl@ steve@stevelosh.com
"
" }}}
" Searching and movement ------------------------------------------------------ {{{

" Use sane regexes.
nnoremap / /\v
vnoremap / /\v

set ignorecase
set smartcase

set incsearch
set showmatch
set hlsearch

set gdefault

map <leader><space> :noh<cr>

runtime macros/matchit.vim " Load the matchit plugin.
map <tab> %

nnoremap Y y$
nnoremap D d$

" Keep search matches in the middle of the window.
nnoremap * *zz
nnoremap ? ?zz
nnoremap n nzz
nnoremap N Nzz

" L is easier to type, and I never use the default behavior.
noremap L $

" Error navigation {{{
"
"             Location List     QuickFix Window
"            (i.e. Syntastic)     (i.e. Ack)
"            ----------------------------------
" Next      |     M-k               M-Down     |
" Previous  |     M-l                M-Up      |
"            ----------------------------------
"
nnoremap ˚ :lnext<cr>
nnoremap ¬ :lprevious<cr>
inoremap ˚ <esc>:lnext<cr>
inoremap ¬ <esc>:lprevious<cr>
nnoremap <m-Down> :cnext<cr>
nnoremap <m-Up> :cprevious<cr>
" }}}

" Directional Keys {{{

" Why stretch?
noremap h ;
noremap j h
noremap k gj
noremap l gk
noremap ; l

" Easy buffer navigation
" Note: For this section to make any sense you need to remap Ctrl-; to Ctrl-g at
"       the KEYBOARD level.  The reason is that for some reason the OS X doesn't
"       recognize the Ctrl+; combination as something special, so it just passes it
"       to Vim as a semicolon.
"
"       Yeah, it's dumb.
noremap <C-j>  <C-w>h
noremap <C-k>  <C-w>j
noremap <C-l>  <C-w>k
noremap <C-g>  <C-w>l
noremap <leader>w <C-w>v<C-w>l

" }}}

" }}}
" Folding --------------------------------------------------------------------- {{{

set foldlevelstart=0

" Space to toggle folds.
nnoremap <Space> za
vnoremap <Space> za

" Make zO recursively open whatever top level fold we're in, no matter where the
" cursor happens to be.
nnoremap zO zCzO

function! MyFoldText() " {{{
  let line = getline(v:foldstart)

  let nucolwidth = &fdc + &number * &numberwidth
  let windowwidth = winwidth(0) - nucolwidth - 3
  let foldedlinecount = v:foldend - v:foldstart

  " expand tabs into spaces
  let onetab = strpart('          ', 0, &tabstop)
  let line = substitute(line, '\t', onetab, 'g')

  let line = strpart(line, 0, windowwidth - 2 -len(foldedlinecount))
  let fillcharcount = windowwidth - len(line) - len(foldedlinecount)
  return line . '…' . repeat(" ",fillcharcount) . foldedlinecount . '…' . ' '
endfunction " }}}
set foldtext=MyFoldText()

" }}}
" Destroy infuriating keys ---------------------------------------------------- {{{

" Fuck you, help key.
set fuoptions=maxvert,maxhorz
noremap <F1> :set invfullscreen<CR>
inoremap <F1> <ESC>:set invfullscreen<CR>a

" Fuck you too, manual key.
nnoremap K <nop>

" Stop it, hash key.
inoremap # X<BS>#

" }}}
" FILE Specific --------------------------------------------------------------- {{{
" CSS and SASS {{{


au BufNewFile,BufRead *.sass setlocal filetype=sass
au BufNewFile,BufRead *.css  setlocal foldmethod=marker

au BufNewFile,BufRead *.css  setlocal foldmarker={,}

" Use cc to change lines without borking the indentation.
au BufNewFile,BufRead *.css  nnoremap <buffer> cc ddko
au BufNewFile,BufRead *.less nnoremap <buffer> cc ddko

" Use <leader>S to sort properties.  Turns this:
"
"     p {
"         width: 200px;
"         height: 100px;
"         background: red;
"
"         ...
"     }
"
" into this:

"     p {
"         background: red;
"         height: 100px;
"         width: 200px;
"
"         ...
"     }
"
au BufNewFile,BufRead *.css  nnoremap <buffer> <localleader>S ?{<CR>jV/\v^\s*\}?$<CR>k:sort<CR>:noh<CR>
au BufNewFile,BufRead *.sass nnoremap <buffer> <localleader>S ?{<CR>jV/\v^\s*\}?$<CR>k:sort<CR>:noh<CR>

" Make {<cr> insert a pair of brackets in such a way that the cursor is correctly
" positioned inside of them AND the following code doesn't get unfolded.
au BufNewFile,BufRead *.css  inoremap <buffer> {<cr> {}<left><cr>.<cr><esc>kA<bs><space><space><space><space>

" }}}
" Javascript {{{

au FileType javascript setlocal foldmethod=marker
au FileType javascript setlocal foldmarker={,}
" }}}
" Markdown {{{
au BufNewFile,BufRead *.m*down setlocal filetype=markdown

" Use <localleader>1/2/3 to add headings.
au Filetype markdown nnoremap <buffer> <localleader>1 yypVr=
au Filetype markdown nnoremap <buffer> <localleader>2 yypVr-
au Filetype markdown nnoremap <buffer> <localleader>3 I### <ESC>

" }}}
" Vim {{{

au FileType vim setlocal foldmethod=marker
au FileType help setlocal textwidth=78

" }}}
" Python {{{

au Filetype python noremap  <localleader>rr :RopeRename<CR>
au Filetype python vnoremap <localleader>rm :RopeExtractMethod<CR>
au Filetype python noremap  <localleader>ri :RopeOrganizeImports<CR>


" }}}
" Nginx {{{

au BufRead,BufNewFile /etc/nginx/conf/*                      set ft=nginx
au BufRead,BufNewFile /etc/nginx/sites-available/*           set ft=nginx
au BufRead,BufNewFile /usr/local/etc/nginx/sites-available/* set ft=nginx
" }}}
" }}}
" Convenience mappings -------------------------------------------------------- {{{

" Clean whitespace
map <leader>W :%s/\s\+$//<cr>:let @/=''<CR>

" Ack
map <leader>a :Ack

" Yankring
nnoremap <silent> <F6> :YRShow<cr>

" Formatting, TextMate-style
nnoremap <leader>q gqip

" Easier linewise reselection
nnoremap <leader>v V`]

" HTML tag closing
inoremap <C-_> <Space><BS><Esc>:call InsertCloseTag()<cr>a

" Faster Esc
inoremap jk <ESC>

" Marks and Quotes
noremap ' `
noremap æ '
noremap ` <C-^>

" Scratch
nmap <leader><tab> :Sscratch<cr><C-W>x<C-j>:resize 15<cr>

" Better Completion
set completeopt=longest,menuone
" inoremap <expr> <CR>  pumvisible() ? "\\<C-y>" : "\\<C-g>u\\<CR>"
" inoremap <expr> <C-p> pumvisible() ? '<C-n>'  : '<C-n><C-r>=pumvisible() ? "\\<lt>up>" : ""<CR>'
" inoremap <expr> <C-n> pumvisible() ? '<C-n>'  : '<C-n><C-r>=pumvisible() ? "\\<lt>Down>" : ""<CR>'

" Make selecting inside an HTML tag less dumb
nnoremap Vit vitVkoj
nnoremap Vat vatV

" Rainbows!
nmap <leader>R :RainbowParenthesesToggle<CR>

" Edit vim stuff
nnoremap <leader>ev <C-w>s<C-w>j<C-w>L:e $MYVIMRC<cr>
nnoremap <leader>es <C-w>s<C-w>j<C-w>L:e ~/.vim/snippets/<cr>

" Sudo to write
cmap w!! w !sudo tee % >/dev/null

" Easy filetype switching
nnoremap _hr :set ft=ruby<CR>
nnoremap _hra :set ft=rails<CR>
nnoremap _hjs :set ft=javascript<CR>
nnoremap _d  :set ft=diff<CR>
nnoremap _a  :AnsiEsc<CR>

" Toggle paste
set pastetoggle=<F8>

" I can't type
cmap W w
cmap Wa wa
cmap WA wa
cmap Wq wq

" }}}
" Plugin settings ------------------------------------------------------------- {{{

" NERD Tree {{{

map <F2> :NERDTreeToggle<cr>
let NERDTreeIgnore=['.vim$', '\~$', '.*\.pyc$', 'pip-log\.txt$', 'whoosh_index', 'xapian_index', '.*.pid', 'monitor.py', '.*-fixtures-.*.json', '.*\.o']

" }}}
" HTML5 {{{

let g:event_handler_attributes_complete = 0
let g:rdfa_attributes_complete = 0
let g:microdata_attributes_complete = 0
let g:atia_attributes_complete = 0

" }}}
" Rope {{{

" let ropevim_enable_shortcuts = 0
" let ropevim_guess_project = 1
" let ropevim_global_prefix = '<C-c>p'
"
" source $HOME/.vim/sadness/sadness.vim

" }}}
" Gundo {{{

nnoremap <F5> :GundoToggle<CR>
let g:gundo_debug = 1
let g:gundo_preview_bottom = 1

" }}}
" Syntastic {{{

let g:syntastic_enable_signs=1
let g:syntastic_disabled_filetypes = ['html', 'python']

" }}}
" Command-T {{{
"
" let g:CommandTMaxHeight = 20
"


" }}}

" }}}
" Text objects ---------------------------------------------------------------- {{{

" Shortcut for [] {{{

onoremap id i[
onoremap ad a[
vnoremap id i[
vnoremap ad a[

" }}}
" Next () {{{
vnoremap <silent> inb :<C-U>normal! f(vib<cr>
onoremap <silent> inb :<C-U>normal! f(vib<cr>
vnoremap <silent> anb :<C-U>normal! f(vab<cr>
onoremap <silent> anb :<C-U>normal! f(vab<cr>
vnoremap <silent> in( :<C-U>normal! f(vi(<cr>
onoremap <silent> in( :<C-U>normal! f(vi(<cr>
" vnoremap <silent> an( :<C-U>normal! f(va(<cr>
onoremap <silent> an( :<C-U>normal! f(va(<cr>
" }}}
" Next {} {{{
vnoremap <silent> inB :<C-U>normal! f{viB<cr>
onoremap <silent> inB :<C-U>normal! f{viB<cr>
vnoremap <silent> anB :<C-U>normal! f{vaB<cr>
onoremap <silent> anB :<C-U>normal! f{vaB<cr>
vnoremap <silent> in{ :<C-U>normal! f{vi{<cr>
onoremap <silent> in{ :<C-U>normal! f{vi{<cr>
vnoremap <silent> an{ :<C-U>normal! f{va{<cr>
onoremap <silent> an{ :<C-U>normal! f{va{<cr>
" }}}
" Next [] {{{
vnoremap <silent> ind :<C-U>normal! f[vi[<cr>
onoremap <silent> ind :<C-U>normal! f[vi[<cr>
vnoremap <silent> and :<C-U>normal! f[va[<cr>
onoremap <silent> and :<C-U>normal! f[va[<cr>
vnoremap <silent> in[ :<C-U>normal! f[vi[<cr>
onoremap <silent> in[ :<C-U>normal! f[vi[<cr>
vnoremap <silent> an[ :<C-U>normal! f[va[<cr>
onoremap <silent> an[ :<C-U>normal! f[va[<cr>
" }}}
" Next <> {{{
vnoremap <silent> in< :<C-U>normal! f<vi<<cr>
onoremap <silent> in< :<C-U>normal! f<vi<<cr>
vnoremap <silent> an< :<C-U>normal! f<va<<cr>
onoremap <silent> an< :<C-U>normal! f<va<<cr>
" }}}
" Next '' {{{
vnoremap <silent> in' :<C-U>normal! f'vi'<cr>
onoremap <silent> in' :<C-U>normal! f'vi'<cr>
vnoremap <silent> an' :<C-U>normal! f'va'<cr>
onoremap <silent> an' :<C-U>normal! f'va'<cr>
" }}}
" Next "" {{{
vnoremap <silent> in" :<C-U>normal! f"vi"<cr>
onoremap <silent> in" :<C-U>normal! f"vi"<cr>
vnoremap <silent> an" :<C-U>normal! f"va"<cr>
onoremap <silent> an" :<C-U>normal! f"va"<cr>
" }}}

" }}}
" Quickreturn ----------------------------------------------------------------- {{{

inoremap <c-cr> <esc>A<cr>
inoremap <s-cr> <esc>A:<cr>

" }}}
" Error toggles --------------------------------------------------------------- {{{

command! ErrorsToggle call ErrorsToggle()
function! ErrorsToggle() " {{{
  if exists("w:is_error_window")
    unlet w:is_error_window
    exec "q"
  else
    exec "Errors"
    lopen
    let w:is_error_window = 1
  endif
endfunction " }}}

command! -bang -nargs=? QFixToggle call QFixToggle(<bang>0)
function! QFixToggle(forced) " {{{
  if exists("g:qfix_win") && a:forced == 0
    cclose
    unlet g:qfix_win
  else
    copen 10
    let g:qfix_win = bufnr("$")
  endif
endfunction " }}}

nmap <silent> <f3> :ErrorsToggle<cr>
nmap <silent> <f4> :QFixToggle<cr>

" }}}
" Open quoted ----------------------------------------------------------------- {{{

nnoremap <silent> ø :OpenQuoted<cr>
command! OpenQuoted call OpenQuoted()

" Open the file in the current (or next) set of quotes.
function! OpenQuoted() " {{{
  let @r = ''

  exe 'normal! vi' . "'" . '"ry'

  if len(@r) == 0
    exe 'normal! i' . '"' . '"ry'
  endif

  if len(@r) == 0
    exe 'normal! "ry'
    let @r = ''
  endif

  exe "silent !open ." . @r
endfunction " }}}

" }}}
" Ctags ----------------------------------------------------------------------- {{{

map <leader>T :!/usr/local/bin/ctags -R . $(test -f .venv && echo ~/lib/virtualenvs/`cat .venv`)<CR>

" }}}
" MacVim ---------------------------------------------------------------------- {{{

if has('gui_running')
  set guifont=Menlo:h12
  " Remove all the UI cruft
  set go-=T
  set go-=l
  set go-=L
  set go-=r
  set go-=R

  " PeepOpen
  " if has("gui_macvim")
  "     macmenu &File.New\\ Tab key=<nop>
  "     map <leader><leader> <Plug>PeepOpen
  " end

  highlight SpellBad term=underline gui=undercurl guisp=Orange

  " Use a line-drawing char for pretty vertical splits.
  set fillchars=vert:│

  " Different cursors for different modes.
  set guicursor=n-c:block-Cursor-blinkon0
  set guicursor+=v:block-vCursor-blinkon0
  " set guicursor+=i-ci:ver20-iCursor





  set encoding=utf-8
  set antialias                     " MacVim: smooth fonts.
  set bg=dark
  set fuopt+=maxhorz
endif



" }}}
" Extending  --------------------------------------- ---------------------------{{{
nnoremap <leader>w <C-w>v<C-w>l

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l


map <D-R> :JSLintLight<CR>
map <C-D-r> :JSLint<CR>
map <leader>e '.
map <D-E> :NERDTreeToggle<CR>
map <Leader>; :FuzzyFinderTextMate<cr>

map <Leader>cc :! nanoc3 compile<cr>

iab lorem Lorem ipsum dolor sit amet, consectetur adipiscing elit
iab llorem Lorem ipsum dolor sit amet, consectetur adipiscing elit.  Etiam lacus ligula, accumsan id imperdiet rhoncus, dapibus vitae arcu.  Nulla non quam erat, luctus consequat nisi
iab lllorem Lorem ipsum dolor sit amet, consectetur adipiscing elit.  Etiam lacus ligula, accumsan id imperdiet rhoncus, dapibus vitae arcu.  Nulla non quam erat, luctus consequat nisi.  Integer hendrerit lacus sagittis erat fermentum tincidunt.  Cras vel dui neque.  In sagittis commodo luctus.  Mauris non metus dolor, ut suscipit dui.  Aliquam mauris lacus, laoreet et consequat quis, bibendum id ipsum.  Donec gravida, diam id imperdiet cursus, nunc nisl bibendum sapien, eget tempor neque elit in tortor
iab css console.log("-------------------------   -----------------------");
iab cs console.log();
" Common abbreviations / misspellings {{{
source /Users/anselmo/.vim/bundle/vim-autocorrect/autocorrect.vim
" }}}

autocmd FileType css  setlocal foldmethod=syntax shiftwidth=2 tabstop=2
autocmd FileType javascript setlocal foldmethod=syntax shiftwidth=2 tabstop=2

" if has("autocmd")
"   autocmd bufwritepost .vimrc source $MYVIMRC
" endif

" highlight Cursor guifg=white guibg=black
highlight iCursor guifg=white guibg=steelblue
" set guicursor=n-v-c:block-Cursor
set guicursor+=i:ver100-iCursor
" set guicursor+=n-v-c:blinkon0
set guicursor+=i:blinkwait10


" For the MakeGreen plugin and Ruby RSpec. Uncomment to use.
autocmd BufNewFile,BufRead *_spec.rb compiler rspec

autocmd BufWritePost,FileWritePost *.coffee :silent !coffee --no-wrap -c <afile>
" autocmd BufWritePost,FileWritePost *.coffee :silent !coffee -c <afile>


"Projects Specific ----------------------------------------------------- {{{
"
"
nmap <silent> <leader>c :cd %:p:h<cr>
nmap <silent> <leader>ru :!ruby % <cr>
nmap <silent> <leader>nn :!nanoc compile <cr>
nmap <leader>aa :!ruby maker.rb  <cr>
"
"
iab vtt _this_=this;
"}}}














"}}}
