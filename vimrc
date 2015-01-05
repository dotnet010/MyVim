"=============================================================================
"     FileName: vimrc
"    Developer: carmack.ding
"        Email: dotnet010@gmail.com
"     HomePage: http://www.aboutme.com.cn
"      Version: 0.0.33
"   LastChange: 2015-01-05 11:09:41
"      Explain: 
"      History:
"=============================================================================
"用到的一些view模式指令 o是一个新行 \是转义符  C-E上滚 C-F下滚(两行)
"w移动前方一个单词第一个字母 b后方一个单词 e前方单词词末 C-U上半屏 C-D下半屏 
"0行首 $行尾 c修改 d删除 y抽搐到寄存器 gu变为小写 gU变为大写 gq文字排版 
"-/+/_ 移动到上/下/当前一行行首 gg行首 G行尾 =排版 C-q选择列
"m 标记符 建立标记 `标记符 跳转到标记符处 :maks {arg} 列出标记符 :delm 删除标记
"ctrl+r 反撤销 数字G 移动到数字行 %数字 移动到%处 C-g当前位置
"f 字母 寻找并移动到前方字母 df删除  /字符串 查找 匹配的字符串 :s替换
"C-t返回上一层文件(堆栈中) C-]跳转到当前单词对应标签 :tag 标签 跳转到标签
"插入 a当前右侧 A当前行尾 I当前行首 O上一行 v按字符选中 V选中当前行 C-q块选择
"p粘贴 D剪切至行尾 C剪切至行尾并插入 y复制选中 dd剪切yy复制当前行 v选择
":reg 列出剪切板 "剪切板名称 'ay 'ap即复制到剪切板a在从a粘贴出来
"*移动到当前字符串下一次出现位置 #移动到上一次 `.移动到上一次编辑行
"%跳转到匹配成对符号 [# 找到if ZZ退出 :bd 4 删除第4个缓冲区 
":b :跳到缓冲区 C-S-T切换到前一缓冲区  n下一个搜索结果 N前一个结果
"zf创建 zo打开 zd删除当前折叠 zD删除所有(嵌套)折叠 zc关闭折叠
"zR 打开所有折叠  zM关闭所有折叠 zn禁止折叠 zN恢复折叠 zi切换折叠
":%s/vivian/sky/ 替换当前行第一个 vivian 为 sky :%s/vivian/sky/g 替换当前行所有 vivian 为 sky
":%s #\#/#g  替换当前航所有\ 为/   :version 显示vim版本信息
"10 >>光标所在位置下10行缩进 C-q 大写I // 批量注释
"diffsplit # 对比窗口文件 =%把光标位置移到语句块的括号上,然后按=%,缩进整个语句块（%是括号匹配）
"分屏同步浏览:set scb 取消同步浏览:set scb!
"guu把一行的文字变成全小写 gUU把一行的文件变成全大写
"按【v】键进入选择模式，然后移动光标选择你要的文本，按【u】转小写，按【U】转大写
"ga查看光标处字符的ascii码 g8查看光标处字符的utf-8编码
"gf打开光标处所指的文件 
":r!date插入日期 上面这个命令，:r 是:read的缩写，!是表明要运行一个shell命令，意思是我要把shell命令的输出读到vim里来
"
"如何只替换符合某种条件的行？
"如果你的条件可以用正则表达式表达，则可以结合:g命令来使用。:g表示全局替换。比如，如果你想在所有出现bar的行进行替换，则可以在normal mode输入：
":%g/bar/s/\(foo([^)]*\))/\1, NULL)/g

"在所有不出现bar的行进行替换，则可以在normal mode输入：
":%g!/bar/s/\(foo([^)]*\))/\1, NULL)/g

