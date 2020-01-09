set tabstop=4
set shiftwidth=4
set softtabstop=4
set shiftwidth=4
set expandtab
set autoindent
set incsearch
set nonumber " No numbes on lines
set encoding=utf-8
set cursorline " Highligth the current line
" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let g:mapleader = ','
set nohlsearch
set ruler
" Better listing of filename with the :b stuff
set wildmenu
set wildignore=*.o,*~,*.pyc


if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

" Vundle stuff
set nocompatible
filetype off                   " required!
set runtimepath+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" Look and feel
Plugin 'lifepillar/vim-solarized8'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" Misc. Plugins
Plugin 'noahfrederick/vim-skeleton'
Plugin 'kien/ctrlp.vim'
Plugin 'tpope/vim-haml'
Plugin 'tpope/vim-bundler'
Plugin 'tpope/vim-markdown'

" Plugins fo Golang
Plugin 'fatih/vim-go'

" These ae for code autoformatting
Plugin 'hynek/vim-python-pep8-indent'
Plugin 'google/vim-codefmt'
Plugin 'google/vim-glaive'
Plugin 'google/vim-maktaba'
Plugin 'nvie/vim-flake8'
Plugin 'python.vim'
Plugin 'spacehi.vim'
Plugin 'godlygeek/tabular'
Plugin 'w0rp/ale'
let b:ale_fixers = {'python': ['autopep8', 'black'], 'json': ['jq']}
let g:ale_python_autopep8_options = '--aggressive'
let ale_fix_on_save=1

" Plugins for apps
Plugin 'chase/vim-ansible-yaml'
Plugin 'django.vim'
Plugin 'hashivim/vim-terraform'
Plugin 'tpope/vim-rails'
Plugin 'towolf/vim-helm'
Plugin 'rodjek/vim-puppet'

" Syntax checking
" Make sure pylint or flake8 is installed
"let g:ale_sign_warning = '🤔'
"let g:ale_sign_error = '🤬'


call vundle#end()  
call glaive#Install()
syntax on
filetype plugin indent on     " required!

" Better tab fixes
nmap <Leader>f= :Tabularize /=<CR>
vmap <Leader>f= :Tabularize /=<CR>
nmap <Leader>ft :Tabularize /=><CR>
vmap <Leader>ft :Tabularize /=><CR>
nmap <Leader>f: :Tabularize /:\zs<CR>
vmap <Leader>f: :Tabularize /:\zs<CR>

" Easy copy/paste
nmap <Leader>c :'<,'>w ! bash -c cat<CR>
vmap <Leader>c :>w ! bash -c cat<CR>

nnoremap th  :tabfirst<CR>
nnoremap tj  :tabnext<CR>
nnoremap tk  :tabprev<CR>
nnoremap tl  :tablast<CR>
nnoremap tt  :tabedit<Space>
"nnoremap tn  :tabnext<Space>
nnoremap tm  :tabm<Space>
nnoremap td  :tabclose<CR>
" Alternatively use
"nnoremap th :tabnext<CR>
"nnoremap tl :tabprev<CR>
nnoremap tn :tabnew<CR>


inoremap jj <ESC>


map gn :bn<cr>
map gp :bp<cr>
map gd :bd<cr>  

autocmd Filetype yaml setlocal ts=2 sts=2 sw=2
autocmd Filetype ruby setlocal ts=2 sts=2 sw=2
autocmd Filetype python setlocal smarttab expandtab tabstop=4 shiftwidth=4

" Show tabs
syn match TAB_CHAR "\t"
hi link TAB_CHAR Error

" For puppet manifests
" let loaded_syntastic_yaml_jsyaml_checker = 1
autocmd FileType puppet SpaceHi
autocmd FileType puppet :setlocal sw=2 ts=2 sts=2 " Two spaces for Puppet files "
autocmd BufWritePre *.pp :%s/\s\+$//e
autocmd BufWritePre *.pl :%s/\s\+$//e
autocmd BufWritePre *.py :%s/\s\+$//e

syntax enable
set background=light
colorscheme solarized8
" colorscheme gruvbox
"
" Highlight past 80 characters
autocmd BufEnter * highlight OverLength ctermbg=red ctermfg=white guibg=#592929
autocmd BufEnter * match OverLength /\%79v.*/

" Really write this junk
cmap w!! w !sudo tee % >/dev/null       

" Pretty paste
nnoremap <F2> :set invpaste paste?<CR>
inoremap <S-Insert> <ESC>"+p`]a"
set pastetoggle=<F2>
set showmode

" Pretty statusline
set laststatus=2
let g:Powerline_symbols = 'fancy'

" let g:syntastic_yaml_checkers = ['yamllint']
" let g:syntastic_python_checkers = ['flake8']

"autocmd BufNewFile,BufRead *.py compiler nose

augroup autoformat_settings
  autocmd FileType bzl AutoFormatBuffer buildifier
  autocmd FileType c,cpp,proto,javascript AutoFormatBuffer clang-format
  autocmd FileType dart AutoFormatBuffer dartfmt
  autocmd FileType go AutoFormatBuffer gofmt
  autocmd FileType gn AutoFormatBuffer gn
  autocmd FileType html,css,json AutoFormatBuffer js-beautify
  autocmd FileType java AutoFormatBuffer google-java-format
  autocmd FileType python AutoFormatBuffer yapf
  " Alternative: autocmd FileType python AutoFormatBuffer autopep8
augroup END


" Airline config
let g:airline#extensions#tabline#enabled = 1
"let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_symbols.space = "\ua0"
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 1
let g:airline_theme = 'solarized'
let g:airline_solarized_bg='light'

" Terraform
let g:terraform_align=1
" let g:terraform_fmt_on_save=1


" Spellcheck on .md files
autocmd BufRead,BufNewFile *.md setlocal spell

" CtrlP
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlPMixed'
