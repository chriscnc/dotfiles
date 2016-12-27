" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

execute pathogen#infect()

"load 'sensible.vim' now so, the remaining commands in this .vimrc
"can override it wished.
runtime! plugin/sensible.vim

filetype plugin indent on
syntax on

set number 			
set nowrap
set showmode
set nowrap
set showmode
set tw=80
set smartcase
set smarttab
set mouse=a
set smartindent
set autoindent
set softtabstop=2
set shiftwidth=2
set expandtab
set incsearch
set backspace=indent,eol,start 	" allow backspacing over everything in insert mode
set history=50			" keep 50 lines of command line history
set ruler			" show the cursor position all the time
set showcmd			" display incomplete commands
set incsearch			" do incremental searching
set nohlsearch
set clipboard=unnamedplus,autoselect
set completeopt=menuone,menu,longest
set wildignore+=*\\tmp\\*,*.swp,*.swo,*.zip,.git,.cabal-sandbox
set wildmode=longest,list,full
set wildmenu
set completeopt+=longest
set autoindent
set t_Co=256

colorscheme desert

" Customize ctrp to open files in new tab on CR.
let g:ctrlp_prompt_mappings = {
    \ 'AcceptSelection("e")': ['<2-LeftMouse>'],
    \ 'AcceptSelection("t")': ['<cr>'],
    \ }

" Markdown
autocmd BufNewFile,BufReadPost *.md set filetype=markdown

" OCaml stuff
au BufEnter *.ml setf ocaml
au BufEnter *.mli setf ocaml
let g:opamshare = substitute(system('opam config var share'),'\n$','','''')
execute "set rtp+=" . g:opamshare . "/merlin/vim"
set rtp^="/Users/chris/.opam/system/share/ocp-indent/vim"
set rtp+="/Users/chris/.opam/system/share/ocp-index/vim"

" When editing a file, always jump to the last known cursor position.
" Don't do it when the position is invalid or when inside an event handler
" (happens when dropping a file on gvim).
" Also don't do it when the mark is in the first line, that is the default
" position when opening a file.
autocmd BufReadPost *
\ if line("'\"") > 1 && line("'\"") <= line("$") |
\   exe "normal! g`\"" |
\ endif


" Custom key mappings
inoremap kj <ESC>
map <C-n> :NERDTreeToggle<CR>
