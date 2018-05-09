if v:lang =~ "utf8$" || v:lang =~ "UTF-8$"
   set fileencodings=ucs-bom,utf-8,latin1
endif

" 设置vim主题为molokai主题
let g:molokai_original = 1
let g:rehash256 = 1

" 设置状态栏主题风格
let g:Powerline_colorscheme='solarized256'

set nocompatible	" Use Vim defaults (much better!)
set bs=indent,eol,start		" allow backspacing over everything in insert mode
"set ai			" always set autoindenting on
"set backup		" keep a backup file
set viminfo='20,\"50	" read/write a .viminfo file, don't store more
			" than 50 lines of registers
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time

set autowrite

set noic

" -----------个人设置-----------
filetype on 

set ts=4                " tab所占空格数
set shiftwidth=4        " 自动缩进所使用的空格数
set expandtab           " 用空格替换tab
set autoindent          " 自动缩进
set smartindent         " C语言缩进
set number              " 显示行号
set ignorecase          " 搜索忽略大小写
set incsearch           " 输入字符串就显示匹配点
set showtabline=2       " 总是显示标签页
set noswf               " 不使用交换文件
set foldmethod=marker   " 对文中的标志折叠

set clipboard=unnamed   " 系统剪贴板的设置

" vim zsh的补全方式
set wildmenu
set wildmode=full

if has("mouse")
    set mouse=iv  " 在 insert 和 visual 模式使用鼠标定位
endif

" -------------颜色配置-------------
" 补全弹出窗口
" hi Pmenu ctermbg=lightmagenta
" 补全弹出窗口选中条目
hi PmenuSel ctermbg=yellow ctermfg=black

" -------------键盘映射-------------
" F3 查找当前高亮的单词
inoremap <F3> *<Esc>:noh<CR>:match Todo /\k*\%#\k*/<CR>v
vnoremap <F3> *<Esc>:noh<CR>:match Todo /\k*\%#\k*/<CR>v

" F4 在paste和非paste模式之间切换
set pastetoggle=<F4>

" Ctrl+\ 取消缩进
inoremap <C-\> <Esc><<i

" 在vim中调用make进行编译，如果出错，会自动打开QuickFix窗口
nnoremap <F5> :w<CR>:make<CR><CR>:cw<CR>
nnoremap <F6> :!make clean<CR>
" 跳转到上一个或下一个错误
nnoremap <F7> :cp<CR>
nnoremap <F8> :cn<CR>

" 行号显示
nnoremap <silent> mu :set nonu<CR>
nnoremap <silent> mi :set nu<CR>

" 保存按键映射
nnoremap <silent>ss :w <CR>

" tab 操作
nnoremap <silent> <C-l> :tabnext<CR>
nnoremap <silent> <C-h> :tabprev<CR>
for n in range(1,9)
    execute 'nnoremap <silent> <C-n>'.n ':tabnext '.n.'<CR>'
endfor

" change mapleader
let mapleader = ","

" 将当前 QuickFix中的文件在新的 tab 页中打开
nnoremap <C-t>t  <C-W><CR><C-W>T
" 将当前 QuickFix中的文件在新的窗口中以水平分隔的方式打开
nnoremap <C-t>v <C-W><CR><C-W>H<C-W>b<C-W>J<C-W>t

" key-bind for go
au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap <leader>c <Plug>(go-coverage)
au FileType go nmap <Leader>d <Plug>(go-def-vertical)
au FileType go nmap <Leader>s <Plug>(go-implements)
au FileType go nmap gi :GoImports<CR>
au FileType go nmap gl :GoMetaLinter<CR>
au FileType go nmap gc :GoCallees<CR>
au FileType go nmap gr :GoReferrers<CR>

" -------------插件设置------------
" winmanager 的样式设置，包括taglist
let g:winManagerWindowLayout='NERDTree|Tagbar'

" 设置窗口宽度
let g:winManagerWidth = 30

"gitgutter max
let g:gitgutter_max_signs = 500000  

nnoremap <Leader>m :WMToggle<CR>

let g:Tagbar_title = "[Tagbar]"
function! Tagbar_Start()
    exe 'q'
    exe 'TagbarOpen'
endfunction

function! Tagbar_IsValid()
    return 1
endfunction

let g:NERDTree_title = "[NERDTree]"
function! NERDTree_Start()  
    exe 'q'
    exec 'NERDTree'  
endfunction

function! NERDTree_IsValid()  
    return 1  
endfunction

" Visual-Mark
" 下一个标签
nmap mn <F2>
" 上一个标签
nmap mp <S-F2>

" neocomplcache
let g:neocomplcache_enable_at_startup = 1                 " 设置为自动启用补全
let g:neocomplcache_enable_auto_select = 1
let g:neocomplcache_enable_smart_case = 1
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'
let g:neocomplcache_enable_auto_delimiter = 1
let g:neocomplcache_enable_fuzzy_completion = 1

