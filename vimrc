" Bryan Hooper's  .vimrc
" v0.3 2018-10-24
"

set nocompatible 
filetype off
" Set up Vundle
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'

" Vundle Plugins 

" Gobs and gobs of color schemes.....
Plugin 'flazz/vim-colorschemes'

" Fuzzy finder -- absolutely must have.
Plugin 'kien/ctrlp.vim'

" Ultisnips for snippet management - off for now because it's not working for
" me...
Plugin 'SirVer/ultisnips'

" Support for easily toggling comments.
Plugin 'tpope/vim-commentary'

" Markdown support.
" Plugin 'tpope/vim-markdown'
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'

" VIM support for Rails generators
Plugin 'tpope/vim-rails'
"VIM support for Bundler
Plugin 'tpope/vim-bundler'

" This plugin provides the Airline status bar at the bottom of the screen.
Plugin 'bling/vim-airline'

" The Nerd Tree plugin, plus cool icons for it 
Plugin 'scrooloose/nerdtree'
Plugin 'ryanoasis/vim-devicons'
Plugin 'Xuyuanp/nerdtree-git-plugin'

" YouCompleteMe for code completion
Plugin 'Valloric/YouCompleteMe'

" Fugitive allows managing git
Plugin 'tpope/vim-fugitive'

Plugin 'tpope/vim-dispatch'

" Rspec integration
Plugin 'thoughtbot/vim-rspec'

" TMUX runner for vim-rspec (and whatever else)...
Plugin 'christoomey/vim-tmux-runner'
Plugin 'christoomey/vim-tmux-navigator'

" Journaling related plugins
Plugin 'junegunn/goyo.vim'
Plugin 'reedes/vim-pencil'

" End Vundle - all plugins must be before this call
call vundle#end()


" We have to turn this stuff back on if we want all of our features.
syntax on " Syntax highlighting
filetype plugin indent on " Filetype auto-detection

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

" Set up for vim-rspec
noremap <Leader>t :call RunCurrentSpecFile()<cr>
noremap <Leader>s :call RunNearestSpec()<CR>
noremap <Leader>l :call RunLastSpec()<CR>
noremap <Leader>a :call RunAllSpecs()<CR>
nnoremap <leader>va :VtrAttachToPane<cr>
nnoremap <leader>ror :VtrReorientRunner<cr>
nnoremap <leader>sc :VtrSendCommandToRunner<cr>
nnoremap <leader>sl :VtrSendLinesToRunner<cr>
vnoremap <leader>sl :VtrSendLinesToRunner<cr>
nnoremap <leader>or :VtrOpenRunner<cr>
nnoremap <leader>kr :VtrKillRunner<cr>
nnoremap <leader>fr :VtrFocusRunner<cr>
nnoremap <leader>dr :VtrDetachRunner<cr>
nnoremap <leader>cr :VtrClearRunner<cr>
nnoremap <leader>fc :VtrFlushCommand<cr>
nnoremap <leader>sf :VtrSendFile<cr>
let g:rspec_command = "VtrSendCommandToRunner! rspec {spec}"



" Configure ultisnips - off for now because it's not working
let g:UltiSnipsExpandTrigger="<c-j>"

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
" Below are some 'sane' (IMHO) defaults for a couple of the above plugins I
" referenced.

" Let ctrlp have up to 30 results.
let g:ctrlp_max_height = 30

" Turn on the status bar at all times.
set laststatus=2

" Finally the color scheme. Choose whichever you want from the list in the
" link above (back up where we included the bundle of a ton of themes.)
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

" set up Pencil to work with filetypes automatically
" augroup pencil
"   autocmd!
"   autocmd FileType markdown,mkd call pencil#init()
"   autocmd FileType text         call pencil#init()
" augroup END

set encoding=utf8
set guifont=Droid\ Sans\ Mono\ for\ Powerline\ Plus\ Nerd\ File\ Types:h11
let g:airline_powerline_fonts=1
