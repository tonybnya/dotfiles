set omnifunc=javascriptcomplete#CompleteJS
set omnifunc=htmlcomplete#CompleteTags
set omnifunc=csscomplete#CompleteCSS

"For vim-prettier
packloadall

" enable syntax highlighting
" syntax on
syntax enable

" disable compatibility with vi which can cause unexpected issues
set nocompatible
set fileformat=unix
set encoding=utf-8

" whenever I open a new buffer for a .py file, tabs are 4 spaces long
au BufNewFile,BufRead *.py
            \ set tabstop=4 |
            \ set softtabstop=4 |
            \ set shiftwidth=4 |

" whenever I open a new buffer for a .c file, tabs are 8 spaces long
au BufNewFile,BufRead *.c
            \ set tabstop=8 |
            \ set softtabstop=8 |
            \ set shiftwidth=8 |

" if file is not .py, fall back to global tab settings
set tabstop=4
set softtabstop=4
set shiftwidth=4
set autoindent
set smartindent
set cindent
set smarttab
set expandtab
set mouse=a
" add numbers to each line on the left-hand side
set number
" set relativenumber
" highlight cursor line underneath the cursor horizontally
" set cursorline
" highlight cursor line underneath the cursor vertically
" set cursorcolumn
" enable the left-most column where the error is marked
set signcolumn=yes
" do not save backup files
set nobackup
" do not wrap lines, allow long lines to extend as far as the line goes
set nowrap
" do not let cursor scroll below or above N number of lines when scrolling
set scrolloff=8
" show the command I'm currently typing on the bottom-right of the screen
set showcmd
" show the mode you are on the last line
set showmode
" enable type file detection
filetype on
set backspace=indent,eol,start
set hidden
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
" plugin on Github repo
Plugin 'tpope/vim-fugitive'
" Git plugin not hosted on Github
Plugin 'git://git.wincent.com/command-t.git'
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
Plugin 'ambv/black'
Plugin 'wakatime/vim-wakatime'
Plugin 'chiel92/vim-autoformat'
Plugin 'mattn/emmet-vim'
Plugin 'loremipsum'
Plugin 'rust-lang/rust.vim'
Plugin 'racer-rust/vim-racer'
" All of your Plugins must be added before the following line
call vundle#end()
" to use FZF in Vim
set rtp+=/usr/local/opt/fzf
filetype plugin indent on
call plug#begin('~/.vim/plugged')
" Surrounding command -> ysw)
Plug 'http://github.com/tpope/vim-surround' 
" \subsection*{(a) $H_0: \gamma = 1$}
Plug 'https://github.com/tpope/vim-commentary' " For Commenting gcc & gc
Plug 'https://github.com/vim-airline/vim-airline' " Status bar
Plug 'https://github.com/preservim/nerdtree' " NerdTree
Plug 'https://github.com/ap/vim-css-color' " CSS Color Preview
Plug 'https://github.com/rafi/awesome-vim-colorschemes' " Retro Scheme
Plug 'https://github.com/ryanoasis/vim-devicons' " Developer Icons
Plug 'https://github.com/tc50cal/vim-terminal' " Vim Terminal
Plug 'https://github.com/preservim/tagbar' " Tagbar for code navigation
Plug 'https://github.com/terryma/vim-multiple-cursors' " CTRL + N for multiple cursors
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/nerdtree'
Plug 'turbio/bracey.vim'
Plug 'github/copilot.vim'
Plug 'sheerun/vim-polyglot'
Plug 'morhetz/gruvbox'
Plug 'sheerun/vim-polyglot'
Plug 'mattn/emmet-vim'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'dense-analysis/ale'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'preservim/tagbar'
Plug 'junegunn/fzf' | Plug 'junegunn/fzf.vim'
Plug 'SirVer/ultisnips'
Plug 'yggdroot/indentline'
Plug 'sonph/onehalf', { 'rtp': 'vim' }
Plug 'bluz71/vim-nightfly-guicolors'
" post install (yarn install | npm install) then load plugin only for editing
" supported files
Plug 'prettier/vim-prettier', { 'do': 'yarn install --frozen-lockfile --production' }
" lightline - a light & configurable statusline/tabline plugin for Vim
Plug 'itchyny/lightline.vim'
Plug 'rust-lang/rust.vim'