" vim-go
let g:go_highlight_trailing_whitespace_error = 0
let g:go_fmt_fail_silently = 1  " 退出时如果语法出错不提醒
let g:go_fmt_autosave = 1       " 保存时自动执行gofmt

" gocode
imap <C-o> <C-x><C-o>

" let ag instead of ack
if executable('ag')
    let g:ackprg = 'ag --vimgrep'
endif
nnoremap <Leader>a :Ack!<Space>

" ctrlp
let g:ctrlp_clear_cache_on_exit = 1
let g:ctrlp_mruf_max            = 500
let g:ctrlp_custom_ignore = 'DS_Store\|\.git\|\.hg\|\.svn\|optimized\|compiled\|node_modules\|bower_components'
let g:ctrlp_open_new_file       = 1

" tagbar
nnoremap <silent> <Leader>w :TagbarToggle<CR>

"nerdtree
nnoremap <silent> <Leader>e :NERDTreeToggle<CR>
let g:vimfiler_as_default_explorer = 1
let g:vimfiler_safe_mode_by_default = 0

" nerdcommenter
" 注释的时候自动加个空格, 强迫症必配
let g:NERDSpaceDelims=1

" vundle 插件管理器的设置
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Plugins
" Vundle
Plugin 'VundleVim/Vundle.vim'
" 窗口管理器
Plugin 'winmanager'
" 标签工具
Plugin 'Visual-Mark'
" 代码补全工具
Plugin 'neocomplcache'
" golang插件
Plugin 'fatih/vim-go'
" ack搜索
Plugin 'mileszs/ack.vim'
" 快速文件打开工具
Plugin 'ctrlpvim/ctrlp.vim'
" markdown
Plugin 'tpope/vim-markdown'
" go autocompletion
Plugin 'nsf/gocode', {'rtp': 'vim/'}
" 和 taglist 类似
Plugin 'majutsushi/tagbar'
le" 目录显示
Plugin 'scrooloose/nerdtree'
" git 有文件修改，会有绿色加号显示
Plugin 'airblade/vim-gitgutter'

"Airline: 小巧美观的状态栏。
Plugin 'bling/vim-airline'

Plugin 'Raimondi/delimitMate'
"Commentary: 快速注释。
Plugin 'tpope/vim-commentary'

"Tabular: 自动对齐。
Plugin 'godlygeek/tabular'

" 快速搜索跳转
Plugin 'easymotion/vim-easymotion'

"python
Plugin 'vim-scripts/indentpython.vim'

"自动格式化
Plugin 'tell-k/vim-autopep8'

"状态栏高亮 
Plugin 'Lokaltog/vim-powerline'

Plugin 'scrooloose/nerdcommenter'


call vundle#end()

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

let g:Tlist_Ctags_Cmd='/usr/local/bin/ctags'

" 自动补全设置
let g:neocomplcache_enable_at_startup = 1

" tlist 的配置
let Tlist_Show_One_File = 1            "只显示当前文件的taglist，默认是显示多个
let Tlist_Exit_OnlyWindow = 1          "如果taglist是最后一个窗口，则退出vim
let Tlist_Use_Right_Window = 1         "在右侧窗口中显示taglist
let Tlist_GainFocus_On_ToggleOpen = 1  "打开taglist时，光标保留在taglist窗口
let Tlist_Ctags_Cmd='/usr/local/bin/ctags'  "设置ctags命令的位置
nnoremap <leader>tl : Tlist<CR>    

"自动补全的插件 for go docstring ", 特别有用
au FileType go let b:delimitMate_nesting_quotes = ['"']
au FileType mail let b:delimitMate_autoclose = 0


" golang代码右侧的概览图
let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
\ }
" 右侧的属性预览
nmap <F8> :TagbarToggle<CR>

" 更改快捷键 https://github.com/Lokaltog/vim-easymotion
map s <Plug>(easymotion-prefix)
"map ff <Plug>(easymotion-s)
"map fs <Plug>(easymotion-f)
"map fl <Plug>(easymotion-lineforward)
"map fj <Plug>(easymotion-j)
"map fk <Plug>(easymotion-k)
"map fh <Plug>(easymotion-linebackward)
map J <Plug>(easymotion-overwin-w)
" 忽略大小写
let g:EasyMotion_smartcase = 1
"python 高亮
let python_highlight_all=1

"缩进指示线"
let g:indentLine_char='┆'
let g:indentLine_enabled = 1

"autopep8设置"
let g:autopep8_disable_show_diff=1

filetype plugin on

"通过以下的配置可以避免缓冲区的内容被删除的文本内容所覆盖（放到~/.vimrc文件的最后）
" vp doesn't replace paste buffer
function! RestoreRegister()
  let @" = s:restore_reg
  return ''
endfunction
function! s:Repl()
  let s:restore_reg = @"
  return "p@=RestoreRegister()<cr>"
endfunction
vmap <silent> <expr> p <sid>Repl()

" vi下不能用tmux的问题
" set term=builtin_ansi
"
"
" cscope
" 代码查找,查看某个函数在什么地方被调用的快速搜索工具,非常方便,类似于ctag
cs add cscope.out
