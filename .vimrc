" ******************************
" ******  基本配置  ************
" ******************************
"
"设置vim剪贴板等于系统剪贴板
set clipboard=unnamed

" 设置自动换行
set textwidth=72

" 设置长文本换行"
set sms

" 允许未保存时切换缓冲区（类似现代编辑器的行为）
" 也就是前一个文件没有保存，也可以打开新文件
set hidden

" 开启语法检测"
filetype plugin on
" 启用文件类型检测
filetype plugin indent on
"
"
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
colorscheme desert
" 忽略大小写
set ic


"v启用自动缩进
set autoindent
set smartindent
set tabstop=4
set expandtab
set shiftwidth=4
set softtabstop=4


" ==== 视觉换行配置（不修改文件内容） ====
set wrap                " 启用视觉换行（不插入真实换行符）
set linebreak           " 在单词边界处换行
" 换行分隔符（空格、符号等）
set breakat=\ \	!@*-+;:,./?^
"set showbreak=↪\        " 换行提示符（可选）
set textwidth=0         " 禁用自动插入换行符（关键！）
set wrapmargin=0        " 禁用右侧边距换行

"设置字体
set guifont=Monaco:h17
" set guifont=PingFang_C:h16,Menlo:h16
" set guifont=Menlo:h18


" 显示行尾空格
set list
set listchars=trail:·


" 启用代码折叠
" set foldmethod=indent
" set foldlevel=99


" 显示状态行
set laststatus=2


" 启用备份和交换文件
" set backup
" set backupdir=~/.vim/backup
" set directory=~/.vim/swap




" 光标在屏幕上最少保留5行 被jzz，kzz 代替
set scrolloff=20




" ******************************
" ******  键位配置  ************
" ******************************

" 将空格键设置为 Leader 键
let mapleader = "\<Space>"


" 设置打开vimrc和更新vimrc快捷键
nnoremap <Leader>ev :e ~/.vimrc<CR>
nnoremap <Leader>sv :source ~/.vimrc<CR>

nnoremap <Leader><Space> :
"
"
"
" 下面的 4 条命令其实都可以写成 nmap 
" nmap 是递归，nnoremap 是不递归
" 注意 nnoremap 和onoremap是不一样的，一个是正常模式，一个是命令模式
"
" 设置H为行首，L为行尾
nnoremap H ^
nnoremap L $
nnoremap dH d^
nnoremap dL d$

cnoreabbrev q q!


nnoremap <ESC> :noh<CR>



" ******************************
" ******  插件配置  ************
" ******************************
"
call plug#begin()
Plug 'ybian/smartim'
Plug 'dhruvasagar/vim-table-mode'
Plug 'preservim/nerdcommenter'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'preservim/nerdtree'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'honza/vim-snippets'
Plug 'habamax/vim-rst'
Plug 'hotoo/pangu.vim', { 'for': ['markdown', 'vimwiki', 'text'] }
let g:pangu_rule_date = 1
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
Plug 'prettier/vim-prettier', {
            \ 'do': 'yarn install --frozen-lockfile --production',
            \ 'for': ['javascript', 'typescript', 'md', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'svelte', 'yaml', 'html'] }
call plug#end() 



"========== smartim 设置 =========="
" 设置smartim 在返回normal模式时，切换输入法
" 使用鼠须管之后，这个插件可以不用了，但如果使用自带五笔还是要用
let g:smartim_default='com.apple.keylayout.ABC'


"========== Nerd 设置 =========="
" 激活 NERD Commenter 插件
let g:NERDCreateDefaultMappings = 1
" 注释的时候自动加个空格, 强迫症必配
let g:NERDSpaceDelims=1
" 使用nerdtree, 打开/关闭
nnoremap <leader>n :NERDTreeToggle<CR>
"
" cc 是加注释, c<space> (字母c+空格)是切换注释状态, cu 是取消注释, cA 是在尾部加注释



