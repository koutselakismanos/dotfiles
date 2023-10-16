"Plug auto-install
if 0
  if(!isdirectory(expand("~/.config/nvim/autoload/plug.vim")))
    call system(expand("mkdir -p ~/.config/nvim/autoload"))
    call system(expand("curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"))
  endif
endif

" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.local/share/nvim/plugged')

"Apperance
Plug 'flazz/vim-colorschemes'
Plug 'powerline/fonts'
Plug 'vim-airline/vim-airline'

"Windows and Features
Plug 'majutsushi/tagbar'
Plug 'scrooloose/nerdtree'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install -all'}
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'ryanoasis/vim-devicons'

"Motions
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'junegunn/vim-easy-align'
Plug 'michaeljsmith/vim-indent-object'
Plug 'markonm/traces.vim'

""AutoCompletion
" Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" Plug 'beeender/Comrade'
"Plug 'neoclide/coc.nvim', {'branch': 'release'}
"Plug 'sirver/ultisnips'
"Plug 'honza/vim-snippets'
call plug#end()

"---------------------------------------------------------------------------------

" Colorize line numbers in insert and visual modes
"---------------------------------------------------------------------------------
function! Setcursorlinenrcolorinsert(mode) abort
  " insert mode: blue
  if a:mode == "i"
    highlight cursorlinenr ctermfg=10 guifg=green
    highlight cursor ctermbg=10 guibg=green

    " replace mode: red
  elseif a:mode == "r"
    highlight cursor ctermbg=1 guibg=#dc322f
    highlight cursorlinenr ctermfg=1 guifg=#dc322f
  endif
endfunction

function! Resetcursorlinenrcolor() abort
  set updatetime=4000
  highlight cursorlinenr ctermfg=4 guifg=#268bd2
  highlight cursor ctermbg=4 guibg=#268bd2
endfunction

augroup cursorlinenrcolorswap
  autocmd!
  autocmd insertenter * call Setcursorlinenrcolorinsert(v:insertmode)
  autocmd insertleave * call Resetcursorlinenrcolor()
  autocmd cursorhold * call Resetcursorlinenrcolor()
augroup END

""---------------------------------------------------------------------------------
set encoding=UTF-8
set backupdir=~/.nvim/tmp " for the backup files
set directory=~/.nvim/tmp " for the swap files

" set autochdir

"on search highlight instances
set hlsearch

"ex mode command completion
set wildmenu

"search ignore capital letters
set ignorecase
set smartcase

"complete search pattern by pressing enter and cancel with esc
set incsearch

"display line number
set number

"display line relative to position
set relativenumber

"mouse cursor in terminal
set mouse=a

"better clipboard
set clipboard+=unnamedplus

""each time a new or existing file is edited,
""vim will try to recognize the type of the file and set the 'filetype' option.
""this will trigger the filetype event, which can be used to set the syntax highlighting,
""set options, etc.
"filetype plugin indent on
"syntax on
"autocmd filetype * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

"doesn't wrap lines
set nowrap
""convert tab to spaces
"set tabstop=2 softtabstop=0 expandtab shiftwidth=2 smarttab

set splitright

""Auto indentation smart and more strict c indentation
" set autoindent
" set smartindent
" set cindent
" set copyindent
"
"Show commands/letters i'm typing
set showcmd
"
set backspace=indent,eol,start
set history=1000
set undolevels=1000
set title
set visualbell
set noerrorbells
set pastetoggle=<F2>

"---------------------------------------------------------------------------------

"Leader
let mapleader = " "

"Split window navigation and settings
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>


""Resize Windows
"nnoremap <C-Up> 5<C-W>-
"nnoremap <C-Down> 5<C-W>+
"nnoremap <C-Right> 5<C-W>>
"nnoremap <C-Left> 5<C-W><

function! NerdTreeToggler()
  if &filetype == 'nerdtree'
    :NERDTreeToggle
  elseif &filetype == ''
    :NERDTreeToggle
  else
    :NERDTreeFind
  endif
endfunction


" map <F4> :Explore<CR>
map <F4> :call NerdTreeToggler()<CR>
map <S-F4> :NERDTreeToggle<CR>

"nnoremap <F8> :TagbarToggle<CR>
"nnoremap <leader>w :w<CR>
"nnoremap <leader>q :q<CR>
"
" FZF----------
nmap <C-p> :GFiles<CR>
nmap <leader>f :Files<CR>

nmap <leader>b :Buffers<CR>

nmap <leader>H :History<CR>
nmap <leader>: :History:<CR>
nmap <leader>/ :History/<CR>

nmap <leader>C :Commands<Cr>

nmap <leader>M :Maps<CR>

nmap <leader>t :BTags<CR>
nmap <leader>T :Tags<CR>

nmap <leader>F :Ag<Space>

nnoremap <leader>; A;<ESC>

"" nnoremap <leader><leader> <leader><leader>s
imap jk <ESC>
imap JK <ESC>

" Insert mode delete like most text editors
imap <C-Backspace> <C-w>

" Clear highlights
nnoremap <leader>h :noh<CR>

" Asterisk highlighting
nnoremap * *<C-o>

"Keep search matches in the middle of the window and pulse the line when moving
nnoremap n nzzzv
nnoremap N Nzzzv

"Easy align
nmap ga <Plug>(EasyAlign)
xmap ga <Plug>(EasyAlign)

""Better copy paste
"nnoremap <leader>y "*y
"nnoremap <leader>p "*p
"nnoremap <leader>Y "+y
"nnoremap <leader>P "+p

vnoremap <C-c> "+y
vnoremap <C-v> "+p
imap <C-v> <C-o>"+p

nnoremap <leader>en :e ~/Documents/Notes<CR>:cd ~/Documents/Notes<CR>
nnoremap <leader>ev :e $MYVIMRC<CR>
