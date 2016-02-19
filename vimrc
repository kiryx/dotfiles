execute pathogen#infect()
Helptags
let mapleader = ","
set nocompatible " Turn the vi compatibility off
set bs=2 " Enable backspace in insert mode
set number " Enable line numbering
set ignorecase " Ignore-case when searching
set cpoptions+=$ " Display dollar sign when changing
set go-=m " No menu
set go-=T " No taskbar
set undofile " Create undo list for each edited file
set hidden " Enables navigation between buffers without saving
syntax on " Set syntax highlighting on

colorscheme solarized
"colorscheme monokai
set background=dark
call togglebg#map("<F5>") " Alternate between light/dark solarized background

set autoindent " Copy indent from current line when making a new line
set showmatch " Blink the matching brackets when typing
set smarttab
set smartcase " Override ignorecase if the search patter contains upper case characters
set hlsearch " Highlight previous matches of previous search pattern
set incsearch " Jump to the next search pattern match during typing
set noswapfile " Contain all buffers in memory
set nobackup " Don't keep a backup file before overwriting
set clipboard=unnamedplus " Use system clipboard for copy/paste/delete

"" Execute 'make' command in current directory
map <leader>v <Esc>:w<CR>:!make<CR><CR>

"" Changing buffers
map <leader>f :buffers<CR>:buffer<Space>

"" Deleting buffers
map <leader>g :buffers<CR>:bdelete<Space>

"" Puts newline above current line
map <S-CR> O<Esc>j

map <C-i> :NERDTreeToggle<CR>
let NERDTreeShowHidden=1
let NERDTreeIgnore = ['\.pyc$', '\.un\~$', '__pycache__$']
set colorcolumn=80

"" Navigation 'j' and 'k' will not jump over the line breaks
"nmap j gj
"nmap k gk

"" Jump between the buffers
nmap <C-n> :bnext<CR>
nmap <C-p> :bprev<CR>

" Move tabs with alt-l/h
map <a-l> gt
map <a-h> gT
" Create tabs with alt-j/k
map <a-k> :tabnew<CR>
map <a-j> :tabclose<CR>

"" Toggles displaying special characters (tabs, eol, trailing spaces)
nmap <leader>r :set list!<CR>
"" Displaying special characters is on by default
set list
"" List of special characters
set listchars=tab:¦ ,trail:▸,eol:¬

""" Different styles of indentation
nmap <leader>t :set noexpandtab tabstop=4 shiftwidth=4 softtabstop=4<CR>
nmap <leader>m :set expandtab tabstop=4 shiftwidth=4 softtabstop=4<CR>

set expandtab tabstop=4 shiftwidth=4 softtabstop=4

nmap <leader>w :w<CR>
nmap <leader>e :e.<CR>
nmap <leader>q :q<CR>

"" Open current file in new tab
"nnoremap <expr> <leader>a (exists('g:zoomedtabpagenr') && g:zoomedtabpagenr == tabpagenr()) ? ':tabclose\|unlet g:zoomedtabpagenr<CR>' : ':tabe %\|let g:zoomedtabpagenr=tabpagenr()<CR>'
nmap <leader>a :tabe %<CR>

nmap <A-n> :lnext<CR>
nmap <A-p> :lprev<CR>

nnoremap <Space> za

set guifont=Droid\ Sans\ Mono\ 9
set guioptions=

"" Resize the splits with A-{hjkl}
nnoremap <A-j> <C-w>+
nnoremap <A-k> <C-w>-
nnoremap <A-l> <C-w>>
nnoremap <A-h> <C-w><

"" Navigate the splits with C-{hjkl}
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <C-h> <C-w>h

nmap <C-w>j <C-w>+
nmap <C-w>k <C-w>-
nmap <C-w>l <C-w>>
nmap <C-w>h <C-w><

"" Splits the windows below and right to the current one
set splitbelow
set splitright

"" Enables vim-airline tabline
" let g:airline#extensions#tabline#enabled = 1
let g:airline_exclude_preview=1

"" Turn off the tabline
set showtabline=0

"" Enable the silversearcher glob
if executable("ag")
    let g:CtrlSpaceGlobCommand = 'ag -l --nocolor -g ""'
endif

let g:CtrlSpaceUseTabline = 1

"" Search filter delay
let g:CtrlSpaceSearchTiming = 50

"" Custom Symbols
let g:CtrlSpaceSymbols = { "WLoad": "↥", "WSave": "↧" }

"" Relative line counting instead of absolute
nnoremap <leader>z :NumbersToggle<CR>

filetype plugin indent on

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_python_checkers = ['pyflakes', 'pep8', 'pep257']
"" pep8 will ignore: E501(line length)
" let g:syntastic_python_pep8_args='--ignore=E501'
"" pylint will ignore: F0401(imports), W0142(*magic)
"let g:syntastic_python_pylint_args='--disable=F0401,W0142'

"" No spelling by default, but set up the English dictionary as default
set nospell spelllang=en
nmap <leader>s :set spell!<CR>
"" Spelling on by default for .tex files
au BufReadPost *.tex setlocal spell spelllang=en

"" Custom folding
set foldmethod=indent

fu! CustomFoldText()
    "get first non-blank line
    let fs = v:foldstart
    while getline(fs) =~ '^\s*$' | let fs = nextnonblank(fs + 1)
    endwhile
    if fs > v:foldend
        let line = getline(v:foldstart)
    else
        let line = substitute(getline(fs), '\t', repeat(' ', &tabstop), 'g')
    endif

    let w = winwidth(0) - &foldcolumn - (&number ? 8 : 0)
    let foldSize = 1 + v:foldend - v:foldstart
    let foldSizeStr = " " . foldSize . " lines "
    let foldLevelStr = repeat("+--", v:foldlevel)
    let lineCount = line("$")
    let foldPercentage = printf("[%.1f", (foldSize*1.0)/lineCount*100) . "%] "
    let expansionString = repeat(".", w - strwidth(foldSizeStr.line.foldLevelStr.foldPercentage))
    return line . expansionString . foldSizeStr . foldPercentage . foldLevelStr
endf
set foldtext=CustomFoldText()

" Author: Bernardo Fontes <falecomigo@bernardofontes.net>
" Website: http://www.bernardofontes.net
" This code is based on this one: http://www.cmdln.org/wp-content/uploads/2008/10/python_ipdb.vim
" I worked with refactoring and it simplifies a lot the remove breakpoint feature.
" To use this feature, you just need to copy and paste the content of this file at your .vimrc file! Enjoy!
python << EOF
import vim
import re

ipdb_breakpoint = 'import ipdb; ipdb.set_trace()'

def set_breakpoint():
    breakpoint_line = int(vim.eval('line(".")')) - 1

    current_line = vim.current.line
    white_spaces = re.search('^(\s*)', current_line).group(1)

    vim.current.buffer.append(white_spaces + ipdb_breakpoint, breakpoint_line)

vim.command('map <f6> :py set_breakpoint()<cr>')

def remove_breakpoints():
    op = 'g/^.*%s.*/d' % ipdb_breakpoint
    vim.command(op)

vim.command('map <f8> :py remove_breakpoints()<cr>')
