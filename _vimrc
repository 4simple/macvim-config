" =======================================================
" VIM Config for macvim by wondger@gmail.com @ 2012-01-03
" =======================================================

" ===========
" UI Settings
" ===========
se nocp "不兼容模式
se backspace=indent,eol,start
se whichwrap=b,s,<,>,[,]
se sm "showmatch 设置高亮匹配
se cino=:0,g0 "what's this?
se nu "行号
se ai "自动缩进
se si "智能缩进 
se go= "隐藏菜单栏 
se helplang=cn "帮助语言
se syn=on "语法高亮
se shiftwidth=4
se softtabstop=4
se tabstop=4 "tab键宽度
"se noexpandtab "不要用空格代替制表符
se expandtab "用空格代替制表符
se confirm "在处理为保存或制度文件的时候，弹出确认
se cindent "C语言风格自动缩进
se foldmethod=indent "按缩进进行自动折叠
se ruler "右下角状态行
se hls "高亮搜索
se matchtime=5 "高亮显示匹配的括号
se smarttab "行首的根据'shiftwidth'插入空白
se backspace=indent,eol,start "在插入状态下使用退格和delete
se showcmd "在状态栏显示目前所执行的指令
se showmatch "再输入括号时光标会短暂地跳到与之相匹配的括号处，不影响输入
let mapleader = ','
se ff=unix
se wildmenu
" status
se laststatus=2
se statusline=%F%m%r%h%w\ [ff=%{&ff}\ ft=%Y\ fenc=%{&fenc}]\ [pos=%l,%v\ %p%%]\ [lines=%L]

se nobackup "禁止生成备份文件
se noswapfile "禁止生成临时文件
se autowrite "自动保存
filetype plugin indent on "打开文件内容监测，为特定的文件类型载入插件，为不同的文件类型定义不同的缩进格式

"解决输入法的困扰
se iminsert=0
se imsearch=0
se imd 
au InsertEnter * se noimd 
au InsertLeave * se imd
au FocusGained * se imd

"SHIFT+F
map <S-F> :tabnew <cfile><cr>
map <silent><leader>q :q<cr>
noremap <silent>Q ZQ<cr>
map <leader>n :new 
map <leader>s :se 
map <D-f> :se invfu<CR>

"map <C-t> :tabnew 
map <leader>ss :source $VIM/
map <leader>t :tabnew 
map <leader>e :e 
map <leader>ms :mksession! $VIM/
"map <leader>wi :wviminfo 
"map <leader>ri :rviminfo 
map <leader>vsf :vertical sfind 
map <leader>df :vert diffsplit 
"取消搜索高亮 JSLint
map <silent><C-h> :noh<cr>:call JSHintClear()<cr>
"tab
map <silent><C-Tab> :tabn<cr>
map <silent><S-Tab> :tabp<cr>

nmap ht :helptags ~/.vim/doc<cr>
nmap <tab> <C-W><C-W>

"vimrc
noremap <silent><leader>src :source $MYVIMRC<cr>
noremap <silent><leader>rc :tabnew $MYVIMRC<cr>
au! bufwritepost .vimrc source $MYVIMRC

" 设置字符集编码，默认使用utf8
se nobomb "去掉utf-bom
se encoding=utf8
se fileencodings=utf8,gbk,gb2312,gb18030,ucs-bom,latin1

"设置新建保存编码为utf-8
map <leader>fu :se fenc=utf-8<esc>:w<cr>
map <leader>fg :se fenc=gbk<esc>:w<cr>

"new tab remove empty tab
"au BufEnter * call DelEmptyBuf()

colo simple
if has("gui_running") "GUI settings
    "theme
    se gfn=Courier:h16
    "se gfn=Bitstream_Vera_Sans_Mono:h16
    "se gfn=Menlo:h16
    "se gfn=Courier_New:h16
    se t_Co=256 "256 color mode
    se cursorline "highlight current line
    se nowrap
    se guioptions+=b
    "theme

    se fu "fullscreen macvim opt(fu/nofu)
    "se fuopt+=maxhorz "grow to maximum horizontal width on entering fullscreen mode
endif

