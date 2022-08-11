" Neil Guertin's vimrc
set nocompatible        " must be first line. Use vim commands, not vi commands
" Set here so shortcuts work from anywhere in file
let mapleader = ","       " leader is ,
let localmapleader = "\\" " local leader is \
set encoding=utf-8      " display as UTF-8
set fileencoding=utf-8  " save as UTF-8

" ==== Colors ====
"colorscheme solarized   " Use solarized colorscheme. Because black/white are
set background=dark     " backwards in my X, PC has light background, laptop has dark
syntax enable           " allow syntax highlighting

" ==== Spaces and tabs ====
filetype on
filetype indent on      " load filetype-specific indent files
filetype plugin on
filetype plugin indent on
set tabstop=4           " number of columns per existing TAB
set expandtab           " in insert mode, hitting TAB inserts spaces
set shiftwidth=4        " number of columns indented with >>/<< and auto-indent
set softtabstop=4       " number of columns indented with TAB in insert mode
set listchars=tab:»·,trail:·,precedes:◂,extends:▸   " show tabs and trailing spaces
set list                        " show tabs and trailing spaces
set autoindent
set smartindent

" ==== UI config ====
set number              " show line numbers
set numberwidth=3       " 3 digit numbers
set relativenumber      " show relative numbers
set ruler               " Turn on ruler: Full path, Modified, ReadOnly, Column, Line
set rulerformat=%40(%F\ %m%r%=c%c\ %l/%L\ %P%)
set showcmd             " show command line in bottom bar
set cursorline          " highlight current line
set visualbell          " cursor flashes instead of beeps
set mouse=a
set wildmenu            " visual autocomplete for command menu
set wildmode=list:full  " list all possible matches and open horizontal menu
set showmatch           " highlight matching [{()}]
set title               " show file title in titlebar
" Let me know when I've passed 80 chars
highlight ColorColumn ctermbg=magenta
call matchadd('ColorColumn', '\%81v', 100)

" ==== Searching ====
set ignorecase          " ignore case when searching
set smartcase           " except when search has a capital
set incsearch           " search as characters are entered
set hlsearch            " highlight matches
" Turn off search highlight
nnoremap <leader>/ :set hlsearch!<CR>

" ==== Movement ====
" Disable arrow keys
"noremap <Up> <nop>
"noremap <Down> <nop>
"noremap <Left> <nop>
"noremap <Right> <nop>
" Disable hjkl to encourage wWbBeE{}() etc.
"noremap h <nop>
"noremap j <nop>
"noremap k <nop>
"noremap l <nop>
" Move vertically by visual line
nnoremap j gj
nnoremap k gk
" Move whole screen with capital letters
nnoremap J <C-e>
nnoremap K <C-y>
" Get the Join action back
nnoremap <leader>j J
set scrolloff=3             " 2 lines above/below cursor when scrolling
" Prevent cursor from stepping back when leaving insert mode
autocmd InsertLeave * call cursor([getpos('.')[1], getpos('.')[2]+1])

" ==== Window Management ====
" Switch tabs
nnoremap H :tabp<CR>
nnoremap L :tabn<CR>
set tabpagemax=100       " give me more than 10 tabs
set hidden             " allow hidden buffers
set splitright " feels more natural
set splitbelow  " feels more natural
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" ==== Other Shortcuts ====
set timeoutlen=250        " No more waiting for timeout
set pastetoggle=<F12>   " pastetoggle works in insert mode
" jk is escape
inoremap jk <esc>
inoremap kj <esc>
" More efficient saving and quitting
noremap <leader>w <esc>:w<cr>
noremap <leader>q <esc>:q<cr>
noremap <leader>x <esc>:x<cr>
" Open and source vimrc
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
" Delete a line but leave it empty
nnoremap <leader>d 0D
" Delete the line above or below
nnoremap dj jddk
nnoremap dk kdd
" Yank to end of line with Y (like C or D)
nnoremap Y y$
" Reformat whole file
nnoremap <leader>= gg=G
" Allow quick recording/playback with qq/Q (Also disables annoying ex mode)
nnoremap Q @q
" Keeps visual block selected after using > or <
vmap > >gv
vmap < <gv
" sudo write with <leader>W
nnoremap <leader>W :w !sudo tee %<cr>

" Comment a line with <leader>c for various filetypes
autocmd FileType vim nnoremap <buffer> <leader>c I"<esc>
autocmd Filetype python nnoremap <buffer> <leader>c I#<esc>
autocmd Filetype java nnoremap <buffer> <leader>c I//<esc>
autocmd Filetype tex nnoremap <buffer> <leader>c I%<esc>
" Same thing, but delete a comment with <leader>C
autocmd FileType vim nnoremap <buffer> <leader>C I<del><esc>
autocmd Filetype python nnoremap <buffer> <leader>C I<del><esc>
autocmd Filetype java nnoremap <buffer> <leader>C I<del><del><esc>
autocmd Filetype tex nnoremap <buffer> <leader>C I<del><esc>

" ==== LaTeX ====
set grepprg=grep\ -nH\ $*
let g:tex_flavor = "latex"
let g:Tex_DefaultTargetFormat = 'pdf'
let g:Tex_MultipleCompileFormats='pdf, aux'
let g:Tex_ViewRule_pdf = 'mupdf'
autocmd BufNewFile,BufRead *.tex inoremap ; $

" ==== Java ====
autocmd BufNewFile,BufRead *.java iabbrev sop System.out.println
autocmd BufNewFile,BufRead *.java iabbrev psvmsa public static void main(String[] args){
autocmd BufNewFile,BufRead *.java iabbrev AL ArrayList
" <leader>ll is a compile shortcut from vimlatex, I started using it for other filetypes
autocmd BufNewFile,BufRead *.java nnoremap <leader>ll :!javac *.java<CR>

" ==== C ====
autocmd BufNewFile,BufRead *.c nnoremap <leader>ll :!make<CR>
autocmd BufNewFile,BufRead *.cpp nnoremap <leader>ll :!make<CR>

" ==== Python ====
"autocmd BufNewFile,BufRead *.py nnoremap <leader>ll :w|!python %


" ======================
" ==== Experimental ====
" ======================

" ==== For vimdiff no whitespace ====
" Not sure if this works
if &diff
        set diffopt+=iwhite
endif

"backups?
set backup
set backupdir=$HOME/.vim/backups
set writebackup


"plugins to get
"supertab tab completion
"coffeescript
"nnoremap <space> za "code folding

"TODO
"Code folding - open/collapse all
"               get it working in java/python
"fuzzy finder
"surround.vim
set nolist
