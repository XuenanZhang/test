
"""""""""""""""""""""""""""""""""""""""""
" 基础配置设置
""""""""""""""""""""""""""""""""""""""""""
filetype on                      "检测文件类型
filetype indent on               "针对不同的文件类型采用不同的缩进格式
filetype plugin on               "允许插件
filetype plugin indent on        "启动自动补全

set nu							 "设置行号
"set backup                       "开启自动保存 文件备份
"iset backupext=.bak               "备份文件后缀名修改
"set paste
"set relativenumber number        "相对行号，可用Ctrl+n在相对/绝对行号间切换
set history=2000                 "history存储长度
set nocompatible                 "非兼容vi模式,避免以前版本的一些bug和局限
set autoread                     "文件修改之后自动载入
"set shortmess=atI                "启动的时候不显示那个援助索马里儿童的提示
"set t_ti= t_te=                  "退出vim后，内容显示在终端屏幕
"set title                        "change the terminal's title
set novisualbell                 "don't beep
set noerrorbells                 "don't beep
set t_vb=
"set tm=500
set mat=2                        "Blink times every second when matching brackets
set showmatch                    "括号配对情况
set hidden                       "A buffer becomes hidden when it is abandoned
"set wildmode=list:longest
set ttyfast
"set wildignore=*.swp,*.,*.pyc,*.class
"set scrolloff=7                  "至少有7行在光标所在行上下
set mouse=n                     "为所有模式启用鼠标
set selection=old
"set selection=exclusive  
set selectmode=mouse,key
set viminfo^=%                   "Remember info about open buffers on close
set magic                        "正则表达式匹配形式
"set backspace=eol,start,indent  "Configure backspace so it acts as it should act
" set whichwrap+=<,>,h,l           " 允许backspace和光标键跨越行边界
set foldcolumn=0                 " 在行号前空出一列的宽度
set autowrite                    "在切换buffer时自动保存当前文件
" 打开一个文件自动定位到上一次退出的位置
if has("autocmd")
    au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" 语法
"""""""""""""""""""""""""""""""""""""""""
syntax enable                    "打开语法高亮
syntax on 
"set langmenu=zh_CN.UTF-8		 "语言设置
    
