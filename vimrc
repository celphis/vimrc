" General appearance
colorscheme default
syntax on
set foldcolumn=1
set guifont=Monospace\ 8
set mouse=a
set cursorline
set number
set ruler
set syntax=highlight
set tpm=64
set undofile

set ssop-=options " Do not store global and local values in a session
set ssop-=folds " Do not store folds

nnoremap <silent> <C-S-Left> :execute 'silent! tabmove -1'<CR>
nnoremap <silent> <C-S-Right> :execute 'silent! tabmove +1'<CR>

" Pathogen
" execute pathogen#infect()

" Vundle
set nocompatible
filetype off
set runtimepath+=~/.vim/bundle/vundle
call vundle#rc()
Bundle 'gmarik/vundle'

Bundle 'ervandew/supertab'
Bundle 'fidian/hexmode'
" Bundle 'garbas/vim-snipmate'
Bundle 'majutsushi/tagbar'
Bundle 'Rip-Rip/clang_complete'
Bundle 'salsifis/vim-transpose.git'
Bundle 'tpope/vim-commentary.git'
Bundle 'tpope/vim-pathogen.git'
Bundle 'tpope/vim-surround.git'
Bundle 'vim-scripts/Align.git'
Bundle 'xolox/vim-misc'
Bundle 'xolox/vim-notes'
" Bundle 'vim-scripts/VimLite.git'
" Bundle 'scrooloose/nerdcommenter'
" Bundle 'altercation/vim-colors-solarized.git'
" Bundle 'git://vim-latex.git.sourceforge.net/gitroot/vim-latex/vim-latex'

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
