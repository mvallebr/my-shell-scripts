"
" Description: mvalle's vim file, configuration for several plugins and nice editor options
" Author: Marcelo Valle
"=================================================
syntax on
"open .vim file in current folder if it exists
set exrc
set secure "disabling potential problems

"Make it works as other editors reggarding buffers
set hidden

"=================================================
" EDITOR options
set tabstop=4
set softtabstop=4
set shiftwidth=4
"set noexpandtab
set expandtab        " expand tabs to spaces
" wrap lines at 120 chars. 80 is somewhat antiquated with nowadays displays.
set textwidth=120
set colorcolumn=120
" highlight ColorColumn ctermbg=darkgray
" set UTF-8 encoding
set enc=utf-8
set fenc=utf-8
set termencoding=utf-8
" disable vi compatibility (emulation of old bugs)
set nocompatible
" use indentation of previous line
set autoindent
" use intelligent indentation for C
set smartindent
" turn syntax highlighting on
set t_Co=256
syntax on

set backspace=indent,eol,start
" colorscheme wombat256
" turn line numbers on
set number
" highlight matching braces
set showmatch
" Customize status line
set statusline=%<\ %n:%f\ %m%r%y%=%-35.(line:\ %l\ of\ %L,\ col:\ %c%V\ (%P)%)
" intelligent comments
set comments=sl:/*,mb:\ *,elx:\ */
" Highlight search word
set hlsearch
" wildmenu
set wildmenu
set wildignore=*.o,*.a,*.pyc,*.log,*.d,*.dd,*.sundev*,*.tsk
set wildmode=list:longest,full

"=================================================
" cpp options
augroup project
  autocmd!
  autocmd BufRead,BufNewFile *.h,*.cpp set filetype=cpp.doxygen
augroup END

"=================================================
" PyMode plugin
let g:pymode_rope = 0 " https://github.com/klen/python-mode/issues/342
" let g:pymode_rope = 1
let g:pymode_doc = 1
let g:pymode_doc_key = 'K'
let g:pymode_lint = 1
let g:pymode_lint_checker = "pyflakes"
let g:pymode_lint_write = 1
let g:pymode_virtualenv = 0
let g:pymode_syntax = 1
let g:pymode_syntax_all = 1
let g:pymode_syntax_indent_errors = g:pymode_syntax_all
let g:pymode_syntax_space_errors = g:pymode_syntax_all
let g:pymode_folding = 0
let g:pymode_options_max_line_length = 120

"=================================================
"Pathogen plugin
filetype off
call pathogen#infect()
call pathogen#helptags()
filetype plugin indent on 
syntax on


"=================================================
"Solarized plugin 
if has('gui_running')
    set background=light
else
    set background=dark
endif
 set background=light
colorscheme solarized
let g:solarized_termcolors=256
syntax enable

"=================================================
"NERDTree plugin
" Opens at initialization 
" autocmd vimenter * NERDTree
" Opens at initialization only if no files have been specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
"Key biding to enable/disable nerd tree
map <C-n> :NERDTreeToggle<CR>
" Closes vim if nerdtree window is the last on remaining
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif


"=================================================
"OmniCppComplete plugin
" Install OmniCppComplete like described on http://vim.wikia.com/wiki/C++_code_completion
" This offers intelligent C++ completion when typing ... .->. or <C-o>
" Load standard tag files
set tags+=~/.vim/tags/cpp
set tags+=~/.vim/tags/gl
set tags+=~/.vim/tags/sdl
set tags+=~/.vim/tags/qt4


"=================================================
" Enhanced keyboard mappings
"
" in normal mode F2 will save the file
nmap <F2> :w<CR>
" in insert mode F2 will exit insert, save, enters insert again
imap <F2> <ESC>:w<CR>i
" Be able to paster stuff without problems
map <F3> :set paste!
" switch between header/source with F4
map <F4> :e %:p:s,.h$,.X123X,:s,.cpp$,.h,:s,.X123X$,.cpp,<CR>
" goto definition with F12
map <F12> :set hlsearch!

"=================================================
" Options for diff mode

" in diff mode we use the spell check keys for merging
if &diff
    " diff settings
    map <M-Down> ]c
    map <M-Up> [c
    map <M-Left> do
    map <M-Right> dp
    map <F9> :new<CR>:read !svn diff<CR>:set syntax=diff buftype=nofile<CR>gg
else
    " spell settings
    :setlocal spell spelllang=en
    " set the spellfile - folders must exist
    set spellfile=~/.vim/spellfile.add
    map <M-Down> ]s
    map <M-Up> [s
endif


"=================================================