"想了解更多，在normal mode输入：
":h :g
"
"
"
".重复上一个命令 n执行上一次查找 H移动到屏首 M屏中 L屏底
"
"
"ci'、ci"、ci(、ci[、ci{、ci< - 分别更改这些配对标点符号中的文本内容
"di'、di"、di(或dib、di[、di{或diB、di< - 分别删除这些配对标点符号中的文本内容
"yi'、yi"、yi(、yi[、yi{、yi< - 分别复制这些配对标点符号中的文本内容
"vi'、vi"、vi(、vi[、vi{、vi< - 分别选中这些配对标点符号中的文本内容
"另外如果把上面的i改成a可以连配对标点一起操作。
"举个例子：
"比如要操作的文本如下：
"111"222"333
"将光标移到"222"的任何一个字符处输入命令 di" ,文本会变成： 111""333
"若输入命令 da" ,文本会变成： 111333
"dG删除到底部 
"
"
"录制操作示例
"	qa			启动记录，并使用寄存器 a
"	^			移到行首
"	i#include ""<Esc>	在行首输入 #include "
"	$			移到行末
"	a"<Esc>			在行末加上双引号 (")
"	j			移到下一行
"	q			结束记录
"       @a			通过@a执行录制的
"
"
"	gcc编译器
"	map : call CompileGcc()
"	func! CompileGcc()
"	 exec "w"
"	 exec "!gcc % -o %<"
"	endfunc
"
"	map :call CompileRunGcc()
"	func! CompileRunGcc()
"	 exec "w"
"	 exec "!gcc % -o %<"
"	 exec "! ./%<"
"	endfunc
	
" -----------------------------------------------------------------------------
"  < 判断操作系统是否是 Windows 还是 Linux >
" -----------------------------------------------------------------------------
let g:iswindows = 0
let g:islinux = 0
if(has("win32") || has("win64") || has("win95") || has("win16"))
    let g:iswindows = 1
else
    let g:islinux = 1
endif
" -----------------------------------------------------------------------------
"  < 判断是终端还是 Gvim >
" -----------------------------------------------------------------------------
if has("gui_running")
    let g:isGUI = 1
else
    let g:isGUI = 0
endif

set nu! "显示行号
set nobomb "设置没有bom
au BufReadPost setlocal nobomb   "vim打开的时候（读完buffer ）去bom
set nocp   "不兼容vi模式 
"set t_Co=256 "开启256色
set background=dark "背景颜色
filetype plugin on  "开启插件 
runtime macros/matchit.vim "开启html标签跳转 
syntax enable "开启关键字高亮
syntax on "开启语法分析
set guifont=Monaco:h11 "设置英文字体
"set guifont=MyFont\ for\ Powerline
set gfw=Yahei_Mono:h12 "设置中文字体
set number "显示行号
set ruler "显示当前光标位置
set cursorline "操作行添加下划线
set hlsearch "高亮匹配
set incsearch "搜索结果即时显示
set showmatch " 显示配对括号
set matchtime=2 "短暂跳转到匹配括号的时间
set hidden  "允许在有未保存的修改时切换缓冲区，此时的修改由 vim 负责保存
set smartindent "开启新行时使用智能自动缩进
set tags=tags; "设置当前目录寻找tag
set autochdir "设置vim运行命令行在当前文件夹
set shiftwidth=4 "设置缩进为4个空格
set ts=4 "设置tab显示为4个空格
"set tw=10 "设置100个空换行
"set et "设置所有tab替换为空格
set autoindent "开启自动缩进
set writebackup "设置无备份文件
set nobackup "设置无备份文件 只在linux下有效
"set runtimepath+=~/.vim/ultisnips_rep "设置ultisnips启动目录
"let g:UltiSnipsUsePythonVersion = 2
setlocal omnifunc=pythoncomplete#Complete "设置编译pythone版本
inoremap <silent><A-1> <C-x><C-o><cr> "映射编辑模式下pythoncomplete自动补全
set fileformats=unix,dos "识别回车符
let g:debuggerMaxDepth = 5  "xdebug设置

"设置中文
"set fileencoding=utf-8  "打开支持文件编码
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1  "编辑已有文件编码
"set clipboard+=unnamed "y,p对接windows剪切板
"set $termencoding=encoding "设置屏幕(linux下)终端编码为内部编码
set termencoding=utf-8 "终端编码
set ambiwidth=double "设置保存字长
set encoding=utf-8 "编辑器内部编码 
set helplang=cn "中文帮助文档
"解决菜单乱码
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim
language messages zh_CN.utf-8 "提示信息中文设置
" vimwiki
let g:vimwiki_use_mouse = 1
let g:vimwiki_list = [{'path': 'F:\bak\vyun\wiki',
	    \ 'path_html': 'F:\bak\vyun\wiki\html\',
	    \ 'html_header': 'F:\bak\vyun\wiki\template\header.tpl',}]
"输入\ww快速进入wiki

"高亮显示关键字和引用
autocmd CursorMoved * silent! exe printf('match Underlined /\<%s\>/', expand('<cword>'))
autocmd CursorHold * silent! exe printf('match Underlined /\<%s\>/', expand('<cword>'))


"Tlist
"let Tlist_Exit_OnlyWindow = 1   "如果taglist窗口是最后一个窗口，则退出vim
"let Tlist_Use_Right_Window = 1  "在右侧窗口中显示taglist窗口 
"let Tlist_Sort_Type = "name"    "使taglist以tag名字进行排序
"let Tlist_Use_SingleClick = 1   "单击tag就跳转
"""let Tlist_Auto_Open = 1         "启动vim后自动打开taglist窗口
"let Tlist_Show_One_File = 1     "设置不同时打开多个文件的Tags
"let Tlist_File_Fold_Auto_Close=1 "让当前不被编辑的文件的方法列表自动折叠起来 
"nmap <silent> <A-2> :Tlist<cr>
"NERDTree
let NERDChristmasTree=1 
let NERDTreeAutoCenter=1 
let NERDTreeBookmarksFile=$VIM.'\Data\NerdBookmarks.txt' "指定书签文件
let NERDTreeMouseMode=2 "指定鼠标模式（1.双击打开；2.单目录双文件；3.单击打开）
let NERDTreeShowFiles=1 
let NERDTreeShowHidden=1 
let NERDTreeShowBookmarks=1 
let NERDTreeShowLineNumbers=1
let NERDTreeWinPos='left' 
let NERDTreeWinSize=31 
"autocmd BufRead *  25vsp  ./ "设置NERDTree随VIM启动
"autocmd vimenter * NERDTree "设置NERDTree随VIM启动
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") &&b:NERDTreeType == "primary") | q | endif "设置如果只有文件只有NERDTree自动关闭
nmap <silent> 1 <A-1> 
nmap <silent> <A-1> :NERDTreeToggle<cr>





"设置插入模式映射方向键
inoremap <silent><A-a> <LEFT>
inoremap <silent><A-s> <DOWN>
inoremap <silent><A-w> <UP>
inoremap <silent><A-d> <Right>
"nmap <silent><A-4> :SrcExpl
inoremap <silent><A-b> <BackSpace>
inoremap <silent><A-v> <Del>
inoremap <silent><A-r> <PageUp> 
inoremap <silent><A-f> <PageDown>
inoremap <silent><A-z> <Home>
inoremap <silent><A-x> <End>

"切换到下一个buffer
nnoremap <silent><leader>a :bn<CR>
nmap <silent> a <leader>a

"切换到上一个buffer
nnoremap <silent><leader>f :bN<CR>
nmap <silent> f <leader>f

"写php代码时用.代替->
inoremap <silent><A-.> ->
"使用tab键来代替%进行匹配跳转
nnoremap <tab> %
vnoremap <tab> %
"使用,w来垂直分割窗口，这样可以同时查看多个文件,如果想水平分割则<c-w>s
nnoremap <leader>v <c-w>v<c-w>l "<leader>表示\ 即\w
"映射php解析器,需要php.exe在vim目录
nnoremap <C-J> :!php -l %<CR>
"预览色彩配置
nnoremap <buffer>`cs :ColorSchemeExplorer<CR>
"bufexplorer列表
"nnoremap <silent>'be :BufExplorer<CR>
"nnoremap <silent>'bs :BufExplorerHorizontalSplit<CR>
"nnoremap <silent>'bv :BufExplorerVerticalSplit<CR>
"BufExplorer \bs \be \bv

"设置自动提示
autocmd FileType php set omnifunc=phpcomplete
"去掉utf-8 BOM
set nobomb
setglobal nobomb 
au BufReadPost setlocal nobomb 
"保留utf-8 BOM
"set bomb
"设置php语法
set omnifunc=phpcomplete#CompletePHP
" 启用 neocomplcache.  1是打开 
let g:neocomplcache_enable_at_startup = 1
"开启airlin插件
let g:airline#extensions#tabline#enabled = 1
"所有状态开启
set laststatus=2
let g:airline_left_sep = '>'
let g:airline_right_sep='<'
let g:airline_fugitive_prefix='§'
let g:airline_readonly_symbol='≠'
let g:airline_linecolumn_prefix='||'
set noshowmode
"let g:Powerline_symbols = 'fancy'

"let g:airline_powerline_fonts = 1
"g:airline_symbols
"function! AccentDemo()
  "let keys = ['a','b','c','d','e','f','g','h']
  "for k in keys
    "call airline#parts#define_text(k, k)
  "endfor
  "call airline#parts#define_accent('a', 'red')
  "call airline#parts#define_accent('b', 'green')
  "call airline#parts#define_accent('c', 'blue')
  "call airline#parts#define_accent('d', 'yellow')
  "call airline#parts#define_accent('e', 'orange')
  "call airline#parts#define_accent('f', 'purple')
  "call airline#parts#define_accent('g', 'bold')
  "call airline#parts#define_accent('h', 'italic')
  "let g:airline_section_a = airline#section#create(keys)
"endfunction
"autocmd VimEnter * call AccentDemo()

" 启用 smartcase. 仅当输入大写字母时，区<silent>分大小写 
" let g:neocomplcache_enable_smart_case = 1
" 启用大写字母补全.输入大写字母时, 进行模糊搜索可能性词语  例如，当输入AE时匹配ArgumentsException。
let g:neocomplcache_enable_camel_case_completion = 1
" 启用下划线补全.进行模糊搜索匹配的词。例如,当输入'p_h'时会匹配'public_html'。默认值是 0
let g:neocomplcache_enable_underbar_completion = 1
 "自动选择
let g:neocomplcache_enable_auto_select = 1  
"inoremap <expr><CR>  pumvisible() ? neocomplcache#close_popup() : "\<CR>"
"inoremap <expr><space>  pumvisible() ? "<C-n>" : "\<SPACE>"
"inoremap <expr><S-Space>  pumvisible() ? "<C-p>" : "\<SPACE>"
"设置supertable
"let g:SuperTabDefaultCompletionType="context" 
"只需编辑~/.vim/snippets/目录下的*.snippets文件就可以根据自己的要求自动产生代码
"设置snipmate运行目录,解决windows兼容性
"let g:snippets_dir = "d:/Vim/vimfiles/snippets/"


"配置作者信息
let g:developer_developer='carmack.ding' "设置开发者名称
let g:developer_email='dotnet010@gmail.com' "设置开发者邮箱
let g:developer_homepage='http://www.aboutme.com.cn' "指定开发者主页
let g:developer_version='0.0.1' "指定初始版本号
let g:developer_version_length='4' "指定版本号长度
nnoremap <silent><A-4> :DeveloperInfoDetect<cr>
nmap <silent> 4 <A-4> 


filetype on
au FileType php call MyPHP()
" For PHP
function MyPHP()
    set dictionary-=/home/cool/.vim/syntax/php_funclist.txt dictionary+=/home/cool/.vim/syntax/php_funclist.txt
    set complete-=k complete+=k
endfunction

if has('win32')
    	au GUIEnter * simalt ~x
else
    	au GUIEnter * call MaximizeWindow()
endif
function! MaximizeWindow()
    	silent !wmctrl -r :ACTIVE: -b add,maximized_vert,maximized_horz
endfunction

"替换字符串
"{
fun! AReplace() 
	let s:word = input("Replace " . expand('<cword>') . " with:")
	if s:word != ''
		exe '%s/\<' . expand('<cword>') . '\>/' . s:word . '/ge' 
	endif
	unlet! s:word
endfunction

"fun! NReplace() 
"	let s:search = expand('<cword>')
"	let s:replace =  input('Replace ' . expand('<cword>') . ' with:')
"	if s:search != '' && s:replace!=''
"		let s:flag = search(s:search)
"		if s:flag ==0
"			echo 'Can't find ''.s:search.'''
"		else
"			exec 's/\<' . s:search . '\>/' . s:replace . '/e' 
"			echo ''
"			echo 'Replaced line'.s:flag
"			echo ''
"			let s:loag = inputlist(['Repeat?','1.yes','2.no','3.All'])
"			while(s:loag =='1')
"				let s:flag = search(s:search)
"				if s:flag==0
"					echo ' '
"					echo 'Replaced'
"					echo ' '
"					let s:loag= input('input any for exit')
"					break
"				else
"					echo ' '
"					exec 's/\<' . s:search . '\>/' . s:replace . '/e' 
"					echo ' '
"					echo 'Replace line:' .s:flag
"					echo ' '
"					let s:loag = inputlist(['Repeat?','1.yes','2.no','3.All'])
"				endif
"			endwhile
"			if s:loag == 3
"				echo ' '
"				exec '%s/\<' . s:search . '\>/' . s:replace . '/ge' 
"				echo ' '
"				echo 'Replaced'
"				echo ' '
"				let s:loag= input('input any for exit')
"			endif
"			unlet! s:loag
"			unlet! s:flag
"			unlet! s:search
"			unlet! s:replace
"		endif
"	endif
"endfunction


fun! Replace() 
	let s:search = expand('<cword>')
"	let s:search = input("input you want search key:")
	let s:replace =  input("Replace '" . expand("<cword>") . "' with:")
	if s:search != '' && s:replace!=''
		exec '%s+' . s:search . '+' . s:replace . '+gc' 
	endif
	unlet! s:search
	unlet! s:replace
endfunction


fun! VReplace() 
	let s:search = expand('<cword>')
	let s:word=input('you search "'.s:search.'" ,or input you key:')
	try
		if s:search!=""&&s:word==""
			let s:word=s:search
		endif
		if  s:word != ""
			let s:path =inputlist(['select search path:','1:/**/*.php','2:*.php','3:user input:'])
	    	if s:path == 1
				exec ':vimgrep '  . s:word. '  */*.php' .'|copen'
			elseif s:path ==2
				exec ':vimgrep '  . s:word. '  *.php' .'|copen'
			else
				let s:path=input("Please enter the path:")
				while(s:path =='')
					let s:path=input("Please enter the path:")
				endwhile
				exec ':vimgrep '  . s:word.' '. s:path .'|copen'
			endif
			unlet! s:path
		endif
	catch
		exec 'cclose'
	endtry
	unlet! s:word
	unlet! s:search
endfunction
"	if s:word !=''
"		exec ':vimgrep '  . s:word. '  **/*.php' .'|copen'
"	endif
inoremap <A-f> <esc>:call VReplace()<cr>
noremap <A-f> <esc>:call VReplace()<cr>
inoremap <A-g> <esc>:call Replace()<cr>
noremap <A-g> <esc>:call Replace()<cr>
"}




"程序开发自动配对
function ClosePair(char)
        if getline('.')[col('.') - 1] == a:char
                return ""
        else
                return a:char
        endif
endf

inoremap <silent>( ()<esc>
":inoremap ) :ClosePair(')')
inoremap <silent>{ {<CR>}<esc>O
"":inoremap } :ClosePair('}')
inoremap <silent>[ []<esc>
":inoremap ] :ClosePair(']')
inoremap <silent>< <><esc>i
inoremap <silent>' ''<esc>i
inoremap <silent>" ""<esc>i
":inoremap > =ClosePair('>')
"inoremap <buffer> h1 <h1></h1><esc>4hi
"inoremap <buffer> `//  /**--------------------<CR>*<CR>*--------------------*/<esc>kA

noremap  <buffer><leader>// <esc>:call Getfiletype()<cr>
function Getfiletype()
let s:filetype = expand("%:e") 
if s:filetype=='php'
	normal o
	call setline('.','/**--------------------')
	normal o
	call setline('.','*')
	normal o
	call setline('.','*--------------------*/')
	normal k
	startinsert!
elseif s:filetype=='html'
	normal o
	call setline('.','<!-- -->')
	exe 'normal 3h i'
	startinsert!
	call cursor(line('.'),5)
endif
endfunction

"解决终端下无法使用Alt键,并处理F1-F4
if &cp || exists("g:loaded_escalt") || has("gui_running") || has("win32") || has("win64")
  finish
endif
let s:keepcpo = &cpo
let g:loaded_escalt = 1
set cpo&vim
" ---------------------------------------------------------------------
" Functions:
function Escalt_console()
  for i in range(65, 90) + range(97, 122)
    exe "set <M-".nr2char(i).">=\<Esc>".nr2char(i)
  endfor
  set ttimeoutlen=50
  if &term =~ 'xterm'
    set <F1>=OP
    set <F2>=OQ
    set <F3>=OR
    set <F4>=OS
    set <Home>=OH
    set <End>=OF
  endif
  for i in ["", "c", "i", "x"]
    exe i . "map 脧1;2P <S-F1>"
    exe i . "map 脧1;2Q <S-F2>"
    exe i . "map 脧1;2R <S-F3>"
    exe i . "map 脧1;2S <S-F4>"
  endfor
endfunction
" ---------------------------------------------------------------------
" Call Functions:
call Escalt_console()
" ---------------------------------------------------------------------
"  Restoration And Modelines:
let &cpo= s:keepcpo
unlet s:keepcpo
"----------------------------------------------------------------------


"默认配色方案
"hi ErrorMsg term=standout ctermbg=DarkRed ctermfg=White guibg=Red guifg=White
"hi IncSearch term=reverse cterm=reverse gui=reverse
"hi ModeMsg term=bold cterm=bold gui=bold
"hi StatusLine term=reverse,bold cterm=reverse,bold gui=none guifg=black	guibg=#606060 
"hi StatusLineNC term=reverse cterm=reverse gui=none guifg=black	guibg=#606060 
"hi VertSplit term=reverse cterm=reverse guifg=#606060	guibg=#606060 gui=none
"hi Visual term=reverse ctermbg=black guibg=#353535
"hi VisualNOS term=underline,bold cterm=underline,bold gui=underline,bold
"hi DiffText term=reverse cterm=bold ctermbg=Red gui=bold guibg=Red
"hi Cursor guibg=#dddddd guifg=Black
"hi lCursor guibg=Cyan guifg=Black
"hi Directory term=bold ctermfg=LightCyan guifg=lightgreen gui=underline
hi LineNr term=underline ctermfg=cyan guifg=#FFD700
"hi MoreMsg term=bold ctermfg=LightGreen gui=bold guifg=SeaGreen
"hi NonText term=bold ctermfg=LightBlue guifg=LightBlue guibg=black
"hi Question term=standout ctermfg=LightGreen gui=bold guifg=Green
"hi Search term=reverse ctermbg=Yellow ctermfg=Black guibg=lightYellow guifg=Black
"hi SpecialKey term=bold ctermfg=LightBlue guifg=Cyan
"hi Title term=bold ctermfg=LightMagenta gui=bold guifg=Magenta
"hi WarningMsg term=standout ctermfg=LightRed guifg=Red
"hi WildMenu term=standout ctermbg=Yellow ctermfg=Black guibg=Yellow guifg=Black
"hi Folded term=standout ctermbg=LightGrey ctermfg=DarkBlue guibg=DarkBlue guifg=#E6E8FA
"hi FoldColumn term=standout ctermbg=LightGrey ctermfg=DarkBlue guibg=Grey guifg=DarkBlue
"hi DiffAdd term=bold ctermbg=DarkBlue guibg=DarkBlue
"hi DiffChange term=bold ctermbg=DarkMagenta guibg=DarkMagenta
"hi DiffDelete term=bold ctermfg=Blue ctermbg=DarkCyan gui=bold guifg=Blue guibg=DarkCyan
"hi CursorColumn term=reverse ctermbg=Black guibg=grey40
"hi CursorLine term=underline cterm=underline guibg=#202020
"语法关键字
"hi statement	guifg=#005cff	ctermfg=blue	ctermbg=black	gui=none
"hi preproc	 guifg=#005cff	ctermfg=blue
"类型关键字
"hi type	 guifg=#005cff	ctermfg=blue	ctermbg=black	gui=none
"注释
hi comment	 guifg=#336633 ctermfg=cyan ctermbg=black	gui=none
"常量
"hi Constant term=underline ctermfg=Magenta guifg=#ff8000 gui=none
"数字
"hi Number term=underline ctermfg=Magenta guifg=Magenta gui=none
"标识符,如lua中的function end if 
"hi identifier	guifg=#005cff	 ctermfg=red	gui=none
"标签
"hi label	 guifg=yellow	ctermfg=yellow
"hi operator	 guifg=orange	ctermfg=lightRed	ctermbg=darkBlue
"hi TabLine guifg=black gui=none
"hi TabLineSel	gui=none
"hi TabLineFill	guibg=darkgrey	gui=none
"hi MatchParen ctermbg=blue guibg=lightblue guifg=black
"弹出菜单
"hi Pmenu	guibg=#101010	guifg=#909090 gui=none
"弹出菜单选中项
hi PmenuSel	guibg=#cda49e	guifg=#c51f1f gui=none
