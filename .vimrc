set ts=4
set sw=4
set softtabstop=4
set shiftwidth=4
set et
set ai
set incsearch
set nonu
set encoding=utf-8

set cul " Highligth the current line

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","
let g:mapleader = ","

set nohlsearch
set viminfo=""
set ruler

if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

" Vundle stuff
set nocompatible
filetype off                   " required!
"set rtp+=~/.vim/bundle/Vundle.vim
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'lifepillar/vim-solarized8'
Plugin 'noahfrederick/vim-skeleton'
Plugin 'morhetz/gruvbox'
Plugin 'towolf/vim-helm'
" Google code junk
Plugin 'google/vim-maktaba'
Plugin 'google/vim-codefmt'
Plugin 'google/vim-glaive'
Plugin 'dhruvasagar/vim-marp'
Plugin 'kien/ctrlp.vim'
Plugin 'tpope/vim-rails'
"Plugin 'ekalinin/Dockerfile'
Plugin 'tpope/vim-haml'
Plugin 'tpope/vim-bundler'
Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-notes'
Plugin 'natw/keyboard_cat.vim'
Plugin 'gmarik/Vundle.vim'
Plugin 'tpope/vim-markdown'
Plugin 'hynek/vim-python-pep8-indent'
Plugin 'nvie/vim-flake8'
Plugin 'python.vim'
Plugin 'spacehi.vim'
Plugin 'reinh/vim-makegreen'
Plugin 'chase/vim-ansible-yaml'
Plugin 'Raimondi/delimitMate'
Plugin 'altercation/vim-colors-solarized'
Plugin 'django.vim'
Plugin 'hashivim/vim-terraform'
"Plug 'Gundo'
Plugin 'acustodioo/vim-tmux'
Plugin 'Lokaltog/vim-easymotion'
" TODO: Learn how to use this, may be useful for puffers
"Plug 'kien/ctrlp.vim'
Plugin 'nathanaelkane/vim-indent-guides'
"Plug 'vcscommand.vim'
Plugin 'Lokaltog/vim-powerline'
" Plugin 'kana/vim-fakeclip'

" Colors
Plugin 'nanotech/jellybeans.vim'
Plugin 'brafales/vim-desert256'

" Snipmate stuff
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
" Plugin "honza/snipmate-snippets"
Plugin 'garbas/vim-snipmate'

" Commenting
Plugin 'scrooloose/nerdcommenter'

" Syntax checking
" Make sure pylint or flake8 is installed
" Plugin 'scrooloose/syntastic'
Plugin 'w0rp/ale'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
let b:ale_fixers = ['autopep8', 'black']
"let g:ale_sign_warning = '🤔'
"let g:ale_sign_error = '🤬'

" Puppet syntax highlighting
Plugin 'godlygeek/tabular'
Plugin 'rodjek/vim-puppet'

call vundle#end()  
call glaive#Install()
syntax on
filetype plugin indent on     " required!

" Use a better leader for vcs
let VCSCommandMapPrefix="<leader>x"
let VCSCommandCommitOnWrite=1


" Taglist plugin mapping
noremap <silent> <Leader>tl :TlistToggle<CR>
"noremap <silent> <Leader>v :VTreeExplore<CR>
noremap <silent> <Leader>t :NERDTreeToggle<CR>
noremap <silent> <Leader>u :GundoToggle<CR>
noremap <silent> <Leader>s :SyntasticToggleMode<CR>

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

" Replace quotes with single quotes
nmap <Leader>fq :s/"/'/g<CR>
vmap <Leader>fq :s/"/'/g<CR>

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

" Taglist plugin config
let Tlist_Use_Right_Window = 1
let Tlist_Inc_Winwidth = 0
let Tlist_WinWidth = 45
let Tlist_GainFocus_On_ToggleOpen= 1
let Tlist_Ctags_Cmd = '/usr/local/bin/ctags'
let Tlist_Show_One_File = 1

"nmap ,t :ToggleWord<CR> 

" Better listing of filename with the :b stuff
set wildmenu
set wildignore=*.o,*~,*.pyc

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

" let g:solarized_termcolors = 256
let g:solarized_termtrans = 1
let g:solarized_bold = 1
let g:solarized_underline = 1 
let g:solarized_italic = 1
" let g:solarized_visibility =  "low"
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


" Auto detect pasting
function! WrapForTmux(s)
  if !exists('$TMUX')
    return a:s
  endif

  let tmux_start = "\<Esc>Ptmux;"
  let tmux_end = "\<Esc>\\"

  return tmux_start . substitute(a:s, "\<Esc>", "\<Esc>\<Esc>", 'g') . tmux_end
endfunction

" Airline config
let g:airline#extensions#tabline#enabled = 1
"let g:airline_powerline_fonts = 1

let &t_SI .= WrapForTmux("\<Esc>[?2004h")
let &t_EI .= WrapForTmux("\<Esc>[?2004l")

" Terraform
let g:terraform_align=1
" let g:terraform_fmt_on_save=1


function! XTermPasteBegin()
  set pastetoggle=<Esc>[201~
  set paste
  return ""
endfunction

" Spellcheck on .md files
autocmd BufRead,BufNewFile *.md setlocal spell

" CtrlP
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlPMixed'

inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()
