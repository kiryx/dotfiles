execute pathogen#infect()
set nocompatible "Turn the vi compatibility off
set bs=2
set number "Enable line numbering
"set paste "Fixes the pasting from system clipboard
set ic "Ignore-case when searching
"set copyindent
set cpoptions+=$ "Display dollar sign when changing
"set viminfo+=% "zapisywanie buforow po zamknieciu
"set gcr=i:block "ustawia kursor w insert na blok
set go-=m "wylacza menu
set go-=T "wylacza pasek narzedzi
set background=dark
"colorscheme slate "slate kolorystyka 
"colorscheme solarized
colorscheme solarized
set autoindent "auto wciecia
set showmatch
set smarttab
set smartcase
set hlsearch
set incsearch
map <CR> o<Esc>k
map <F9> <Esc>:w<CR>:!make<CR><CR>
set noswapfile
set nobackup
nmap <leader>d :buffers<CR>:buffer<Space>
call togglebg#map("<F5>")
map <S-CR> O<Esc>j

""" j and k will not jump over the line breaks
nmap j gj
nmap k gk

""" Jump between the buffers
nmap <C-n> :bnext<CR>
nmap <C-p> :bprev<CR>

""" Moving text using ctrl
"" Normal mode
"nnoremap <C-j> :m .+1<CR>==
"nnoremap <C-k> :m .-2<CR>==
"
"" Insert mode
"inoremap <C-j> <ESC>:m .+1<CR>==gi
"inoremap <C-k> <ESC>:m .-2<CR>==gi
"
"" Visual mode
"vnoremap <C-j> :m '>+1<CR>gv=gv
"vnoremap <C-k> :m '<-2<CR>gv=gv

"numery przy tabach
set showtabline=1 " always show tabs in gvim, but not vim
" set up tab labels with tab number, buffer name, number of windows
function! GuiTabLabel()
  let label = ''
  let bufnrlist = tabpagebuflist(v:lnum)
  " Add '+' if one of the buffers in the tab page is modified
  for bufnr in bufnrlist
    if getbufvar(bufnr, "&modified")
      let label = '+'
      break
    endif
  endfor
  " Append the tab number
  let label .= v:lnum.': '
  " Append the buffer name
  let name = bufname(bufnrlist[tabpagewinnr(v:lnum) - 1])
  if name == ''
    " give a name to no-name documents
    if &buftype=='quickfix'
      let name = '[Quickfix List]'
    else
      let name = '[No Name]'
    endif
  else
    " get only the file name
    let name = fnamemodify(name,":t")
  endif
  let label .= name
  " Append the number of windows in the tab page
  let wincount = tabpagewinnr(v:lnum, '$')
  return label . '  [' . wincount . ']'
endfunction
set guitablabel=%{GuiTabLabel()}
"numery przy tabach

" Przelaczanie tabow jak w terminalu Alt-numer
map <A-1> 1gt
map <A-2> 2gt
map <A-3> 3gt
map <A-4> 4gt
map <A-5> 5gt
map <A-6> 6gt
map <A-7> 7gt
map <A-8> 8gt
map <A-9> 9gt
map <A-0> 10gt

imap <A-1> 1gt
imap <A-2> 2gt
imap <A-3> 3gt
imap <A-4> 4gt
imap <A-5> 5gt
imap <A-6> 6gt
imap <A-7> 7gt
imap <A-8> 8gt
imap <A-9> 9gt
imap <A-0> 10gt

let mapleader = " "

""" Displaying special characters (tabs, eol):
"" \e turns switches the displaing on/off
nmap <leader>r :set list!<CR>
"" List of chars definition
set listchars=tab:»·,trail:▸,eol:¬
"" Turns off displaying at the start
set nolist

""" Przełączanie się pomiędzy wcięciami w kodize (tabem)
" expandtab - zamiana tab na spacje
" tabstop - ile spacji to tabulator
nmap <leader>t :set noexpandtab tabstop=4 shiftwidth=4 softtabstop=4<CR>
nmap <leader>T :set noexpandtab tabstop=8 shiftwidth=8 softtabstop=4<CR>
nmap <leader>m :set expandtab tabstop=4 shiftwidth=4 softtabstop=4<CR>
"set expandtab tabstop=4 shiftwidth=4 softtabstop=4 " Domyslna konfiguracja
set noexpandtab tabstop=4 shiftwidth=4 softtabstop=4
nmap <leader>M :set expandtab tabstop=2 shiftwidth=2 softtabstop=2<CR>

nmap <leader>w :w<CR>
nmap <leader>e :e.<CR>

nnoremap <Space> za

"nmap \o :set paste!<CR>
set guifont=Monospace\ 8

"SPLITS NAVIGATION CTRL-HJKL instead CTRL-W HJKL
nnoremap <C-j> <C-w>+
nnoremap <C-k> <C-w>-
nnoremap <C-l> <C-w>>
nnoremap <C-h> <C-w><
nnoremap <S-H> gT
nnoremap <S-L> gt

" Move current tab to left with Shift-Alt-H
nnoremap <silent> <S-A-H> :execute 'silent! tabmove ' . (tabpagenr()-2)<CR>
" Move current tab to right with Shift-Alt-L
nnoremap <silent> <S-A-L> :execute 'silent! tabmove ' . tabpagenr()<CR>
" otwiera splity dol, prawo
set splitbelow
set splitright

"relative numbers
nnoremap <F3> :NumbersToggle<CR>

" Set syntax highlighting on
syntax on

"" OmniCppComplete required
"set nocp
"filetype plugin indent on

set filetype=off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'
Bundle 'Valloric/YouCompleteMe'

filetype plugin indent on " required!

"turn off some pep8
let g:syntastic_python_checkers = ['pyflakes']
let g:syntastic_python_pyflakes_args='--ignore=E501,W191'
let g:syntastic_python_flake8_args = '--ignore=W191,E501,E121,E122,E123,E128'


""" SPELLING """
"" No spelling by default, but set up the English dictionary
set nospell spelllang=en
nmap <leader>s :set spell!<CR>
"" Only for the .tex files
"au BufReadPost *.tex setlocal spell spelllang=pl
