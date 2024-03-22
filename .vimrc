" ******************************
" ******  基本配置  ************
" ******************************
"
"设置vim剪贴板等于系统剪贴板
set clipboard=unnamed
"
" 设置自动换行
set textwidth=80

" 在图形界面下，自动切换输入法
" set noimdisable
"
" 启用行号和相对行号
set number
set relativenumber
" 设置行号宽度,注意是行号
set numberwidth=5

" 设置显示光标位置
set ruler

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
" 忽略大小写
set ic
" 设置列宽为80时有一个标记
set colorcolumn=80

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

" 光标在屏幕上最少保留3行
set scrolloff=3



" ******************************
" ******  键位配置  ************
" ******************************

" 将空格键设置为 Leader 键
let mapleader = "\<Space>"

" 设置打开vimrc和更新vimrc快捷键
nnoremap <Leader>ev :e ~/.vimrc<CR>
nnoremap <Leader>sv :source ~/.vimrc<CR>
nnoremap <Leader>p :Prettier<CR>
nnoremap <Leader><ESC> :nohl<CR>       " 取消高亮
nnoremap <Leader><Space> :
cnoreabbrev q q!

" inoremap <Leader><Space> <ESC>
nnoremap <leader>n :NERDTreeFocus<CR>
" 设置复制粘贴选项。
" 1、保留vim正常的复制粘贴
" 2、从vim复制到系统是leader+y, 单行复制和v选中之后复制都可以
" 3、从系统到vim是插入模式下的M+v
"nnoremap <Leader>y :let @+ = getline('.')<CR>
"vnoremap <Leader>y "+y

" 回车时取消高亮
nnoremap <CR> :noh<CR><CR>

" 设置tb等于tabnew
" command! -nargs=* Tb tabnew <args>
nnoremap tb :tabnew<CR>













" ******************************
" ******  插件配置  ************
" ******************************
"
call plug#begin()
Plug 'ybian/smartim'
Plug 'neoclide/coc.nvim'
" Plug 'tpope/vim-surround'
Plug 'python-mode/python-mode', { 'for': 'python', 'branch': 'develop' }
Plug 'preservim/nerdtree'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'honza/vim-snippets'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
" post install (yarn install | npm install) then load plugin only for editing supported files
Plug 'prettier/vim-prettier', {
            \ 'do': 'yarn install --frozen-lockfile --production',
            \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'svelte', 'yaml', 'html'] }
call plug#end() 


" 设置smartim 在返回normal模式时，切换输入法
let g:smartim_default='com.apple.keylayout.ABC'
" let g:smartim_default='com.apple.keylayout.US'


" 激活 NERD Commenter 插件
let g:NERDCreateDefaultMappings = 1
" 注释的时候自动加个空格, 强迫症必配
let g:NERDSpaceDelims=1







" 设置 coc-snippets 快捷键
" Use <C-l> for trigger snippet expand.
imap <C-l> <Plug>(coc-snippets-expand)
" Use <C-j> for select text for visual placeholder of snippet.
vmap <C-j> <Plug>(coc-snippets-select)
" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-j>'
" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-k>'
" Use <C-j> for both expand and jump (make expand higher priority.)
imap <C-j> <Plug>(coc-snippets-expand-jump)
" Use <leader>x for convert visual selected code to snippet
xmap <leader>x  <Plug>(coc-convert-snippet)


" 设置正定义css样式
let g:mkdp_markdown_css = '/Users/jinfeng/.vim/plugged/markdown-preview.nvim/css/wbm.css'




" ******************************
" ******  一键运行  ************
" ******************************
map <F5> :call CompileRunGcc()<CR>
func! CompileRunGcc()
    exec "w"
    if &filetype == 'c'
        exec "!g++ % -o %<"
        exec "!time ./%<"
    elseif &filetype == 'cpp'
        exec "!g++ % -o %<"
        exec "!time ./%<"
    elseif &filetype == 'java'
        exec "!javac %"
        exec "!time java %<"
    elseif &filetype == 'sh'
        :!time bash %
    elseif &filetype == 'python'
        exec "!time python3 %"
    elseif &filetype == 'html'
        " exec "!safari % &"
         exec "!open -a Safari % &"
    elseif &filetype == 'go'
        "exec "!go build %<"
        exec "!time go run %"
    elseif &filetype == 'mkd'
        exec "!start microsoft-edge:% &"
        " exec "!~/.vim/markdown.pl % > %.html &"
        " exec "!start microsoft-edge:% &"
        exec "!open -a Safari % &"
    endif
endfunc