" 搜索
" """""""""""""""""""""""""""""""""""""""""
set hlsearch                     "高亮search命中的文本。
set ignorecase                   "搜索时忽略大小写
set incsearch                    "随着键入即时搜索
set smartcase                    "有一个或以上大写字母时仍大小写敏感

" 缩进
" """""""""""""""""""""""""""""""""""""""""
set smartindent                  "智能缩进
set autoindent                   "总是自动缩进
set tabstop=4                    "设置Tab键的宽度(等同的空格个数)
set shiftwidth=4                 "自动对齐的空格数
set softtabstop=4                "按退格键时可以一次删掉4个空格
set smarttab                     "insert tabs on the start of a line according to shiftwidth, not tabstop
set noexpandtab                  " 不要用空格代替制表符  
" set expandtab					 "将Tab自动转化成空格(需要输入真正的Tab键时,使用Ctrl+V+Tab)
set shiftround                   "Use multiple of shiftwidth when indenting with '<' and '>'
set cindent						 " 使用 C/C++ 语言的自动缩进方式
set cinoptions={0,1s,t0,n-2,p2s,(03s,=.5s,>1s,=1s,:1s "设置C/C++语言的具体缩进方式
set linebreak					 " 整词换行
set whichwrap=b,s,<,>,[,]		 " 光标从行首和行末时可以跳到另一行去
set scrolloff=5                  " 光标移动到buffer的顶部和底部时保持3行距离   "
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ %{strftime(\"%d/%m/%y\ -\ %H:%M\")}   "状态行显示内容
"set backspace=indent,eol,start

" 编码
" """""""""""""""""""""""""""""""""""""""""
" set encoding=utf-8 fileencodings=utf-8
set fencs=utf-8,ucs-bom,shift-jis,gb18030,gbk,gb2312,cp936  
set termencoding=utf-8           "这句只影响普通模式 (非图形界面) 下的Vim
set encoding=utf-8
set fileencodings=ucs-bom,utf-8,gbk,cucs-bom,up936,gb18030,gb2312,chinese,big5,euc-jp,euc-kr,latin1 " 自动判断编码时 依次尝试一下编码
set fileencoding=utf-8
set helplang=cn
set ffs=unix,dos,mac             "Use Unix as the standard file type
set formatoptions+=m			 "如遇Unicode值大于255的文本，不必等到空格再折行。
set formatoptions+=B             "合并两行中文时，不在中间加空格：
set helplang=cn 

" 撤销
"""""""""""""""""""""""""""""""""""""""""
set undolevels=1000              "How many undos
set undoreload=10000             "number of lines to save for undo
if v:version >= 730
    set undofile                 "keep a persistent backup file
    set undodir=~/bak/vimundo/
endif

" 状态栏
"""""""""""""""""""""""""""""""""""""""""
set ruler                        "显示当前的行号列号
set showcmd                      "在状态栏显示正在输入的命令
set showmode
"set statusline=%<%f\%h%m%r%=%k[%{(&fenc==\"\")?&enc:&fenc}%{(&bomb?\",BOM\":\"\")}]\%-14.(%l,%c%V%)\ %P
set laststatus=2				 "命令行（在状态行下）的高度，默认为1，这里是2" 显示最后一个窗口的状态行；设为1则窗口数多于一个的时候显示最后一个窗口的状态行；0不显示最后一个窗口的状态行

" 相对绝对行号
"""""""""""""""""""""""""""""""""""""""""
"autocmd FocusLost * :set norelativenumber number
"autocmd FocusGained * :set relativenumber
"autocmd InsertEnter * :set norelativenumber number
"autocmd InsertLeave * :set relativenumber

set cursorline                  "突出显示当前行，可用Ctrl+k切换是否显示
"set cursorcolumn               "突出显示当前列，可用Ctrl+k切换是否显示
"set backup                     "备份
" 退出插入模式时自动保存
"autocmd InsertLeave * :w!<ESC>



"""""""""""""""""""""""""""""""""""""""""
" 插件管理配置
":PluginList          - list configured plugins
":PluginInstall(!)    - install (update) plugins
":PluginSearch(!) foo - search (or refresh cache first) for foo
":PluginClean(!)      - confirm (or auto-approve) removal of unused plugins
"""""""""""""""""""""""""""""""""""""""""

" Vundle配置
"""""""""""""""""""""""""""""""""""""""""
filetype off  "文件类型自动检测功能  

set rtp+=~/.vim/bundle/vundle
call vundle#begin()

" let Vundle manage Vundle
" required! 
Plugin 'gmarik/Vundle.vim'

"如果你的插件来自github，写在下方，只要作者名/项目名就行了
"Plugin 'Valloric/YouCompleteMe'
Plugin 'altercation/vim-colors-solarized'
"Plugin 'rking/ag.vim'
Plugin 'mileszs/ack.vim'
Plugin 'ggreer/the_silver_searcher'
Plugin 'tomasr/molokai'
Plugin 'kien/ctrlp.vim'
Plugin 'tacahiroy/ctrlp-funky'
Plugin 'dyng/ctrlsf.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'scrooloose/syntastic'
Plugin 'scrooloose/nerdtree'
Plugin 'vim-scripts/taglist.vim'
Plugin 'Rip-Rip/clang_complete' "代码提示
Plugin 'ervandew/supertab'
Plugin 'octol/vim-cpp-enhanced-highlight' "更改各种颜色
Plugin 'vim-scripts/AutoComplPop' "自动弹出补全
"  Plugin 'vim-scripts/TabBar'
Plugin 'SirVer/ultisnips' "自定义补全
Plugin 'honza/vim-snippets'
Plugin 'kien/rainbow_parentheses.vim' "颜色括号
" Plugin 'Chiel92/vim-autoformat'
Plugin 'majutsushi/tagbar'
Plugin 'scrooloose/nerdcommenter' "注释专用
Plugin 'easymotion/vim-easymotion' "快速跳转
Plugin 'haya14busa/incsearch.vim' 
Plugin 'haya14busa/incsearch-fuzzy.vim' "模糊搜索
Plugin 'mbbill/undotree' "历史操作记录
Plugin 'tpope/vim-surround' "添加替换各种环绕符号
Plugin 'tpope/vim-repeat' "重复上一次操作
Plugin 'godlygeek/tabular' "自动对齐
Plugin 'Raimondi/delimitMate' "补全括号之类
Plugin 'terryma/vim-multiple-cursors'
Plugin 'terryma/vim-expand-region' "补全括号之类
" Plugin 'terryma/vim-smooth-scroll' "平滑滚动
" Plugin 'vim-ctrlspace/vim-ctrlspace'

"如果插件来自 vim-scripts，你直接写插件名就行了
Plugin 'a.vim' " .h .cpp切换
" Plugin 'EasyGrep'
Plugin 'DoxygenToolkit.vim' "注释
"Plugin 'OmniCppComplete'
Plugin 'AutoClose'

"如使用自己的git库的插件，像下面这样做
" Plugin 'git://git.wincent.com/command-t.git'

call vundle#end()            " required
filetype on    " required

"插件安装清理
nnoremap <leader>pi :PluginInstall<CR>
nnoremap <leader>pc :PluginClean<CR>
"==============================================
"

"""""""""""""""""""""""""""""""""""""""""
" 主题颜色显示
"""""""""""""""""""""""""""""""""""""""""
set t_Co=256
set background=dark
let g:solarized_termcolors=256
let g:solarized_termtrans=1
"let g:colors_name="nslib_color256"  
colorscheme molokai "solarized deser 
let g:molokai_original = 1
let g:rehash256 = 1

let g:formatdef_allman = '"astyle --style=allman --pad-oper"'
let g:formatters_cpp = ['allman']
let g:formatters_c = ['allman']


set tags=./tags
"set tags+=/root/workShare/tank_new/tags

"easyMotion setting
"""""""""""""""""""""""""""""""""""""""""
let g:EasyMotion_smartcase = 1
"建议简单化, 一个<Leader><leader>w/b走天下.
map <Leader><leader>h <Plug>(easymotion-linebackward)
map <Leader><Leader>j <Plug>(easymotion-j)
map <Leader><Leader>k <Plug>(easymotion-k)
map <Leader><leader>l <Plug>(easymotion-lineforward)
" map <Leader><leader>. <Plug>(easymotion-repeat)

"incsearch setting
"""""""""""""""""""""""""""""""""""""""""
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)
map z/ <Plug>(incsearch-fuzzy-/)
map z? <Plug>(incsearch-fuzzy-?)
map zg/ <Plug>(incsearch-fuzzy-stay)

"undotree setting
"""""""""""""""""""""""""""""""""""""""""
":earlier and :later
set undodir=~/.undodir/
set undofile
let g:undotree_SetFocusWhenToggle = 1
"let g:undotree_TreeNodeShape = '->'
nnoremap <leader>u :UndotreeToggle<cr>

"surround setting
"""""""""""""""""""""""""""""""""""""""""
" nnoremap <leader>l :ySS
" # 替换: cs^'
" ^Hello world!^ -> 'Hello world!'

" # 替换-标签(t=tag): cst'
" <a>abc</a>  -> 'abc'

" cst<html>
" <a>abc</a>  -> <html>abc</html>

" # 删除: ds'
" 'Hello world!' -> Hello world!

" # 添加(ys=you surround): ysiw'
" Hello -> 'Hello'

" # 添加: csw'
" Hello -> 'Hello'

" # 添加-整行: yss'
" Hello world -> 'Hello world'

" # ySS@
" Hello world ->
"    @
"    hello world
"    @
"
"    # 添加-两个词: veeS'
"    hello world -> 'hello world'
"
"    # 添加-当前到行尾: ys$'
"
"    # 左符号/右符号 => 带不带空格
"    cs([
"    (hello) -> [ hello ]
"
"    cs()]
"    (hello) -> [hello])

"ctrlp setting
"""""""""""""""""""""""""""""""""""""""""
"设置搜索时忽略的文件
let g:ctrlp_custom_ignore = {
	\ 'dir':  '\v[\/](.git|.svn|win_vs)$',
    \ 'file': '\v\.(exe|so|dll|d|o|out)$',
    \ }
" \ 'link': 'SOME_BAD_SYMBOLIC_LINKS',
 let g:ctrlp_working_path_mode=0
 let g:ctrlp_match_window_bottom=1
 let g:ctrlp_max_height=25
 let g:ctrlp_match_window_reversed=0
 let g:ctrlp_mruf_max=500
 let g:ctrlp_follow_symlinks=1
 let g:ctrlp_by_filename = 1 "默认使用全路径搜索，置1后按文件名搜索，准确率会有所提高，可以用<C-d>进行切换
 let g:ctrlp_line_prefix = '♪ '
"调用ag进行搜索提升速度，同时不使用缓存文件
" if executable('ag')
    " set grepprg=ag\ --nogroup\ --nocolor
    " let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g "" '
    " let g:ctrlp_use_caching = 0
" endif"

inoremap <C-p> <ESC>:CtrlP<CR>
nnoremap <C-b> :CtrlPBuffer<CR>
inoremap <C-b> <ESC>:CtrlPBuffer<CR>

"ctrlp-funky setting
"""""""""""""""""""""""""""""""""""""""""
let g:ctrlp_funky_syntax_highlight = 1
let g:ctrlp_extensions = ['funky']
let g:ctrlp_funky_matchtype = 'path' "(value: 'line', 'path', 'tabs', 'tabe')
let g:ctrlp_funky_multi_buffers = 1
let g:ctrlp_funky_sort_by_mru = 1
let g:ctrlp_funky_use_cache = 1 "时间戳没有改变则用缓存
noremap <silent> <ESC>m :CtrlPFunky<CR> 
inoremap <silent> <ESC>m :CtrlPFunky<CR>

"ctrlsf setting
"""""""""""""""""""""""""""""""""""""""""
let g:ctrlsf_ackprg = 'ag'
let g:ctrlsf_ignore_dir = ['./win_vs', './release', './log', './map*']
let g:ctrlsf_case_sensitive = 'yes' "是否敏感大小写
let g:ctrlsf_auto_close = 1
let g:ctrlsf_regex_pattern = 1
" let g:ctrlsf_populate_qflist = 1
" let g:ctrlsf_default_view_mode = 'compact' "quick 窗口模式

map <C-F>f :CtrlSF <C-R><C-W><CR>
map <C-F>k :CtrlSFQuickfix <C-R><C-W><CR>
map <C-F><Space> :CtrlSF ''<ESC>h
map <C-F>i :CtrlSF -ignorecase ''<ESC>h
map <C-F>o :CtrlSFToggle<CR>
" imap <C-F>f <ESC>;:CtrlSF <C-R><C-W><CR>
" imap <C-F><Space> <ESC>;:CtrlSF 
" imap <C-F>i <ESC>;:CtrlSF -ignorecase 
" imap <C-F>o <ESC>;:CtrlSFToggle<CR>

"multiple-cursors setting
"""""""""""""""""""""""""""""""""""""""""
let g:multi_cursor_use_default_mapping=0
let g:multi_cursor_next_key="<C-n>" "选中一个
let g:multi_cursor_prev_key="<C-m>" "放弃一个, 回到上一个
let g:multi_cursor_skip_key="<C-x>" "跳过当前选中, 选中下一个
let g:multi_cursor_exit_key="<ESC>:<ESC>"
"选中后, 可以进行增删替换a/c/x等

"airline setting  
"""""""""""""""""""""""""""""""""""""""""
let g:airline_powerline_fonts=1        "配置airline使用powerline字体
let g:airline_theme='bubblegum'   " distinguismed  bubblegum qwq molokai papercolor
let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#whitespace#symbol = '!'
let g:airline_section_b = '%{strftime("%m/%d/%y - %H:%M")}'
"set guifont=Consolas\ for\ Powerline\ FixedD:h11
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
" j old vim-powerline symbols
let g:airline_left_sep = '⮀'
let g:airline_left_alt_sep = '⮁'
let g:airline_right_sep = '⮂'
let g:airline_right_alt_sep = '⮃'
let g:airline_symbols.branch = '⭠'
let g:airline_symbols.readonly = '⭤'"
let g:airline_symbols.linenr = ''
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#bufferline#overwrite_variables = 1

nnoremap <ESC>n :bn<CR>
nnoremap <ESC>p :bp<CR>
nnoremap <ESC>d :bd<CR>


"ack setting
"""""""""""""""""""""""""""""""""""""""""
let g:ackhighlight = 1                  "高亮搜索关键词
let g:ack_autoclose = 1                 "在QuickFix窗口使用快捷键以后，自动关闭QuickFix窗口
if executable('ag')
    let g:ackprg = 'ag --vimgrep'
endif
map <Leader>c :Ack -i 

"taglist setting
"""""""""""""""""""""""""""""""""""""""""
let Tlist_Ctags_Cmd='ctags'             "ctags位于PATH目录下,所以可以省略具体路径
let Tlist_Show_One_File=1               "不同时显示多个文件的tag，只显示当前文件的
let Tlist_WinWidth =40                  "设置taglist的宽度
let Tlist_Exit_OnlyWindow=1             "如果taglist窗口是最后一个窗口，则退出vim
let Tlist_Use_Right_Window=1            "在右侧窗口中显示taglist窗口
"let Tlist_Use_Left_Windo =1            "在左侧窗口中显示taglist窗口
"let Tlist_Auto_Open=1                  "启动vim后自动打开
let Tlist_GainFocus_On_ToggleOpen=1     "在使用:TlistToggle打开taglist窗口时，如果希望输入焦点在taglist窗口中
let Tlist_Use_SingleClick=1             "设置点击一个tag跳转到函数
let Tlist_Close_On_Select=1              "在选择了tag后自动关闭taglist窗口
"noremap <silent> <ESC>m :TlistToggle<cr>/
"inoremap <silent> <ESC>m :TlistToggle<cr>/

"tagbar setting
"""""""""""""""""""""""""""""""""""""""""
let g:tagbar_width = 40
noremap <silent> <ESC>M :TagbarToggle<CR>
inoremap <silent> <ESC>M :TagbarToggle<CR>

"clang_complete setting
"""""""""""""""""""""""""""""""""""""""""
"let g:clang_complete_loaded "不加载
set completeopt=menu,longest
let g:clang_auto_select=1       " 自动选择第一个匹配项但不插入到代码中
let g:clang_complete_auto=1     " 在->. ., ::后自动补全
let g:clang_hl_errors=0         " 高亮警告和错误 
let g:clang_complete_copen=0    " 发现错误之后打开QuickFix窗口 
let g:clang_periodic_quickfix=0 " periodically update the quickfix window
let g:clang_close_preview=1     "插入第一个补全后关闭预览窗口
"let g:clang_user_options = '-std=c++11' "开启对C++11的编译支持
let g:clang_use_library=1
let g:clang_library_path='/usr/local/lib/' "设定clang库路径 LLVM
let g:clang_user_options='-stdlib=libstdc++ -IIncludePath'
" let g:clang_user_options='-stdlib=libc++ -IIncludePath'
let g:clang_user_options=''
let g:clang_complete_macros = 1 "补全预处理指令，宏和常数，默认为0，不补全
let g:clang_complete_patterns = 1 "补全代码模式，比如循环等，默认为0，不补全
let g:clang_jumpto_declaration_key = "<C-]>" "跳转到声明
" let g:clang_jumpto_declaration_in_preview_key = "<C-w>" "在预览窗口中打开声明
" let g:clang_jumpto_back_key = "<C-t>" "回跳
let g:clang_snippets = 1 "使用UltiSnips进行代码片段补全
let g:clang_snippets_engine = 'ultisnips'

"UltiSnips vim-snippets setting
"""""""""""""""""""""""""""""""""""""""""
" 由于UltiSnips 和YouCompleteMe.的补全是冲突的，这里修改一下UltiSnips的触发按键 
let g:UltiSnipsSnippetDirectories=["plugin/snippets"]
" let g:UltiSnipsExpandTrigger="<leader><tab>"
" let g:UltiSnipsJumpForwardTrigger="<leader><tab>"
" let g:UltiSnipsJumpBackwardTrgger="<leader><tab>"
let g:UltiSnipsListSnippets="<c-j>"

"NERDTree setting
"""""""""""""""""""""""""""""""""""""""""
let NERDTreeShowLineNumbers=1 "显示行号
let NERDTreeAutoCenter=1
let NERDTreeShowHidden=0 "是否显示隐藏文件
let NERDTreeWinSize=30 "设置宽度
let NERDTreeIgnore=['\.d','\.o','\~$','\.swp']
let NERDTreeShowBookmarks=1 "显示书签列表
let g:NERDTreeWinPos='left' "窗口位置
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif "当NERDTree为剩下的唯一窗口时自动关闭

map <ESC>e :NERDTreeToggle<CR>

"SuperTab setting
"""""""""""""""""""""""""""""""""""""""""
let g:SuperTabRetainCompletionType=2 " 0 - 不记录上次的补全方式 1 - 记住上次的补全方式,直到用其他的补全命令改变它 2 - 记住上次的补全方式,直到按ESC退出插入模式为止
let g:SuperTabDefaultCompletionType="<C-X><C-O>" " 设置按下<Tab>后默认的补全方式, 默认是<C-P>,  现在改为<C-X><C-O>. 关于<C-P>的补全方式,
let g:SuperTabLongestHighlight = 1
let g:SuperTabLongestEnhanced = 1
let g:SuperTabCompleteCase = 'ignorecase'
let g:SuperTabClosePreviewOnPopupClose = 1

"vim-cpp-enhanced-highlight setting
"""""""""""""""""""""""""""""""""""""""""
let g:cpp_class_scope_highlight = 1
"let g:cpp_member_variable_highlight = 1
let g:cpp_experimental_simple_template_highlight = 1
let g:cpp_experimental_template_highlight = 1
let g:cpp_concepts_highlight = 1
let c_no_curly_error=1 "文件较大时使用下面的设置高亮模板速度较快，但会有一些小错误
"166 cterm=bold
hi Normal       ctermfg=144
hi String       ctermfg=193
hi Label        ctermfg=68 
hi cppFunction  ctermfg=208
hi cppClass     ctermfg=226
hi def link cCustomFunc  cppFunction
hi def link cCustomClass cppClass
hi def link cCustomTemplateFunc  cppFunction
hi def link cppSTLfunction cppFunction
hi def link cppSTLios cppFunction
hi def link cppStorageClass cppFunction
"vim /usr/share/vim/vim74/colors/molokai.vim

"autoComplPop setting
"""""""""""""""""""""""""""""""""""""""""
let g:acp_behaviorKeywordLength=999
let g:acp_behaviorKeywordCommand="\<C-x>\<C-u>"
let g:acp_ignorecaseOption=1
let g:acp_mappingDriven=1
let g:AutoComplPop_IgnoreCaseOption=1
"let g:AutoComplPop_MappingDriven=1
"let g:AutoComplPop_IgnoreCaseOption=1

"tabbar setting
"""""""""""""""""""""""""""""""""""""""""
let g:Tb_MaxSize = 1  
let g:Tb_MinSize = 1
let g:Tb_TabWrap = 1 
"let g:Tb_MoreThanOne=1
"let g:Tb_ModSelTarget = 1
let g:Tb_MapWindowNavVim = 1
let g:Tb_UseSingleClick=1
"let g:Tb_ForceSyntaxEnable = 1
let g:Tb_MapCTabSwitchWindows = 1
"hi Tb_Normal ctermbg=32 ctermfg=249
"hi Tb_Changed guifg=green ctermfg=green  
"hi Tb_VisibleNormal ctermbg=24 ctermfg=32  guibg=#13354A
"hi Tb_VisibleChanged guifg=green ctermbg=252 ctermfg=white  
"
"syntastic setting
"""""""""""""""""""""""""""""""""""""""""
""let g:loaded_syntastic_plugin = 1
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_cpp_check_header = 1
let g:syntastic_cpp_auto_refresh_includes = 1
let g:syntastic_enable_highlighting = 1 " 错误单词高亮
let g:syntastic_aggregate_errors = 1 "第一时间检查发现任何错误〇
let g:syntastic_enable_signs = 1 
"let g:syntastic_auto_jump =3
"let g:syntastic_error_symbol = '乄'
"let g:syntastic_warning_symbol = '△'
let g:syntastic_check_on_wq = 0 "进行实时检查，如果觉得卡顿，将下面的选项置为1
let g:syntastic_auto_loc_list = 2 "自动打开Locaton List，默认值为2，表示发现错误时不自动打开，当修正以后没有再发现错误时自动关闭，置1表示自动打开自动关闭，0表示关闭自动打开和自动关闭，3表示自动打开，但不自动关闭
"let g:syntastic_check_on_open = 1 "打开文件时自动进行检查
let g:syntastic_always_populate_loc_list = 1 "Errors时候 错误改变自动更新
let g:syntastic_cpp_include_dirs = [ 'gsdefine', 'gscommon', 'gsproto', 'gsproto/gsclient', 'gssdk', 'gsserver', 'gssdk/gsenc', '/app/include/libxml2/']
""let g:syntastic_ignore_files = [.]
""let g:syntastic_cpp_compiler = 'g++'
""let g:syntastic_cpp_compiler = 'clang++'
""let g:syntastic_cpp_compiler_options = '-std=c++11 -stdlib=libc++'
let g:syntastic_python_python_exec = '/usr/bin/python3'

map <leader>er :SyntasticCheck<CR>
map <leader><leader>er :lnext<CR>
map <leader><leader>re :lprevious<CR>
map <leader>ser :Errors<CR>
"rainbow_parentheses setting
"""""""""""""""""""""""""""""""""""""""""
let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]

" 不加入这行, 防止黑色括号出现, 很难识别
" " \ ['black',       'SeaGreen3'],
"
let g:rbpt_max = 16
let g:rbpt_loadcmd_toggle = 0
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces


"nerdcommenter setting
"""""""""""""""""""""""""""""""""""""""""
let g:NERDSpaceDelims=1 "注释的时候自动加个空格, 强迫症必配

"使用：  
"1、 \cc 注释当前行和选中行  
"2、 \cn 没有发现和\cc有区别  
"3、 \c<空格> 如果被选区域有部分被注释，则对被选区域执行取消注释操作，其它情况执行反转注释操作  
"4、 \cm 对被选区域用一对注释符进行注释，前面的注释对每一行都会添加注释  
"5、 \ci 执行反转注释操作，选中区域注释部分取消注释，非注释部分添加注释  
"6、 \cs 添加性感的注释，代码开头介绍部分通常使用该注释  
"7、 \cy 添加注释，并复制被添加注释的部分  
"8、 \c$ 注释当前光标到改行结尾的内容  
"9、 \cA 跳转到该行结尾添加注释，并进入编辑模式  
"10、\ca 转换注释的方式，比如： /**/和//  
"11、\cl \cb 左对齐和左右对其，左右对其主要针对/**/  
"12、\cu 取消注释  0


""OmniCppComplete setting
""""""""""""""""""""""""""""""""""""""""""
"set completeopt=menu,menuone " 关掉智能补全时的预览窗口
"set nocp 
""au BufNewFile,BufRead,BufEnter *.cpp,*.hpp set omnifunc=omni#cpp#complete#Main
"filetype on  "文件类型自动检测功能  
"let OmniCpp_GlobalScopeSearch = 1 "全局查找控制。0:禁止；1:允许(缺省)
"let OmniCpp_NamespaceSearch = 2 "命名空间查找控制。0 : 禁止查找命名空间 1 : 查找当前文件缓冲区内的命名空间(缺省) 2 : 查找当前文件缓冲区和包含文件中的命名空间
"let OmniCpp_DisplayMode = 1 "类成员显示控制(是否显示全部公有(public)私有(private)保护(protected)成员)。 0 : 自动 1 : 显示所有成员
"let OmniCpp_ShowScopeInAbbr = 0 "选项用来控制匹配项所在域的显示位置。缺省情况下，omni显示的补全提示菜单中总是将匹配项所在域信息显示在缩略信息最后一列。 0 : 信息缩略中不显示匹配项所在域(缺省)
"                                "1 : 显示匹配项所在域，并移除缩略信息中最后一列
"let OmniCpp_ShowPrototypeInAbbr = 1 "是否是补全提示缩略信息中显示函数原型。0 : 不显示(缺省) 1 : 显示原型
"let OmniCpp_ShowAccess = 1 "是否显示访问控制信息('+', '-', '#')。0/1, 缺省为1(显示)
""let OmniCpp_DefaultNamespaces = ["std"] "默认命名空间列表，项目间使用','隔开。如：let OmniCpp_DefaultNamespaces = ['std', 'MyNamespace']
"let OmniCpp_MayCompleteDot = 1 "在'.'号后是否自动运行omnicppcomplete给出提示信息。0/1, 缺省为1
"let OmniCpp_MayCompleteArray = 1 "在'->'后是否自动运行omnicppcomplete给出提示信息。0/1, 缺省为1
"let OmniCpp_MayCompleteScope = 1 "在域标识符'::'后是否自动运行omnicppcomplete给出提示信息。0/1, 缺省为0
""let OmniCpp_SelectFirstItem = 0 "是否自动选择第一个匹配项。仅当completeopt不为longest时有效。0 : 不选择第一项(缺省) 1 : 选择第一项并插入到光标位置 2 : 选择第一项但不插入光标位置
""let OmniCpp_LocalSearchDecl = 1 "使用Vim标准查找函数/本地(local)查找函数。Vim内部用来在函数中查找变量定义的函数需要函数括号位于文本的第一列，而本地查找函数并不需要。

"Cscope setting
"""""""""""""""""""""""""""""""""""""""""
if has("cscope")
	set csprg=/usr/bin/cscope            " 指定用来执行cscope的命令
    set cscopetag
	set csto=0                           " 设置cstag命令查找次序：0先找cscope数据库再找标签文件；1先找标签文件再找cscope数据库
	set cst                              " 同时搜索cscope数据库和标签文件
	"set cscopequickfix=s+,c+,d-,i-,t-,e- " 使用QuickFix窗口来显示cscope查找结果
	set nocsverb
    set cspc=0                           "决定了一个文件的路径的多少部分被显示。默认值是0，所以整个路径都会被显示。值为1的话，那么就只会显示文件名, 值为2的话，那么会显示本文件所在文件夹在加文件名，以此类推
    "set cscopeverbose 

	if filereadable("cscope.out")        " 若当前目录下存在cscope数据库，添加该数据库到vim /home/zxn/cscope/cscope.out
		cs add cscope.out
	elseif $CSCOPE_DB != ""              " 否则只要环境变量CSCOPE_DB不为空，则添加其指定的数据库到vim
		cs add $CSCOPE_DB
	endif
	set csverb
    set nocscopeverbose
	nmap <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR>	
	nmap <C-\>g :cs find g <C-R>=expand("<cword>")<CR><CR>	
	nmap <C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR>	
	nmap <C-\>t :cs find t <C-R>=expand("<cword>")<CR><CR>	
	nmap <C-\>e :cs find e <C-R>=expand("<cword>")<CR><CR>	
	nmap <C-\>f :cs find f <C-R>=expand("<cfile>")<CR><CR>	
	nmap <C-\>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
	nmap <C-\>d :cs find d <C-R>=expand("<cword>")<CR><CR>	
	nmap <C-\>n :/<C-R>=expand("<cword>")<CR>

	nmap <C-@>s :scs find s <C-R>=expand("<cword>")<CR><CR>	
	nmap <C-@>g :scs find g <C-R>=expand("<cword>")<CR><CR>	
	nmap <C-@>c :scs find c <C-R>=expand("<cword>")<CR><CR>	
	nmap <C-@>t :scs find t <C-R>=expand("<cword>")<CR><CR>	
	nmap <C-@>e :scs find e <C-R>=expand("<cword>")<CR><CR>	
	nmap <C-@>f :scs find f <C-R>=expand("<cfile>")<CR><CR>	
	nmap <C-@>i :scs find i ^<C-R>=expand("<cfile>")<CR>$<CR>	
	nmap <C-@>d :scs find d <C-R>=expand("<cword>")<CR><CR>	

	nmap <C-@><C-@>s :vert scs find s <C-R>=expand("<cword>")<CR><CR>
	nmap <C-@><C-@>g :vert scs find g <C-R>=expand("<cword>")<CR><CR>
	nmap <C-@><C-@>c :vert scs find c <C-R>=expand("<cword>")<CR><CR>
	nmap <C-@><C-@>t :vert scs find t <C-R>=expand("<cword>")<CR><CR>
	nmap <C-@><C-@>e :vert scs find e <C-R>=expand("<cword>")<CR><CR>
	nmap <C-@><C-@>f :vert scs find f <C-R>=expand("<cfile>")<CR><CR>	
	nmap <C-@><C-@>i :vert scs find i ^<C-R>=expand("<cfile>")<CR>$<CR>	
	nmap <C-@><C-@>d :vert scs find d <C-R>=expand("<cword>")<CR><CR>
	"map <F4> :cs add ./cscope.out .<CR><CR><CR> :cs reset<CR>
	nmap <C-\><C-\>s :cs find s 
	nmap <C-\><C-\>g :cs find g 
	nmap <C-\><C-\>c :cs find c 
	nmap <C-\><C-\>t :cs find t 
	nmap <C-\><C-\>e :cs find e 
	nmap <C-\><C-\>f :cs find f 
	nmap <C-\><C-\>i :cs find i 
    nmap <C-\><C-\>d :cs find d 

	nnoremap <ESC>g :cs find g <C-R>=expand("<cword>")<CR><CR> 
	nnoremap <ESC>t :cs find t <C-R>=expand("<cword>")<CR><CR> 
    noremap <C-j> :cs find g <C-R>=expand("<cword>")<CR><CR> 
    "重新加载ctags cscope
    nnoremap <F11> :!sh update.sh<CR>:cs add ./cscope.out .<CR> :cs reset<CR>
    nnoremap <leader>cr :cs reset<CR>
    " nnoremap <C-S-F> :cs find t 
endif
"imap <F4> <ESC>:cs add ./cscope.out .<CR><CR><CR> :cs reset<CR>
" 将:cs find c等Cscope查找命令映射为<C-_>c等快捷键（按法是先按Ctrl+Shift+-, 然后很快再按下c）

"cscope的主要功能是通过其"find"子命令来实现的
"cscope find"的用法:
"cs find c|d|e|f|g|i|s|t name
"0 或 s  查找这个 C 符号(可以跳过注释)
"1 或 g  查找这个定义
"2 或 d  查找这个函数调用的函数
"3 或 c  查找调用过这个函数的函数
"4 或 t  查找这个字符串
"6 或 e  查找这个 egrep 模式
"7 或 f  查找这个文件
"8 或 i  查找包含这个文件的文件

" 常用快捷键
"""""""""""""""""""""""""""""""""""""""""
"let mapleader = "
"unmap <F5>
" 恢复撤销
nnoremap U <C-r>
" 全选
noremap <C-a> ggVG
"返回常规模式
noremap <ESC>; <ESC>
" noremap <C-j> <ESC>
" inoremap <C-j> <ESC>
"cpp h文件快速切换
nnoremap <ESC>A :A<CR>
inoremap <ESC>A :A<CR>
"清除windons回车\r
noremap <leader>rn :%s/\r//g<CR>
"保存文件
noremap <silent> <ESC>s :w<cr>
inoremap <silent> <ESC>s <ESC>:w<cr>
"imap <silent> <leader>s <esc>:w<cr>"
map <ESC><CR> <CR><CR>:nohl<CR>
"nmap <F8> :cc<cr>
"取消高亮 
noremap <ESC>H :nohl<CR>
"退出
noremap <ESC>q :q<CR>
noremap QQ :q!<CR>
"移动删除操作
noremap <ESC>j <DOWN>
noremap <ESC>k <UP>
noremap <ESC>h <LEFT>
noremap <ESC>l <RIGHT>
nnoremap < <<
nnoremap > >>
inoremap <ESC>j <DOWN>
inoremap <ESC>k <UP>
inoremap <ESC>h <LEFT>
inoremap <ESC>l <RIGHT>
inoremap <ESC>i <ESC>I
inoremap <C-l> <END>
inoremap <C-K> <ESC><RIGHT>d$a
inoremap <C-U> <ESC><RIGHT>d^i
cnoremap <ESC>j <DOWN>
cnoremap <ESC>k <UP>
cnoremap <ESC>h <LEFT>
cnoremap <ESC>l <RIGHT>
cnoremap <ESC>i <HOME>
cnoremap <C-l> <END>
"添加注释
imap <ESC>, <C-l><CR>{<CR><ESC>k<ESC>l<CR>
inoremap <ESC>V <ESC>:Dox<CR>
noremap <ESC>V :Dox<CR>
imap <ESC>v /** **/<ESC>h<ESC>h<ESC>h<ESC>h 
"上下移动一行
noremap <ESC>D ddp
noremap <ESC>U ddkP
"两个文件键切换
noremap <ESC>a <C-^>
imap <ESC>a <ESC>;<C-^>i

imap <ESC>. -><C-h>>
nnoremap <ESC>i zt<C-y><C-y><C-y><C-y><C-y><C-y><C-y><C-y><C-y>a
" nmap <ESC>o <C-o>
" 本文件内容全部替换
nmap <C-h> :%s/<C-R><C-W>//g<LEFT><LEFT>
"对齐方式
nmap <unique> <Leader><Leader>a <Plug>ToggleAutoCloseMappings
map <unique> <Leader>a= :Tabularize /=<CR>
map <unique> <Leader>a: :Tabularize /:<CR>
map <unique> <Leader>a, :Tabularize /,<CR>
map <unique> <Leader>a/ :Tabularize /\/\/<CR>
map <unique> <Leader>aa :Tabularize /


"打开quickfix窗口
map <F1> :botright copen 10<CR>
map <F2> :cclose<CR>

" 快速跳转 
map J <Leader><Leader>w
map K <Leader><Leader>b


" 选中扩大
vmap v <Plug>(expand_region_expand)
vmap V <Plug>(expand_region_shrink)

" map viwp viwpyiw
" map vvp viwpyiw

"粘贴模式
nnoremap<Leader>sp <ESC>:set paste<CR>
nnoremap<Leader>snp <ESC>:set nopaste<CR>

"改变编码集为utf-8
nnoremap <Leader><Leader>e :set encoding=utf-8 fileencoding=utf-8 fileencodings=utf-8<CR>

" noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 0, 20)<CR>
" noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 0, 20)<CR>

" vp doesn't replace paste buffer
function! RestoreRegister()
	let @" = s:restore_reg
	return ''
endfunction
function! s:Repl()
	let s:restore_reg = @"
	return "p@=RestoreRegister()\<CR>"
endfunction
vmap <silent> <expr> p <sid>Repl()
	" vnoremap <silent> s //e<C-r>=&selection=='exclusive'?'+1':''<CR><CR>
    " \:<C-u>call histdel('search',-1)<Bar>let @/=histget('search',-1)<CR>gv
" omap s :normal vs<CR>

" noremap <F5> :make -j3<cr>
nnoremap <F5> :call CompileRun(1)<cr>
nnoremap <F10> :call CompileRun(2)<cr>
nnoremap <F6> :cp<cr>
nnoremap <F7> :cn<cr>
nnoremap <F8> :cc<cr>
func CompileRun(val)  
	if a:val == 1
		" exec "w"  
	endif
	if &filetype == 'c'  

    elseif &filetype == 'cpp'  
		if a:val == 1
			exec "make -j3"  
		elseif a:val == 2
			silent exec "!sh RunServer.sh kill"  
			exec "!sh RunServer.sh start"  
        endif
    elseif &filetype == 'sh'  
		:!./%  
    elseif &filetype == 'python'  
		!python3 % 
    endif  
endfunc  



"初始化函数
function MyInitFunc()
endfunction
map <leader>mi :SyntasticToggleMode<CR>

call MyInitFunc()


