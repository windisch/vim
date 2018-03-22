" Initialize pathogen
filetype off
call pathogen#infect()
call pathogen#helptags()

filetype plugin indent on
syntax on


set foldmethod=indent   
set foldnestmax=10
set foldenable
set foldlevel=2

" ###############################################
"
"       Global configurations
"
" ###############################################

set nocompatible
set number
set ignorecase
set incsearch
set hlsearch
set encoding=utf-8

set completeopt-=preview

" disables word wrap
set linebreak
set tw=70

"Disable welcome screen
set shortmess+=I

"swap files
silent !mkdir -p /tmp/vim/backup > /dev/null 2>&1
set backupdir=/tmp/vim/backup/

silent !mkdir -p /tmp/vim/swap > /dev/null 2>&1
set directory=/tmp/vim/swap/

silent !mkdir -p /tmp/vim/undo > /dev/null 2>&1
set undodir=/tmp/vim/undo/

" create splits below
set splitbelow
set splitright

"speed-up scrolling
set ttyfast
set ttyscroll=3
set lazyredraw

set backspace=indent,eol,start

if has('unnamedplus')
      set clipboard=unnamed,unnamedplus
endif

"Enable-File type detection
syntax enable
filetype on
filetype plugin on

"Indent
set autoindent
set smartindent
set tabstop=3
set shiftwidth=4
set expandtab 

" Completion
set complete+=k

" ###############################################
"
"       Key bindings
"
" ###############################################

"<Leader>-Key (needed for command-T plugin)
let mapleader=' '
let maplocalleader= ',,'

"Navigation through line wraps
map <silent> j gj
map <silent> k gk
map D <PageDown>
map U <PageUp>

"VISUAL-BLOCK Mode and Windoof
:nnoremap <Alt-v> <c-v>

" easymotion configuration
nmap s <Plug>(easymotion-s)
let g:EasyMotion_smartcase=1
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)

" map environmen-key <F5> to <C-e> in tex files
au BufEnter *.tex map <C-e> <F5>
au BufEnter *.tex imap <C-e> <F5>
au BufEnter *.tex vmap cc I%<ESC>
au BufEnter *.tex set autowrite


au BufEnter *.m2 vmap cc I--<ESC>

" ###############################################
"
"       Colors
"
" ###############################################

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

"highlight special keywords
augroup HiglightTODO
    autocmd!
    autocmd WinEnter,VimEnter * :silent! call matchadd('Todo', 'TODO', -1)
augroup END

"ColorScheme
let python_highlight_all=1
" color-issue when using vim through tmux
set term=screen
set t_Co=256

" Solarized
let g:solarized_termcolors=256
colorscheme solarized
set background=dark

" Turn lights on and off
command LightOn set background=light
command LightOff set background=dark

" ###############################################
"
"       Plugin configurations
"
" ###############################################

" CommandT
let g:CommandTAcceptSelectionSplitMap=1

" SuperTab
let g:SuperTabDefaultCompletionType="context"

" jedi-vim
let g:jedi#use_tabs_not_buffers = 1
let g:jedi#goto_definitions_command = "<leader>d"
let g:jedi#goto_assignments_command = "<leader>g"
let g:jedi#documentation_command = "<leader>h"
let g:jedi#force_py_version=3
let g:jedi#show_call_signatures="1"

" pymode
let g:pymode_python = 'python3'
let g:pymode_options_colorcolumn = 0
let g:pymode_rope_lookup_project = 1
let g:pymode_rope = 0
let g:pymode_options_max_line_length = 100
" Enable static code checking
let g:pymode_lint = 1
let g:pymode_lint_on_write = 1
" Use python interpreter from venv
let g:pymode_virtualenv = 1
" Enable Folding
let g:pymode_folding = 1
" Disable rope (python refactoring library)
let g:pymode_rope = 0

" latex
set grepprg=grep\ -nH\ $*
let g:Tex_flavor='latex'
let g:Tex_DefaultTargetFormat = 'pdf'
let g:Tex_MultipleCompileFormats = 'pdf'
let g:Tex_CompileRule_pdf = 'pdflatex -shell-escape --synctex=1 -interaction=nonstopmode $*'
let g:Tex_GotoError = 0
let g:Tex_ViewRule_pdf = 'Skim'
let g:Tex_FoldedMisc='item,slide,emptyslide,wideslide,preamble,frame,<<<'
"disable ... -> \ldots
let g:Tex_SmartKeyDot=0 
let g:tex_FoldedEnvironments='comment,gather,align,figure,table,thebibliography,keywords,abstract,titlepage,tikzpicture,proof'
"notice that it is tex instead of Tex
let g:tex_comment_nospell= 1 "no spell-check in comments
let g:Tex_PromptedEnvironments='equation*,split'

"removes <++> coming from $$
let g:Imap_UsePlaceHolders = 0

"Environments
let g:Tex_Env_{'thm'} = "\\begin{thm}\\label{thm:}\<CR>\<CR>\\end{thm}"
let g:Tex_Env_{'theorem'} = "\\begin{theorem}\\label{t:<++>}\<CR>\<CR>\\end{theorem}"
let g:Tex_Env_{'lemma'} = "\\begin{lemma}\\label{l:<++>}\<CR>\<CR>\\end{lemma}"
let g:Tex_Env_{'prop'} = "\\begin{prop}\\label{p:<++>}\<CR>\<CR>\\end{prop}"
let g:Tex_Env_{'cor'} = "\\begin{cor}\\label{c:<++>}\<CR>\<CR>\\end{cor}"
let g:Tex_Env_{'remark'} = "\\begin{remark}\\label{r:<++>}\<CR>\<CR>\\end{remark}"
let g:Tex_Env_{'proof'} = "\\begin{proof}\<CR><++>\<CR>\\end{proof}"
let g:Tex_Env_{'equation'} = "\\begin{equation*}\<CR><++>\<CR>\\end{equation*}"
let g:Tex_Env_{'split'} = "\\begin{split}\<CR><++>\<CR>\\end{split}"
let g:Tex_Env_{'figure'} = "\\begin{figure}[htbp]\<CR><++>\<CR>\\caption{}\\label{f:}\\end{figure}"
let g:Tex_Env_{'frame'} = "\\begin{frame}\<CR>\\frametitle{<++>}\<CR>\<CR>\\end{frame}"
let g:Tex_Env_{'block'} = "\\begin{block}{<++>}\<CR><++>\<CR>\\end{block}"


" ###############################################
"
"       Spelling
"
" ###############################################

" Default spelling language
set spelllang=en

" Swith spelling language
command Spde set spell spelllang=de
command Spen set spell spelllang=en

" Filetypes where spell should be enabled
autocmd FileType tex setlocal spell 
autocmd FileType md setlocal spell 

" ###############################################
"
"       Syntax and file endings
"
" ###############################################

" HIVE
au BufNewFile,BufRead *.hql set filetype=hive expandtab
au BufNewFile,BufRead *.q set filetype=hive expandtab

" GNUPLOT Filetye regognition
autocmd BufNewFile,BufRead *.gnu set syntax=gnuplot

"Sage Filetype recognition 
autocmd BufRead,BufNewFile *.sage,*.pyx,*.spyx,*.py set filetype=python
