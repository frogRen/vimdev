"个人vim配置 (renzhenguo@moxiu.net)

" 插件管理器的配置
" https://github.com/junegunn/vim-plug,
" http://vim-scripts.org/vim/scripts.html)
"
call plug#begin('~/.vim/plugged')
" 目录管理
Plug 'scrooloose/nerdtree',{ 'tag': '4.1.0' }
"php代码补全
Plug 'ervandew/supertab'
"Plug 'phpvim/phpcd.vim', { 'for': 'php' , 'do': 'composer update' }  "只能用于NeoVim
"phpcs插件
Plug 'bpearson/vim-phpcs'
" 用来显示索引进度的插件
Plug 'vim-scripts/progressbar-widget'
"配色
"Plug 'nanotech/jellybeans.vim',
Plug 'vim-scripts/jellybeans.vim'
"tagbar管理
Plug 'majutsushi/tagbar'
Plug 'kien/ctrlp.vim'
"自动注释
"Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'scrooloose/nerdcommenter'
Plug 'tobyS/vmustache'
Plug 'tobyS/pdv'

call plug#end()

"基本配置
"syntax on  
"filetype plugin on
"set nocompatible
set nu "显示行号
set ruler "在右下角显示光标的坐标
set hlsearch "高亮显示搜索结果
set incsearch "边输边搜，即时更新搜索结果
set showcmd "在ruler左边显示当前正在输入的命令
set expandtab "将tab键改为空格，默认是8个
set tabstop=4 "将tab键改为4个空格
set shiftwidth=4 "自动缩进时，使用4个空格，默认是8个
set cindent "使用C语言的规则自动缩进
"set modeline "自动识别文件格式
set fdm=indent "代码折叠
set nofoldenable
colorscheme jellybeans
"上一个/下一个标签页切换的快捷键
nmap - <ESC>:tabprevious<RETURN>
nmap = <ESC>:tabnext<RETURN>


"NERDTREE插件配置
let NERDTreeWinSize=24
let NERDTreeShowBookmarks=1
let NERDTreeChDirMode=2
nmap <F2> <ESC>:NERDTreeToggle<RETURN>
nmap \ <ESC>:NERDTreeToggle<RETURN>

"PHPCD插件配置
"autocmd FileType php setlocal omnifunc=phpcd#CompletePHP
autocmd FileType php set sw=4
autocmd FileType html set sw=2
autocmd FileType js set sw=2
autocmd FileType vue set sw=2

au BufRead,BufNewFile *.vue set filetype=html

" tagbar配置
nmap <F3> <ESC>:TagbarToggle<RETURN>
nmap <F4> <ESC>:w<RETURN>:b#<RETURN>
"set tags=tags
"set autochdir
"let g:tagbar_left = 0
"let g:tagbar_width = 24
"let g:tagbar_autoclose = 1
"let g:tagbar_autofocus = 1
"let g:tagbar_sort = 1

" pdv 配置
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

let g:pdv_template_dir = $HOME . "/.config/nvim/config/pdv_template"

nmap <C-k> :call pdv#DocumentWithSnip()<CR>
nnoremap <buffer> <C-j> :call pdv#DocumentWithSnip()<CR>

nmap <F10> <ESC>:CodeSniff<RETURN>

if exists('$TMUX')
    set term=screen-256color
endif
