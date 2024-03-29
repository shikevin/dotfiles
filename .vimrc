set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'bling/vim-airline'
Plugin 'scrooloose/nerdtree'
Plugin 'flazz/vim-colorschemes'
Plugin 'walm/jshint.vim'
Plugin 'klen/python-mode'
Plugin 'kien/ctrlp.vim'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'vadimr/bclose.vim'
Plugin 'scrooloose/syntastic'
Plugin 'gcorne/vim-sass-lint'
Plugin 'yuezk/vim-js'
Plugin 'maxmellon/vim-jsx-pretty'
" Plugin 'Valloric/YouCompleteMe'
" Plugin 'davidhalter/jedi-vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'mileszs/ack.vim'
Plugin 'nvie/vim-flake8'
Plugin 'lervag/vimtex'
Plugin 'mustache/vim-mustache-handlebars'
Plugin 'kchmck/vim-coffee-script'
Plugin 'tpope/vim-surround'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo

" All of your Plugins must be added before the following line
call vundle#end()            " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" Ignore files from ctrlp
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . -co --exclude-standard', 'find %s -type f']

" linter/completion dependencies
let coffee_linter = '/usr/local/bin/coffeelint'

" Basic vimrc
" colorscheme Monokai
" syntastic config
let g:syntastic_cpp_compiler = 'g++'
let g:syntastic_cpp_compiler_options = ' -std=c++11'

" SASS
let g:syntastic_sass_checkers=["sasslint"]
let g:syntastic_scss_checkers=["sasslint"]

" use the local version of eslint for linting
if executable('node_modules/.bin/eslint')
    let g:syntastic_javascript_eslint_exec = 'node_modules/.bin/eslint'
endif
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_ruby_checkers = ['rubocop']

syntax enable
filetype plugin indent on    " required
let g:solarized_termcolors = 256  " New line!!
set background="dark"
set t_Co=256
colorscheme solarized

" Setup some default ignores
let g:ctrlp_custom_ignore = {
  \ 'dir':  'dist-*\|node_modules',
  \ 'file': '\v\.(exe|so|dll|class|png|jpg|jpeg)$',
\}

" OLD DIR IGNORE FOR CtrLP
" \ 'dir':  '\v[\/](\.(git|hg|svn)|\_site)$',

" Use the nearest .git directory as the cwd
" This makes a lot of sense if you are working on a project that is in
" control. It also supports works with .svn, .hg, .bzr.
let g:ctrlp_working_path_mode = 'r'

" NERDTREE IGNORE DIRECTORIES"
let g:NERDTreeIgnore=['\~$', 'dist-*']

" Use a leader instead of the actual named binding
nmap <leader>p :CtrlP<cr>

" Easy bindings for its various modes
nmap <leader>bb :CtrlPBuffer<cr>
nmap <leader>bm :CtrlPMixed<cr>
nmap <leader>bs :CtrlPMRU<cr>

" move between windows using ctl 
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" nerd tree stuff
map <C-n> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

syntax on

" THIS IS VERY IMPORTANT, NEW REGEX ENGINE IS SLOW AF
set re=1

" set clipboard=unnamedplus,unnamed,autoselect
set clipboard=unnamed
set smartindent
set tabstop=4
set shiftwidth=4
set expandtab
" Allow saving of files as sudo when I forgot to start vim using sudo.
cmap w!! w !sudo tee > /dev/null %
set cursorline
set cursorcolumn

set number
set relativenumber
set autoindent
set backspace=indent,eol,start " backspace over everything in insert mode

function! GlobalSeach()
    let text = escape(input("what do you want to seach?: "),  '\\/')
    if text == ""
        echo "" | return
    endif
    let extension = escape(input("Wich extension? (* for all): "), '\\/')
    if extension == ""
        echo "" | return
    endif

    let search_command = ':lvim /\V' . text . '/gj ./**/*.' . extension
    try
        execute search_command 
    catch
        echo "Nothing found"
        return
    endtry

    lwindow
endfunction

noremap <leader>F :call GlobalSeach() <CR>
autocmd FileType javascript setlocal shiftwidth=2 tabstop=2
autocmd Filetype css setlocal ts=2 sts=2 sw=2
autocmd Filetype html.handlebars setlocal ts=2 sts=2 sw=2
autocmd Filetype html setlocal ts=2 sts=2 sw=2
autocmd Filetype cpp setlocal ts=4 sts=4 sw=4
autocmd Filetype coffee setlocal ts=2 sts=2 sw=2
autocmd Filetype scss setlocal ts=2 sts=2 sw=2
autocmd Filetype ruby setlocal ts=2 sts=2 sw=2
autocmd Filetype python setlocal ts=4 sts=4 sw=4
" autocmd Filetype ruby setlocal ts=2 sts=2 sw=2
"
" allow edit jsx tags inside js files
let g:jsx_ext_required = 0
filetype indent on