Plug 'mhinz/vim-startify'

" https://eliasjuremalm.com/blog/how-to-get-started-with-vim-for-web-development-in-2021
Plug 'itchyny/lightline.vim'
Plug 'scrooloose/nerdtree'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'

Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
Plug 'jparise/vim-graphql'

Plug 'neoclide/coc-css'
Plug 'neoclide/coc-html'

Plug 'folke/zen-mode.nvim'

"PlugInstall
"PlugUpdate
"PlugStatus
"PlugClean
"PlugUpgrade

call plug#end()

" Keybindings for NERDTree: CTRL+f, CTRL+n, CTRL+t
nnoremap <C-f> :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>

nmap <F8> :TagbarToggle<CR>

" set completeopt-=preview " For No Previews

let g:NERDTreeDirArrowExpandable="+"
let g:NERDTreeDirArrowCollapsible="~"

let g:prettier#config#single_quote = 'true'
let g:prettier#config#trailing_comma = 'all'

set autoread | au CursorHold * checktime | call feedkeys("lh")
" set guifont=Hack:h14
set printfont=Hack:h10
" while searching a file incrementally highlight matching characters
set incsearch
" ignore capital letters during search
set ignorecase
" override the ignorecase option if searching for capital letters
" this will allow to search specifically for capital letters
set smartcase
" show matching words during a search
set showmatch
" use highlighting when doing a search
set hlsearch
" set the commands to save in history, default number is 20
set history=100
" enable autocompletion menu after pressing TAB
set wildmenu
" make wildmenu behave like similar to Bash completion
set wildmode=list:longest
" there are certain files that we would never want to edit with Vim
" wildmenu will ignore files with these extensions
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx
retab
set textwidth=79
"let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall
"All the languages Kite supports
"let g:kite_supported_languages = ['*']
let python_highlight_all=1
"Python, JavaScript, Go
let g:kite_supported_languages = ['python', 'javascript', 'go', 'php', 'c', 'rust']
" Enable Vim's built-in auto-completion tool for JavaScript
set omnifunc=javascriptcomplete#CompleteJS
"command! -bang LiveReload('*', {'toggle': 1, 'autoread': <bang>0})
"call LiveReload('*', {'toggle': 1, 'autoread': <bang>0})
let g:airline_powerline_fonts = 1
let g:NERDTreeDirArrowExpandable = '▶︎'
let g:NERDTreeDirArrowCollapsible = '▼'
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" -- COLOR & THEME CONFIG
set termguicolors
let g:gruvbox_italic=1
colorscheme gruvbox
" colorscheme nightfly
" colorscheme afterglow
" Customize afterglow theme
" let g:afterglow_blackout=1
" let g:afterglow_italic_comments=1
" let g:afterglow_use_italics=0
" let g:afterglow_inherit_background=1

" Show spelling mistakes
set spell

set background=dark
hi Normal guibg=NONE ctermbg=NONE
hi Normal guifg=NONE ctermfg=NONE
" hi Comment guibg=#FFFFFF guifg=#272727
" let g:terminal_ansi_colors = [
"     \ '#282828', '#cc241d', '#98971a', '#d79921',
"     \ '#458588', '#b16286', '#689d6a', '#a89984',
"     \ '#928374', '#fb4934', '#b8bb26', '#fabd2f',
"     \ '#83a598', '#d3869b', '#8ec07c', '#ebdbb2',
" \]
" hi Normal guifg=#bbbbbb guibg=#333333 gui=NONE
