<h1>Guide for build Python IDE base on Vim</br>


## Prebuilt preparation:

	Distributor ID:	Ubuntu
	Description:	Ubuntu 16.04.2 LTS
	Release:	16.04
	Codename:	xenial
	kernel:		4.8.0-58-generic
	Vim:		Vi IMproved 7.4
(Make sure your vim support python3:"+python3")


## Extend Vim:

## Recommend Bundle manager: Vundle

<h4>1.git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
####2.vim ~/.vimrc  

	set nocompatible              " required  
	filetype off                  " required  
	" set the runtime path to include Vundle and initialize  
	set rtp+=home/.vim/bundle/Vundle.vim  
	call vundle#begin()  
	" alternatively, pass a path where Vundle should install plugins  
	"call vundle#begin('~/some/path/here')  
	" let Vundle manage Vundle, required  
	Plugin 'gmarik/Vundle.vim'  
	" Add all your plugins here (note older versions of Vundle used Bundle instead of Plugin)  
	" All of your Plugins must be added before the following line  
	call vundle#end()            " required  
	filetype plugin indent on    " requireid
(recommend copy above file config)  
<h4>3.Install Vundle  
		  
		<h6>...bash...  
#vim  
(normal mode)  
:PluginInstall  
:q  
...bash...  
<h6>
(Vundle install complete)  
<h4>4.Make layout split,add two lines to ~/.vimrc later  
				
set splitbelow
set splitright  

(In vim normal mode you can type":vs filename"or ":sv filename" to open 
several textfiles in one textfile )  
<h4>5.Jump between splits with just one key combination  
add several lines to ~/.vimrc later  
		<h6>"split navigations
</br>nnoremap "<C-J> <C-W><C-J>"
</br>nnoremap "<C-K> <C-W><C-K>"
</br>nnoremap "<C-L> <C-W><C-L>"
</br>nnoremap "<C-H> <C-W><C-H>"  

</br>(Add them, you can use Ctrl + w[hjkl] to jump each splits)  
<h6></br>Ctrl-j move to the split below
</br>Ctrl-k move to the split above
</br>Ctrl-l move to the split to the right
</br>Ctrl-h move to the split to the left
</br>Ctrl-w move to the each split 
<h6>
<h6>
<h4>6.Enable Folding  
</br<h5>Add two lines to ~/.vimrc later  
		<h6>"Enable Folding
</br>set foldmethod=indent
</br>set foldlevel=99
</br>"Enable folding with the spacebar
</br>nnoremap <space> za  
<h6>
(In vim normal mode ,type ":za" to fold)
<h4>7.Add Python Indentation  
		<h6>add the following to your ~/.vimrc later  
au BufNewFile,BufRead *.py
 \ set tabstop=4 |
 \ set softtabstop=4 |
 \ set shiftwidth=4 |
 \ set textwidth=79 |
 \ set expandtab |
 \ set autoindent |
 \ set fileformat=unix |  
  
<h4>8.UTF8 Support,add the following to your ~/.vimrc  
		<h6>set encoding=utf-8  
<h4>9.Install bunldes for Vim
	<h5>1.0)  
	Install "Valloric/YouCompleteMe", add the following to your ~/.vimrc  
	<h6> Bundle 'Valloric/YouCompleteMe'
	 let g:ycm_autoclose_preview_window_after_completion=1
	 map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>   
	 (This steps will not easy,more try,don't give up!)	
	<h6>
	<h5>1.1)
		<h6> 
	`...bash...
	 # sudo apt-get install python-dev python3-dev
	 # cd ~/.vim/bundle/YouCompleteMe
	 # ./install.py`
	<h6>
	<h5>1.2)
	 download Clang+llvm from official address
	<h6> <1.2.0> # mkdir -p ~/ycm_temp/llvm_root_dir
	<h6> <1.2.1> # tar xvfJ clang+llvm-4.0.0-x86_64-linux-gnu-ubuntu-16.04.tar.xz -C ~/ycm_temp/llvm_root_dir
			(.tar.xz package must use "J" to extract)
	 <h6><1.2.2> # cd ~/ycm_temp/llvm_root_dir/clang+llvm-4.0.0-x86_64-linux-gnu-ubuntu-16.04/
	 <h6><1.2.3> # cmake -G "Unix Makefiles" -DPATH_TO_LLVM_ROOT=~/ycm_temp/llvm_root_dir . ~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp  
	(At this steps(1.2.3) ,you must install YCM(YouCompleteMe) in Vundle first)
	<h5>1.3)  
	Add the following to your ~/.vimrc later  
	 
	 `"set default path of config file
	 let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'
	 "python interpreter path"
	 let g:ycm_path_to_python_interpreter='/usr/bin/python3'
	 "Enable Python auto-complete
	 let g:ycm_seed_identifiers_with_syntax=1
	 let g:ycm_server_python_interpreter = '/usr/bin/python'

	 Plugin 'tmhedberg/SimpylFold'
	 let g:SimpylFold_docstring_preview=1
	 Plugin 'vim-scripts/indentpython.vim'
	 au BufRead,BufNewFile .py,.pyw,.c,.h match BadWhitespace /\s\+$/

	 Plugin 'scrooloose/syntastic'
	 Plugin 'nvie/vim-flake8'
	 let python_highlight_all=1
	 syntax on
	 Plugin 'jnurmine/Zenburn'
	 Plugin 'altercation/vim-colors-solarized'
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
`

The last:</br>
see .vimrc for more config command</br>
see https://github.com/MagicVin </br>
see  </br>


































