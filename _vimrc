""" USEFUL:
" :so %  "Reloads .vimrc
"
let mapleader = ","
execute pathogen#infect()
set nocompatible "Turn the vi compatibility off
set bs=2 "Backspace in insert will work as expected
set number "Enable line numbering
set ic "Ignore-case when searching
set cpoptions+=$ "Display dollar sign when changing
set go-=m "No menu
set go-=T "No taskbar
set undofile "Undo list is tracked for each file separately
set hidden "Allows to navigate between buffers without saving the files
syntax on "Set syntax highlighting on

" Dark background of solarized theme
" let g:solarized_termcolors=256
" colorscheme solarized
 colorscheme monokai
set background=dark
call togglebg#map("<F5>") " Alternate between light/dark background

set autoindent
set showmatch
set smarttab
set smartcase
set hlsearch
set incsearch

" Execute 'make' in current directory
map <F9> <Esc>:w<CR>:!make<CR><CR>
set noswapfile
set nobackup
nmap <leader>f :buffers<CR>:buffer<Space>
nmap <leader>g :buffers<CR>:bdelete<Space>
map <S-CR> O<Esc>j

""" j and k will not jump over the line breaks
nmap j gj
nmap k gk

""" Jump between the buffers
nmap <C-n> :bnext<CR>
nmap <C-p> :bprev<CR>


""" Displaying special characters (tabs, eol):
"" \e turns switches the displaing on/off
nmap <leader>r :set list!<CR>
"" List of chars definition
set listchars=tab:¦ ,trail:▸,eol:¬

"" Turns off displaying at the start
set list

""" Different styles of indentation
nmap <leader>t :set noexpandtab tabstop=4 shiftwidth=4 softtabstop=4<CR>
nmap <leader>m :set expandtab tabstop=4 shiftwidth=4 softtabstop=4<CR>

set expandtab tabstop=4 shiftwidth=4 softtabstop=4

nmap <leader>w :w<CR>
nmap <leader>e :e.<CR>

""Open current file in new tab
"nnoremap <expr> <leader>a (exists('g:zoomedtabpagenr') && g:zoomedtabpagenr == tabpagenr()) ? ':tabclose\|unlet g:zoomedtabpagenr<CR>' : ':tabe %\|let g:zoomedtabpagenr=tabpagenr()<CR>'
nmap <leader>a :tabe %<CR>

nmap <A-n> :lnext<CR>
nmap <A-p> :lprev<CR>

nnoremap <Space> za
map <C-i> :NERDTreeToggle<CR>

set guifont=Monospace\ 9

"SPLITS NAVIGATION CTRL-HJKL instead CTRL-W HJKL
nnoremap <C-j> <C-w>+
nnoremap <C-k> <C-w>-
nnoremap <C-l> <C-w>>
nnoremap <C-h> <C-w><

" otwiera splity dol, prawo
set splitbelow
set splitright

" Relative line counting instead of absolute
nnoremap <F3> :NumbersToggle<CR>

filetype plugin indent on

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_python_checkers = ['pyflakes', 'pep8']
" pep8 ignores: E501(line length)
let g:syntastic_python_pep8_args='--ignore=E501'
" pylint ignores: F0401(imports), W0142(*magic)
"let g:syntastic_python_pylint_args='--disable=F0401,W0142'

""" SPELLING """
"" No spelling by default, but set up the English dictionary
set nospell spelllang=en
nmap <leader>s :set spell!<CR>
"" Spelling on by default for .tex files
au BufReadPost *.tex setlocal spell spelllang=en

"------- FOLDING ----
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
