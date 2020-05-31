" Bryan Hooper's  .vimrc
" v0.6 2020-05-31
" A slimmed down version for a new mac (Zech!)

set nocompatible 

" Plugins 
call plug#begin('~/.vim/plug-ins')

" Gobs and gobs of color schemes.....
Plug 'flazz/vim-colorschemes'

" Support for easily toggling comments.
Plug 'tpope/vim-commentary'

" Markdown support.
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'

" This plugin provides the Airline status bar at the bottom of the screen.
Plug 'bling/vim-airline'

" JavaScript/JSON Syntax Highlighting
Plug 'pangloss/vim-javascript'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'elzr/vim-json'

" The Nerd Tree plugin, plus cool icons for it 
Plug 'scrooloose/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'Xuyuanp/nerdtree-git-plugin'


" End  - all plugins must be before this call
call plug#end()

" We have to turn this stuff back on if we want all of our features.
syntax on " Syntax highlighting
filetype plugin indent on " Filetype auto-detection
set visualbell

set relativenumber
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab " use spaces instead of tabs.
set smarttab " let's tab key insert 'tab stops', and bksp deletes tabs.
set shiftround " tab / shifting moves to closest tabstop.
set autoindent " Match indents on new lines.
set smartindent " Intellegently dedent / indent new lines based on rules.
set spelllang=en " Set English as my spell checking language
set clipboard=unnamed
set fillchars+=vert:│

" We have VCS -- we don't need this stuff.
set nobackup " We have vcs, we don't need backups.
set nowritebackup " We have vcs, we don't need backups.
set noswapfile " They're just annoying. Who likes them?

" don't nag me when hiding buffers
set hidden " allow me to have buffers with unsaved changes.
set autoread " when a file has changed on disk, just load it. Don't ask.

" Make search more sane
set ignorecase " case insensitive search
set smartcase " If there are uppercase letters, become case-sensitive.
set incsearch " live incremental searching
set showmatch " live match highlighting
set hlsearch " highlight match,s
set gdefault " use the `g` flag by default.

" allow the cursor to go anywhere in visual block mode.
set virtualedit+=block

" leader is a key that allows you to have your own "namespace" of keybindings.
" You'll see it a lot below as <leader>
let mapleader = ","

" So we don't have to press shift when we want to get into command mode.
nnoremap ; :
vnoremap ; :

" create new vsplit, and switch to it.
noremap <leader>v <C-w>v

" Clear match highlighting
noremap <leader><space> :noh<cr>:call clearmatches()<cr>

" Quick buffer switching - like cmd-tab'ing
nnoremap <leader><leader> <c-^>

" Visual line nav, not real line nav
" If you wrap lines, vim by default won't let you move down one line to the
" wrapped portion. This fixes that.
noremap j gj
noremap k gk

" Plugin settings:

" Turn on the status bar at all times.
set laststatus=2

" ColorScheme
set number
set background=dark
colorscheme gruvbox 

" Configure netrw
let g:netrw_liststyle = 3
let g:netrw_banner = 0
" autocmd vimenter * NERDTree " Start NERDTree when launching Vim
autocmd vimenter * wincmd p

"Map NerdTREE
map <C-n> :NERDTreeToggle<CR>
let NERDTreeQuitOnOpen = 1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1

"Quit if I'm really done
function! s:CloseIfOnlyControlWinLeft()
  if winnr("$") != 1
    return
  endif
  if (exists("t:NERDTreeBufName") && bufwinnr(t:NERDTreeBufName) != -1)
        \ || &buftype == 'quickfix'
    q
  endif
endfunction
augroup CloseIfOnlyControlWinLeft
  au!
  au BufEnter * call s:CloseIfOnlyControlWinLeft()
augroup END

set encoding=utf8
let g:airline_powerline_fonts=1
