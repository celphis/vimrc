" General appearance
colorscheme default " desert
set bs=2
syntax on
set display=lastline " Omit @ if line doesn't fit screen
set foldcolumn=1
set guifont=Monospace\ 8 " #win: Courier\ New:h8
set hlsearch
set mouse=a
set cursorline
set number
set ruler
" Status line {
  set laststatus=2 " Always show status bar
  set statusline= " Clear statusline
  set statusline+=%-10.3n\ " Buffer number
  set statusline+=%f\ " File name
  set statusline+=%h%m%r%w " Status flags
  set statusline+=\[%{strlen(&ft)?&ft:'none'}] " File type
  set statusline+=%= " Right-align remainder
  set statusline+=0x%-8B " Character value
  " set statusline+=%-14(%1,%c%V%) " Line, character
  set statusline+=%<%P " File position
"}
set syntax=highlight
set tpm=64

" #undo
set undofile
set undodir=~/.vim/undo/

" au GUIEnter * simalt ~x
" au VimResized * wincmd =
" de

set ssop-=options " Do not store global and local values in a session
set ssop-=folds " Do not store folds
" set ssop-=curdir " Do not store current directory
" set ssop-=sesdir " Do store directory of session file as current working directory

nnoremap <silent> <C-S-Left> :execute 'silent! tabmove -1'<CR>
nnoremap <silent> <C-S-Right> :execute 'silent! tabmove +1'<CR>
nnoremap <silent> <C-S-h> :execute 'silent! tabmove -1'<CR>
nnoremap <silent> <C-S-l> :execute 'silent! tabmove +1'<CR>
nnoremap <silent> <C-S-h> :execute 'silent! tabnext'<CR>
nnoremap <silent> <C-S-k> :execute 'silent! tabprev'<CR>

" Vundle
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'

Plugin 'ervandew/supertab'
Plugin 'fidian/hexmode'
Plugin 'majutsushi/tagbar'
Plugin 'Rip-Rip/clang_complete'
Plugin 'salsifis/vim-transpose.git'
Plugin 'tpope/vim-commentary.git' " chrisbra/
Plugin 'tpope/vim-pathogen.git'
Plugin 'tpope/vim-surround.git' " without .git?
Plugin 'vim-scripts/Align.git'
Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-notes'
" Plugin 'junegunn/vim-easy-align'
" Plugin 'garbas/vim-snipmate'
" Plugin 'vim-scripts/VimLite.git'
" Plugin 'scrooloose/nerdcommenter'
" Plugin 'altercation/vim-colors-solarized.git'
" Plugin 'git://vim-latex.git.sourceforge.net/gitroot/vim-latex/vim-latex'
" Plugin 'MatlabFilesEdition'
" Plugin 'nachumk/systemverilog.vim'
" Plugin 'vhda/verilog_systemverilog.vim'
" Plugin 'Valor/ZouCompleteMe'
" Plugin 'darkburn'
" Plugin 'scrooloose/nerdtree'
" Plugin 'vim-syntastic/syntastic'
call vundle#end()

" Syntastic
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*

" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 0

" Indentation
set ai
filetype plugin indent on

" Tabulators
set expandtab
set shiftwidth=2
set softtabstop=2
set tabstop=2

" NERD Commenter
" let mapleader=","
" let g:NERDSpaceDelims=1

" clang
let g:clang_user_options='|| exit 0'

" SuperTab
let g:SuperTabDefaultCompletionType="context"

" Folding
set foldmethod=indent
set nofoldenable
map + zo
map - zc
nnoremap <silent> <F9> :TagbarToggle<CR>

" Swapping
nnoremap <silent> ,sc xph
nnoremap <silent> ,sw "_yiw:s/\(\%#\w\+\)\(\_W\+\)\(\w\+\)/\3\2\1/<CR><c-o><c-l>
nnoremap <silent> ,sl "_yiw?\w\+\_W\+\%#<CR>:s/\(\%#\w\+\)\(\_W\+\)\(\w\+\)/\3\2\1/<CR><c-o><c-l>
nnoremap <silent> ,sr "_yiw:s/\(\%#\w\+\)\(\_W\+\)\(\w\+\)/\3\2\1/<CR><c-o>/\w\+\_W\+<CR><c-l>
nnoremap ,{ {dap}p{

" Commentary
  " au FileType cls set commentstring=%\ %s
au FileType matlab set commentstring=%\ %s
au FileType vhdl set commentstring=--\ %s
au FileType xdc set commentstring=#\ %s
au FileType ucf set commentstring=#\ %s
au FileType vb set commentstring='\ %s
au FileType dosbatch set commentstring=rem\ %s
au FileType verilog set commentstring=//\ %s

" Quoting
nnoremap ,qs :silent! normal "zyiw<Esc>:let @z="'".@z."'"<CR>cw<c-r>z<Esc>b
nnoremap ,qd :silent! normal "zyiw<Esc>:let @z="\"".@z."\""<CR>cw<c-r>z<Esc>b
" nnoremap wq :silent! normal mpeld bhd `ph<CR>

" Auto commands
" au VimLeave * :mksession! session.vim " Auto-save session
" au VimEnter * nested TagbarOpen
