" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible


"load 'sensible.vim' now so, the remaining commands in this .vimrc
"can override it wished.
runtime! plugin/sensible.vim

syntax on
filetype plugin indent on

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
set clipboard=unnamed,autoselect
set completeopt=menuone,menu,longest
set wildignore+=*\\tmp\\*,*.swp,*.swo,*.zip,.git,.cabal-sandbox
set wildmode=longest,list,full
set wildmenu
set completeopt+=longest
set autoindent
set cmdheight=1

" Pathogen
execute pathogen#infect()
execute pathogen#helptags()

set background=dark
colorscheme solarized


" Customize ctrp to open files in new tab on CR.
let g:ctrlp_prompt_mappings = {
    \ 'AcceptSelection("e")': ['<2-LeftMouse>'],
    \ 'AcceptSelection("t")': ['<cr>'],
    \ }

" super tab
let g:SuperTabDefaultCompletionType = '<c-x><c-o>'

if has("gui_running")
    imap <c-space> <c-r>=SuperTabAlternateCompletion("\<lt>c-x>\<lt>c-o>")<cr>
  else " no gui
      if has("unix")
            inoremap <Nul> <c-r>=SuperTabAlternateCompletion("\<lt>c-x>\<lt>c-o>")<cr>
              endif
            endif

let g:haskellmode_completion_ghc = 1
" end super tab

" Syntastic
augroup my_syntastic
  autocmd!
  " tell syntasitc to alwas stick any detected errors into the location-list
  au FileType python,haskell let g:syntastic_always_populate_loc_list = 1
  " automatically open and/or close the location-list
  au FileType python,haskell let g:syntastic_auto_loc_list = 1
  au FileType racket let g:syntastic_enable_racket_racket_checker = 1
augroup END

let g:syntastic_java_checkers=[]

nnoremap <leader>S :SyntasticToogleMode<CR>


" tabular
augroup tabular_haskell
  autocmd!
  au FileType haskell let g:haskell_tabular = 1
  au FileType haskell vmap a= :Tabularize /=<CR>
  au FileType haskell vmap a; :Tabularize /::<CR>
  au FileType haskell vmap a- :Tabularize /-><CR>
augroup END

" Racket
augroup filetype_racket
  autocmd!
  autocmd FileType racket nnoremap <buffer> <localleader>r :exec '!raco test' shellescape(@%, 1)<CR>
augroup END

" Python
augroup filetype_python
  autocmd!
  autocmd FileType python nnoremap <buffer> <localleader>r :exec '!python' shellescape(@%, 1)<CR>
augroup END


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


" global mappings
let mapleader = "-"
let maplocalleader = ","
" Edit vimrc
nnoremap <leader>ev :tabnew $MYVIMRC<cr> 
" Source vimrc
nnoremap <leader>sv :source $MYVIMRC<cr>
" Remap ESC
inoremap <silent> kj <ESC>
inoremap <esc> <nop>

map <C-n> :NERDTreeToggle<CR>


augroup filetype_clojure
  autocmd!
  autocmd FileType clojure nnoremap <buffer> <localleader>r :Require<CR>
augroup END

augroup filetype_haskell
  autocmd!
  " ghcmod key mappings
  autocmd FileType haskell nnoremap <buffer> <localleader>r :Require<CR>
  autocmd FileType haskell nnoremap <silent> <buffer> <localleader>tq :GhcModType<CR>
  autocmd FileType haskell nnoremap <silent> <buffer> <localleader>te :GhcModTypeClear<CR>
  autocmd FileType haskell nnoremap <silent> <buffer> <localleader>ti :GhcModTypeInsert<CR>
  autocmd FileType haskell nnoremap <silent> <buffer> <localleader>ts :GhcModSplitFunCase<CR>
  autocmd Filetype haskell nnoremap <silent> <buffer> <localleader>d :GhcModInfoPreview<CR>
  " for tab completion
  autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc
  autocmd Filetype haskell nnoremap <localleader>hi :HoogleInfo<CR>
augroup END