"========== vim-table 设置 =========="
" 设置 vim-table 使用reStructureText
"let g:table_mode_corner_corner='+'
"let g:table_mode_header_fillchar='='
" 设置tb等于tabnew
" command! -nargs=* Tb tabnew <args>
nnoremap tb :tabnew<CR>
" 这段 Vim 脚本代码是为 vim-table-mode 插件提供的**“自动激活 / 关闭表格
" 模式”的辅助功能**。它让你在插入模式中通过输入 || 来开启表格模式，
" 通过 __ 来关闭，非常方便。
function! s:isAtStartOfLine(mapping)
  let text_before_cursor = getline('.')[0 : col('.')-1]
  let mapping_pattern = '\V' . escape(a:mapping, '\')
  let comment_pattern = '\V' . escape(substitute(&l:commentstring, '%s.*$', '', ''), '\')
  return (text_before_cursor =~? '^' . ('\v(' . comment_pattern . '\v)?') . '\s*\v' . mapping_pattern . '\v$')
endfunction
" 开启插入模式使用||激活表格
let g:table_mode_always_active = 0
inoreabbrev <expr> <bar><bar>
          \ <SID>isAtStartOfLine('\|\|') ?
          \ '<c-o>:TableModeEnable<cr><bar><space><bar><left><left>' : '<bar><bar>'
inoreabbrev <expr> __
          \ <SID>isAtStartOfLine('__') ?
          \ '<c-o>:silent! TableModeDisable<cr>' : '__'
" 使用 tab 补全代码
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ CheckBackspace() ? "\<TAB>" :
      \ coc#refresh()
function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" ||（双竖线）触发 :TableModeEnable → 开启表格模式
" __（双下划线）触发 :TableModeDisable → 关闭表格模式







" 设置命令RstPreview保存rst文件，通过rst2html编译，并打开
command! RstPreview :w | !rst2html --stylesheet-path=$HOME/Documents/essay/css/obsidianrst.css % %:r.html && open %:r.html
" command! RstPreview :w | !rst2html % %:r.html && open %:r.html

"
"
"========== coc-snippets 设置 =========="
" 设置 coc-snippets 快捷键
" Use <C-l> for trigger snippet expand.
" imap <C-l> <Plug>(coc-snippets-expand)
" Use <C-j> for select text for visual placeholder of snippet.
" vmap <C-j> <Plug>(coc-snippets-select)
" Use <C-j> for jump to next placeholder, it's default of coc.nvim
" let g:coc_snippet_next = '<c-j>'
" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
" let g:coc_snippet_prev = '<c-k>'
" Use <C-j> for both expand and jump (make expand higher priority.)
imap <C-j> <Plug>(coc-snippets-expand-jump)
" Use <leader>x for convert visual selected code to snippet
" xmap <leader>x  <Plug>(coc-convert-snippet)
" 设置 tab 补全代码
let g:coc_snippet_next = '<tab>'







"========== markdow preview 设置 =========="
" 设置正定义css样式
let g:mkdp_markdown_css = '~/Documents/essay/obsidin.css'


"========== vim-prettier 设置 =========="
" 使用 vim-prettier + 自动格式化保存
" 自动保存时格式化
autocmd BufWritePre *.js,*.ts,*.jsx,*.tsx,*.json,*.md,*.css,*.scss,*.html PrettierAsync
" 使用 prettier 全局配置
let g:prettier#config#config_precedence = 'prefer-file'
" 如果找不到本地 .prettierrc，就用全局的 ~/.prettierrc
let g:prettier#config#config_path = expand('~/.prettierrc')
" 指定 prettier 可执行文件（可选）
let g:prettier#exec_cmd_path = 'prettier'



"========== NERDTreeToggle 设置 ========== "
" Create default mappings
let g:NERDCreateDefaultMappings = 1

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1

" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" Enable NERDCommenterToggle to check all selected lines is commented or not 
let g:NERDToggleCheckAllLines = 1



" ========== 设置 FZF ========== "
" 设置 leader-f 打开文件
noremap <Leader>f :Files ~<CR>
" 设置 leader-fb 打开buffter
noremap <Leader>fb :Buffers<CR>
" 默认 ctrl-t 通过 tab 打开
" 默认 ctrl-x 水平分屏打开
" 默认 ctrl-v 垂直分屏打开
"
"
"
" ========== 设置 pangu 插件 ==========
" 退出以下文件时，自动启用 pangu 插件检查中文格式
autocmd BufWritePre *.markdown,*.md,*.text,*.txt,*.wiki,*.cnx call PanGuSpacing('ALL')

" 日期使用紧凑格式
" “1 月 1 日”改为“1月1日”
let g:pangu_rule_date = 1

"
"
"
"





" " 设置不同模式下的光标样式（iTerm2 专用转义序列）
" if exists('$TMUX')
"   " 如果在 tmux 中运行，使用不同的转义序列
"   let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
"   let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
"   let &t_SR = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=2\x7\<Esc>\\"
" else
"   " 直接使用 iTerm2 转义序列
"   let &t_SI = "\<Esc>]50;CursorShape=1\x7"  " 插入模式：竖线
"   let &t_EI = "\<Esc>]50;CursorShape=0\x7"  " 普通模式：块状
"   let &t_SR = "\<Esc>]50;CursorShape=2\x7"  " 替换模式：下划线
" endif
"
" " 可选：设置不同模式下的光标颜色（需要 iTerm2 Build 3.3+） autocmd VimEnter,InsertLeave * silent !echo -ne "\e]1337;CursorColor=#ff0000\x7"
" autocmd InsertEnter * silent !echo -ne "\e]1337;CursorColor=#00ff00\x7"
" autocmd InsertEnter * if v:insertmode == 'replace' | silent !echo -ne "\e]1337;CursorColor=#ffff00\x7" | endif
" autocmd VimLeave * silent !echo -ne "\e]1337;CursorColor=#ffffff\x7"
" " 退出时恢复默认
"
" " 确保离开 Vim 后重置光标样式
" autocmd VimLeave * set guicursor=a:ver20-blinkon0
"





" 设置不同模式下的光标样式（iTerm2 专用转义序列）
if exists('$TMUX')
  " 如果在 tmux 中运行，使用不同的转义序列
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
  let &t_SR = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=2\x7\<Esc>\\"
else
  " 直接使用 iTerm2 转义序列
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"  " 插入模式：竖线
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"  " 普通模式：块状
  let &t_SR = "\<Esc>]50;CursorShape=2\x7"  " 替换模式：下划线
endif

" 改进：设置光标颜色的函数
function! s:SetCursorColor(color)
  if has('macunix') && $TERM_PROGRAM ==# 'iTerm.app'
    call system('printf "\033]1337;CursorColor=' . a:color . '\a"')
  endif
endfunction

" 自动根据模式设置颜色（Insert/Replace/Normal）
autocmd VimEnter,InsertLeave * call <SID>SetCursorColor('#ff0000')      " 普通模式：红色
autocmd InsertEnter * if v:insertmode ==# 'i' | call <SID>SetCursorColor('#00ff00') | endif  " 插入模式：绿色
autocmd InsertEnter * if v:insertmode ==# 'r' | call <SID>SetCursorColor('#ffff00') | endif  " 替换模式：黄色
autocmd VimLeave * call <SID>SetCursorColor('#ffffff')                  " 退出时恢复白色

" 可选：确保离开 Vim 后光标样式也恢复
autocmd VimLeave * set guicursor=a:ver20-blinkon0




