" ******************************
" ******  基本配置  ************
" ******************************
"
" 在图形界面下，自动切换输入法
" set noimdisable
"
" 启用行号和相对行号
set number
set relativenumber

" 高亮显示当前行
set cursorline

" 启用搜索时实时高亮
set hlsearch

" 忽略大小写搜索
set ignorecase

" 匹配时区分大小写
set smartcase

" 显示匹配的括号
set showmatch

" 启用语法高亮
syntax enable

" 设置配色方案（可根据个人喜好更改）
" colorscheme desert

"v启用自动缩进
set autoindent
set smartindent
set tabstop=4
set shiftwidth=4
set expandtab

" 显示行尾空格
set list
set listchars=trail:·

" 启用鼠标支持
" set mouse=a

" 启用代码折叠
" set foldmethod=indent
" set foldlevel=99

" 显示状态行
set laststatus=2

" 启用备份和交换文件
" set backup
" set backupdir=~/.vim/backup
" set directory=~/.vim/swap

" 启用自动补全
" set completeopt=menuone,noselect

" 启用文件类型检测
" filetype plugin indent on







" ******************************
" ******  键位配置  ************
" ******************************

" 将空格键设置为 Leader 键
let mapleader = "\<Space>"

" 设置打开vimrc和更新vimrc快捷键
nnoremap <Leader>ev :e ~/.vimrc<CR>
nnoremap <Leader>sv :source ~/.vimrc<CR>











" ******************************
" ******  插件配置  ************
" ******************************
"
call plug#begin()
Plug 'ybian/smartim'
Plug 'neoclide/coc.nvim'
Plug 'tpope/vim-surround'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
call plug#end() 


" 设置smartim 在返回normal模式时，切换输入法
 let g:smartim_default='com.apple.keylayout.ABC'
" let g:smartim_default='com.apple.keylayout.US'


