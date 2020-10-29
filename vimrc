" Bryan Hooper's  .vimrc
" v0.6 2020-05-31
" A slimmed down version for a new mac (Zech!)

set nocompatible 

" Plugins 
call plug#begin('~/.vim/plug-ins')

" Gruvbox colorscheme..and pretiier for some reason 
Plug 'morhetz/gruvbox'
Plug 'prettier/vim-prettier'

" Support for easily toggling comments.
Plug 'tpope/vim-commentary'

" Auto pair brackets, parens, quotes
Plug 'jiangmiao/auto-pairs'

" Add fuzzy finder
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Markdown support.
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'

" This plugin provides the Airline status bar at the bottom of the screen.
Plug 'bling/vim-airline'

" Syntax Highlighting
Plug 'sheerun/vim-polyglot'

" Code Completion
Plug 'neoclide/coc.nvim', {'branch': 'release'}

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

" FORMATTERS
let g:prettier#autoformat = 0
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue PrettierAsync

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

" Reasonable split navigation
 nnoremap <C-J> <C-W><C-J>
 nnoremap <C-K> <C-W><C-K>
 nnoremap <C-L> <C-W><C-L>
 nnoremap <C-H> <C-W><C-H>

 " Reasonable split openings
 set splitbelow
 set splitright

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
autocmd vimenter * colorscheme gruvbox

" Configure netrw
let g:netrw_liststyle = 3
let g:netrw_banner = 0
" autocmd vimenter * NERDTree " Start NERDTree when launching Vim - don't
" really like this feature....

"Map NerdTREE
map <C-n> :NERDTreeToggle<CR>
let NERDTreeQuitOnOpen = 1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1

" FZF and navigation key bindings
nnoremap <silent> <leader>f :Files<CR>
nnoremap <silent> <leader>a :Buffers<CR>
nnoremap <silent> <leader>s :Rg<CR>

" Set up for COC
set cmdheight=2
set updatetime=300
set shortmess+=c
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction


if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

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
