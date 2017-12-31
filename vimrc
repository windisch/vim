" Initialize pathogen
filetype off
call pathogen#infect()
call pathogen#helptags()

filetype plugin indent on
syntax on

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

" disables word wrap
set linebreak
set tw=70

"Disable welcome screen
set shortmess+=I

"swap files
set backupdir=/tmp/vim/backup/
set directory=/tmp/vim/swap/
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

"Completion
set complete+=k

"set some latex-keywords for completion
set iskeyword+=:,- 


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
set background=dark
colorscheme solarized

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
let g:jedi#force_py_version=3
let g:jedi#show_call_signatures="1"

" pymode
let g:pymode_python = 'python3'
let g:pymode_options_colorcolumn = 0
let g:pymode_rope_lookup_project = 1
let g:pymode_rope = 0
let g:pymode_options_max_line_length = 100

" HIVE
au BufNewFile,BufRead *.hql set filetype=hive expandtab
au BufNewFile,BufRead *.q set filetype=hive expandtab

" GNUPLOT Filetye regognition
autocmd BufNewFile,BufRead *.gnu set syntax=gnuplot


" ###############################################
"
"       MISC
"
" ###############################################

" VirtualEnv Support for Python
if has('py3')
py << EOF
import os.path
import sys
import vim
if 'VIRTUAL_ENV' in os.environ:
        project_base_dir = os.environ['VIRTUAL_ENV']
        sys.path.insert(0, project_base_dir)
        activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
        execfile(activate_this, dict(__file__=activate_this))
EOF
endif
