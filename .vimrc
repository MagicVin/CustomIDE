set nocompatible              " required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
"安装gmarik/Vundle.vim插件
Plugin 'gmarik/Vundle.vim'
"安装tmhedberg/SimpyFold插件
Plugin 'tmhedberg/SimpylFold'
let g:SimpylFold_docstring_preview=1


" Add all your plugins here (note older versions of Vundle used Bundle instead of Plugin)
Plugin 'vim-scripts/indentpython.vim'
au BufRead,BufNewFile .py,.pyw,.c,.h match BadWhitespace /\s\+$/


Bundle 'Valloric/YouCompleteMe'
let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

Plugin 'scrooloose/syntastic'
Plugin 'nvie/vim-flake8'
let python_highlight_all=1
syntax on
Plugin 'jnurmine/Zenburn'
Plugin 'altercation/vim-colors-solarized'


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on  " required

set splitbelow
set splitright
"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
"Enable folding
set foldmethod=indent
set foldlevel=99
"Enable folding with the spacebar
nnoremap <space> za

au BufNewFile,BufRead *.py
\ set tabstop=4 |
\ set softtabstop=4 |
\ set shiftwidth=4 |
\ set textwidth=79 |
\ set expandtab |
\ set autoindent |
\ set fileformat=unix |

" au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/
set encoding=utf-8



if has('gui_running')
	set background=dark
	colorscheme solarized
else
    colorscheme zenburn
endif
call togglebg#map("<F5>")
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree
Plugin 'kien/ctrlp.vim'
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
set clipboard=unnamed
let g:ycm_pythonn_binary_path = '/usr/bin/python3'
let g:ycm_server_keep_logfiles = 1
let g:ycm_log_level = 'debug'
"基于缩进或语法进行代码折叠
"set foldmethod=indent
"set foldmethod=syntax
" 启动 vim 时关闭折叠代码
"set nofoldenable
"
"按F5运行Python
map <F5> :Autopep8<CR> :w<CR> :call RunPython()<CR> 
function RunPython() 
	let mp = &makeprg 
	let ef = &errorformat 
	let exeFile = expand("%:t") 
	setlocal makeprg=python\ -u 
	set efm=%C\ %.%#,%A\ \ File\ \"%f\"\\,\ line\ %l%.%#,%Z%[%^\ ]%\\@=%m 
	silent make % 
	copen let &makeprg = mp 
	let &errorformat = ef 
endfunction


"F2开启和关闭树" 
map <F2> :NERDTreeToggle<CR> 
let NERDTreeChDirMode=1
""显示书签" 
let NERDTreeShowBookmarks=1 
"设置忽略文件类型" 
let NERDTreeIgnore=['\~$', '\.pyc$', '\.swp$'] 
"窗口大小"
let NERDTreeWinSize=25


"默认配置文件路径
let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'
"python解释器路径"
let g:ycm_path_to_python_interpreter='/usr/bin/python3'
"开启语义补全
let g:ycm_seed_identifiers_with_syntax=1
let g:ycm_server_python_interpreter = '/usr/bin/python'