" =============
" some commands
" =============
imap <silent><leader>d <c-r>=strftime('%Y-%m-%d')<cr>
imap <silent><leader>t <c-r>=strftime('%Y-%m-%d %H:%M:%S')<cr>
imap <silent><leader>s <c-r>=localtime()<cr>
nmap <silent><leader>co :call ToggleCursorColumn()<cr>
map <silent><F12> :call PageView('chrome')<cr>

au BufEnter *.js,*.vim :call SetTextWidth()
au FileType nerdtree :setl nofoldenable
au BufEnter * silent! lcd %:p:h "自动cd到当前文件目录

"自动完成括号和引号 mac下和输入法有冲突
inoremap ( ()<esc>:let leavechar=")"<cr>i
inoremap [ []<esc>:let leavechar="]"<cr>i
inoremap { {}<esc>:let leavechar="}"<cr>i
"inoremap ' ''<esc>:let leavechar="'"<cr>i
inoremap " ""<esc>:let leavechar='"'<cr>i

"template
nmap <silent><C-N> :SimpleTemplateTab tb.html<cr>
nmap <silent><C-M> :SimpleTemplateTab sw.html<cr>
nmap <silent><C-J> :SimpleTemplateTab js.js<cr>
nmap <silent><C-Y> :SimpleTemplateTab css.css<cr>
nmap <silent><C-P> :SimpleTemplateTab php.php<cr>
nmap <silent><C-X> :SimpleTemplateTab xml.xml<cr>
"nmap <silent><C-R> :SimpleTemplateTab reset.css<cr>

"set filetype
nmap <silent><S-T><S-H> :se ft=xhtml<cr>
nmap <silent><S-T><S-J> :se ft=javascript<cr>
nmap <silent><S-T><S-C> :se ft=css<cr>
nmap <silent><S-T><S-P> :se ft=php<cr>
nmap <silent><S-T><S-V> :se ft=vim<cr>

"set fileformat
nmap <leader>ff :se ff=

au FileType ruby,eruby set omnifunc=rubycomplete#Complete
au FileType python set omnifunc=pythoncomplete#Complete
au FileType javascript set omnifunc=javascriptcomplete#CompleteJS
au FileType html set omnifunc=htmlcomplete#CompleteTags
au FileType css set omnifunc=csscomplete#CompleteCSS
au FileType xml set omnifunc=xmlcomplete#CompleteTags
au FileType java set omnifunc=javacomplete#Complete

"if has("autocmd") && exists("+omnifunc")
"    autocmd Filetype *
"  \ if &omnifunc == "" |
"  \   setlocal omnifunc=syntaxcomplete#Complete |
"  \ endif
"endif

"variables
let g:cfgpath = '~/.vim/'

"functions
"
"isCC设为全局变量在多窗口中存在bug
"切换垂直参考线
let g:isCC = 0
function! ToggleCursorColumn()
    if(g:isCC)
        se nocursorcolumn
        let g:isCC = 0
    else
        se cursorcolumn
        let g:isCC = 1
    endif
endfunction

"打开当前编辑页面
function! s:setBrowser(browserName,value)
  if !exists('g:Browser[a:browserName]')
    let g:Browser[a:browserName] = a:value
  endif
endfunction

function! PageView(browser)
    let file = expand('%:p')
    if match(file,'\.js$\|\.css$\|\.htm$\|\.html$\|\.txt\|\.vim') == -1
        echo 'PageView cant not support current filetype'
        return
    endif
    if !exists('g:Browser')
        let g:Browser = {}
    endif
    if has('win32')
        call s:setBrowser('chrome',expand('~').'\Local Settings\Application Data\Google\Chrome\Application\chrome.exe')
    else
        call s:setBrowser('chrome','chromium-browser')
        call s:setBrowser('firefox','firefox')
        call s:setBrowser('opera','opera')
        call s:setBrowser('konqueror','konqueror')
    endif
    if !exists('g:Browser[a:browser]')
        return
    endif
    silent execute '!start "'.g:Browser[a:browser].'" "'.expand('%:p').'"'
endfunction

"buffers length
function! Buflen()
    return len(filter(range(1,bufnr('$')),'buflisted(v:val)'))
endfunction

"delete the init empty buffer when new buffer
"bug in NERD_Tree
function! DelEmptyBuf()
    if Buflen()==2 && !len(bufname(1))
        bun 1
    endif
endfunction

"TODO:
"args *.*
"argdo command

" ===============
" Plugin settings
" ===============

""""""""""""""""""""""""""""""
" NERD_tree
""""""""""""""""""""""""""""""
let NERDTreeShowHidden=1
nmap <leader>d :NERDTree<cr>

""""""""""""""""""""""""""""""
"snipMate
""""""""""""""""""""""""""""""
let g:snips_author = 'wondger'
let g:snippets_dir = '~/.vim/snippets/'
"ino <tab> <c-r>=TriggerSnippet()<cr>
"snor <tab> <esc>i<right><c-r>=TriggerSnippet()<cr>

""""""""""""""""""""""""""""""
" SimpleTemplate
""""""""""""""""""""""""""""""
let g:SimpleTemplate = {
    \'path':$HOME.'/.vim/plugin/template/',
    \'default_name':'',
    \'cursor':'#cursor#',
    \'flags':[
        \{
            \'key':'#filename#',
            \'value':'#filename#'
        \},
        \{
            \'key':'#date#',
            \'value':'#date#'
        \},
        \{
            \'key':'#author#',
            \'value':'wondger'
        \},
        \{
            \'key':'#email#',
            \'value':'wondger@gmail.com'
        \}
    \]
\}


""""""""""""""""""""""""""""""
" zencoding
""""""""""""""""""""""""""""""
"todo:
    "[ ]how to config snippets

let g:use_zen_complete_tag = 1
let g:user_zen_settings = {
\  'indentation':'    ',
\  'html':{
\    'extends':'html,php',
\    'snippets':{
\      'msg':"<div class=\"msg msg-${cursor}\">\n\t${child}\n</div>"
\    }
\  }
\}
let g:user_zen_expandabbr_key = '<C-y>'
let g:user_zen_expandword_key = '<C-y>'
"let user_zen_balancetaginward_key
"let user_zen_balancetagoutward_key
"let user_zen_next_key
"let user_zen_prev_key
"let user_zen_imagesize_key
"let user_zen_togglecomment_key
"let user_zen_splitjointag_key
"let user_zen_removetag_key
"let user_zen_anchorizeurl_key
"let user_zen_anchorizesummary_key

""""""""""""""""""""""""""""""
" tagbar
""""""""""""""""""""""""""""""
nmap <leader>t :TagbarToggle<cr>
"let g:tagbar_ctags_bin = ''
let g:tagbar_width = 30
let g:tagbar_iconchars = ['▸','▾']

""""""""""""""""""""""""""""""
" pathogen
""""""""""""""""""""""""""""""
"how to use
call pathogen#infect()

""""""""""""""""""""""""""""""
" jslint
""""""""""""""""""""""""""""""
"let g:JSLintHighlightErrorLine = 0
"let g:JSLintAuto = 0
"nmap <silent><S-C> :JSLintUpdate<cr>

""""""""""""""""""""""""""""""
" JSHint
""""""""""""""""""""""""""""""
"let g:JSHintHighlightErrorLine = 0
let g:JSHintAuto = 0
nmap <silent><S-C> :JSHintUpdate<cr>

"Functions
" textwidth
function! SetTextWidth()
    " 换行 提示线 80宽度外字符以Comment显示
    setl tw=80
    "set nowrap
    " colorcolumn
    setl cc=80
    hi colorcolumn guibg = #2E0000
    let g:mtw = matchadd('OutTextWidth', '\%>' . &textwidth . 'v.\+', -1)
endfunction

"page view
function! PageView(browser)
    let file = expand('%:p')
    if match(file,'\.js$\|\.css$\|\.htm$\|\.html$\|\.txt\|\.vim') == -1
        echo 'PageView cant not support current filetype'
        return
    endif
    if !exists('g:Browser')
        let g:Browser = {}
    endif
    if has('win32')
        call s:setBrowser('chrome',expand('~').'\Local Settings\Application Data\Google\Chrome\Application\chrome.exe')
    else
        call s:setBrowser('chrome','chromium-browser')
        call s:setBrowser('firefox','firefox')
        call s:setBrowser('opera','opera')
        call s:setBrowser('konqueror','konqueror')
    endif
    if !exists('g:Browser[a:browser]')
        return
    endif
    silent execute '!start "'.g:Browser[a:browser].'" "'.expand('%:p').'"'
endfunction

" hidden highlight
function! JSHintClear()
    if exists(':JSHintClear')
        :JSHintClear
    endif
endfunction
