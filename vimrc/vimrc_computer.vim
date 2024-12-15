"设置标志位
let g:vimrcid = 5
let mapleader = ","
"设置作者和版权信息{{{{
map <F6> :call TitleDet()<cr>
function! AddTitle()
    call append(0,"/*******************************************************")
    call append(1,"$Author       : 唐新楼 ")
    call append(2,"$Last modified: ".strftime("%Y-%m-%d %H:%M"))
    call append(3,"$Email        : 个人邮箱")
    call append(4,"$blog         : https://blog.csdn.net/daweigongting")
    call append(5,"$Filename     : ".expand("%:t"))
    call append(6,"$Description  : tangxinlou")
    call append(7,"*******************************************************/")
    echohl WarningMsg | echo "Successful in adding copyright." | echohl None
endfunction
function! UpdateTitle()
    normal m'
    execute '/$Last modified/s@:.*$@\=strftime(":\t%Y-%m-%d %H:%M")@'
    normal ''
    normal mk
    execute '/$Filename/s@:.*$@\=":\t".expand("%:t")@'
    execute "noh"
    normal 'k
    echohl WarningMsg | echo "Successful in updating the copyright." | echohl None
endfunction
function! TitleDet()
    let n=1
    while n < 10
        let line = getline(n)
        if line =~ '^\$*\S*Last\smodified\S*.*$'
            call UpdateTitle()
            return
        endif
        let n = n + 1
    endwhile
    call AddTitle()
endfunction
"}}}}
"设置屏幕效果按za打开折叠{{{{
"设置折叠的颜色
hi Folded term=standout ctermfg=darkcyan ctermbg=NONE guifg=Black guibg=#e3c1a5
set nocompatible
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set fileencodings=utf-8,gb2312,gbk,gb18030,big5,cp936,gbk,ucs-bom,latin-1
set encoding=utf-8
set hlsearch
set incsearch
set number
set modifiable
"set ignorecase
set noignorecase
set ruler
set magic
set fileformats=unix
set laststatus=2
set statusline=%F
set statusline+=%=
set statusline+=%l
set statusline+=/
set statusline+=%v
set statusline+=/
set statusline+=%L
"set statusline=%f
"set foldenable
set foldmethod=syntax
set foldlevel=100
"set foldignore=
"set foldmethod=marker
"set mouse=nv
syntax on
set showmode
set nowrap
set ve=all
set smartindent
"set cindent
"set autoindent
"set indentexpr
set backspace=2
"set spell
"colorscheme peachpuff
set browsedir=current
"diff 模式忽略空格的改变
"set diffopt+=icase
"set diffopt+=iwhite
"set diffexpr=""
set shortmess=a
set cmdheight=2
"vimscript 语言代码不能格式化
filetype indent on
set cursorline cursorcolumn
set guioptions=mrb
set diffopt=context:3
"set scrolloff=999
"隐藏一些提示信息
set hidden
"gitbash vim 和windows 不共用剪贴板
set clipboard=exclude:clipboard
"let java_highlight_functions = "indent"
"colorscheme torte
colorscheme elflord
"}}}}}
"vimdiff 颜色配置{{{
if &diff
    "colorscheme morning
    "colorscheme industry
    "set diffopt-=internal
    "set diffopt+=iwhite
    "diff模式关闭颜色高亮
    colorscheme elflord
    syntax off
endif
"}}}
"快捷输入{{{{
"iabbrev com tangxinlou@wingtech.com
"iabbrev txl tangxinlou
"iabbrev r r!
iabbrev find find -iname '*mobilelog*'
"iabbrev echo call Dbug(,3)
iabbrev <expr> echo  "if 3 > g:debugflag \| call Dbug(,3,0) \| endif" . "\<Left>\<Left>\<Left>\<Left>\<Left>\<Left>\<Left>\<Left>\<Left>\<Left>\<Left>\<Left>\<Left>"
iabbrev findana find -iname 'analy.txt'
iabbrev grep grep -Esinr --include=*{.c,.cc,.cpp,.java,.h}
iabbrev vimg vimgrep! //j %:p
iabbrev gitstatus git status .
iabbrev gitreflog git reflog
"git log --graph --pretty=oneline --abbrev-commit --decorate
"查看这个commit 在哪些分支合入了
iabbrev gitbranch git branch -a --contains
"iabbrev gitlog git log --graph --oneline  --decorate
"repo sync --local-only
iabbrev gitadd git add --intent-to-add .
iabbrev gitdiff git diff --binary > my_patch.patch
iabbrev gitlog  git log --graph --oneline  --decorate  --date=format:\%Y-\%m-\%d --pretty=format:"\%cd \%cn \%H \%s"
iabbrev gitcherrypick  git cherry-pick
iabbrev gitlogbranch git log --graph --decorate --oneline --all
iabbrev gitfile git log  --pretty=oneline
iabbrev gitchange git  log --oneline  --decorate --pretty=format:"\%cr \%cn \%H \%s" --all  --grep
iabbrev gittime git reflog show --date=iso
iabbrev gitcfg git config my.log-compliance-check false
"git log --oneline  --decorate --date=format:\%Y-\%m-\%d --pretty=format:"\%cd+\%an+\%H+\%s"
"}}}
"auto command自动命令{{{
""创建空文件和自动注释
""设置折叠
augroup filetype_vim
    autocmd FileType vim  setlocal foldmethod=marker
augroup END
augroup filetype_make
    autocmd FileType make  setlocal  noexpandtab
augroup END
augroup filetype_markdown
    "autocmd FileType markdown  setlocal foldmethod=manual syntax marker
    autocmd FileType markdown  setlocal foldmethod=expr
    autocmd FileType markdown  setlocal foldexpr=GetPotionFold(v:lnum)
    autocmd FileType text  setlocal foldmethod=expr
    autocmd FileType text  setlocal foldexpr=GetPotionFold(v:lnum)
    autocmd FileType special setlocal foldmethod=expr
    autocmd FileType special   setlocal foldexpr=GetPotionFold(v:lnum)
    autocmd FileType markdown  :highlight MyGroup1 term=reverse ctermbg=black guibg=Grey40
    autocmd FileType markdown  :let m = matchadd("MyGroup1", "_")
augroup END
augroup filetype_dts
    autocmd FileType dts  setlocal foldmethod=indent
    autocmd FileType dts  setlocal foldignore=
augroup END
augroup filetype_csv
    autocmd BufNewFile,BufRead *.csv      setf csv
    autocmd BufEnter * :call SetFileType()
    "autocmd WinEnter * :call DynamicallyOpenTheMouse()
    "autocmd QuitPre *.csv   :call VisualiZationcsv(2,",")
augroup END
augroup filetype_python
    autocmd BufNewFile *.py      :call Openfile()
    autocmd BufNewFile *.sh      :call Openfile()
augroup END
autocmd VimEnter * :cle
"保存文件打印
augroup testgroup
    "清除组命令
    autocm!
    "保存文件是自动打印
    autocmd BufWrite * :echom "cat"
    "syntax match javaFunction "\<\h\w*\>\s*("
    autocmd FileType  cpp  syntax match javaFunction '\<\h\w*\>\ze\s*('
    autocmd FileType  cpp   hi link javaFunction Function
    autocmd FileType java   syntax match javaFunction '\<\h\w*\>\ze\s*('
    autocmd FileType java    hi link javaFunction Function
    autocmd FileType java    hi link javaLineComment Special
    autocmd FileType java    hi link javaComment Special
    autocmd FileType c   syntax match javaFunction '\<\h\w*\>\ze\s*('
    autocmd FileType c    hi link javaFunction Function
augroup END

"}}}
"寄存器{{{
"开始清除寄存器
""abcilud已使用
"let @" = ""
"let @0 = ""
"let @1 = ""
"let @2 = ""
"let @3 = ""
"let @4 = ""
"let @5 = ""
"let @6 = ""
"let @7 = ""
"let @8 = ""
"let @9 = ""
"let @a = "" "保存文件路径
"let @b = "" "保存文件行数
"let @c = "" "关键代码行
"let @d = "" "写文档时关键日志列表
let @f = "" "定时器 find 历史搜素词
let @g = "" "定时器 grep 历史搜素词
"let @h = ""
let @i = "" "保存着当前次数搜索的行
"let @j = ""
"let @k = ""
let @l = "" "log搜索器的历史关键词
"let @s = "" "保存的debug id
"let @u = ""
"let @w = ""
"let @z = ""
"let @- = ""
"}}}
"简单的映射i{{{
"保存
noremap <leader>w :write<cr>
noremap <leader>q :q!<cr>
"插入模式<esc>
inoremap <leader>k <esc>
"可视模式<esc>
vnoremap <leader>k <esc>
"所有模式<esc>,我换输入法后这条命令失效
noremap  <leader>k <esc>
"按,v进入可视模式
inoremap  <leader>v <esc>v
"切换tab标签
nnoremap <c-n>  :tabn<cr>
nnoremap <c-p>  :tabp<cr>
"切换搜索结果
"nnoremap <leader>cn :cn<cr>
"nnoremap <leader>cp :cn<cr>
"切换打开的buffer
nnoremap <leader>bn :bn!<cr>
nnoremap <leader>bp :bp!<cr>
nnoremap <leader>tab :tabnew<cr>
"分割终端
nnoremap <leader>sp :split
nnoremap <leader>vsp :vsplit
"外部ls命令
nnoremap <leader>ls :copen<cr>:set modifiable<cr>:r!ls<cr><c-w>H
"外部wc命令
nnoremap <leader>lr :copen<cr>:set modifiable<cr>:r!ls -lR \| wc -l<cr>
"内部ls命令
nnoremap <leader>ll :ls<cr>
"外部tree命令
nnoremap <leader>tree   :copen<cr>:set modifiable<cr>:r!tree<cr><c-w>H
"改变分割的终端窗口的尺寸
nnoremap +  <c-w>+ 5
nnoremap -  <c-w>- 5
nnoremap <  <c-w>< 10
nnoremap >  <c-w>> 10
"内部cd命令
nnoremap cd :cd
vnoremap g y
nnoremap <leader>s :set mouse=r<cr>:set nonumber<cr>:set wrap <cr>:set clipboard=unnamed <cr>
"nnoremap <leader>wc :tabnew<cr>:!ls -lR |grep "^-"
"nnoremap <leader>f viwyq:ig/<esc>pa/p<cr>
"inoremap <C-h> <Left>
nnoremap <C-h> 60h
nnoremap <C-l> 60l
nnoremap <C-j> 10j
nnoremap <C-k> 10k
"inoremap <C-j> <Down>
"inoremap <C-k> <Up>
"inoremap <C-l> <Right>
"inoremap <bs> <bs>
"inoremap <leader>java <cr><bs><cr><esc>ki<tab><tab>
inoremap {} {}<esc>i<cr><esc>O
"inoremap {} {}<esc>i<cr><esc>V<O
inoremap "" ""<esc>i
"inoremap `` ``<esc>i
inoremap '' ''<esc>i
inoremap () ()<esc>i
nnoremap zr zR
nnoremap zm zM
"删除log文件中的杂乱log
nnoremap <leader>rep     :g/audio_hw_primary:/d<cr>:g/ANDR-PERF-LM:
"获取当前文件名及目录
nnoremap <leader>n :let @" = expand("%:p").':'.line(".").':'<cr>
"复制到系统黏贴板
"vnoremap <leader>m "+y
"删除window下添加^M
nnoremap <leader>vm :%s/<c-v><c-M>/<cr>/g
"自动复制文本所在的当前行及文件名
"vnoremap <leader>a "dy<esc>:let @c= expand("%:p").':'.line(".").':'<cr>
"复制文本及当前行
"nnoremap <leader>p i```c<cr>```<esc>O<esc>0"cpli<cr><esc>0"dp
"nnoremap <leader>p i<cr>```c<cr><cr><cr>```<esc>O<cr><esc>kkk"7pjj0"cpli<cr><esc>0"dpi<bs><esc>lki<bs><esc>
nnoremap <leader>txl :tabnew<cr>:e ~/tang1.txt<cr>
"nnoremap <leader>co :copen<cr>:set modifiable<cr><c-w>H
nnoremap <leader>co :call <SID>QuckfixToggle()<cr>
nnoremap <leader>br :vsplit<cr>:browse e<cr>
nnoremap <leader>viff :diffthis<cr><c-w>l:diffthis<cr><c-w>h:syntax off<cr>
"添加uml
nnoremap <leader>uml i```mermaid<esc>osequenceDiagram<esc>o```<esc>O
"markdown 注释多余的#
nnoremap <leader>map :%g/^#[a-z]\{1,3\}/normal 0i//<esc>
nnoremap <leader>h1 yiwq:i:2match DiffChange /\<<c-r>"\>/<CR>
"nnoremap <leader>h1 yiwkq:i:/\<<c-r>"\>/<CR>
"nnoremap <leader>/ q:i/<esc>p<CR>
"vnoremap <leader>/ yq:i/<esc>p<CR>
nnoremap <leader>fold  :set foldmethod=indent
"nnoremap  <leader>key   ^hi<<<>>><esc>hhikeycode<esc>
nnoremap  <leader>key   0i<<<>>><esc>hhikeycode<esc>
"批量改文件名 find -iname . -name '*.XXX' | awk -F "." '{print $2}' | xargs -i -t mv  {} {}.bck
nnoremap  <Down> ]c
nnoremap  <Up>   [c
"cherry pick 后解冲突
nnoremap <leader>cn /<<<<<<<<cr>v/=====<cr>$ddd/>>>>>>><cr>v$ddd
"nnoremap <leader>cp i//vivo tangxinlou modify for B211201-1894 begin<cr>//vivo tangxinlou modify for B211201-1894 end<esc>Oif (Log.isHostLoggable && Log.isLoggableModel) {}<esc>i<cr><esc>O<esc>p?//vivo tangxinlou<cr>v/// vivo tangaolin add .*end<cr>=
nnoremap <leader>cp i//vivo tangxinlou modify for B231223-81342 begin<cr>//vivo tangxinlou modify for B231223-81342 end<esc>O<esc>p
"inoremap <F3>  <cr><esc>gg0jvG$dk0v$hyq:0ir!find -iname '*<esc>pa*'<cr>gg0$a
"早期debug 映射
nnoremap <leader>rm :echom "hello"
nnoremap <leader>y :call AddLineNumber()<cr>
"echo winheight('%') winwidth('%')
nnoremap <leader>dd  :let tempchardretory = getline(line('.'))<cr>: execute " cd " . tempchardretory<cr>
nnoremap <leader>log  :call append(line('.'),g:debuglist)
"临时快捷键
"nnoremap <F12>  : noautocmd call SelectEntireCode()<cr>
"nnoremap <F12>  : call SelectEntireCode()<cr>
nnoremap <F12>  : call CallStack(0,[],line('.'),0,"",[])<cr>
"nnoremap <F12>  : call WhichFunctionToCall(line('.'))<cr>
"nnoremap <F12>  : call Exeample()<cr>
nnoremap  <leader>temp : call  JoinTwoTables()<cr>
"}}}
"画图{{{{
"inoremap  <Up>    <esc>kki^<esc>ji^<esc>ji^
inoremap  <c-k>  <esc>ki^<esc>lvdi<esc>ki^<esc>lvdi<esc>ki^<esc>lvdi
inoremap  <c-j>  <esc>jiv<esc>lvdi<esc>jiv<esc>lvdi<esc>jiv<esc>lvdi
"inoremap  <c-h>  <---<esc>hhhhvhhhdi
inoremap  <c-l>  ---><esc>lvllldi
inoremap  <c-k>k <esc>jli\<esc>lvdi<esc>jli\<esc>lvdi<esc>jli\<esc>lvdi
inoremap  <c-j>j <esc>jhi/<esc>lvdi<esc>jhi/<esc>lvdi<esc>jhi/<esc>lvdi
"inoremap  <c-h>h <esc>khi\<esc>lvdi<esc>khi\<esc>lvdi<esc>khi\<esc>lvdi
inoremap  <c-l>l <esc>kli/<esc>lvdi<esc>kli/<esc>lvdi<esc>kli/<esc>lvdi
"}}}}
"markdown{{{{
inoremap <leader>form \|<esc>ji\|<esc>ji\|<esc>ji\|<esc>kkka <esc>ji-<esc>ki \|<esc>ji\|<esc>ji\|<esc>ji\|<esc>kkka \|<esc>ji\|<esc>ji\|<esc>ji\|<esc>kkkl<c-v>lljjjdvlldjvdki



"}}}}
"编辑vimrc文件{{{
"编辑vimrc文件
nnoremap <leader>ev :tabnew<cr>:e $MYVIMRC<cr>
nnoremap <leader>et :tabnew<cr>:e ~/.vimrc_tt<cr>
nnoremap <leader>eg :tabnew<cr>:execute "e " . Homedir("autoanaly/keywords",1)<cr>
nnoremap <leader>ee :tabnew<cr>:execute "e " . Homedir("autoanaly/Extractioncode",1)<cr>
nnoremap <leader>ef :tabnew<cr>:execute "e " . Homedir("txl/plan",1)<cr>
nnoremap <leader>tr :tabnew<cr>:execute "e " . Homedir("txl/transplant.txt",1)<cr>
"加载vimrc文件
nnoremap <leader>sv :source $MYVIMRC<cr>:syntax match javaFunction '\<\h\w*\>\ze\s*('<cr>
nnoremap <leader>tt :source ~/.vimrc_tt<cr>
""}}}
"搜索命令{{{{
nnoremap gf  :execute  "grep! -sirn"  shellescape(expand(@@)) "~/txl/tang.txl"<cr>:!clear<cr>:copen<cr>:set modifiable<cr><c-w>H
nnoremap <leader>gg :tabnew<cr>q:0ir!grep -sirn "<esc>pa" . <cr>:tabm<cr>
"nnoremap <leader>f  :execute "grep! -Esirn  " shellescape(expand(@@))  "%:p" <cr>:!clear<cr>:copen<cr>:set modifiable<cr><c-w>J
"nnoremap <leader>f  :cexpr system('grep -Esinr  -RnI --exclude-dir={.git,.svn} --include=*{.c,.cc,.cpp,.java,.h} "BluetoothBondStateMachine"')
"在vimrc文件中|不可以映射，可以使用<bar>代替|
"nnoremap <leader>ff   q:ivimgrep! /\<bar>headset\<bar>a2dp/j  %:p <cr>:copen<cr><esc><cr>
nnoremap <leader>ff   q:ivimgrep! /<esc>"/pa/j %:p <cr>:copen<cr>:set modifiable<cr><esc><c-w>H
"按,gc后会使用外置的grep搜索光标下的单词的个数和文件位置并用新的修改区保存起来
nnoremap <leader>gc "iyy:execute "grep! -R " shellescape(expand("<cword>"))"."<cr>:!clear<cr>:let winwidthnum  = float2nr(winheight('%')  * 0.3)<cr>:copen<cr>:set modifiable<cr><c-w>J:execute "res " . winwidthnum<cr>::let winwidthnum = 0<cr>
"nnoremap <leader>vhc :execute "vimgrep!" shellescape(expand("<cword>")) " **/*.h"<cr>:!clear<cr>:copen<cr>:set modifiable<cr><c-w>H
nnoremap <leader>vh "iyy:execute "grep! -Esinr --include=*.h "shellescape(expand("<cword>"))"."<cr>:!clear<cr>:let winwidthnum  = float2nr(winheight('%')  * 0.3)<cr>:copen<cr>:set modifiable<cr><c-w>J:execute "res " . winwidthnum<cr>::let winwidthnum = 0<cr>
nnoremap <leader>vc "iyy:execute "grep! -Esinr --include=*{.c,.cc} "shellescape(expand("<cword>"))"."<cr>:!clear<cr>:let winwidthnum  = float2nr(winheight('%')  * 0.3)<cr>:copen<cr>:set modifiable<cr><c-w>J:execute "res " . winwidthnum<cr>::let winwidthnum = 0<cr>
nnoremap <leader>vj "iyy:execute "grep! -Esinr --include=*.java "shellescape(expand("<cword>"))"."<cr>:!clear<cr>:let winwidthnum  = float2nr(winheight('%')  * 0.3)<cr>:copen<cr>:set modifiable<cr><c-w>J:execute "res " . winwidthnum<cr>::let winwidthnum = 0<cr>
"执行命令
nnoremap <leader>xx <esc>:let @t=@*<cr>0v$hyG:r!date +\\%F-\\%T<cr>q:0ir!<esc>p<cr>o<cr><cr><esc>:let @*=@t<cr>:let @t=""<cr>:r!date +\\%F-\\%T<cr>
""}}}}
"文件路径切换{{{{
"更改到当前文件所在的目录
nnoremap <leader>lcd :lcd %:p:h
nnoremap <leader>start :silent call system("start " . expand("%:p:h"))<cr>
"打开选中的的文件,并新开一个tap
"omap i:  f:lvf:h
"nnoremap <leader>y :normal! yt:<cr>
"nnoremap <leader>cd :tabnew<cr>:execute "e" expand(@@)<cr>
"nnoremap <leader>cd  0"ayt:0f:lvf:h"by0<c-w>k:execute "e" expand(@a)<cr>:@b<cr>:setlocal foldmethod=syntax<cr>:let &foldlevel=100<cr>
nnoremap <leader>cd  :call SmartFileSwitching(1)<cr>
"nnoremap <leader>cv  0"ayt:0f:lvf:h"by0:tabnew<cr>:execute "e" expand(@a)<cr>:@b<cr>:tabm<cr>:setlocal foldmethod=syntax<cr>:let &foldlevel=100<cr>
nnoremap <leader>cv  :call SmartFileSwitching(2)<cr>
nnoremap <leader>cc  0"ayt\|0f\|lvf\|h"by0:tabnew<cr>:execute "e" expand(@a)<cr>:@b<cr>:tabm<cr>:setlocal foldmethod=syntax<cr>:let &foldlevel=100<cr>
"打开find搜索的文件
nnoremap <leader>zz  0v$hy:tabnew<cr>:setlocal foldmethod=syntax<cr>:let &foldlevel=100<cr>q:ie <esc>p<cr>
"}}}}
"函数{{{{
"{{{{{2   全局变量
let g:projectlist = ['vendor_vivo_bluetoothInteropConf',
            \ 'android_packages_apps_Bluetooth',
            \ 'android_system_bt',
            \ 'android_frameworks_base',
            \ 'android_vendor_mediatek_proprietary_hardware_connectivity_firmware_rom_patch',
            \ 'android_device_mediatek_vendor_common',
            \ 'android_vendor_mediatek_kernel_modules_connectivity_bt_mt66xx',
            \ 'android_vendor_qcom_opensource_commonsys_system_bt' ,
            \ 'android_vendor_qcom_opensource_commonsys_bluetooth_ext',
            \ "android_kernel-4.14",
            \ "android_vendor_mediatek_proprietary_hardware_connectivity_bluetooth_driver_mt66xx",
            \ "android_packages_modules_Bluetooth",
            \ "android_prebuilts_module_sdk_Bluetooth",
            \ "vendor_vivo_source_frameworks_services",
            \ "android_cts",
            \ "android_vendor_mediatek_kernel_modules_connectivity_bt_linux_v2",
            \ "android_vendor_qcom_opensource_commonsys_packages_apps_Bluetooth",
            \ "android_vendor_mediatek_proprietary_tinysys_adsp_HIFI3",
            \ "android_vendor_mediatek_proprietary_tinysys_common",
            \ "android_vendor_mediatek_proprietary_tinysys_adsp_common",
            \ "android_device_mediatek_common",
            \ "android_vendor_mediatek_proprietary_custom",
            \ "android_vendor_mediatek_proprietary_packages_modules_Bluetooth"]
"判断带{有下面的就不是函数
let g:nonfunctionlist = ["if(",
            \"  new ",
            \" interface ",
            \"class ",
            \"} catch",
            \"() -> {",
            \"namespace",
            \"if (",
            \"try{",
            \"try {",
            \"try (",
            \"for(",
            \"for (",
            \"synchronized (",
            \"synchronized(",
            \"switch (",
            \"else{",
            \"else {",
            \"case ",
            \"default:",
            \"do {",
            \"do {",
            \"switch(",
            \"while (",
            \"while(",
            \"static {",
            \"static{"]
let g:debugid = 0
"sdpdefs.h uuid
"hci_error_code.h  error code
"port_api.h rfcom 断开原因
let g:Removeduplicates = [
            \ 'AudioFlinger_Threads: volumedebug',
            \ 'getNewOutputDevices selected devices',
            \'Remote device name is',
            \'interop_database_match',
            \'btif_dm_update_rmt_device_name',
            \]
 let g:MultiDimensionalAnalysisSolution =  [
             \['101','102','201',"a2dp 通路",'A'],
             \['103','104','201',"hfp 通路",'A'],
             \]
let g:DimensionalAnalysis  = [
            \['A2dpStateMachine: A2DP Playing state : device: .* State:NOT_PLAYING->PLAYING','101'],
            \['A2dpStateMachine: A2DP Playing state : device: .* State:PLAYING->NOT_PLAYING','102'],
            \['HeadsetStateMachine: AudioOn: currentDevice=.*, msg=audio state changed: .*: Connected -> AudioOn','103'],
            \['HeadsetStateMachine: Connected: currentDevice=.*, msg=audio state changed: .*: AudioOn -> Connected','104'],
            \['HeadsetStateMachine: Connected: currentDevice=.*, msg=audio state changed: .*: AudioDisconnecting -> Connected','104'],
            \['APM_AudioPolicyManager: getNewOutputDevices selected devices','201'],
            \['volumedebug track','202'],
            \]
let g:Dimensionalmsg = {
            \'101' : "开启播放",
            \'102' : "停止播放",
            \'103' : "建立sco",
            \'104' : "断开sco",
            \}
let g:Dimensionalflag = []
"第二个参数[-2,1000]
"第一位是flag -1 既不计算也不显示，-2不计算但是显示
"第二位是时间，虽然这一行不计算，但是下一行还需要这个值计算
let g:smallestunitdict = {
            \"11gattconnect": [['BluetoothGatt: connect() - device: .*, auto', 0.0, ''], ['client_connect_cback: No active GAP service found for peer:.* callback:Connected', 593.0, ''], ['BtGatt.GattService: clientDisconnect', [-2,4703.0], ''], ['client_connect_cback: No active GAP service found for peer:.* callback:Disconnected', 5714.0, '']],
            \"10aclconnectstate": [['aclStateChangeCallback: Adapter State: ON Connected', 0.0, ''], ['aclStateChangeCallback: Adapter State: ON Disconnected', [-2,1000.0], '']],
            \"09扫描": [["BluetoothAdapterService: startDiscovery",0,''],["BluetoothAdapterService: cancelDiscovery",-2,'']],
            \"08a2dp_simple_start_play": [['StartRequest: accepted', 0.0, ''], ['A2dpStateMachine: A2DP Playing state : device: .* State:NOT_PLAYING->PLAYING', 481.0, ''], ['A2dpStateMachine: A2DP Playing state : device: .* State:PLAYING->NOT_PLAYING', [-2,1000.0], '']],
            \"07hfpVirtual_simple_start_call": [['HeadsetService: startScoUsingVirtualVoiceCall', 0.0, ''], ['HeadsetStateMachine: AudioOn: currentDevice=.*, msg=audio state changed: .*: Connected -> AudioOn', 260.0, ''],['HeadsetStateMachine: Connected: currentDevice=.*, msg=audio state changed: .*: AudioOn -> Connected', [-2,10000], '']],
            \"06hfp_simple_start_call": [['Telecom: Telecom: VivoCallsManager: setCallState CONNECTING -> DIALING', 0.0, ''], ['HeadsetStateMachine: AudioOn: currentDevice=.*, msg=audio state changed: .*: Connected -> AudioOn', 2917.0, ''],['HeadsetService: stopScoUsingVirtualVoiceCall',[-2,1000],''],['HeadsetStateMachine: Connected: currentDevice=.*, msg=audio state changed: .*: AudioOn -> Connected', [-2,10000], '']],
            \"05a2dp_simple_connect": [['A2dpStateMachine: Connection state .*: DISCONNECTED->CONNECTING', 0.0, ''], ['A2dpStateMachine: Connection state .*: CONNECTING->CONNECTED', 672.0, '']],
            \"04hfp_simple_connect": [['HeadsetStateMachine: Connecting: currentDevice=.*, msg=connection state changed: .*: Disconnected -> Connecting', 0.0, ''], ['HeadsetStateMachine: Connected: currentDevice=.*, msg=connection state changed: .*: Connecting -> Connected', 505.0, '']],
            \"03bond" : [['BluetoothBondStateMachine: Bond State Change Intent:.* BOND_NONE => BOND_BONDING', 0.0, ''], ['BluetoothBondStateMachine: Bond State Change Intent:.* BOND_BONDING => BOND_BONDED', 4695.0, '']],
            \"02auto_connect": [['BluetoothPhonePolicy: autoConnect: Initiate auto connection on BT on', 28631.0, ''], ['BluetoothPhonePolicy: autoConnect:HFP Device', 28634.0, ''], ['autoConnectHeadset: Connecting HFP with', 28634.0, ''], ['BluetoothPhonePolicy: autoConnect:A2DP Device', 28635.0, ''], ['BluetoothPhonePolicy: autoConnectA2dp: connecting A2DP', 28635.0, '']],
            \"01bluetoothenable": [['AdapterProperties: Setting state to OFF', 0.0, ''], ['AdapterProperties: Setting state to BLE_TURNING_ON', 96.0, ''], ['AdapterProperties: Address is', 478.0, ''], ['AdapterProperties: Setting state to BLE_ON', 524.0, ''], ['AdapterProperties: Setting state to TURNING_ON', 540.0, ''], ['AdapterProperties: Setting state to ON', 786.0, '']],
            \}
let g:filterchar = {
            \"35headsetcod" : "romote_cod|add leaudio cod",
            \"34hearingaid" : "connectEnabledProfiles.*Hearing Aid Profile|HearingAidStateMachine.*process message|connectHearingAidNative|HearingAidStateMachine.*->|BluetoothHearingAid: setVolume",
            \"33leaudio volume" : "AS.BtHelper: setLeAudioVolume|LeAudioService: SetVolume|VolumeControlService: setGroupVolume|VolumeControlService: setAvrcpVolume",
            \"32batchscan" : "onBatchScanStartStopped|onBatchScanReports|mtk_bta_batch_scan_reports_cb|BTM_BleReadScanReports",
            \"31acountconnect" : "vivoTWS-GattManager: onCharacteristicChanged characteristic|handleGattCharacteristic createBond|GattManager: handlePairRequest|vivoTWS-GattManager: onCharacteristicWrite",
            \"30hwerror" : "com.android.bluetooth.*has died|LogMsg: Received H/W Error|BT_FW assert|Bluetooth service died|ActivityManager: Killing.*com.android.bluetooth|com.android.bluetooth.*died because of ANR|MESSAGE_TIMEOUT_BIND|bluetooth: asser|init_uart.*stpbt|蓝牙打开失败|com.android.bluetooth.*died because of|com.android.bluetooth.*cause:|exited due to signal",
            \"29oppandpan" : "onConnect BluetoothSocket|Get incoming connection|Start Obex Server|BtOppService: HINT|BtOppService: TOTAL|Incoming Notification ID|BluetoothOppReceiver: Receiver|BluetoothOppReceiver:  action|BluetoothOppNotification: mCurrentBytes|BtOppTransfer: L2cap socket connection|BtOppTransfer: Create.*session|BtOppTransfer: Start session|BtOppTransfer: Stop mSession|BtOppTransfer:  Action|Receiving file completed|PanService: Pan Device state|updateShareStatus|sendIntentIfCompleted|Can't open file for OUTBOUND|putSendFileInf",
            \"28interopmatch" : "interop_database_match|interop_config_init: interop_config_init",
            \"27vivoshare" : "Share-BLEService: Connecting|Share-ShareLink-BleObserver: onFailure",
            \"26btelevel" : "BTE_InitTraceLevels TRC_AVDT|BTE_InitTraceLevels -- TRC_AVDT",
            \"25scoreason" : "btm_acl_iso_disconnected|HeadsetService:.*connectAudio|BluetoothHeadsetServiceJni: AudioStateCallback|bta_ag_create_sco|bta_ag_sco_disc_cback|setAclDisconnectReason",
            \"24twsbatteryearversion" : "sendBatteryLevelChangedBroadcast|tws wear state|vivoTWS-CheckUpdateTask.*SimpleEarInfo{right_version",
            \"23avrcpstatus stop play puase 012" : "MediaSessionService: Sending KeyEvent|opcode=Opcode::PASS_THROUGH|Reject invalid addressed|PlaybackStatusNotificationResponse|MetadataChanged|getCurrentPlayStatus|isDropKey: key_drop",
            \"22gamemode" : "GameModeManager: enter game mode|GameModeManager.*exit game mode:",
            \"21tool" : "collectresult.*\\[E",
            \"20absetvolume" : "AS.BtHelper: setAvrcpAbsoluteVolumeIndex|AvrcpNativeInterface: sendVolumeChanged",
            \"19a2dpcodec" : "A2dpStateMachine: A2DP Codec Config:.*->|ableOptionalCodecs|SelectSourceCodec:|SetCodecUserConfig|setCodecConfigPreference",
            \"18att" : "bta_gatts_send_request_cback|onResponseSendCompleted|GATTS_SendRsp:|BtGatt.GattService: .*Characteristic|BtGatt.GattService: on.*Characteristic|bt_gatt_callbacks.*characteristic_cb",
            \"17absolutevolume" : "DynamicAbsVolumeManager: getAbsoluteCap device|bluetooth::avrcp::ConnectionHandler::AcceptorControlCb|AvrcpNativeInterface: deviceConnected|AvrcpNativeInterface: deviceDisconnected|updateAbsoluteCap cap|ConnectionHandler::AvrcpConnect|ConnectionHandler::InitiatorControlCb|HandleVolumeChanged|Absolute volume disabled by property",
            \"16audiooutput" : "APM_AudioPolicyManager: startOutput.* stream [2345]|getNewOutputDevices selected",
            \"15volume" : "volumedebug.*streamType:[1234567]|onTrackStateCallback.*appname.*sessionid|AudioMTKGainController: setVoiceVolume(), index|AS.AudioService: setStreamVolume.*com.android.bluetooth",
            \"14rfcomconnect" : "port_release_port p_port|RFCOMM_CreateConnectionWithSecurity|RFCOMM connection closed",
            \"13gattadv" : "BtGatt.AdvertiseManager: stopAdvertisingSet|BtGatt.AdvertiseManager: startAdvertisingSet|Number of max instances 8 reached",
            \"12gattscan" : "BtGatt.GattService: startScan pkg|BtVcdTimer: startScan|BtVcdTimer: stopScan|BtVcdTimer: configureRegularScanParams|BtGatt.ScanManager.*Package",
            \"11gattconnect" : "connectEnabledProfiles|BluetoothGatt: connect.*auto|client_connect_cback:.*connected|BtGatt.GattService: clientDisconnect|BtGatt.ContextMap:.*app|GATT_Disconnect|GATT_Connect|pem  : BLE_REGITION_APP|BtGatt.GattService: clientConnect|BluetoothGatt: connect|client_connect_cback|clientDisconnect|bta_gattc_open_fail|bta_hh_le_open_fail|onClientConnected|BtGatt.GattService: registerServer|BtGatt.GattService: onServerRegistered| Send EATT Connect ",
            \"10aclconnectstate" : "aclStateChangeCallback.* Adapter State: ON.*Connected|OnConnectFail: Connection failed|btm_sec_disconnected clearing pending|Disconnection complete device|bluetooth: OnConnectFail|ISO disconnection from GD|btm_sco_on_disconnected",
            \"09扫描" : "BluetoothAdapterService: startDiscovery|BluetoothAdapterService: cancelDiscovery|BluetoothRemoteDevices: deviceFoundCallback",
            \"08a2dp_simple_start_play" : 'StartRequest: accepted|A2dpStateMachine: A2DP Playing state.*->\w+|BTAudioSessionAidl.*SessionType=|streamStarted - SessionType=|BTAudioHalDeviceProxy:.*session_type=',
            \"07hfpVirtual_simple_start_call" : 'HeadsetStateMachine: .*msg=audio state changed.*-> \w+|HeadsetService: startScoUsingVirtualVoiceCall|HeadsetStateMachine:.*msg=broadcastAudioState.*->|HeadsetService: .*connectAudio|BluetoothHeadset: startScoUsingVirtualVoiceCall|HeadsetService: startScoUsingVirtualVoiceCall|HeadsetStateMachine:.*msg=TIME_SPACE_A2DP_SCO|BTHF: PhoneStateChange|bta_ag_sco.cc|bluetooth: bta_ag_sco_event: SCO_state_change|bta_ag_create_sco|bluetooth: bta_ag_sco_event.*Ignoring event|stopScoUsingVirtualVoiceCall|bta_ag_sco_close|startBluetoothsco|HeadsetService:  isInCall|HeadsetService: connectAudio:|isInCall|stopScoUsingVirtualVoiceCall',
            \"06hfp_simple_start_call" : 'HeadsetStateMachine: .*msg=audio state changed.*-> \w+|telecom.*setcallstate.*-> \w+|HeadsetService: .*connectAudio|HeadsetStateMachine:.*msg=broadcastAudioState.*->|HeadsetStateMachine: Set VGS|HeadsetStateMachine.*mSpeakerVolume|InCallController: Failed to connect|InCallController: Attempting to bind to InCall|HeadsetService: connectAudio:|AS.AudioService: setMode|BluetoothHeadset: disconnectAudio|HeadsetService - Not present',
            \"05a2dp_simple_connect" : 'connectEnabledProfiles|A2dpStateMachine: Connection state.*->\w+|A2dpStateMachine.*CONNECT_TIMEOUT|trigger reconnect|must wait for le services discovery|l2c_link_timeout All channels closed|forcing LE transport for Bonding',
            \"04hfp_simple_connect" : 'connectEnabledProfiles|HeadsetStateMachine.*connection state changed.*-> \w+|HeadsetStateMachine.*CONNECT_TIMEOUT',
            \"03bond" : 'bluetoothbondstate.*=> \w+|BTM_GetRemoteDeviceName, NV name =|btif_dm_update_rmt_device_name|BluetoothBondStateMachine: Bond address is|tool_BondCreate|bta_dm_bond: Bonding with peer device',
            \"02auto_connect" : "BluetoothPhonePolicy: autoConnect: Initiate auto connection on BT on|BluetoothPhonePolicy: autoConnect:HFP Device|autoConnectHeadset: Connecting HFP with|BluetoothPhonePolicy: autoConnect:A2DP Device|BluetoothPhonePolicy: autoConnectA2dp: connecting A2DP",
            \"01bluetoothenable" : 'AdapterProperties: Address is|AdapterProperties: Setting state to \w+|BluetoothManagerService.*able.*\(|BluetoothManagerService:.*State Change.*>|BluetoothAdapterService.*able\(',
            \"00temp" : "temptemptem"}

let g:alldebugflag = "true"
"}}}}}
"{{{{{2   Homedir(...) 家目录
if join(split(system("uname"))) ==# "Linux"
    let g:homedir = $HOME
else
    if finddir("/z") != ""
        let g:homedir = "/z"
    else
        let g:homedir = "/d"
        "git信息异常变动，gitbash
        "call system("git config --global core.autocrlf false")
        "call system("git config --global core.filemode false")
        "call system("git config --global core.safecrlf true")
    endif
endif
function! Homedir(...)
    "{{{{{3 变量定义
    let dirpath = a:1
    let type = ""
    if a:0 ==# 2
        let type = a:2
    endif
    "}}}}
    let dirpath = g:homedir . "/" . dirpath
    if type ==# 1
        if "" ==# findfile(dirpath)
            call system("touch " . dirpath)
            echo dirpath . "没有这个文件现在新建这个文件"
        else
            "echo dirpath
        endif
    elseif type ==# 2
        if "" ==# finddir(dirpath)
            call system("mkdir " . dirpath)
            echo dirpath . "没有这个文件夹现在新建这个文件夹"
        else
            "echo dirpath
        endif
    endif
    return dirpath
endfunction
"}}}}}
"{{{{{2 function! s:GrepOperator(type)           grep 函数扩展                 逗号 + g 调用
nnoremap <leader>g :set operatorfunc=<SID>GrepOperator<cr>g@
vnoremap <leader>g :<c-u>call <SID>GrepOperator(visualmode())<cr>
function! s:GrepOperator(type)
    let saved_unnamed_register = @@
    if a:type ==# 'v'
        normal! `<v`>y
    elseif a:type ==# 'char'
        normal! `[v`]y
    else
        return
    endif
    let filepath = " ."
    let grepcmd = ""
    let path = join(split(system("pwd")))
    if g:homedir ==# "/z"
        let filepath = " find " . path . "  -iname '*main_log*' -o -iname '*adsp_*' | xargs "
        let grepcmd = filepath . " grep -EsinR "  . shellescape(@@)
        echo grepcmd
        silent cgetexpr   system(grepcmd)
    else
        silent execute "grep! -EsinR " . shellescape(@@) . filepath
    endif
    let winwidthnum  = float2nr(winheight('%')  * 0.2)
    copen
    set modifiable
    let @/ = @@
    silent execute "!clear"
    silent execute "normal! \<c-w>J"
    execute "normal! :res " . winwidthnum . "\<cr>"
    "execute "normal! 'q:i!clear<cr>:copen<cr>:set modifiable<cr><c-w>H<esc>'"
    let @@ = saved_unnamed_register
endfunction
"}}}}}
"{{{{{2 function! s:Copy2file(type)              拷贝内容到本地                可视模式下逗号 + m 调用
"通过把命令写到一个bat文件中，为这个bat文件右键属性设置快捷键
"powershell -command "Get-Clipboard" > Z:\tangxinlou\transplant.txt  这个命令会在windows 环境拷贝剪贴板的内容到transplant.txt
vnoremap <leader>m :<c-u>call <SID>Copy2file(visualmode())<cr>
function! s:Copy2file(type)
    let saved_unnamed_register = @@
    if a:type ==# 'v'
        normal! `<v`>y
    elseif a:type ==# 'char'
        normal! `[v`]y
    else
        return
    endif
    let idx1 = 0
    let templist = []
    let tempchar = ""
    let tempchar = @@
    let relativepath = Homedir("txl/transplant.txt",1)
    let templist = split(tempchar,"\n")
    if  @@ ==# " "
        let templist = readfile(relativepath)
        echo "复制公共文件到本地"
        while idx1 < len(templist)
            call append(line('.'), templist[idx1])
            call cursor(line('.') + 1,1)
            let idx1 += 1
        endwhile
    else
        echo "复制到公共文件"
        silent call writefile(templist,relativepath)
    endif
    "silent execute "grep! -EsinR " . shellescape(@@) . " ."

    let @@ = saved_unnamed_register
endfunction
"}}}}}
"{{{{{2  s:QuckfixToggle()  早期第一次写的函数
nnoremap <F1> :call  QuckfixToggle()<cr>
let g:quickfix_is_open = 0
function! QuckfixToggle()
    if g:quickfix_is_open
        set mouse=
        set clipboard=exclude:clipboard
        echo  "关闭鼠标"
        let g:quickfix_is_open = 0
        "colorscheme default
        "highlight Folded   term=standout ctermfg=6 ctermbg=none guifg=Black guibg=#e3c1a5
        "highlight CursorColumn    term=reverse ctermbg=0 guibg=Grey40
        "call append(line('.'),split(execute("highlight"),"\n"))
        "let g:debuglist = split(execute("syntax"),"\n")
        "highlight MyGroup1 term=reverse ctermbg=black ctermfg=White guibg=Grey40
        "let m = matchadd("MyGroup1", "_")
        "查看当前行是什么高亮组
        "echo "Current highlight group: " . synIDattr(synID(line("."), col("."), 1), "name")
        "verbose highlight javaMethod
        "echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')  当前光标下是什么高亮组

        silent vnoremap <c-c>
        silent nnoremap <c-v>
    else
        let g:quickfix_is_open = 1
        set mouse=a
        "colorscheme morning
        set clipboard=unnamed
        "highlight MyGroup1 term=reverse ctermbg=White ctermfg=black guibg=Grey40
        "let m = matchadd("MyGroup1", "_")
        echo "打开鼠标"
        vnoremap <c-c> y
        nnoremap <c-v> <esc>p
    endif
endfunction
"}}}}}
"{{{{{2   OpenQuickfix(...) 快速打开窗口
function! OpenQuickfix(...)
    "{{{{{3 变量定义
    let winlist = []
    let tabpageid = 0
    "}}}}
    let tabpageid = tabpagenr()
    let winlist = getwininfo()
    for window in winlist
        if window.quickfix ==# 1
            if  window.tabnr ==#  tabpageid
                :ccl
                return
            endif
        endif
    endfor
    :copen
    :exec "normal! \<c-w>J"
endfunction
"}}}}}
"{{{{{2  s:MaMarkdownPreview()
let g:tang = 1
function! s:MarkdownPreview()
    if g:tang
        MarkdownPreview
        let g:tang = 0
    else
        MarkdownPreviewStop
        let g:tang = 1
        echom "markdown stop"
    endif
endfunction
"}}}}}
"{{{{{2 function! s:Shellfunc(type)              批量shell 命令                  可视模式下 逗号 + sh 调用
nnoremap <leader>sh :call Shellfunc()<cr>
function! Shellfunc(...)
     let srcline = -1
     let tailline = -1
     let filelist = []
     let path = ""
     let idx1 = 0
     let mode = ""
     let mode = input("1是删除2是复制")
     let command = ""
     let tempchar = ""
     if mode ==# "1"
         let srcline = str2nr(input("输入首行"))
         let tailline = str2nr(input("输入末行"))
         let filelist = getline(srcline,tailline)
         while idx1 < len(filelist)
             let tempchar = join(split(filelist[idx1]))
             let command = "rm -rf "  . tempchar
             echom command
             silent call system(command)
             let idx1 += 1
         endwhile
     elseif mode ==# "2"
         let srcline = str2nr(input("输入首行"))
         let tailline = str2nr(input("输入末行"))
         let path = input("输入目标路径")
         let filelist = getline(srcline,tailline)
         while idx1 < len(filelist)
             let tempchar = join(split(filelist[idx1]))
             let command = "cp -rf "  . tempchar   . " " . path . '/'  . tempchar
             echom command
             silent call system(command)
             let idx1 += 1
         endwhile
     endif
     echom "Successfully"
endfunction
"}}}}}
"{{{{{2 function! s:HighLightSearch(type)        高亮搜索                      可视模式下逗号 + 下划线 调用
"vnoremap <leader> yq:i/<esc>p<CR>
vnoremap <leader>/ :<c-u>call <SID>HighLightSearch(visualmode())<cr>
function! s:HighLightSearch(type)
    let saved_unnamed_register = @@
    let idx1 = 0
    if a:type ==# 'v'
        normal! `<v`>y
    elseif a:type ==# 'char'
        normal! `[v`]y
    else
        return
    endif
    let searchchar = @@
    let searchchar = split(searchchar,"\n")
    if len(searchchar) ==# 1
        let searchchar = searchchar[0]
        let searchchar = join(split(searchchar,"\x00"),' ')
    else
        while idx1 < len(searchchar)
            let searchchar[idx1] = join(split(join(split(searchchar[idx1],'*'),'.*'),"\x00"),'.*')
            let idx1 += 1
        endwhile
        let searchchar = join(searchchar,'.*\n.*')
    endif
    let @@ = searchchar
    let searchchar = substitute(searchchar, '|', '\\|', 'g')
    echo searchchar
    let @/ = searchchar
    let @@ = saved_unnamed_register
endfunction
"}}}}}
"{{{{{2 function! MakeCompressedPackage()        制作push压缩包
function! MakeCompressedPackage()
    "{{{{{{3 定义变量
    let curpath = ""
    let intentpath = Homedir("copy/cp",2)
    let batfile = "copy.bat"
    let command = ""
    let iscopyconf = ""
    let iscopyiotconf = ""
    let iscopyapk = ""
    let iscopy15apk = ""
    let iscopyso = ""
    let templist = []
    let zipname = ""
    let isvos = ""
    let isfirmware = ""
    let firmwarelist = []
    let firmwarepath = "/vendor/firmware"
    let tempchar = ""
    "}}}}}
    let command = "pwd"
    "set fileformats=dos
    call system("rm *.tar")
    call system("rm  -rf cp")
    call system("cp -rf " . intentpath . " ./ ")
    let batfile = readfile("./cp/copy.bat")
    let isvos = input("是否外销")
    let isfirmware = input("是否push固件")
    if "yes" ==# isfirmware
        let iscopyconf = "no"
        let iscopyiotconf = "no"
        let iscopyapk = "no"
        let iscopyso = "no"
        let iscopyqcomso = "no"
        let firmwarelist = map(split(system("find -iname '*.bin'")),'split(v:val, "/")[-1]')
        for item in firmwarelist
            let command = "cp -rf " . item .   " ./cp/cp/system"
            call system(command)
            let tempchar = "adb push cp\\system\\" . item . " " . firmwarepath
            let batfile = insert(batfile,tempchar,-3)
            let tempchar = "adb shell ls -la " . firmwarepath . '/' . item
            let batfile = insert(batfile,tempchar,-3)
        endfor
        echo firmwarelist
    else
        let iscopyconf = input("是否打包conf 文件")
        let iscopyiotconf = input("是否打包iot conf 文件")
        let iscopyapk = input("是否打包apk 文件")
        let iscopy15apk = input("是否打包15.0apk")
        let iscopyso = input("是否打包so 文件")
        let iscopyqcomso = input("是否打包qcom so 文件")
    endif
    let curpath = system(command)


    if isvos  != "yes"
        let templist = join(split(batfile[3])[1:])
        let batfile[3] = templist
    else
        let templist = join(split(batfile[3])[1:])
        let batfile[3] = templist
        let batfile[3] =  substitute(batfile[3], 'vivoroot', 'root', 'g')
    endif

    if iscopyso ==# "yes"
        let command = "cp -rf libbluetooth_jni.so libbluetooth.so ./cp/cp/system/lib64 "
        call system(command)

        let templist = join(split(batfile[10])[1:])
        let batfile[10] = templist
        let templist = join(split(batfile[11])[1:])
        let batfile[11] = templist

        let templist = join(split(batfile[12])[1:])
        let batfile[12] = templist
        let templist = join(split(batfile[13])[1:])
        let batfile[13] = templist
    else
        let batfile[10] = ""
        let batfile[11] = ""
        let batfile[12] = ""
        let batfile[13] = ""
    endif

    if iscopyapk ==# "yes"
        let command = "cp -rf Bluetooth.apk  ./cp/cp/system/app "
        call system(command)
        let templist = join(split(batfile[8])[1:])
        let batfile[8] = templist
        let templist = join(split(batfile[9])[1:])
        let batfile[9] = templist
    else
        let batfile[8] = ""
        let batfile[9] = ""
    endif

    if iscopyconf ==# "yes"
        let command = "cp -rf interop_database.conf  ./cp/cp/system "
        call system(command)
        let templist = join(split(batfile[14])[1:])
        let batfile[14] = templist
        let templist = join(split(batfile[15])[1:])
        let batfile[15] = templist
    else
        let batfile[14] = ""
        let batfile[15] = ""
    endif
    if iscopyiotconf ==# "yes"
        let command = "cp -rf iot_device_list_json.conf  ./cp/cp/system "
        call system(command)
        let templist = join(split(batfile[16])[1:])
        let batfile[16] = templist
        let templist = join(split(batfile[17])[1:])
        let batfile[17] = templist
    else
        let batfile[16] = ""
        let batfile[17] = ""
    endif
    if iscopy15apk ==# "yes"
        let command = "cp -rf com.android.btservices.apex  ./cp/cp/system "
        call system(command)
        let templist = join(split(batfile[18])[1:])
        let batfile[18] = templist
        let templist = join(split(batfile[19])[1:])
        let batfile[19] = templist
    else
        let batfile[18] = ""
        let batfile[19] = ""
    endif

    if iscopyqcomso ==# "yes"
        let command = "cp -rf Bluetooth.apk libbluetooth_qti_jni.so libbluetooth_qti.so ./cp/cp/system/lib64 "
        call system(command)

        let templist = join(split(batfile[20])[1:])
        let batfile[20] = templist
        let templist = join(split(batfile[21])[1:])
        let batfile[21] = templist

        let templist = join(split(batfile[22])[1:])
        let batfile[22] = templist
        let templist = join(split(batfile[23])[1:])
        let batfile[23] = templist

        let templist = join(split(batfile[24])[1:])
        let batfile[24] = templist
        let templist = join(split(batfile[25])[1:])
        let batfile[25] = templist
    else
        let batfile[20] = ""
        let batfile[21] = ""
        let batfile[22] = ""
        let batfile[23] = ""
        let batfile[24] = ""
        let batfile[25] = ""
    endif
    silent call writefile(batfile,"./cp/copy.bat")
    call append(line("."),batfile)
    silent execute "normal! :tabnew\<cr>"
    silent execute "normal! :e ./cp/copy.bat\<cr>"
    "每行后加VM
    silent execute "normal! \<c-v>G$A\<c-v>\<c-m>\<esc>"
    silent execute "normal! :wq\<cr>"
    let zipname = "tar -cvf " .  split(split(system("pwd"),"/")[-1],"\n")[0]  . ".rar" . " ./cp"
    call system(zipname)
endfunction
"}}}}}
"{{{{{2   MyCompare(i1, i2) 比较字符串，在比较函数里面设置比较的格式
let g:charinterval = ''  "切割字符
let g:listnumber = -1    "list的index
let g:listmembertype = ""
let g:comparedirect = ""
function! MyCompare(i1, i2)
    let list = []
    let list1 = []
    let compare = ""
    let compare1 = ""
    let charinterval =  g:charinterval
    let listnumber = g:listnumber
    let listmembertype = g:listmembertype
    let comparedirect = g:comparedirect
    let list = split(a:i1,charinterval)
    let list1 = split(a:i2,charinterval)
    let compare = list[listnumber]
    let compare1 = list1[listnumber]
    if listmembertype ==# "nr"
        let compare = str2nr(compare)
        let compare1 = str2nr(compare1)
    endif
    if comparedirect ==# "b-s"
        return  compare == compare1 ? 0 : compare1  > compare    ? 1 : -1
    elseif comparedirect ==# "s-b"
        return  compare == compare1 ? 0 : compare  > compare1    ? 1 : -1
    endif
endfunction
func! MyCompare1(i1, i2)
    return a:i2 == a:i1 ? 0 : a:i2 > a:i1 ? 1 : -1
endfunc
func! MyCompareTimestamp(i1, i2) "时间戳换算成us比较
    let i1timestamp = ParseTimestamp(split(a:i1)[1])
    let i2timestamp = ParseTimestamp(split(a:i2)[1])
    return i2timestamp ==#  i1timestamp ? 0 : i1timestamp > i2timestamp ? 1 : -1
endfunc
func! MyCompareTimeChar(i1, i2)  "两行日志通过时间比较
    let i1timestamp = matchstr(a:i1,'\d\d-\d\d \d\d:\d\d:\d\d\.\d\{6\}')
    let i2timestamp = matchstr(a:i2,'\d\d-\d\d \d\d:\d\d:\d\d\.\d\{6\}')
    "从小到大
    return i2timestamp ==#  i1timestamp ? 0 : i1timestamp > i2timestamp ? 1 : -1
    "从大到小
    "return i1timestamp ==#  i2timestamp ? 0 : i2timestamp > i1timestamp ? 1 : -1
endfunc
function! MyCompareVersion(i1, i2)
    let idex = 0
    let biger = ""
    let smaller = ""
    "\d\{0,4}\.\d\{1,2}.\{,3}\.\d\{1,2}
    let smaller1 = matchstr(a:i1,"\\d\\{0,4}\\.\\d\\{1,2}.\\{,3}\\.\\d\\{1,2}")
    let biger1 = matchstr(a:i2,"\\d\\{0,4}\\.\\d\\{1,2}.\\{,3}\\.\\d\\{1,2}")
    let smaller = split(smaller1,"\\.")
    let biger = split(biger1,"\\.")
    let smallerlen = (len(biger) >= len(smaller)) ?  len(smaller) : len(biger)
    while idex < smallerlen
        "echo biger1  . " " .  smaller1
        let difference =  biger[idex] - smaller[idex]
        if difference > 0
            return 1
        elseif  difference < 0
            return -1
        elseif  difference == 0
        endif
        let idex += 1
    endwhile
    return 0
endfunction
"}}}}}
"{{{{{2   IsContain(...) string list返回对应 列表项
function! IsContain(...)
    "{{{{{3 变量定义
    let string = ""
    let char = ""
    let list = []
    let idx1 = 0
    let string = a:1
    let list = a:2
    "转义
    let string = escape(string, '[]')
    "}}}}
    while idx1 < len(list)
        let char = matchstr(list[idx1],string)
        if char != ""
            return list[idx1]
        endif
        let idx1 += 1
    endwhile
endfunction
"}}}}}
"{{{{{2   SetCharNull(...) 补空格
function! SetCharNull(...)
    let char = " "
    let char2 = ""
    let idx1 = 0
    let list = []
    if a:0 ==# 2
        let char = " "
        let idx1 = a:2
        let char2 = a:1
        let char2 = char2 . repeat(char,idx1 - strwidth(char2) - 1) . '|'
    endif
    return char2
endfunction
"}}}}}
"{{{{2  List2Format(...)    把字符串|竖线之间补空格后面补空格
function! List2Format(...)
    let list2fmt = []
    let list2fmt1 = []
    let idx1 = 0
    let idx2 = 0
    if a:0 ==# 1
        let list2fmt = a:1
        "echo  list2fmt
        while idx1 < len(list2fmt)
            let idx2 = 0
            let list2fmt1 = split(list2fmt[idx1],",")
            "echo list2fmt1
            while idx2 < len(list2fmt1)
                if idx2 ==# 0
                    let list2fmt1[0] =  SetCharNull(list2fmt1[0],15)
                else
                    "echo list2fmt1[idx2]
                    let list2fmt1[idx2] =  SetCharNull(list2fmt1[idx2],10)
                    "echo list2fmt1[idx2]
                endif
                let idx2 += 1
            endwhile
            let list2fmt[idx1] = join(list2fmt1,"\x00")
            let idx1 += 1
        endwhile
    endif
    return list2fmt
endfunction
"}}}}
"{{{{2  DictTest()                      测试字典
function! DictTest()
    let char1 = "aaaaaaaa"
    let char2 = "指数名称"
    let dict1 = {}
    let char3 = {5:1,6:3}
    let list = ['a', 'b', 'c', 'd', 'e']
    let list1 = ['1', '2', '3']
    let char = {'a': 1,
                \ 100: 'foo',
                \ 1001:list,
                \ 1002:char3}
    let nodeformat = {'0path':'xx',
                \'1matchchar':'xx',
                \'2structname':'xx',
                \'5structuremember':[],
                \'00structuremembername':'xx',
                \'3structtype':'xx'}
    let char[1003] = "txlws"
    let char.1004 = "1234"
    try
        " 这里故意抛出一个错误，以便捕获它
        throw 'Some error occurred'
    catch /Vim\%(\(\w+\)\):E\d\+:\).*/
        " 捕获到的错误信息中包含了函数名，我们在这里提取它
        let func_name = matchstr(v:exception, '\(\w+\)')
        echo 'Current function is: ' . func_name
    endtry
    echo sort(keys(nodeformat))
    let stringdict = string(char)
    echo list
    echo list[0:3]
    echo len(char1)
    echo strlen(char1)
    echo strchars(char1)
    echo strwidth(char1)
    echo len(char2)
    echo strlen(char2)
    echo strchars(char2)
    echo strwidth(char2)
    echo "tangxinlou"
    echo  char
    echo stringdict
    echo char[1003]
    echo stringdict[1003]
    call Dbug1("dd" ,10,0 ,'DictTest 0')
    call Dbug1( "dd",10,0 ,'DictTest 1')
    let dict1  = eval(stringdict)
    echo eval(string(char3))
    echo "tangxinlou333"
    echo dict1
    echo dict1[1003]
    echo "tangxinlou22"
    echo char[1003]
    echom "kdfjladfkkk"
    call system("cd android_vendor_qcom_opensource_commonsys_system_bt")
    echo system("cd android_vendor_qcom_opensource_commonsys_system_bt;"."git status . ")
    echom system("pwd")
    call system("cd ..")
    echo system("git status . ")
    echom system("pwd")
    echom "dkfjakdfj"
    echo len(char)
    echo keys(char)
    echo values(char)
    echo items(char)
    echo len(values(char))
    echo char[3]
    echo char[1002]
    echo "tangxinlou"
    highlight MyGroup ctermbg=green guibg=green
    let m = matchaddpos("MyGroup", [[24, 24], 34])
    echo items(char)
    let char = "/opt5/caizheng/Codes/ard10.0/android_system_bt/bta/hh/bta_hh_main.cc:71:"
    let char = split(char,":")[0]
    echo char
    let @l = char
    echo expand("%:p")
    echo expand("l:h")
    echo @l
    echo @%
    call extend(list,list1,2)
    echo list
    call remove(list,3,5)
    echo list
    echo matchstr(char2, "指数")
    if "" ==#  matchstr(char2, "tang")
        echo "tangxinlou1"
    else
        echo "tangxinlou2"
    endif
    echo matchstr(char2, "tang")
    let cparefile = ""
    "let cparefile = readfile("cpareversion.txt")
    "let filelen = len(cparefile)
    "echo cparefile
    let idex = 0
    "while  idex < filelen
    "    let cparefile[idex] = matchstr(cparefile[idex],"\\d\\{0,4}\\.\\d\\{1,2}\\.\\d\\{1,2}")
    "    echo cparefile[idex]
    "    let idex += 1
    "endwhile
    "let list = split(cparefile[0],"\\.")
    "echo list
    "echo cparefile

    let biger = "12.1.7.4"
    let smaller = "13.1.8"
    let smaller = split(smaller,"\\.")
    let biger = split(biger,"\\.")
    let smallerlen = (len(biger) >= len(smaller)) ?  len(smaller) : len(biger)
    echo smallerlen
    let idex = 0
    while idex < smallerlen
        echo biger[idex]  . " " .  smaller[idex]
        if biger[idex] > smaller[idex]
            echo "biger 大于 smaller"
        elseif  biger[idex] < smaller[idex]
            echo "smaller 大于biger"
        elseif  biger[idex] == smaller[idex]
        endif
        let idex += 1
    endwhile
    let indexfile = readfile("fund2index.txt")
    let idx = index(indexfile, "300红利LV.*|")
    let idx1 = count(indexfile,"300红利LV.*|")
    echo  "在列表" . idx . "行"
    echo  "在列表" . idx1 . "行"
    let indexfile = readfile("/d/work/fund/zhishu/indexvaluepanel")
    let numbereddatabase = eval(readfile("/d/work/fund/zhishu/numbereddatabase")[0])
    echo numbereddatabase["中证100"]
    let idx1 = 1
    let indexname = ""

    while idx1 < len(indexfile)
        if  len(split(indexfile[idx1],"|")) < 10
            let indexname = split(split(indexfile[idx1],"|")[0]," \\{3,30}")[0]
            if has_key(numbereddatabase,indexname) ==# 1
                let indexfile[idx1]  = indexfile[idx1] . numbereddatabase[indexname] . "|"
            else
                "echo  indexname
            endif
        endif
        let idx1 += 1
    endwhile
    silent call writefile(indexfile,"/d/work/fund/zhishu/indexvaluepanel")

    let listlist1 = [1,3,4]
    let listlist2 = []

    let listlist2 = copy(listlist1)
    let listlist2[0] = 2
    let listlist2 = add(listlist2,7)
    echo listlist1
    echo listlist2
    echo nodeformat
    let listlist3 = copy(nodeformat)
    let listlist3["5structuremember"] = add(listlist3["5structuremember"],"56")
    let listlist3["2structname"] = "1235"
    let listlist3["5structuremember"] = add(listlist3["5structuremember"],"")
    let listlist3["5structuremember"][-1] = "4567"
    echo nodeformat
    echo listlist3

endfunction
"}}}}
"{{{{{2   WriteFund2Index(...) 格式化fund2index
function! WriteFund2Index(...)
    let list2fmt = []
    let list2fmt1 = []
    let list2fmt2 = []
    let idx1 = 0
    let idx12 = 0
    let char = ""
    let char = input("格式化哪个文件，fund2index.txt 选1,index.txt 选2 analyze.txt 选3")
    if char ==# "1"
        let list2fmt = readfile("fund2index.txt")
    elseif char ==# "2"
        let list2fmt = readfile("index.txt")
    elseif char ==# "3"
        let list2fmt = readfile("analyze.txt")
    endif
    while idx1 < len(list2fmt)
        let idx2 = 0
        let list2fmt1 = split(join(split(list2fmt[idx1],"|")))
        while idx2 < len(list2fmt1)
            if char ==# "1"
                if idx2 ==# 0
                    let list2fmt1[0] =  SetCharNull(list2fmt1[0],15)
                else
                    let list2fmt1[idx2] =  SetCharNull(list2fmt1[idx2],35)
                endif
            elseif char ==# "2"
                if idx2 ==# 0
                    let list2fmt1[0] =  SetCharNull(list2fmt1[0],35)
                elseif idx2 ==# 1 || idx2 ==# 2 || idx2 ==# 3
                    let list2fmt1[idx2] =  SetCharNull(list2fmt1[idx2],18)
                else
                    let list2fmt1[idx2] =  SetCharNull(list2fmt1[idx2],15)
                endif
            elseif char ==# "3"
                if idx2 ==# 0
                    let list2fmt1[0] =  SetCharNull(list2fmt1[0],15)
                else
                    let list2fmt1[idx2] =  SetCharNull(list2fmt1[idx2],25)
                endif
            endif
            let idx2 += 1
        endwhile
        let list2fmt[idx1] = join(list2fmt1,"\x00")
        let idx1 += 1
    endwhile
    if len(list2fmt) < 5
        return
    endif
    if char ==# "1"
        if "yes" ==# input("是否写入")
            silent call writefile(list2fmt,"fund2index.txt")
        endif
    elseif char ==# "2"
        let list2fmt2 = copy(list2fmt)
        call sort(list2fmt2,"MyCompare")
        call append(line('.'),list2fmt2)
        redraw
        if "yes" ==# input("是否写入")
            silent call writefile(list2fmt,"index.txt")
        endif
    elseif char ==# "3"
        let list2fmt = RestoreOrder(list2fmt)
        if "yes" ==# input("是否写入")
            silent call writefile(list2fmt,"analyze.txt")
        endif
    endif
endfunction
"}}}}}
"{{{{{2   WriteFund2Index1(...) 格式化fund2index
function! WriteFund2Index1(...)
    let list2fmt = []
    let list2fmt1 = []
    let list2fmt2 = []
    let idx1 = 0
    let idx12 = 0
    let char = ""
    let list2fmt =  a:1
    let char = 4
    if a:0 ==# 0
        let char = input("格式化哪个文件，fund2index.txt 选1,index.txt 选2 analyze.txt 选3, ")
        if char ==# "1"
            let list2fmt = readfile("fund2index.txt")
        elseif char ==# "2"
            let list2fmt = readfile("index.txt")
        elseif char ==# "3"
            let list2fmt = readfile("analyze.txt")
        endif
    endif
    while idx1 < len(list2fmt)
        let idx2 = 0
        if char ==# 4
            let list2fmt1 = split(list2fmt[idx1],"|")
        else
            let list2fmt1 = split(join(split(list2fmt[idx1],"|")))
        endif
        while idx2 < len(list2fmt1)
            if char ==# "1"
                if idx2 ==# 0
                    let list2fmt1[0] =  SetCharNull(list2fmt1[0],15)
                else
                    let list2fmt1[idx2] =  SetCharNull(list2fmt1[idx2],35)
                endif
            elseif char ==# "2"
                if idx2 ==# 0
                    let list2fmt1[0] =  SetCharNull(list2fmt1[0],35)
                elseif idx2 ==# 1 || idx2 ==# 2 || idx2 ==# 3
                    let list2fmt1[idx2] =  SetCharNull(list2fmt1[idx2],18)
                else
                    let list2fmt1[idx2] =  SetCharNull(list2fmt1[idx2],25)
                endif
            elseif char ==# "3"
                if idx2 ==# 0
                    let list2fmt1[0] =  SetCharNull(list2fmt1[0],15)
                else
                    let list2fmt1[idx2] =  SetCharNull(list2fmt1[idx2],15)
                endif
            elseif char ==# 4
                if idx2 ==# 0 || idx2 ==# len(list2fmt1) - 1
                    let list2fmt1[idx2] =  SetCharNull(list2fmt1[idx2],5)
                else
                    let list2fmt1[idx2] =  SetCharNull(list2fmt1[idx2],60)
                endif
            endif
            let idx2 += 1
        endwhile
        let list2fmt[idx1] = join(list2fmt1,"\x00")
        let idx1 += 1
    endwhile
    if char ==# "1"
        if "yes" ==# input("是否写入")
            silent call writefile(list2fmt,"fund2index.txt")
        endif
    elseif char ==# "2"
        let list2fmt2 = copy(list2fmt)
        call sort(list2fmt2,"MyCompare")
        call append(line('.'),list2fmt2)
        redraw
        if "yes" ==# input("是否写入")
            silent call writefile(list2fmt,"index.txt")
        endif
    elseif char ==# "3"
        let list2fmt = RestoreOrder(list2fmt)
        if "yes" ==# input("是否写入")
            silent call writefile(list2fmt,"analyze.txt")
        endif
    elseif char ==# "4"
        return list2fmt
    endif
endfunction
"}}}}}
"{{{{test
"{{{{{2  TestTest(...)            图形目录打开对应目录文件      可视模式下 逗号 + r 调用
function! TestTest(...)
    let files = []
    let idx1 = 0
    let files1 = readfile("/d/txl/test/1.csv")
    echo len(files1)
    let temp_files = [' ']
    let temp_files =  repeat(temp_files,len(files1) / 2 + 1)
    echo temp_files
    while idx1 < len(files1)
        let temp_files[idx1 / 2] = join([files1[idx1],files1[idx1 + 1]])
        let idx1 += 2
    endwhile
    echo temp_files
    silent call writefile(temp_files,"/d/txl/test/2.csv")
    silent execute "normal! :e /d/txl/test/2.csv\<cr>"
    silent execute "normal! :%s/？ /？ ,/g\<cr>"
    silent execute "normal! :%s/A、/,A、/g\<cr>"
    silent execute "normal! :%s/B、/,B、/g\<cr>"
    silent execute "normal! :%s/C、/,C、/g\<cr>"
    silent execute "normal! :%s/D、/,D、/g\<cr>"
    silent execute "normal! :%s/E、/,E、/g\<cr>"
    silent execute "normal! :write!"

endfunction
"}}}}}
"}}}}
"{{{{{2   Dbug(...) 打印log的函数
let g:debugflag = 1
let g:debuglist = []
"默认值是2，所有的都会打印
"比较重要的设置成3
function! Dbug(...)
    "{{{{{3 变量定义
    let val = a:1
    let flag = a:2
    let append = 0
    let tempchar = ""
    if a:0 ==# 3
        let append = a:3
    endif
    "}}}}
    if flag > g:debugflag
            let tempchar = strftime("%Y-%m-%d %H:%M:%S") . "." . float2nr(CurrentTimeWithMilliseconds())."-". string(val)
            if append ==#  0
                echom tempchar
                let g:debuglist = add(g:debuglist,tempchar)
            elseif append ==# 1
                call append(line('.'),tempchar)
                call cursor(line('.') + 1,1)
                let g:debuglist = add(g:debuglist,tempchar)
            elseif append ==# 2
                let g:debuglist = add(g:debuglist,tempchar)
            endif
    endif
endfunction
"}}}}}

"{{{{{2   Dbug1(...) 打印log的函数
let g:debugflag = 1
let g:debuglist = []
"默认值是2，所有的都会打印
"比较重要的设置成3
function! Dbug1(...)
    "{{{{{3 变量定义
    let val = a:1
    let flag = a:2
    let append = 0
    let tempchar = ""
    let funcname = ""
    if a:0 !=  2
        let append = a:3
        let funcname = a:4
    endif
    "}}}}
    if flag > g:debugflag
            let tempchar = strftime("%Y-%m-%d %H:%M:%S") . "." . float2nr(CurrentTimeWithMilliseconds())." - ". funcname . " - " . string(val)
            if append ==#  0
                echom tempchar
                let g:debuglist = add(g:debuglist,tempchar)
            elseif append ==# 1
                call append(line('.'),tempchar)
                call cursor(line('.') + 1,1)
                let g:debuglist = add(g:debuglist,tempchar)
            elseif append ==# 2
                let g:debuglist = add(g:debuglist,tempchar)
            endif
    endif
endfunction
"}}}}}
"{{{{{2   AddLineNumber(...) 每行添加行号
function! AddLineNumber(...)
    "{{{{{3 变量定义
    let line = 0
    let filetype = ""
    let idx1 = 0
    let char = ""
    let neglect = 0
    "}}}}
    "let filetype = reverse(split(join(split(execute("set filetype"),"="))))[0]
    echo &filetype
    if &filetype ==# "markdown"
        let idx1 = 10
        while idx1 <= len(readfile(expand("%:p")))
            let char = getline(idx1)
            if neglect ==# 1
                if  char != "```c" && char != "```" && char != ""
                    let char = idx1 . " " . char
                    call setline(idx1,char)
                endif
            else
                if  "》》》》》》》"  ==# matchstr(char,"》》》》》》》")
                    let neglect = 1
                endif
            endif
            let idx1 += 1
        endwhile
    else
        execute "normal! :%s/^/\\=line('.').\" \"\<cr>"
        "execute "normal! :%s/^/\\=foldlevel('.').\" \"\<cr>"
    endif

    "nnoremap <leader>y :%s/^/\=line(".")." "/<cr>
endfunction
"}}}}}
"{{{{{2   SetFileType(...) 设置filetype
function! SetFileType(...)
    "{{{{{3 变量定义

    "}}}}
    let filename = expand('%:t')
    if &filetype ==# ""
        if matchstr(filename,"main_log_") != "main_log_"
            setfiletype  special
        endif
    endif
endfunction
"}}}}}
"{{{{{2   ListTo1D(...)
function! ListTo1D(...)
    "{{{{{3 变量定义
    let listof2d = a:1
    let charinterval = a:2
    let idx1 = 0
    "}}}}
    while idx1 < len(listof2d)
        let listof2d[idx1] = join(listof2d[idx1],charinterval)
        let idx1 += 1
    endwhile
    return  listof2d
endfunction
"}}}}}
"{{{{{2   ListTo2D(...)
function! ListTo2D(...)
    "{{{{{3 变量定义
    let listof1d = a:1
    let charinterval = a:2
    let idx1 = 0
    "}}}}
    while idx1 < len(listof1d)
        let listof1d[idx1] = split(listof1d[idx1],charinterval,2)
        let idx1 += 1
    endwhile
    return  listof1d
endfunction
"}}}}}
"{{{{{2   ListAddSpaces(...)添加多余空格
function! ListAddSpaces(...)
    "{{{{{3 变量定义
    let listof1d = a:1   "一维表格
    let listof2d = []   "二维表格
    let charinterval = a:2
    let listlength = 0
    let idx1 = 0
    let idj1 = 0
    "}}}}
    "let listof1d = readfile("PEvaluepanel.txt")
    let listof2d = ListTo2D(listof1d,charinterval)
    "计算最长是多长
    while idx1 < len(listof2d)
        if listlength < len(listof2d[idx1])
            let listlength =  len(listof2d[idx1])
        endif
        let idx1 += 1
    endwhile
    let listlength = repeat([" "],listlength)
    "计算每列最大长度
    let idx1 = 0
    while idx1 < len(listof2d)
        let idj1 = 0
        while idj1 < len(listof2d[idx1])
            if listlength[idj1] < strwidth(listof2d[idx1][idj1])
                let listlength[idj1] = strwidth(listof2d[idx1][idj1])
            endif
            let idj1 += 1
        endwhile
        let idx1 += 1
    endwhile
    "添加空格
    let idx1 = 0
    let idj1 = 0
    while idx1 < len(listof2d)
        let idj1 = 0
        while idj1 < len(listof2d[idx1])
            let listof2d[idx1][idj1] = listof2d[idx1][idj1] . repeat(" ",listlength[idj1] - strwidth(listof2d[idx1][idj1]) + 5)
            let idj1 +=1
        endwhile
        let idx1 += 1
    endwhile
    let listof1d = ListTo1D(listof2d ,charinterval)
    "call append(line('.'),listof1d)
    return listof1d
endfunction
"}}}}}
"{{{{{2   ListRemoveSpaces(...) 去除多余空格
function! ListRemoveSpaces(...)
    "{{{{{3 变量定义
    let listof1d = a:1   "一维表格
    let listof2d = []   "二维表格
    let charinterval = a:2
    let idx1 = 0
    let idj1 = 0
    let templen = 0
    "}}}}
    "let listof1d = readfile("PEvaluepanel.txt")
    let listof2d = ListTo2D(listof1d,charinterval)

    while idx1 < len(listof2d)
        let idj1 = 0
        while idj1 < len(listof2d[idx1])
            if  len(split(listof2d[idx1][idj1]," \\{2,30}"))  != 0
                "有些空口只有一个，去不掉
                let templen = len(listof2d[idx1][idj1])
                let listof2d[idx1][idj1] = split(listof2d[idx1][idj1]," \\{2,30}")[0]
                if templen  ==# len(listof2d[idx1][idj1])
                    let listof2d[idx1][idj1] = split(listof2d[idx1][idj1]," ")[0]
                endif
            else
                let listof2d[idx1][idj1] = ""
            endif
            let idj1 += 1
        endwhile
        let idx1 += 1
    endwhile
    let listof1d = ListTo1D(listof2d ,charinterval)
    return  listof1d
endfunction
"}}}}}
"{{{{{2   AdjustThePositionOfTwoColumns(...)  "调整两列的位置
"{{{{{3 注释
"调整两列的位置
"}}}}
function! AdjustThePositionOfTwoColumns(...)
    "{{{{{3 变量定义
    let filelist = a:1
    let columnssrc = a:2
    let columnstail = a:3
    let idx1 = 0
    let tempchar = ""
    let charinterval = a:4
    "}}}}
    "let filelist = readfile(Homedir("work/fund/zhishu/panelPEvalue",1))
    let filelist =  ListRemoveSpaces(filelist,charinterval)
    let filelist = ListTo2D(filelist,charinterval)

    while idx1 < len(filelist)
        let tempchar = filelist[idx1][columnssrc]
        let filelist[idx1][columnssrc] = filelist[idx1][columnstail]
        let filelist[idx1][columnstail] = tempchar
        let idx1 += 1
    endwhile
    let filelist = ListTo1D(filelist,charinterval)
    let filelist  =  ListAddSpaces(filelist,charinterval)
    return filelist
endfunction
"}}}}}
"{{{{{2   GetOneOfTheColumns(...)  "获取单独一列
"{{{{{3 注释
"调整两列的位置
"}}}}
function! GetOneOfTheColumns(...)
    "{{{{{3 变量定义
    let filelist = copy(a:1)
    let idx1 = 0
    let charinterval = a:2
    let columns = a:3
    let templist = [" "]
    let typelist = 0
    let Clearchar = ""
    "}}}}
    "let filelist = readfile(Homedir("work/fund/zhishu/panelPEvalue",1))
    let typelist = type(filelist[0])
    let templist  =  repeat(templist,len(filelist))
    if  typelist ==# 1
        let filelist =  ListRemoveSpaces(filelist,charinterval)
        let filelist = ListTo2D(filelist,charinterval)
    endif
    if a:0 ==# 4
        let Clearchar = a:4
        while idx1 < len(filelist)
            if columns ==# -1
                let filelist[idx1] = add(Clearchar[idx1]," ")
            else
                let filelist[idx1][columns] = Clearchar[idx1]
            endif
            let idx1 += 1
        endwhile
        return  filelist
    else
        while idx1 < len(filelist)
            let templist[idx1] = filelist[idx1][columns]
            let idx1 += 1
        endwhile
        return templist
    endif
endfunction
"}}}}}
"{{{{{2  WaveformGraph(...)  波形图
"{{{{{3 注释
"}}}}
function! WaveformGraph(...)
    "{{{{{3 变量定义
    let  WaveformGraph = ""
    let Rowcoordinates = ""
    let Columncoordinates = ""
    "}}}}
    let filelist = readfile(Homedir("work/fund/zhishu/panelPEvalue",1))
    let filelist =  ListRemoveSpaces(filelist,"|")
    let Rowcoordinates = split(filelist[0],"|")[1:]
    let Columncoordinates = split(filelist[1],"|")[1:]
    echo max(Columncoordinates)
    echo min(Columncoordinates)
endfunction
"}}}}}
"{{{{{2   Openfile(...) 添加特殊文件头
function! Openfile()
    "{{{{{3 变量定义
    let pythonfile = ""
    "}}}}
    if &filetype ==# "python"
        call setline(1,"#!/usr/bin/python3")
    elseif  &filetype ==# "sh"
        call setline(1,"#!/bin/bash")
    endif
endfunction
"}}}}}
"{{{{{2   SimplifySearchResults(...) 简化搜索结果
function! SimplifySearchResults(...)
"140行1s都不到
    "{{{{{3 变量定义
    let searchs = "setA"
    let command = ""
    let transfer = []         "长度小于1被识别成调用
    let definition = []       "定义
    let Log = []              "打印
    let judge = []            "判断
    let Comment = []          "注释
    let TEST = []             "test
    let XML = []              "xml
    let resultlist = [1,2,3,4,5,6,7]
    let idx1 = 0
    let command = ""
    let judgechar = ["if","for"]
    let searchstarge = ""
    let temchar = ""
    let tempchar = ""
    "}}}}
    if a:0 ==# 0
        let searchstarge = []
        let command = "grep -EsinR --include=*{.c,.cc,.java,.h} " . "'" . searchs . "'"
        let searchstarge =  system(command)
        execute "normal! :r!date +\\%F-\\%T\<cr>"
    else
        let searchstarge = a:1
        if len(searchstarge) ==# 0
            return []
        endif
    endif
     let resultlist = ResultClassification(searchstarge)
     let definition = resultlist[1]
    let definition = insert(definition,["<<<<<<<<<<<<<<<<"])
    let definition = insert(definition,["定义"])
    let definition = add(definition,[">>>>>>>>>>>>>>>"])
    let definition = add(definition,["语句里面有分号识别调用"])
    let definition = add(definition,["<<<<<<<<<<<<<<<<"])
    let definition = extend(definition,resultlist[0])
    let definition = add(definition,[">>>>>>>>>>>>>>>"])
    let definition = add(definition,["判断"])
    let definition = add(definition,["<<<<<<<<<<<<<<<<"])
    let definition = extend(definition,resultlist[3])
    let definition = add(definition,[">>>>>>>>>>>>>>>"])
    let definition = add(definition,["头文件"])
    let definition = add(definition,["<<<<<<<<<<<<<<<<"])
    let definition = extend(definition,resultlist[7])
    let definition = add(definition,[">>>>>>>>>>>>>>>"])
    let definition = add(definition,["打印"])
    let definition = add(definition,["<<<<<<<<<<<<<<<<"])
    let definition = extend(definition,resultlist[2])
    let definition = add(definition,[">>>>>>>>>>>>>>>"])
    let definition = add(definition,["注释"])
    let definition = add(definition,["<<<<<<<<<<<<<<<<"])
    let definition = extend(definition,resultlist[4])
    let definition = add(definition,[">>>>>>>>>>>>>>>"])
    let definition = add(definition,["test"])
    let definition = add(definition,["<<<<<<<<<<<<<<<<"])
    let definition = extend(definition,resultlist[5])
    let definition = add(definition,[">>>>>>>>>>>>>>>"])
    let definition = add(definition,["XML"])
    let definition = add(definition,["<<<<<<<<<<<<<<<<"])
    let definition = extend(definition,resultlist[6])
    let definition = add(definition,[">>>>>>>>>>>>>>>"])
    let definition = ListTo1D(definition,"█")
    let definition = ListAddSpaces(definition,"█")
    if a:0 ==# 0
        execute "normal! :r!date +\\%F-\\%T\<cr>"
        call append(line('.'),definition)
    else
        return definition
    endif
endfunction
"}}}}}
"{{{{{2   JudgeString(...) 判断string是否对应char
function! JudgeString(...)
    "{{{{{3 变量定义
    let idx1 = 0
    let char = a:1
    let string = a:2
    "}}}}
    let idx1 = 0
    while idx1 < len(char)
        if matchstr(string,char[idx1]) != ""
            return 1
        endif
        let idx1 += 1
    endwhile
    return 0
endfunction
"}}}}}
"{{{{{2   SmartFileSwitching(...) 智能切换文件
function! SmartFileSwitching(...)
    "{{{{{3 变量定义
    let filename = ""
    let path = ""
    let line = 1
    let curwinid = 0
    let targetwinid = 0
    let bufinfo = ""
    let curlinestring = ""
    let bufinfoflag = 0
    let idx1 = 0
    let register = ""
    let flag = a:1
    let templine = 0
    let tempstring = ""
    let istimerwindows = "false"
    let currentwindowsid = win_getid()
    let currenttabid = tabpagenr()
    let index =  -1
    let numberlist = []
    if len(g:greplog2list) != 0
        let currenttimerwindowsidlist  = GetOneOfTheColumns(g:greplog2list,"|",1)
        let curenttabidlist = GetOneOfTheColumns(g:greplog2list,"|",2)
        if count(currenttimerwindowsidlist,currentwindowsid) ==# 1 && count(curenttabidlist,currenttabid) ==# 1
            let istimerwindows = "true"
        endif
    endif
    "}}}}
    let curwinid = win_getid()
    let bufinfo = getbufinfo()
    if flag ==# 1
        let curlinestring  = getline('.')
        "call setline(1,string(getbufinfo()))
        "call setline(2,string(split(execute(":ls"),'\n')))
        if curwinid ==# g:windowfindid
            let path = curlinestring
            let filename = split(path,'/')[-1]
            let register = getline(1)
            "echo split(@f,'█')
            if count(split(@f,'█'),register) ==# 0
                let @f = register . '█'  . @f
            endif
        elseif curwinid ==# g:windowgrepid
            let curlinestring = split(curlinestring,'█')[0]
            let path = split(curlinestring,':')[0]
            let line = split(curlinestring,':')[1]
            let filename = split(path,'/')[-1]
            let register = getline(1)
            let numberlist = getline(3,line('$'))
            let tempstring = split(copy(@g),"█")
            if count(tempstring,register) ==# 0
                let register = join(ListStack(tempstring,register,100),"█")
                let g:grepnumberlist = insert(g:grepnumberlist,numberlist)
            else
                let index =  index(tempstring,register)
                call  remove(tempstring,index)
                let register = register . '█'  . join(tempstring,"█")
                call  remove(g:grepnumberlist,index)
                let g:grepnumberlist = insert(g:grepnumberlist,numberlist)
            endif
            let @g = register
            call setline(2,register)
        elseif istimerwindows ==# "true"
            let path = g:greplog2list[index][5]
            let line = split(curlinestring,':')[0]
            let filename = split(path,'/')[-1]
            let register = getline(1)
            if count(split(@l,'█'),register) ==# 0
                let register = register . '█'  . @l
                if len(split(register,"█")) > 100
                    let register = split(register,"█")
                    let register = register[0:99]
                    let register = join(register,"█")
                endif
                let @l = register
            endif
        else
            let path = split(curlinestring,'|')[0]
            let line = split(curlinestring,'|')[1]
            let filename = split(path,'/')[-1]
        endif
        let idx1 = 0
        while idx1 < len(bufinfo)
            if matchstr(string(bufinfo[idx1]),split(path,'\./')[0]) != ""
                if len(bufinfo[idx1]["windows"]) > 0
                    let targetwinid = bufinfo[idx1]["windows"][0]
                else
                    let targetwinid = 0
                endif
                if line ==# 1
                    let line = bufinfo[idx1]["lnum"]
                endif
                let bufinfoflag = bufinfo[idx1]["bufnr"]
            endif
            let idx1 += 1
        endwhile
        if bufinfoflag ==# 0
            silent execute "normal! \<c-w>k"
            silent execute "normal! :e "  . path . "\<cr>"
            call cursor(line,1)
        else
            if targetwinid ==# 0
                silent execute "normal! \<c-w>k"
                silent execute "normal! :b" . bufinfoflag . "\<cr>"
                call cursor(line,1)
            else
                silent call win_gotoid(targetwinid)
                call cursor(line,1)
            endif
        endif
    elseif flag ==# 2
        if curwinid ==# g:windowgrepid
            let register = getline(1)
            let numberlist = getline(3,line('$'))
            let tempstring = split(copy(@g),"█")
            if count(tempstring,register) ==# 0
                let register = join(ListStack(tempstring,register,100),"█")
                let g:grepnumberlist = insert(g:grepnumberlist,numberlist)
            else
                let index =  index(tempstring,register)
                call  remove(tempstring,index)
                let register = register . '█'  . join(tempstring,"█")
                call  remove(g:grepnumberlist,index)
                let g:grepnumberlist = insert(g:grepnumberlist,numberlist)
            endif
            let @g = register
            call setline(2,register)
        endif
        silent execute  "normal! 0\"ayt:0f:lvf:h\"by0"
        let path = @a
        let line = @b
        if &filetype != "markdown"
            execute "normal! :tabnew " . path  . "\<cr>"
            silent call cursor(line,1)
        else
            if matchstr(path,"/opt6/tangxinlouosc") ==# ""
                let path = g:homedir . '/' . path
            endif
            let register = getline(line('.') - 2)
            execute "normal! :tabnew " . path  . "\<cr>"
            let templine = search(register)
            if templine != 0
                let line = templine
            endif
            silent call cursor(line,1)
        endif
    endif
    setlocal foldmethod=syntax
    let &foldlevel=100
    silent execute  "normal! m`"
endfunction
"}}}}}
"{{{{{2 ParseTimestamp(...) 解析时间戳
function! ParseTimestamp(...)
    "{{{{{3 变量定义
    let timestamp = copy(a:1)
    let mstime = 0
    let ustime= 0
    "}}}}
    let ustime = split(timestamp,'\.')[1]
    let mstime = (split(split(timestamp,'\.')[0],":")[0] * 3600) + (split(split(timestamp,'\.')[0],":")[1] * 60) + (split(split(timestamp,'\.')[0],":")[2])
    let mstime = mstime * 1000
    let ustime = ustime / 1000
    let mstime = mstime + ustime
    return str2float(mstime . ".0")
endfunction
"}}}}}
"{{{{{2 SortByExpression(...) 通过表达式排序log 文件
function! SortByExpression(...)
    "{{{{{3 变量定义
    let charlist = copy(a:1)
    "let charlist = ""
    let expression = ""
    let templist = []
    let tmepcharlist = []
    let idx1 = 0
    let tempchar = ""
    let index = 0
    "}}}}
    for item in charlist
        if matchstr(item,"curf") ==# ""
            let templist = add(templist,split(item,"__")[-1])
        else
            let templist = add(templist,split(item,"log_")[-1])
        endif
    endfor
    let templist = sort(templist)
    while idx1 < len(charlist)
        let tempchar = split(charlist[idx1],"__")[-1]
        let index  =  index(templist,tempchar)
        let templist[index] = charlist[idx1]
        let idx1 += 1
    endwhile
    return templist
endfunction
"}}}}}
"{{{{{2 UniqueList(...) 列表项去重
function! UniqueList(...)
  let list = copy(a:1)
  let list =  uniq(sort(list,"MyCompareTimeChar"))
  return list
endfunction
"}}}}}
"{{{{{2 DictValue2Key(...) 字典通过值找到key
function! DictValue2Key(...)
let myDict = a:1
let targetValue = a:2
for key in keys(myDict)
  if myDict[key] == targetValue
    echo "当前key" . key
    return key
    break
  endif
endfor
endfunction
"}}}}}
"{{{{{2 CheckAndDeleteFolder(...) 查看当前文件夹是不是大于8天
function! CheckAndDeleteFolder(...)
    let folderName = a:1  " 替换为你要操作的文件夹路径
    let currentTime = system('date +%s')
    let folderTime = system('stat -c %Y '.folderName)

    if str2nr(currentTime) - str2nr(folderTime) > 691200  " 14天的秒数是 1209600
        call system('rm -rf ' . folderName)
    endif
endfunction
"}}}}}
"{{{{{2 DatePlus1s(...)04-02 19:01:11 类型日期 加1s
"date -d @1648939271.835907 "+%m-%d %H:%M:%S.%3N"
"04-02 19:01:11.835
"date -d "04-02 19:01:11.835907" "+%s.%6N"
"1648939271.835907
"printf("%.6f",str2float("1648939271.835907") + str2float("1"))
function! DatePlus1s(...)
    "let datestring =  "04-02 19:01:11.835907"
    "let timevalue = "-1"
    let datestring =  a:1
    let timevalue = a:2
    let datestring =  "2024-" . datestring
    let datecmd =   "date -d \"" . datestring . "\" " . "\"+%s.%6N\""
    let datestring =  system(datecmd)
    let datestring = printf("%.6f",str2float(datestring) + str2float(timevalue))
    let datecmd =   "date -d @" . datestring  . " \"+%m-%d %H:%M:%S.%6N\""
    let datestring =  system(datecmd)
    return datestring
endfunction
"}}}}}
"{{{{{2 LogicalJudgment(...) I 包含 D 差集
function! LogicalJudgment(...)
    let type = a:3
    let parentset = a:1
    let subset = a:2
    let result = ''
    let src1 = ""
    let src2 = ""
    let tail1 = ""
    let tail2 = ""
    let idx1 = 0
    let result = -1
    "找出最新集合
    if type ==# 'I'
        if type(parentset) ==# 3
            let idx1 = 0
            while idx1 < len(parentset)
                let src1 = str2nr(split(parentset[idx1],'-')[0])
                let tail1 = str2nr(split(parentset[idx1],'-')[1])
                if src1 <= subset && subset <= tail1
                    let result = idx1
                endif
                let idx1 += 1
            endwhile
            return result
        elseif type(parentset) ==# 1
        endif
    elseif type ==# 'D'
        let src1 = str2nr(split(parentset,'-')[0])
        let tail1 = str2nr(split(parentset,'-')[1])
        let src2 = str2nr(split(subset,'-')[0])
        let tail2 = str2nr(split(subset,'-')[1])
        if src1 > src2  && src1 - src2 > 1
            return (src2 + 1) . '-' . (src1 -1)
        elseif src1 ==# src2
            return -1
        elseif src1 < src2 && src2 - src1 > 1
            return (src1 + 1) . '-' . (src2 -1)
        else
            return -1
        endif
    endif
endfunction
"}}}}}
"{{{{{2 Parsetabinfo(...) 解析tabinfo
function! Parsetabinfo(...)
    "{{{{{3 变量定义
    let tabinfo = gettabinfo()
    let tabnr = []
    let windowsid = []
    let idx1 = 0
    let tabinfodict = {}
    let flag = a:1
    let windlist = []
    "}}}}
    if flag ==# "tabwindict"
        let idx1 = 0
        while idx1 < len(tabinfo)
            let tabnr = tabinfo[idx1]['tabnr']
            let windowsid = tabinfo[idx1]['windows']
            if has_key(tabinfodict,tabnr) ==# 0
                let tabinfodict[tabnr] = {}
            endif
            let tabinfodict[tabnr] = windowsid
            let idx1 += 1
        endwhile
        return tabinfodict
    elseif flag ==# "windlist"
        let idx1 = 0
        while idx1 < len(tabinfo)
            let windowsid = tabinfo[idx1]['windows']
            let windlist = extend(windlist,windowsid)
            let idx1 += 1
        endwhile
        return windlist
    endif
endfunction
"}}}}}
"{{{{{2 DynamicallyOpenTheMouse(...) 动态选择打开鼠标 目前决定打开timer
"的窗口打开鼠标
function! DynamicallyOpenTheMouse(...)
    let currentwindowsid = win_getid()
    let currenttabid = tabpagenr()
    let currenttimerwindowsidlist  = []
    let curenttabidlist = []
    if len(g:greplog2list) != 0
        let currenttimerwindowsidlist  = GetOneOfTheColumns(g:greplog2list,"|",1)
        let curenttabidlist = GetOneOfTheColumns(g:greplog2list,"|",2)
        if count(currenttimerwindowsidlist,currentwindowsid) != 0
        "    set clipboard=unnamed
        "    set mouse=a
        else
        "    set clipboard=exclude:clipboard
        "    set mouse=
        endif
    endif
endfunction
"}}}}}
"{{{{{2 CheckStringIsObtainOfList(...)检查string 里面是否有list中的字符
function! CheckStringIsObtainOfList(...)
    "JudgeString  功能类似
    let String = a:1
    let Stringlist = a:2
    let uncheckflag = 0
    for char in Stringlist
        if "" != matchstr(String,char)
            let uncheckflag = 1
        endif
    endfor
    return uncheckflag
endfunction
"}}}}}
"{{{ 2 FunctionList() 列出当前文件所有的函数名
nnoremap <leader>fuc :call  FunctionList()<cr>
function! FunctionList(...)
     "{{{{{3 变量定义
    let filename = ""
    let targetline = -1
    let cursor = ""
    "}}}}
    if a:0 ==# 0
        "处理当前文件
        let winnrnum = tabpagewinnr(tabpagenr(),'$')
        echo winnrnum
        if winnrnum  >  1
            execute "normal! \<c-w>h"
            execute "normal! :q!\<cr>"
        endif
        let filename = expand("%:p")
    else
        "处理传过来的文件
        let filename = a:1
        let mode = a:2
        execute "normal! :tabnew \<cr>:e " . filename . " \<cr>"
        setlocal foldmethod=syntax
        redraw
    endif
    let idx1 = 0
    while idx1 <= line('$')
        let currentString  = getline(idx1)
        if (matchstr(currentString,") {") ==# ") {"  ||  matchstr(currentString,"){") ==# "){" )
            call cursor(idx1,1)
            let cursor = FindAnotherBracketPosition(')')
            if CheckStringIsObtainOfList(getline('.'),g:nonfunctionlist)
            else
                if line('.') ==# idx1
                    let targetline = idx1
                    echo getline('.')
                else
                endif
            endif
            if a:0 ==# 0
"                call input("11")
            endif
        endif
        "redraw
        let idx1 += 1
    endwhile
    if a:0 ==# 0
    else
        execute "normal! :wq!\<cr>"
    endif
endfunction
"}}}
"{{{{{2  SelectEntireCode(...) 每一个搜索结果就选中符合代码规范的完整一行
"140行结果4.5s
function! SelectEntireCode(...)
    "{{{{{3 变量定义
   " let searchs = "setActivedevice"
    let searchs = "btif_hd_execute_service"
    let command = ""
    let searchstarge = ""
    let tempchar = ""
    let idx1 = 0
    let result = ""
    let filename = ""
    let line = ""
    let srcnum = -1
    let tailnum = -1
    let numberlist = []
    let currentstrlist = [1,2,3]
    let begintime = 0
    let endtime = 0
    let templist = []
    syntax off
    let filelist = []
    "}}}}
    if a:0 ==# 0
        let searchstarge = []
        let command = "grep -EsinR --include=*{.c,.cc,.java,.h,.xml} " . "'" . searchs . "'"
        let searchstarge =  system(command)
        let searchstarge = split(searchstarge,"\n")
        if 10 > g:debugflag | call Dbug( "begin",10,1) | endif
    else
        let searchstarge = a:1
        let searchstarge = split(searchstarge,"\n")
        if len(searchstarge) ==# 0
            return ""
        endif
    endif
    let idx1 = 0
    while idx1 < len(searchstarge)
            let filename = split(searchstarge[idx1],":")[0]
        if idx1 ==# 0 && matchstr(filename,".xml") ==# ""
            let filelist = add(filelist,filename)
        elseif  idx1 > 0 &&  split(searchstarge[idx1 - 1],":")[0] != filename  && matchstr(filename,".xml") ==# ""
            let filelist = add(filelist,filename)
        endif
        let idx1 += 1
    endwhile
    if 10 > g:debugflag | call Dbug("allbegin" ,10,0) | endif
    silent tabnew
    silent execute( "args " . join(filelist))
    if 10 > g:debugflag | call Dbug( "allend",10,0) | endif
    let idx1  = 0
    while idx1 < len(searchstarge)
        let templist = split(searchstarge[idx1],":")
        let currentstrlist[0] = templist[0]
        let currentstrlist[1] = templist[1]
        let currentstrlist[2] = templist[2]
        if count(searchstarge[idx1],':') > 2
            let currentstrlist[2] = join(templist[2:],':')
        endif
        let filename = currentstrlist[0]
        let line = currentstrlist[1]
        if matchstr(filename,'\.xml') ==# "" && matchstr(filename,'\.h') ==# ""
            if idx1 ==# 0
                if 10 > g:debugflag | call Dbug( "open" . filename,10,2) | endif
                if 10 > g:debugflag | call Dbug( "opening" . filename,10,2) | endif
                call SwitchBuff(filename)
                if 10 > g:debugflag | call Dbug( "clebegin",10,2) | endif
                "call ClearBracket()
                if 10 > g:debugflag | call Dbug( "cleend",10,2) | endif
                if 10 > g:debugflag | call Dbug( "opened" . filename,10,2) | endif
            elseif  idx1 > 0 &&  split(searchstarge[idx1 - 1],":")[0] != filename
                if 10 > g:debugflag | call Dbug( "open" . filename,10,2) | endif
                call SwitchBuff(filename)
                if 10 > g:debugflag | call Dbug( "clebegin",10,2) | endif
                "call ClearBracket()
                if 10 > g:debugflag | call Dbug( "cleend",10,2) | endif
                if 10 > g:debugflag | call Dbug( "opened" . filename,10,2) | endif
            endif
            silent setlocal foldmethod=syntax
            let numberlist = MergeLinesOfCode(line)
            if 3 > g:debugflag | call Dbug( numberlist,3) | endif
            if len(numberlist) != 0
                let srcnum = numberlist[0]
                let tailnum = numberlist[1]
                let currentstrlist[2] = GatherIntoRow(srcnum,tailnum)
                let searchstarge[idx1] = join(currentstrlist,":")
            else
                let currentstrlist[2] = currentstrlist[2] . "注释"
                let searchstarge[idx1] = join(currentstrlist,":")
            endif
        else
        endif
        if idx1 != (len(searchstarge) - 1) &&  split(searchstarge[idx1 + 1],":")[0] != filename
            "silent execute "normal! :wq!\<cr>"
            ":q!
        elseif idx1 ==# (len(searchstarge) - 1)
            "silent execute "normal! :wq!\<cr>"
            :q!
        endif

        let idx1 += 1
    endwhile
    if a:0 ==# 0
        if 3 > g:debugflag | call Dbug( "end",3,1) | endif
        silent execute("syntax on")
        call append(line('.'),searchstarge)
    else
        return join(searchstarge,"\n")
    endif
endfunction
"}}}}}
"{{{{{2 GatherIntoRow(...)多行变成一行
function! GatherIntoRow(...)
    let srcnum = a:1
    let tailnum = a:2
    let tempchar = getline(srcnum,tailnum)
    let idj1 = 0
    let foldstring = ""
    while idj1 < len(tempchar)
        "去掉^M
        if matchstr(tempchar[idj1],'') != ""
            let tempchar[idj1] = split(tempchar[idj1],'')[0]
        endif
        if matchstr(tempchar[idj1],"//") != ""
            if len(split(tempchar[idj1],"//")) > 1
                let tempchar[idj1] = split(tempchar[idj1],"//")[0]
            else
                let tempchar[idj1] = ""
            endif
        endif
        if idj1 > 0 && idj1 < len(tempchar) -1
            let tempchar[idj1] = join(split(tempchar[idj1],"\x00"))
        endif
        if idj1 ==# len(tempchar) -1 && idj1 != 0
            let tempchar[idj1] = join(split(tempchar[idj1],"\x00"))
        endif
        let idj1 += 1
    endwhile
    let foldstring = join(tempchar,"\x00")
    return foldstring
endfunction
"}}}}}
"{{{{{2 MergeLinesOfCode(...)判断那几行能合并成符合代码格式的一行
"echo MergeLinesOfCode(line('.'))
function! MergeLinesOfCode(...)
    let line = a:1
    let iscomment = -1
    let BracketLine = -1
    let SemicolonLine = -1
    let linelist = []
    let iscomment = IsComment(line)
    let currentstring = ""
    let end = -1
    let start = -1
    let idx1 = 0
    let indexlist = []
    let col = ""
    let tempstring = ""
    if 3 > g:debugflag | call Dbug(getline(line) ,3) | endif
    if iscomment ==# 0
        let currentstring = getline(line)
        if matchstr(currentstring,"  implements ") != ""
            return [line -1 , line]
        elseif matchstr(currentstring,"  throws ") != ""
            return [line -1 , line]
        elseif matchstr(currentstring,"default:") != ""
            return [line, line]
        elseif matchstr(currentstring,"#include ") != ""
            return [line, line]
        elseif matchstr(currentstring,"#define ") != ""
            return [line, line]
        elseif matchstr(currentstring,"#if ") != ""
            return [line, line]
        elseif matchstr(currentstring,"#endif") != ""
            return [line, line]
        elseif matchstr(currentstring,"-> {") != ""
            let cursor = FindAnotherBracketPosition('{')
            return [line, cursor[0]]
        elseif join(split(currentstring)) ==# "}"
            return [line, line]
        elseif matchstr(currentstring,'^\s*{') != ""
            return [line -1 , line]
        elseif (matchstr(currentstring,"{") ==# "{" || matchstr(currentstring,";") ==# ";") &&  matchstr(currentstring,"{}") != "{}"
            let end = line
        elseif  matchstr(currentstring," case ") != ""  ||  matchstr(currentstring,"#define ") != ""
            return [line,line]
        else
            if 3 > g:debugflag | call Dbug( "tangxinlou6",3) | endif
            silent call cursor(line,1)
            silent let BracketLine = JumpToNext('{','w')[0]
            silent call cursor(line,1)
            silent let SemicolonLine = search(";")
            if BracketLine > line  || SemicolonLine > line
                if 3 > g:debugflag | call Dbug( "tangxinlou9",3) | endif
                if 3 > g:debugflag | call Dbug( line,3) | endif
                if  BracketLine > line &&  SemicolonLine > line
                    if BracketLine >= SemicolonLine
                        if 3 > g:debugflag | call Dbug( "tangxinlou5",3) | endif
                        let end = SemicolonLine
                    else
                        let end = BracketLine
                    endif
                elseif BracketLine > line && SemicolonLine < line
                    "call Dbug( "tangxinlou7",8)
                    if 3 > g:debugflag | call Dbug("tangxinlou7" ,3) | endif
                    let end BracketLine
                elseif BracketLine < line && SemicolonLine > line
                    if 3 > g:debugflag | call Dbug( "tangxinlou10",3) | endif
                    let end = SemicolonLine
                endif
            else
                "; 和{ 一个都没找到
                return []
            endif
            if 3 > g:debugflag | call Dbug(BracketLine ,3) | endif
            if 3 > g:debugflag | call Dbug(SemicolonLine ,3) | endif
            if 3 > g:debugflag | call Dbug(end ,3) | endif
        endif
        let currentstring = getline(end)
        if 3 > g:debugflag | call Dbug(currentstring  ,3) | endif
        if len(split(currentstring)) ==# 1 && split(currentstring)[0] ==# "{" && line ==# end
            if 3 > g:debugflag | call Dbug( "tangxinlou1",3) | endif
            return [line,line]
        else
            if 3 > g:debugflag | call Dbug( "tangxinlou2",3) | endif
            if 3 > g:debugflag | call Dbug( currentstring,3) | endif
            if (count(currentstring,'(') != count(currentstring,')'))
                if 3 > g:debugflag | call Dbug( "tangxinlou3",3) | endif
                if 3 > g:debugflag | call Dbug( end,3,0) | endif
                silent call cursor(end,1)
                "silent execute "normal! $F)%"  缩短到2s
                let cursor = FindAnotherBracketPosition(')')
                "let cursor =searchpairpos('(', '', ')', 'b')
                if 3 > g:debugflag | call Dbug( cursor,3,2) | endif
                let start = cursor[0]
                if start ==# end
                    let indexlist = StringPosition(getline(line('.')),')')
                    let idx1 = len(indexlist) -1
                    while idx1 >= 0
                        silent call cursor(end,indexlist[idx1])
                        let cursor =searchpairpos('(', '', ')', 'b')
                        if cursor[0] != end
                            let start = cursor[0]
                            return [start,end]
                        endif
                        let idx1 -= 1
                    endwhile
                elseif start != line && line < start
                    let start = line
                endif
                return [start,end]
            else
                if 3 > g:debugflag | call Dbug( line,3) | endif
                if 3 > g:debugflag | call Dbug( end,3) | endif
                let tempstring = getline(line)
                let col = FirstNonBlank(tempstring)
                if  tempstring[col] ==# "."
                    let idx1 = line - 1
                    while 1
                        let tempstring = getline(idx1)
                        let col = FirstNonBlank(tempstring)
                        if tempstring[col] != "."
                            let start = idx1
                            break
                        endif
                        let idx1 -= 1
                    endwhile
                    return [start,end]
                else
                    if count(currentstring,'}') != 0
                        return [line,line]
                    else
                        return [line,end]
                    endif
                endif
            endif
        endif
    endif
    return linelist
endfunction
"}}}}}
"{{{{{2 IsComment(...)此行是否是注释行
"call IsComment(line('.'))
function! IsComment(...)
    let issyntax = 0
    let line = a:1
    let groupname = ""
    let lastgroupname = ""
    let iscomment = 0
    let secondNonWhitespace = ""
    let startcursor = []
    let endcursor = []
    let nextbeginitem = ""
    let nextenditem = ""
    let length = -1
    let templist = []
    let idx1 = 0

    if  join(split(getline(line))) ==# ""
        let iscomment = 1
    else
        if 10 > g:debugflag | call Dbug("commentbegin" ,10,2) | endif
        if 10 > g:debugflag | call Dbug( "comment 1",10,2) | endif
        silent call cursor(line,1)
        if 10 > g:debugflag | call Dbug( getline(line),10,2) | endif
        let secondNonWhitespace = matchstr(getline('.'), '\S\{2}')

        if 10 > g:debugflag | call Dbug( "findbegin",10,2) | endif
        silent let endcursor = searchpos('\*\/','w')
        silent let startcursor = searchpairpos('\/\*', '', '\*\/', 'b')
        if 10 > g:debugflag | call Dbug( "findend",10,2) | endif
        if startcursor[0] <= line &&  line <= endcursor[0]
            let iscomment = 1
        else
            if secondNonWhitespace ==# "//"
                let iscomment = 1
            elseif  secondNonWhitespace ==# "*/" || secondNonWhitespace ==# "/*"
                "split(getline('.'),"*/")
                if matchstr(getline(line),"*/") != ""
                    let length = len(split(join(split(getline(line))),"*/"))
                    if length ==# 0
                        let iscomment = 1
                    elseif length ==# 1
                        let iscomment = 1
                    endif
                else
                    let iscomment = 1
                endif
            elseif matchstr(getline(line),"@") != ""
                let templist = split(getline(line))
                let iscomment = 1
                while idx1 < len(templist)
                    if matchstr(templist[idx1],"@") ==# ""
                        let iscomment = 0
                    endif
                    let idx1 += 1
                endwhile
            endif
        endif
    endif
    if 10 > g:debugflag | call Dbug("commentend" ,10,2) | endif
    call cursor(line,1)
    return iscomment
endfunction
"}}}}}
"{{{{{2 CurrentTimeWithMilliseconds(...)返回当前毫秒时间
function! CurrentTimeWithMilliseconds()
  let time_in_milliseconds = reltimestr(reltime())
    let milliseconds = str2float(matchstr(time_in_milliseconds, '\.\zs\d\+\ze'))
  return milliseconds
endfunction
"}}}}}
"{{{{{2 FastMoveToFirstNonBlank(...)移动到首个非空字符位置
function! FastMoveToFirstNonBlank()
  silent let col = match(getline('.'), '\S')
  silent call cursor(line('.'), col + 1)
endfunction
"}}}}}
"{{{{{2 FindAnotherBracketPosition(...)找到匹配的括号另一半位置
"silent execute "normal! $F)%"
function! FindAnotherBracketPosition(...)
    let char = a:1
    let line = line('.')
    let col = col('.')
    let reallycursor = [line,col]
    let cursor = []
    let tempcursor = []
    let idx1 = 1
    let curline = -1
    let index = -1
    let tempchar = getline('.')
    let curline = -1
    if 3 > g:debugflag | call Dbug( "findAnbegin",3,0) | endif
    if a:0 ==# 2
        silent call cursor(1,1)
        silent let cursor =  searchpos('{','w')
        let index = match(getline('.'), '\S')
        let curline = copy(cursor[0])
        if 3 > g:debugflag | call Dbug( "findanend",3,0) | endif
        while IsComment(cursor[0]) ==# 1
            call cursor(cursor[0] + 1,1)
            let cursor =  searchpos('{','w')
        endwhile
        return cursor
    endif
    if char ==# ')'
        silent let col =  strridx(tempchar,')')
        silent call cursor(line('.'), col + 1)
        silent let cursor = searchpairpos('(', '', ')', 'b')
        return cursor
    elseif char ==# '('
        silent let col =  strridx(tempchar,'(')
        silent call cursor(line('.'), col + 1)
        silent let cursor  = searchpairpos('(', '', ')', 'w')
        return cursor
    elseif char ==# '}'
        silent let col =  strridx(tempchar,'}')
        silent call cursor(line('.'), col + 1)
        "for (Uri uri : new Uri[]{Mms.CONTENT_URI, Sms.CONTENT_URI}) {  修复这种情况
        if (count(tempchar,'{') != 0 && count(tempchar,'}') != 0) && (StringPosition(tempchar,'{')[0] < StringPosition(tempchar,'}')[0])
            silent let cursor =  searchpos('{','b')
        endif
        silent let cursor  = searchpairpos('{', '', '}', 'b')
        if IsComment(cursor[0]) ==# 1
            "echo searchpairpos(') {', '', '}', 'b')
           let cursor = FindAnotherBracketPosition('}')
        endif
        if 3 > g:debugflag | call Dbug( "findanend",3,0) | endif
        return cursor
    elseif char ==# '{'
        silent let col =  strridx(tempchar,'{')
        silent call cursor(line('.'), col + 1)
        if (count(tempchar,'{') != 0 && count(tempchar,'}') != 0)  && (StringPosition(tempchar,'{')[0] < StringPosition(tempchar,'}')[0])
            silent let cursor =  searchpos('{','b')
        endif
        "silent let cursor  = searchpairpos('@{', '', '@}', 'w')
        silent let cursor  = searchpairpos('{', '', '}', 'w')
        if 3 > g:debugflag | call Dbug( "end",3,0) | endif
        return cursor
    endif

    let idx1 = 1
    if char ==# '}'  || char ==# '{'
        while idx1 > 0
            let curline = line('.')
            if char ==# '}'
                silent let cursor = searchpos('{','b')
                if cursor[0] > curline
                    let cursor = [0,0]
                    return cursor
                endif
                silent let tempcursor = searchpairpos('{', '', '}', 'w')
                if cursor[0] < line && line < tempcursor[0]
                    let idx1 = 0
                endif
                call cursor(cursor[0],cursor[1])
            elseif char ==# '{'
                silent let cursor = searchpos('}','w')
                if cursor[0] < curline
                    let curosr = [0,0]
                    return cursor
                endif
                silent let tempcursor = searchpairpos('{', '', '}', 'b')
                if cursor[0] > line && line > tempcursor[0]
                    let idx1 = 0
                endif
                call cursor(cursor[0],cursor[1])
            endif
        endwhile
    endif
    if 3 > g:debugflag | call Dbug( "end",3,0) | endif
    return cursor
endfunction
"}}}}}
"{{{{{2 SwitchBuff(...) 切换buffer
function! SwitchBuff(...)
    let filepath = a:1
    let bufferslist = []
    if 10 > g:debugflag | call Dbug( "switch bg",10,2) | endif
    let templist = split(execute("buffers"),"\n")
    let buffidlist = []
    let idx1 = 0
    let index = -1
    while idx1 < len(templist)
        let bufferslist = add(bufferslist,split(templist[idx1],'\"')[1])
        let buffidlist = add(buffidlist,split(templist[idx1])[0])
        let idx1 += 1
    endwhile
    if count(bufferslist,filepath) != 0
        let index = index(bufferslist,filepath)
        if 10 > g:debugflag | call Dbug( "switch bging",10,2) | endif
        silen execute("b " . buffidlist[index])
        if 10 > g:debugflag | call Dbug( "switch end",10,2) | endif
        return 1
    endif
    silen execute("edit " . filepath)
    return 0
endfunction
"}}}}}
"{{{{{2 ClearBracket(...)清除多余的花括号

function! ClearBracket()
    let idx1 = 1
    let line = line('.')
    let col = col('.')
    silent call cursor(1,1)
    silent call searchpos('{','w')
    if 3 > g:debugflag | call Dbug( "cle1",3,0) | endif
    silent let cursor = searchpairpos('{','','}','w')
    if 3 > g:debugflag | call Dbug( "cle2",3,0) | endif
    if cursor[0] ==# 0 && cursor[1] ==# 0
        while idx1 > 0
    if 3 > g:debugflag | call Dbug( "cle3",3,0) | endif
            silent call cursor(line('$'),col('$'))
            silent call searchpos('}','b')
    if 3 > g:debugflag | call Dbug( "cle4",3,0) | endif
            silent let cursor = searchpairpos('{','','}','b')
    if 3 > g:debugflag | call Dbug( "cle5",3,0) | endif
            if 3 > g:debugflag | call Dbug( cursor,3,0) | endif
            silent call setline(cursor[0],"")
            silent call cursor(1,1)
            silent call searchpos('{','w')
    if 3 > g:debugflag | call Dbug( "cle6",3,0) | endif
            silent let cursor = searchpairpos('{','','}','w')
    if 3 > g:debugflag | call Dbug( "cle7",3,0) | endif
            if cursor[0] != 0 && cursor[1] != 0
                let idx1 = 0
            endif
    if 3 > g:debugflag | call Dbug( "cle8",3,0) | endif
        endwhile
    else
    endif
    silent call cursor(line,col)
endfunction
"}}}}}
"{{{{{2 ResultClassification(...)结果分类

function! ResultClassification(...)
    let idx1 = 0
    let transfer = []        "语句里面有分号识别调用
    let definition = []       "定义
    let Log = []              "打印
    let judge = []            "判断
    let Comment = []          "注释
    let TEST = []             "test
    let XML = []              "xml
    let HHH = []              "头文件
    let judgechar = ["if ","for "," case "]
    let judgeLog = ["log","Log"]
    let searchstarge = a:1
    let temchar = ""
    let tempchar = ""
    let resultlist = [1,2,3,4,5,6,7,8]
    let searchstarge = split(searchstarge,"\n")
    while idx1 < len(searchstarge)
        let temchar = join(split(searchstarge[idx1],":")[2:])
        let tempchar = [split(searchstarge[idx1],":")[0] . ":" . split(searchstarge[idx1],":")[1] . ":","   " . split(join(split(searchstarge[idx1],":")[2:]),"^\\s\\+")[0]]
        if matchstr(split(searchstarge[idx1],":")[0],'\.xml') ==# ""
            if matchstr(split(searchstarge[idx1],":")[0],"test") ==# ""
                if matchstr(temchar,"注释") ==# ""
                    if matchstr(split(searchstarge[idx1],":")[0],'\.h') ==# ""
                        if JudgeString(judgeLog,temchar)
                            let Log = add(Log,tempchar)
                        elseif matchstr(temchar," //") != ""
                            let Comment = add(Comment,tempchar)
                        elseif matchstr(temchar,";") != ""
                            if split(split(searchstarge[idx1],":")[0],'\.')[1] ==# "h"
                                let definition  = add(definition,tempchar)
                            else
                                let transfer = add(transfer,tempchar)
                            endif
                        elseif JudgeString(judgechar,temchar)
                            let judge = add(judge,tempchar)
                        else
                            let definition = add(definition,tempchar)
                        endif
                    else
                        let HHH = add(HHH,tempchar)
                    endif
                else
                    let Comment = add(Comment,tempchar)
                endif
            else
                let TEST = add(TEST,tempchar)
            endif

        else
            let XML = add(XML,tempchar)
        endif
        let idx1 += 1
    endwhile

    let resultlist[0] =  transfer
    let resultlist[1] =  definition
    let resultlist[2] =  Log
    let resultlist[3] =  judge
    let resultlist[4] =  Comment
    let resultlist[5] =  TEST
    let resultlist[6] =  XML
    let resultlist[7] =  HHH
    return resultlist
endfunction
"}}}}}
"{{{{{2 StringPosition(...)字符在字符串位置
function! StringPosition(...)
    let strings = a:1
    let char = a:2
    let idx1 = 0
    let indexlist = []
    "let strings = str2list(strings)
    "每个字母
    let strings = split(strings,'\zs')
    while idx1 < len(strings)
        "if strings[idx1] ==# char2nr(char)
        if strings[idx1] ==# char
            let indexlist = add(indexlist,idx1 + 1)
        endif
        let idx1 += 1
    endwhile
    return indexlist
endfunction
"}}}}}
"{{{{{2 ChildStringPosition(...)子字符串在字符串位置
function! ChildStringPosition(...)
    let strings = a:1
    let childstring = a:2
    let indexlist = []
    let srcnum = -1
    let tailnum = -1
    let length = len(childstring)
    let srcnum = match(strings,childstring)
    if srcnum != -1
        let tailnum = srcnum  + length -1
        let indexlist = add(indexlist,srcnum)
        let indexlist = add(indexlist,tailnum)
        return indexlist
    endif
    return indexlist
endfunction
"}}}}}
"{{{{{2 StandardCharacters(...)返回当前行标准格式字符
function! StandardCharacters(...)
    let realityline = a:1
    let numberlist = MergeLinesOfCode(realityline)
    if numberlist ==# []
        return ""
    endif
    let srcnum  = numberlist[0]
    let tailnum = numberlist[1]
    let foldstring =  ""
    if srcnum <= tailnum
        let foldstring =  GatherIntoRow(srcnum,tailnum)
    endif
    call cursor(realityline,1)
    return foldstring
endfunction
"}}}}}
"{{{{{2 SetOperationsBetweenLists(...) 列表间集合运算
function! SetOperationsBetweenLists(...)
    let Alist = a:1
    let Blist = a:2
    let flag = a:3
    let AB = []  "A 中B 没有的元素
    let BA = []  "B中A没有的元素
    let result = []
    let idx1 = 0
    "差集 A-B B-A
    if flag ==# "差集"
        let idx1 = 0
        while idx1 < len(Alist)
            if count(Blist,Alist[idx1]) ==# 0
                let AB = add(AB,idx1)
            endif
            let idx1 += 1
        endwhile
        let idx1 = 0
        while idx1 < len(Blist)
            if count(Alist,Blist[idx1]) ==# 0
                let BA = add(BA,idx1)
            endif
            let idx1 += 1
        endwhile
        let result = add(result,AB)
        let result = add(result,BA)
        return result
    endif
endfunction
"}}}}}
"{{{{{2 SelectionFromTheList(...)列表中摘选
function! SelectionFromTheList(...)
    let childlist = a:1
    let totallist = a:2
    let resultlist = []
    let iscontain =  ""
    let idx1 = 0
    let index = 0
    let lastindex = -1
    while idx1 < len(childlist)
        let iscontain =  IsContain(childlist[idx1],totallist)
        let index = index(totallist,iscontain)
        if index > lastindex
            let resultlist = add(resultlist,iscontain)
        else
            let resultlist = insert(resultlist,iscontain)
        endif
        let idx1 += 1
    endwhile
    return resultlist
endfunction
"}}}}}
"{{{{{2 SelectionFromTheListByIndex(...)列表中摘选通过index
function! SelectionFromTheListByIndex(...)
    let indexlist = a:1
    let totallist = a:2
    let idx1 = 0
    let resultlist = []
    while idx1 < len(indexlist)
        let resultlist = add(resultlist,totallist[indexlist[idx1]])
        let idx1 += 1
    endwhile
    return resultlist
endfunction
"}}}}}
"{{{{{2 ListStack(...)list 栈先进先出
function! ListStack(...)
    let stacklist = a:1
    let targetchar = a:2
    let len = a:3
    let stacklist = insert(stacklist,targetchar)
    if len(stacklist) > 100
        let stacklist  = stacklist[0:len]
    endif
    return stacklist
endfunction
"}}}}}
"{{{{{2 ListIndex(...)提供一个数值index
function! ListIndex(...)
    let list = a:1
    let nr = a:2
    let index = -1
    let idx1 = 0
    if nr > 0
        let index += 1
    endif
    while idx1 < len(list)
        if  nr > list[idx1]
            let index += 1
        endif
        let idx1 += 1
    endwhile
    return index
endfunction
"}}}}}
"{{{{{2 IsFileType(...) filetype 文件类型
function! IsFileType(...)
    let filename = a:1
    let filetype = ""
    if matchstr(filename,'\.java') != ""
        let filetype = "java"
    elseif matchstr(filename,'\.cc') != ""
        let filetype = "cc"
    elseif matchstr(filename,'\.cpp') != ""
        let filetype = "cpp"
    elseif matchstr(filename,'\.ch') != ""
        let filetype = "head"
    elseif matchstr(filename,'\.vimrc') != ""
        let filetype = "vimrc"
    endif
    return filetype
endfunction
"}}}}}
"{{{{{2 JumpToNext(...)跳转到下一个的{ 规避{}
"call JumpToNext('{','w')
function! JumpToNext(...)
    let char = a:1
    let drect = a:2
    let cursor = []
    let flag = 0
    let tempchar = ""
    while flag ==# 0
        let cursor =  searchpos(char,drect)
        let tempchar = getline(cursor[0])
        if char ==# "{"
            if cursor[1] ==# len(tempchar)
                let flag = 1
            else
                if tempchar[cursor[1] -1] ==# '{' && tempchar[cursor[1]] != '}'
                    let flag = 1
                endif
            endif
        elseif char ==# "}"
            if tempchar[cursor[1] -1] ==# '}' && tempchar[cursor[1] - 2] != '{'
                let flag = 1
            endif
        endif
        if IsComment(cursor[0]) ==# 1
            let flag = 0
        endif
        call cursor(cursor[0],cursor[1])
    endwhile
    return cursor
endfunction
"}}}}}
"{{{{{2 ItString(...)判断是否是字符串而不是代码
"call ItString("throw new IllegalStateException("start() called twice");,"start")
"call ItString(getline(5),"start")
function! ItString(...)
    let flag = 0
    let totalstr = a:1
    let childstr = a:2
    let char = '"'
    let length = -1
    let srcnum = -1
    let tailnum = -1
    let indexlist = StringPosition(totalstr,char)
    let length = len(childstr)
    let srcnum = match(totalstr,childstr)
    if srcnum != -1
        let tailnum = srcnum + length
        let srcnum = srcnum + 1
        if len(indexlist) ==# 2
            if indexlist[0] < srcnum && indexlist[1] > tailnum
                let flag = 1
            endif
        endif
    else
        return -1
    endif
    return flag
endfunction
"}}}}}
"{{{{{2 FirstNonBlank(...)获取字符串非空字符位置
function! FirstNonBlank(...)
    let string = a:1
    let length = len(string)
    let idx1 = 0
    let col = -1
    while idx1 < length
        if string[idx1] != " "
            break
        endif
        let idx1 += 1
    endwhile
    let col = idx1
    return col
endfunction
"}}}}}
"{{{{{2 FindCorrespondingBracketPosition(...)在字符串中获取对应括号的位置
"echom FindCorrespondingBracketPosition(getline(line('.')),col('.') -1)
function! FindCorrespondingBracketPosition(...)
    let codestring = a:1
    let position = a:2
    let idx1 = 0
    let openflag = 0
    let closeflag = 0
    let resultposition = -1
    if codestring[position] ==# '('
        let idx1 = position + 1
        let openflag = 1
        while idx1 < len(codestring)
            if codestring[idx1] ==# ')'
                let closeflag += 1
            endif
            if codestring[idx1] ==# '('
                let openflag += 1
            endif
            if openflag ==# closeflag
                break
            endif
            let idx1 += 1
        endwhile
        let resultposition = idx1
    elseif codestring[position] ==# ')'
        let idx1 = position -1
        let closeflag = 1
        while idx1 >= 0
            if codestring[idx1] ==# ')'
                let closeflag += 1
            endif
            if codestring[idx1] ==# '('
                let openflag += 1
            endif
            if openflag ==# closeflag
                break
            endif
            let idx1 -= 1
        endwhile
        let resultposition = idx1
    endif
    return resultposition
endfunction
"}}}}}
"{{{{{2 ClearingStringsInCode(...)在代码中清除字符串
"echom ClearingStringsInCode(getline(line('.')))
function! ClearingStringsInCode(...)
    let codestring = a:1
    let resultstr = ""
    let indexlist = []
    let idx1 = 0
    let srcnum = -1
    let tailnum = -1
    if count(codestring,'"') != 0
        let indexlist = StringPosition(codestring,'"')
        while idx1 <= len(indexlist) / 2
            if idx1 ==# 0
                let srcnum = 0
                let tailnum = indexlist[idx1 * 2] - 2
            elseif idx1 ==# len(indexlist) / 2
                let srcnum = indexlist[idx1 * 2 -1]
                let tailnum = -1
            else
                let srcnum = indexlist[idx1 * 2 - 1]
                let tailnum = indexlist[idx1 * 2] - 2
            endif
            let resultstr = resultstr . codestring[srcnum:tailnum]
            let idx1 += 1
        endwhile
        return resultstr
    else
        return codestring
    endif
endfunction
"}}}}}
"}}}}
"{{{{vmake 命令


"{{{{{2 function! VmakeChange()                  格式化vmake 命令，在vmake 命令标记分支，时间  普通模式下逗号 + ch 调用
"nnoremap <leader>ch 03f"lvllllly05f"lvlllllp015f"ci"<esc>:r!pwd<cr>0v$hdk015f"p0jddk
"使用execute 和normal!特殊字符需要加\
"nnoremap <leader>ch :call fun#VmakeChange()<cr>
nnoremap <leader>ch :call VmakeChange()<cr>

"silent call append(line('.'), system("git status . \| grep  \"On branch\""))
"echo matchstr(MyGroup, "On branch")
function! VmakeChange()
    let i = 0
    let pdname = ""
    let a:MyGroup1 = ""
    let a:MyGroup5 = ""
    let a:MyGroup2 = ""
    let a:MyGroup3 = []
    let a:MyGroup4 = []
    let a:MyGroup6 = []
    let a:MyGroup7 = []
    let curversion = []
    if "yes" ==# input("是否更新日期")
        execute "normal! :r!date +\\%F-\\%T\<cr>"
        return
    endif
    let a:MyGroup4 = IsCfgfile(input("请输入编译的项目"))
    let a:MyGroup7 = copy(a:MyGroup4)
    call AddNumber2(a:MyGroup7)
    let a:MyGroup5 = input("请输入xml")
    let curversion = IsVersion(a:MyGroup4[a:MyGroup5])
    let a:MyGroup6 = split(a:MyGroup4[a:MyGroup5],"/")
    let  @u = a:MyGroup6[len(a:MyGroup6) - 1]
    "execute "normal! $a 2>&1 | tee builglog1.txt\<esc>"
    execute "normal! 03f\"ci\"\<esc>\"up"
    execute "normal! 03f\"lvllllly05f\"lvlllllp017f\"ci\"\<esc>:r!pwd\<cr>0v$hdk017f\"p0jddk"
    " "execute "normal! 011f\"ci\"system ../../../../make_*_images.log ../../../../out/build*.log\<esc>"
    execute "normal! 011f\"ci\" system/app/Bluetooth/Bluetooth.apk  system/lib64/libbluetooth_qti_jni.so system/lib64/libbluetooth_qti.so ../../../../out_sys/target/product/mssi_64_64only_cn_armv82/system/apex/com.android.btservices.apex  system/apex/com.android.btservices.apex ../qssi/system/apex/com.android.btservices.apex ../../../../out_sys/target/product/mssi_64_cn_nonab_armv82/system/app/Bluetooth/Bluetooth.apk ../../../../out_sys/target/product/mssi_64_cn_nonab_armv82/system/lib64/libbluetooth_jni.so ../../../../out_sys/target/product/mssi_64_cn_nonab_armv82/system/lib64/libbluetooth.so ../../../../out_sys/target/product/mssi_64_cn_nonab_armv82/system/framework/framework.jar ../../../../out_sys/target/product/mssi_64_cn_armv82/system/app/Bluetooth/Bluetooth.apk ../../../../out_sys/target/product/mssi_64_cn_nonab_armv82/system/framework/services.jar ../../../../out_sys/target/product/mssi_64_cn_armv82/system/framework/services.jar ../../../../out_sys/target/product/mssi_64_cn_armv82/system/lib64/libbluetooth_jni.so ../../../../out_sys/target/product/mssi_64_cn_armv82/system/lib64/libbluetooth.so ../../../../out_sys/target/product/mssi_64_cn_armv82/system/framework/framework.jar system/app/Bluetooth/Bluetooth.apk  system/lib64/libbluetooth_jni.so system/lib64/libbluetooth.so system/framework/framework.jar system/framework/services.jar../../../../make_*_images.log ../../../../out/build*.log"
    execute "normal! 03f\"lvfAhh\"uy"
    echo "tangxinlou"
    if  "ard_12.0" ==#  curversion[len(curversion) - 3]
        let pdname = @u
        let @u = join([pdname,"_","12.0"],"\x00")
    else
        if "ROM13" ==#  curversion[len(curversion) - 2] || "ROM12" ==#  curversion[len(curversion) - 2]
            let pdname = @u
            let @u = join([pdname,"_",curversion[len(curversion) - 2]],"\x00")
        endif
    endif
    execute "normal! 05f\"ci\"\<esc>\"up"
    execute "normal! 09f\"ci\"yes\<esc>"
    execute "normal! 013f\"ci\"yes\<esc>"
    if input("此版本是否第一次编译? 回答yes or no") == "no"
        execute "normal! 09f\"ci\"no\<esc>"
        execute "normal! 013f\"ci\"no\<esc>"
    endif
    execute "normal! 03f\"yi\""
    execute "normal! 015f\"yi\""
    let a:pathh = split(@@)
    execute "normal! :r!date +\\%F-\\%T\<cr>"
    if len(a:pathh) > 1
        echo "tangxinlou len >1"
        while i < len(a:pathh)
            silent let a:MyGroup1 = system("cd "  . a:pathh[i] . "; git status . \| grep  \"On branch\"")
            if "No such file or directory" !=# matchstr(a:MyGroup1, "No such file or directory")
                let a:MyGroup1 = join(split(a:MyGroup1))
                silent let a:MyGroup2 = join([a:pathh[i],a:MyGroup1]," ")
                silent call add(a:MyGroup3,a:MyGroup2)
                "silent let a:MyGroup2 = join(a:MyGroup3," ")
                "silent call append(line('.'), a:MyGroup2)
            endif
            let i += 1
        endwhile
        silent call append(line('.'), join(a:MyGroup3," "))
        call cursor(line('.') + 1,1)
    else
        echom "tangxinlou len <1"
        silent let a:MyGroup =  system("git status . \| grep  \"On branch\"")
        let  a:MyGroup = join(split(a:MyGroup))
        if "On branch" ==# matchstr(a:MyGroup, "On branch")
            silent call append(line('.'), a:MyGroup)
            call cursor(line('.') + 1,1)
        endif
    endif
endfunction
"}}}}}

"{{{{{2  IsCfgfile(a,b)查找a目录b文件，返回文件列表带绝对路径
function! IsCfgfile(...) "1 项目 2路径 3 安卓版本
    let iscfgfile = "tangxinlou"
    let iscfgpath = "tangxinlou"
    let androidversion = "tangxinlou"
    let isfiles = "tangxinlou"
    let isfiles1 = []
    let CurBranch = []
    if a:0 ==# 0
        let iscfgpath = "~/ftp"
        let iscfgfile = "PD*"
        let isfiles = system("find " . iscfgpath . " -iname " . "'*" . iscfgfile ."*" . "vivo" ."*'")
    elseif a:0 ==# 1
        let iscfgpath = "~/ftp"
        let iscfgfile = a:1
        let isfiles = system("find " . iscfgpath . " -iname " . "'*" . iscfgfile . "*" . "vivo" . "*'")
    elseif a:0 ==# 3
        let iscfgpath = a:2
        let iscfgfile = a:1
        let androidversion = a:3
        let isfiles = system("find " . iscfgpath . " -iname " . "'*" . iscfgfile . "*" . "_" . androidversion . "*vivo" . "*'")
    else
        return
    endif
    let isfiles1 = split(isfiles)
    call sort(isfiles1,"MyCompareVersion")
    return isfiles1
endfunction
"}}}}

"{{{{{2  AddNumber() 列表中的绝对路径取文件，添加标号
function! AddNumber(...)
    let isnumber = "tangxinlou"
    let isnumber2 = []
    let isnumber3 = []
    let @t=@*
    execute "normal! $lvG$d0"
    let @*=@t
    let @t=""
    if a:0 ==# 1 && 3 ==# type(a:1)
        let isnumber2 = a:1
        let idx1 = 0
        while idx1 < len(isnumber2)
            let isnumber3 = split(isnumber2[idx1], "/")
            let GitBranch = join([idx1,isnumber3[len(isnumber3) - 1]," "])
            let isnumber2[idx1]  = GitBranch
            let idx1 += 1
        endwhile
        let idx1 = 0
        "while idx1 < len(isnumber2)
        "    echo isnumber2[idx1]
        "    let idx1 += 1
        "endwhile
        call append(line('.'),isnumber2)
        "call cursor(line('.') + len(isnumber2),1)
        redraw
    endif
    return
endfunction
"}}}}}

"{{{{{2  AddNumber1() 列表中绝对路径前加标号，并打印
function! AddNumber1(...)
    let isnumber = "tangxinlou"
    let isnumber2 = []
    execute "normal! $lvG$d0"
    if a:0 ==# 1 && 3 ==# type(a:1)
        let isnumber2 = a:1
        let idx1 = 0
        while idx1 < len(isnumber2)
            let isnumber = join([idx1,isnumber2[idx1]," "])
            let isnumber2[idx1]  = isnumber
            let idx1 += 1
        endwhile
        call append(line('.'),isnumber2)
        redraw
    endif
    return
endfunction
"}}}}}

"{{{{{2  AddNumber2() 列表中绝对路径取文件，添加标号，用echo 打印
function! AddNumber2(...)
    let isnumber = "tangxinlou"
    let isnumber2 = []
    let isnumber3 = []
    "execute "normal! $lvG$d0"
    if a:0 ==# 1 && 3 ==# type(a:1)
        let isnumber2 = a:1
        let idx1 = 0
        while idx1 < len(isnumber2)
            let isnumber3 = split(isnumber2[idx1], "/")
            let GitBranch = join([idx1,isnumber3[len(isnumber3) - 1]," "])
            let isnumber2[idx1]  = GitBranch
            echo isnumber2[idx1]
            let idx1 += 1
        endwhile
        let idx1 = 0
    endif
    return
endfunction
"}}}}}

"{{{{{2  AddNumber3() 列表中绝对路径前加标号，并echo打印
function! AddNumber3(...)
    let isnumber = "tangxinlou"
    let isnumber2 = []
    if a:0 ==# 1 && 3 ==# type(a:1)
        let isnumber2 = a:1
        let idx1 = 0
        while idx1 < len(isnumber2)
            let isnumber = idx1 . " " . isnumber2[idx1]
            let isnumber2[idx1]  = isnumber
            echom string(isnumber2[idx1])
            let idx1 += 1
        endwhile
    endif
    return
endfunction
"}}}}}
"}}}}
"{{{{实践 vim
"call append(line('.'), readfile("1.txt"))
"call setline(line('.'), readfile("1.txt"))
"call setline(5, ['aaa', 'bbb', 'ccc'])
"silent call writefile(["tangxinlog"], "1.txt", "a")
"echo matchstr("testing", "ing", 5)
"if input("Coffee or beer? ") == "beer"
"   echom "Cheers!"
"else
"   echom "tangxinlou"
"endif
"}}}}
"{{{{{ 获取键盘输入
"{{{{{2  s:getchar()
"function! s:getchar()
"    let c = getchar()
"    if c =~ '^\d\+$'
"        let c = nr2char(c)
"    endif
"    return c
"endfunction
function! Getchar()
    let c = ''
    let b = ""
    while 1
        let c = getchar()
        if c =~ '^\d\+$'
            if c ==# 13
                break
            endif
            let c = nr2char(c)
            let b = b . c
        endif
    endwhile
    return b
endfunction
"}}}}}

" Interactively change the window size
"{{{{{2  InteractiveWindow()  循环输入选择项
function! InteractiveWindow()
    let char = "s"
    call append(line('.'),"tanxinlou")
    while char =~ '^\w$'
        echo "(InteractiveWindow) TYPE: h,j,k,l to resize or a for auto resize"
        let char = s:getchar()
        "if char == "a"
        "    call SetWindowSize("abs" ,0 ,0)
        "endif
        echom "1"
        redraw
    endwhile
endfunction
"}}}}}


"}}}}}
"{{{{{涉及git的函数
"{{{{{2  GitStatus()  git status  找到需要提交的文件，把临时文件去掉，为git add 做准备
function! GitStatus()
    let Gitstatus = "tangxinlou"
    let Preadd = []
    let idx1 = 0
    let resultlist = []
    let isstatus = IsStatus()
    if  "not a respository" ==#  isstatus
        echom isstatus
        return
    endif
    let Gitstatus = system("git status . \| grep -v -Esi \"branch|Changes not|use.*git|Untracked files:|^$|a sparse checkout|Changes to be\"")
    let Preadd = split(Gitstatus,"\n")
    let idx1 = 0
    while idx1 < len(Preadd)
        if "modified:" ==# matchstr(Preadd[idx1],"modified:")
            let resultlist = add(resultlist,Preadd[idx1])
        elseif "deleted:" ==# matchstr(Preadd[idx1],"deleted:")
            let resultlist = add(resultlist,Preadd[idx1])
        endif
        let idx1 += 1
    endwhile
    return resultlist
endfunction
"}}}}}
"{{{{{2  GitAdd()                       git add 为git commit 做准备
function! GitAdd()
    let Gitadd1 = "tangxinlou"
    let Precommit = []
    let idx2 = 0
    let isempty = 0
    let isstatus = ""
    let tempchar = ""
    let isstatus = IsStatus()
    if  "is modified" ==#  isstatus
        echom isstatus
    elseif  "is added" ==#  isstatus
        echom isstatus
    else
        return
    endif
    let Precommit = GitStatus()
    let isempty = empty(Precommit)
    echom "tangxinlou" isempty
    if  1 ==#  isempty
        echom "list is null"
        return
    endif
    while idx2 < len(Precommit)
        let tempchar = split(Precommit[idx2])
        echo tempchar
        if "modified:" ==# matchstr(Precommit[idx2],"modified:")
            if "both" ==# matchstr(Precommit[idx2],"both")
                silent execute("normal! : !vim " . tempchar[-1] . "\<cr>")
                call system("git add " . tempchar[-1])
            else
                call system("git add " . tempchar[-1])
            endif
        elseif "deleted:" ==# matchstr(Precommit[idx2],"deleted:")
            call system("git add " . tempchar[-1])
        endif
        let idx2 += 1
    endwhile
endfunction
"}}}}
"{{{{{2  IsStatus() 显示当前仓在什么状态，modified added commited
function! IsStatus()
    let isstatus = "tangxinlou"
    let isstatus = system("git status .")
    if "Changes to be committed:" ==# matchstr(isstatus,"Changes to be committed:")
        let  isstatus = "is added"
    elseif "no changes added to commit" ==# matchstr(isstatus ,"no changes added to commit")
        let  isstatus = "is modified"
    elseif "nothing added to commit but untracked files present" ==# matchstr(isstatus ,"nothing added to commit but untracked files present")
        let  isstatus = "is added file"
    elseif "nothing to commit, working tree clean" ==# matchstr(isstatus ,"nothing to commit, working tree clean")
        let  isstatus = "is no changes"
    elseif "not a git repository" ==# matchstr(isstatus ,"not a git repository")
        let  isstatus = "not a respository"
    else
        return
    endif
    return  isstatus
endfunction
"}}}}
"{{{{{2  GitCommit()                    git comit 之后可以在这个函数添加push的指令
function! GitCommit()
    let iscommit = "tangxinlou"
    call GitAdd()
    "silent call system("git commit")
    silent !git commit
    "silent let iscommit =  system("git push origin master")
    call append(line('.'),iscommit)
endfunction
"}}}}
"{{{{{2  GitBranch()  返回当前分支列表
function! GitBranch()
    let GitBranch = "tangxinlou"
    let Prebranch = []
    let Prebranch1 = []
    let Prebranch2 = []
    let idx1 = 0
    let idx2 = 0
    "echom GitBranch
    let isstatus = IsStatus()
    if  "not a respository" ==#  isstatus
        echom isstatus
        return
    endif
    let GitBranch  = system("git branch -a  \| grep -v -Esi \"^$\"")
    "call setline(line('.'),GitBranch)
    let Prebranch = split(GitBranch,"\x00 ")
    "call append(line('.'),Prebranch)
    "call cursor(line('.') + len(Prebranch),1)
    while idx1 < len(Prebranch)
        if ("HEAD" ==# matchstr(Prebranch[idx1],"HEAD"))
            "Prebranch->remove(idx1)
            call remove(Prebranch,idx1,idx1 + 2)
            let idx1 = 0
        endif
        let idx1 += 1
    endwhile
    let idx1 = 0
    while idx1 < len(Prebranch)
        let Prebranch2 = split(Prebranch[idx1],"/")
        let idx2 = len(Prebranch2)
        if idx2 > 1
            let  Prebranch[idx1]  = Prebranch2[2]
        endif
        let idx1 += 1
    endwhile

    return Prebranch
endfunction
"}}}}}
"{{{2  GitCheckout()                    checkout 切换分支 既可以从列表选一个分支，也可以切换到a分支
function! GitCheckout(...)
    let GitCheckout = "tangxinlou"
    let ischeckout1 = "tangxinlou"
    let Precheckout = []
    let isstatus = IsStatus()
    let len = 0
    let idx1 = 0
    if  "not a respository" ==#  isstatus
        echom isstatus
        return
    endif
    let Precheckout =  GitBranch()
    call append(line('.'),Precheckout)
    call cursor(line('.') + len(Precheckout),1)
    if a:0 > 1
        return
    elseif a:0 ==# 0
        let GitCheckout = input("请输入分支\n")
        let len = strlen(GitCheckout)
        if len <= 2
            echom Precheckout[GitCheckout]
            if  IsBranch() !=#  Precheckout[GitCheckout]
                silent let ischeckout1  = system("git checkout " . Precheckout[GitCheckout])
                call append(line('.'),ischeckout1)
                call cursor(line('.') + 1,1)
            endif
            return
        else
            for i in Precheckout
                if  IsBranch() !=#  GitCheckout
                    if GitCheckout ==# i
                        silent let ischeckout1  = system("git checkout " . GitCheckout)
                        call append(line('.'),ischeckout1)
                        call cursor(line('.') + 1,1)
                        return
                    endif
                endif
            endfor
        endif
        echom "分支不存在"
    endif
    for i in Precheckout
        if i ==# a:1
            if  IsBranch() !=# a:1
                silent let ischeckout1  = system("git checkout " . a:1)
                call append(line('.'),ischeckout1)
                call cursor(line('.') + 1,1)
                return
            endif
        endif
    endfor
    echom "分支不存在"
endfunction
"}}}
"{{{{{2  GitPatch()                     可以 批量切换2.txt 文件中的分支，然后分别打patch commit
function! GitPatch()
    let ispatch = "tangxinlou"
    let Prepatch = []
    let Prepatch1 = []
    let idx1 = 0
    let idx2 = 0
    silent let Prepatch = readfile("/d/work/2.txt")
    while idx1 < len(Prepatch)
        silent let Prepatch[idx1] =  join(split(Prepatch[idx1]),"\x00")
        silent let Prepatch1 = split(Prepatch[idx1],";")
        if  IsBranch() ==#  Prepatch1[1]
            silent let ispatch =  system("patch -p1 < /d/work/4.txt ")
            call GitCommit()
            let idx1 +=1
        else
            silent    call GitCheckout(Prepatch1[1])
            silent let ispatch =  system("patch -p1 < /d/work/4.txt ")
            call GitCommit()
            let idx1 +=1
        endif
    endwhile
endfunction
"}}}}}
"{{{{{2  IsBranch(...) 显示当前分支名
function! IsBranch(...)
    let IsBranch = "tangxinlou"
    let IsBranch1 = "tangxinlou"
    let CurBranch = []
    if  a:0 ==# 1
        let IsBranch1 = a:1
        let IsBranch = system("cd " . IsBranch1 . "; git status . \| grep -Esi \"On branch\"")
    else
        let IsBranch = system("git status . \| grep -Esi \"On branch\"")
    endif
    let CurBranch = split(IsBranch)
    if "On branch" ==# matchstr(IsBranch,"On branch")
        "echom CurBranch[2]
    else
        return
    endif
    return  CurBranch[2]
endfunction
"}}}}}
"{{{{{2 function! CherryPick(...)    单笔cherry pick
nnoremap <leader>cher :call CherryPick()<cr>
function! CherryPick(...)
    let path = "."
    let branchstr = "tag_PD2283F_EX_14.0.PD2283F_EX_SC_14.0_14.1.4.1_system"
    let commitid = "b2ad53907c36b970381f43c878ccc417031c1544"
    if a:0 != 0
        let path = a:1
        let branchstr = a:2
        let commitid = a:3
    else
        let branchstr = input("分支")
        let commitid = input("commit")
    endif
    call execute(":lcd " . path)

    call system("git fetch")
    call system("git checkout " . branchstr)
    call system("git pull --rebase")
    call system("git cherry-pick " . commitid)
    call GitAdd()
    "if input("是否停止yes or no") ==# "yes"
    "    return
    "endif
    silent !git commit
    let tempchar = "git push origin HEAD:refs/for/"  .  branchstr
    call system(tempchar)
    echom "success"
    if path != "."
        call execute(":lcd ..")
    endif
endfunction
"}}}}
"{{{{{2 function! CycleCherry()                    循环cherry pick  逗号cher调用
nnoremap <leader>cher :call CycleCherry()<cr>
function! CycleCherry()
    let flag = input("合tag1，合修改2")
    let cherrylist = ""
    let idx1 = 0
    let templist = []
    if flag ==# 1
        let cherrylist = ParsingCherry()
        let idx1 = 0
        let templist = []
        while idx1 < len(cherrylist)
            let templist = split(cherrylist[idx1],"█")
            call CherryPick(templist[0],templist[1],templist[2])
            let idx1 += 1
        endwhile
    else
        let templist = reverse(getline(1,'$'))
        echom string(templist)
        let idx1 = 0
        while idx1 < len(templist)
            call RepeatedlyCherry(templist[idx1])
            let idx1 += 1
        endwhile
    endif
endfunction
"}}}}
"{{{{{2 RepeatedlyCherry()                    cherry pick 多笔
function! RepeatedlyCherry(...)
    let commitid = a:1
    let resultchar = ""
    let resultchar = system("git cherry-pick " . commitid)
    call GitAdd()
endfunction
"}}}}
"{{{{{2  ParsingCherry()                    解析cherry pick信息
function! ParsingCherry()
    let lastnumber = line('$')
    let totallen = 18
    let childlen = 11
    if input("长度是否修改 yes or no") ==# "yes"
        let childlen = input("仓库的行")
        let totallen = input("一个项总行数")
    endif
    let index = lastnumber / totallen
    let resultlist = []
    let idx1 = 0
    let tempchar = ""
    while idx1 < index
        let tempchar = ""
        let tempchar = split(getline((idx1 * totallen) + childlen ),'/')[1]
        let tempchar = tempchar ."█" . getline((idx1 * totallen) + childlen + 3 )
        let tempchar = tempchar ."█" . getline((idx1 * totallen) + childlen + 4 )
        let resultlist = add(resultlist,tempchar)
        let idx1 += 1
    endwhile
    echo resultlist
    return resultlist
endfunction
"}}}}
"{{{{{2  IsVersion(...)  列出某个manifest 常用仓的分支和commit
function! IsVersion(...)
    let isversion = "tangxinlou"
    let string = ""
    let list1 = []
    let idx1 = 0
    let idx2 = 0
    let listlen = 0
    let projectlist = g:projectlist
    let lenproject = len(projectlist)
    let branchandcommit = ["1"]
    let branchandcommit =  repeat(branchandcommit,lenproject * 2 + 2)
    let listlen = len(branchandcommit)
    let curversion = []
    let curversion1 = []
    let curversion2 = []
    let curversion3 = []
    if a:0 ==# 0
        let curversion = IsCfgfile(input("请输入需要打开的项目"))
        let curversion2 = copy(curversion)
        call AddNumber(curversion2)
        let isversion = input("请输入xml")
        let curversion1 = readfile(curversion[isversion])
        let string = curversion[isversion]
    else
        let curversion1 = readfile(a:1)
        let string = a:1
    endif
    while  idx1 < len(curversion1)
        let curversion2 = split(curversion1[idx1],"\"")
        if  len(curversion2) > 8
            let idx2 = 0
            while idx2 <  lenproject
                if projectlist[idx2] ==# matchstr(curversion2[1],projectlist[idx2])
                    let branchandcommit[idx2 * 2] =  curversion2[5]
                    let branchandcommit[idx2 * 2 + 1] =  curversion2[7]
                    if idx2 ==# 2
                        if  "ROM13" ==# matchstr(curversion2[7],"ROM13")
                            let branchandcommit[listlen -1] = "ROM13"
                        elseif  "ROM12" ==# matchstr(curversion2[7],"ROM12")
                            let branchandcommit[listlen -1] = "ROM12"
                        else
                            let branchandcommit[listlen -1] = "null"
                        endif
                        let curversion3 = split(curversion2[1],"/")
                        let branchandcommit[listlen -2] = curversion3[0]
                    elseif idx2 ==# 11
                        if  "ROM13" ==# matchstr(curversion2[7],"ROM13")
                            let branchandcommit[listlen -1] = "ROM13"
                        elseif  "ROM12" ==# matchstr(curversion2[7],"ROM12")
                            let branchandcommit[listlen -1] = "ROM12"
                        else
                            let branchandcommit[listlen -1] = "null"
                        endif
                        let curversion3 = split(curversion2[1],"/")
                        let branchandcommit[listlen -2] = curversion3[0]
                    endif
                endif
                let idx2 += 1
            endwhile
        endif
        let idx1 += 1
    endwhile
    let list1 =  split(string,"/")
    let string = list1[len(list1) - 1]
    let branchandcommit = add(branchandcommit ,string)
    "call append(line('.'),curversion1)
    return  branchandcommit
endfunction
"}}}}}
"{{{{{2 function! IsUpdate()                     把当前目录下的几个仓切换到xx manifest 版本状态,且把之前的修改保存起来
function! IsUpdate()
    let isupdate = "tangxinlou"
    let isupdate1 = "tangxinlou"
    let isupdate2 = "tangxinlou"
    let isupdate3 = "tangxinlou"
    let isupdate4 = "tangxinlou"
    let isupdate5 = "tangxinlou"
    let isupdate6 = "tangxinlou"
    let idx1 = 0
    let idx2 = 0
    let projectlist = g:projectlist
    let lenproject = len(projectlist)
    let curpath = []
    let curpath1 = []
    let curpath2 = []
    let curxmlfile = []
    let isupdate = system("ls -F \| grep -Esi \"/$\"")
    let curpath = split(join(split(isupdate),"\x00"),"/")
    "echo curpath

    let idx1 = 0
    let curpath1 = copy(curpath)
    if len(curpath1) > 15
        echo "路径错误"
        return
    endif
    if a:0 ==# 0
        call AddNumber(curpath1)
        call cursor(line('.') + len(curpath1) + 1,1)
        let curxmlfile = IsVersion()
        while 1
            echo "当前xml是" . curxmlfile[len(curxmlfile) - 3]
            if "yes" ==# input("是否重新选择")
                let curxmlfile = IsVersion()

            else
                if "yes" ==# input("是否打开")
                    break
                endif
            endif
        endwhile
        execute "normal! Go\<esc>"
        call append(line('.'),curxmlfile)
        redraw
        let isupdate1 = input("请输入需要重置的路径编号，或者全部更新选a")
    else
        let curxmlfile = a:1
        let isupdate1 = 'a'
    endif
    if isupdate1 ==# 'a'
        while idx1 < len(curpath)
            let curpath2 = split(curpath[idx1],"/")
            let isupdate5 = IsBranch(curpath2[len(curpath2) - 1])
            "echo curpath2[len(curpath2) - 1]
            echo isupdate5
            let isupdate4 =  join([join(split(strftime("%Y-%m-%d %H:%M")),"\x00"),isupdate5,".patch"],"\x00")
            let idx2 = 0
            while idx2 <  lenproject
                if projectlist[idx2] ==# matchstr(curpath[idx1],projectlist[idx2])
                    silent let isupdate3  = join(split(join(["cd"," ",curpath[idx1]])))
                    echo curpath[idx1]
                    silent let isupdate2  = system(isupdate3)
                    if "No such file or directory" !=# matchstr(isupdate2, "No such file or directory")
                        let isupdate2 =   system(isupdate3 . " ; git diff  -U9 > " . isupdate4 . "  ; git checkout . ")
                        "echo isupdate2
                        let isupdate2 =   system(isupdate3 . " ; git fetch ; git checkout " . curxmlfile[idx2 * 2 + 1])
                        "echo isupdate2
                        let isupdate2 =   system(isupdate3 . "; git pull --rebase ; git reset --hard  " . curxmlfile[idx2 * 2])
                        "echo isupdate2
                        let isupdate6 = join([join(split(curpath2[len(curpath2) - 1],"\x00")),'/',isupdate4],"\x00")
                        echo "tangxinlou1"   curxmlfile[idx2 * 2 + 1] curxmlfile[idx2 * 2]
                        echo  getfsize(isupdate6)
                        if  getfsize(isupdate6) ==# 0
                            echo "tangxinlou2"
                            call delete(isupdate6)
                        endif
                        echo isupdate6
                        echo "tangxinlou3"
                    endif
                endif
                let idx2 += 1
            endwhile
            let idx1 += 1
        endwhile
    else
        silent let isupdate  = join(split(join(["cd"," ",curpath[isupdate1]])))
        silent let isupdate2  = system(isupdate)
        if "No such file or directory" !=# matchstr(isupdate2, "No such file or directory")
            if "vendor_vivo_bluetoothInteropConf" ==# matchstr(curpath[isupdate1],"vendor_vivo_bluetoothInteropConf")
                let isupdate3 = 0
            elseif  "android_packages_apps_Bluetooth" ==# matchstr(curpath[isupdate1],"android_packages_apps_Bluetooth")
                let isupdate3 = 2
            elseif   "android_system_bt" ==# matchstr(curpath[isupdate1],"android_system_bt")
                let isupdate3 = 4
            elseif   "android_frameworks_base" ==# matchstr(curpath[isupdate1],"android_frameworks_base")
                let isupdate3 = 6
            elseif   "android_vendor_mediatek_proprietary_hardware_connectivity_firmware_rom_patch" ==# matchstr(curpath[isupdate1],"android_vendor_mediatek_proprietary_hardware_connectivity_firmware_rom_patch")
                let isupdate3 = 8
            else
            endif

            let isupdate2 =  system(isupdate . " ; git diff  -U9 > " . isupdate4 . " ; git checkout . ")
            "echo isupdate2
            let isupdate2 =   system(isupdate . " ; git fetch ; git pull --rebase ; git checkout " . curxmlfile[isupdate3 + 1])
            "echo isupdate2
            let isupdate2 =   system(isupdate  . " ; git reset --hard  " . curxmlfile[isupdate3])
            echo isupdate2
        endif
    endif
    call system("touch 1.txt")
    let idx1 = 0
    while idx1 < len(projectlist)
        if curxmlfile[idx1 * 2]  != "1"
            let  curxmlfile[idx1 * 2] =  curxmlfile[idx1 * 2] . " " .  projectlist[idx1]
        endif
        let idx1 += 1
    endwhile
    silent call writefile(curxmlfile,"1.txt")
endfunction
"}}}}}
"{{{{{2 function! FunList()                      目前实现的函数                普通模式<F4>调用
nnoremap <F4> :call FunList()<cr>
function! FunList()
    let funname = "tangxinlou"
    let idx1 = 0
    let curfunname = []
    let curfunname3 = []
    let curfunname1 = []
    let curfunname = split(system("grep -Esin \"^\\\"{{.*function!\" ~/.vimrc"),"\n")
    "let curfunname = split(system("grep -Esin \"^function!\" ~/.vimrc"),"\n")
    let curfunname1 = copy(curfunname)
    call AddNumber(curfunname)
    let char = 0
    let char1 = ""
    while 1  "char =~ '^\d\+$'
        echo "(InteractiveWindow) TYPE: h,j,k,l to resize or a for auto resize"
        let char1 = Getchar()
        let char = str2nr(char1)
        if char ==# 0 && char1 != "0"
            let char = char1
            if char  ==# 'q'
                return
            endif
            if char  ==# 'j'
                execute "normal! \<c-f>"
            endif
            if char  ==# 'k'
                execute "normal! \<c-u>"
            endif
        else
            echo type(char)
            echo len(curfunname)
            echo (idx1 < len(curfunname))
            if char  <  len(curfunname)
                echo (char < len(curfunname))
                echo "tangxinlou"
                let char = split(split(split(curfunname[char],"!")[1],"(")[0],"\x00")[0]
                call call(char,curfunname3)
            else
                break
            endif
        endif
        redraw
    endwhile
endfunction
"}}}}}
"{{{{{2 function! IsAddDiff()                    动态添加需要比较的文件
"https://github.com/handy1989/vim/blob/master/diffdir
function! IsAddDiff()
    let isadddiff = "tangxinlou"
    let isadddiff1 = "tangxinlou"
    let tempchar = ""
    let isdiffpatch = Homedir("txl/1.txt",1)
    let diffshfile = Homedir("txl/diffdir.sh",1)
    let idx1 = 0
    let idx2 = 0
    let curadddiff = []
    let curadddiff1 = []
    let curadddiff2 = []
    let isadddiff = system("pwd")
    let isadddiff = join(split(isadddiff,"\x00"))
    let curadddiff = readfile(isdiffpatch)
    let curadddiff1 = copy(curadddiff)
    call AddNumber1(curadddiff1)
    let curadddiff2 = split(curadddiff[len(curadddiff) - 1],"")
    if 2 ==# len(curadddiff2)
        let tempchar = input("是否选择文件比较no 选择左边文件，yes选择文件")
        if "no" ==# tempchar
            let curadddiff = add(curadddiff,isadddiff)
            silent call writefile(curadddiff,isdiffpatch)
            echo "选择左边文件\n"
        elseif  "yes" ==# tempchar
            let curadddiff = reverse(curadddiff)
            let curadddiff1 = copy(curadddiff)
            call AddNumber1(curadddiff1)
            let idx2 = input("请输入编号")
            let curadddiff2 = split(curadddiff[idx2],"")
            "echo curadddiff2
            let isadddiff1 = join([diffshfile, " " , curadddiff2[0] ," ", curadddiff2[1]])
            execute "!" .  isadddiff1
        endif
    elseif 1 ==# len(curadddiff2)
        if "yes" ==# input("是否选择右边文件")
            let curadddiff[len(curadddiff) - 1] = join([curadddiff[len(curadddiff) - 1] ," " ,isadddiff])
            silent call writefile(curadddiff,isdiffpatch)
            echo "选择右边文件\n"
        endif
    else
        let curadddiff = add(curadddiff,isadddiff)
        silent call writefile(curadddiff,isdiffpatch)
        echo "第一次比较，文件是空的"
        return

    endif
    let curadddiff1 = copy(curadddiff)
    call AddNumber1(curadddiff1)
    redraw
endfunction

"}}}}}
"{{{{{2  IsRepositoryName(...) 返回仓库名 目前没有使用
function! IsRepositoryName(...)
    let repositoryname = "tangxinlou"
    let repositorynumber = 0
    let repositoryname1 = "tangxinlou"
    let CurBranch = []
    if  a:0 ==# 1
        let repositorynumber = a:1
        let repositorynumber = repositorynumber / 2
        if  repositorynumber ==# 0
            return  "vendor_vivo_bluetoothInteropConf"
        elseif  repositorynumber ==# 1
            return   "android_packages_apps_Bluetooth"
        elseif  repositorynumber ==# 2
            return "android_system_bt"
        elseif  repositorynumber ==# 3
            return "android_frameworks_base"
        elseif  repositorynumber ==# 4
            return "android_vendor_mediatek_proprietary_hardware_connectivity_firmware_rom_patch"
        else
        endif
    else
    endif
endfunction
"}}}}}
"{{{{{2 function! GitBlame()                     当前文件gitblame              普通模式下 <F7> 调用
nnoremap <F7> :call GitBlame()<cr>
function! GitBlame()
    let isblame = "tangxinlou"
    let isblame1 = []
    let line = 0
    let line = line('.')
    echo line
    let isblame = @%
    echo isblame
    execute "normal! ggvG$d0"
    let isblame1 = system("git blame -l  " . isblame)
    let isblame1 = split(isblame1,"\n")
    call append(line('.'),isblame1)
    execute "normal! dd"
    call cursor(line,1)
endfunction
"}}}}
"{{{{{2 function! CompareVersion()               比较两个版本
function! CompareVersion()
    let leftversion = []
    let rightversion = []
    let projectlist = g:projectlist
    let lenproject = len(projectlist)
    let cmplist = []
    let isupdate = system("ls -F \| grep -Esi \"/$\"")
    let curpath = split(join(split(isupdate)),"/")
    let curpath1 = copy(curpath)
    let versiondiff = []
    let versionstring = ""
    let relativepath = Homedir("txl/version",1)
    if len(curpath1) > 15
        echo "路径错误"
        return
    endif
    call AddNumber(curpath1)
    execute "normal! Go\<esc>"
    echo "输入小版本"
    let leftversion  = IsVersion()
    echo "输入大版本"
    let rightversion = IsVersion()
    let idx1 = 0
    let idx2 = 0
    if rightversion[len(rightversion) - 3] !=  leftversion[len(leftversion) - 3]
        echo  rightversion[len(rightversion) - 3] " anroid版本不等于 "  leftversion[len(leftversion) - 3]
        return
    endif
    if "yes" ==# input("是否指定version")
        let curxmlfile =  rightversion "大
        let curxmlfile1 =  leftversion "小
        echo  curxmlfile1[len(curxmlfile1) - 1]  . " 小 " .  curxmlfile[len(curxmlfile) - 1] . " 大"
    else
        let cmplist = add(cmplist ,rightversion[len(rightversion) - 1])
        let cmplist = add(cmplist ,leftversion[len(leftversion) - 1])
        silent call writefile(cmplist,relativepath )
        let cmplist =  split(system("sort -V " . relativepath),"\n")
        echo cmplist
        if  cmplist[1] ==#  rightversion[len(rightversion) - 1]
            let curxmlfile =  rightversion "大
            let curxmlfile1 =  leftversion "小
        else
            let curxmlfile1 =  rightversion "小
            let curxmlfile =  leftversion "大
        endif
    endif
    "比较两个版本号大小

    let isupdate1 = input("请输入需要重置的路径编号，或者全部更新选a")
    if isupdate1 ==# 'a'
        while idx1 < len(curpath)
            let curpath2 = split(curpath[idx1],"/")
            let isupdate5 = IsBranch(curpath2[len(curpath2) - 1])
            let isupdate4 =  join([join(split(strftime("%Y-%m-%d %H:%M")),"\x00"),isupdate5,".patch"],"\x00")
            let idx2 = 0
            while idx2 <  lenproject
                if projectlist[idx2] ==# matchstr(curpath[idx1],projectlist[idx2])
                    silent let isupdate3  = join(split(join(["cd"," ",curpath[idx1]])))
                    silent let isupdate2  = system(isupdate3)
                    if "No such file or directory" !=# matchstr(isupdate2, "No such file or directory") &&  curxmlfile[idx2 * 2  + 1] != "1" &&  curxmlfile[idx2 * 2  + 1] != "1"
                        let versiondiff = add(versiondiff ,join(['"','{','{','{','{',curpath[idx1]],"\x00"))
                        let isupdate2 =   system(isupdate3 . " ; git diff  -U9 > " . isupdate4 . "  ; git checkout . ")
                        let isupdate2 =   system(isupdate3 . " ; git fetch ; git checkout " . curxmlfile[idx2 * 2  + 1])
                        let isupdate2 =   system(isupdate3 . "; git pull --rebase ; git reset --hard  " . curxmlfile[idx2 * 2])
                        let isupdate6 = join([join(split(curpath2[len(curpath2) - 1],"\x00")),'/',isupdate4],"\x00")
                        echo  getfsize(isupdate6)
                        if  getfsize(isupdate6) ==# 0
                            call delete(isupdate6)
                        endif
                        "system("git log    --pretty=format:\"\%cr \%cn \%h \%s\"  1e8dda8d1caa5d3d8d72ab8fce7948ade13d9b61..9ab432d70e6ca30d4795d8177a9d56efe719117c")
                        if curxmlfile1[idx2 * 2 + 1] ==# curxmlfile[idx2 * 2 + 1]
                            echo "tangxinlou1"
                            let versionstring = system(isupdate3 . "; git log    --pretty=format:\"\%cr \%cn \%h \%s\" " . curxmlfile1[idx2 * 2] . ".." . curxmlfile[idx2 * 2])
                            if  versionstring ==# ""
                                let isupdate2 =   system(isupdate3 . " ; git diff -U9  > " . isupdate4 . "  ; git checkout . ")
                                let isupdate2 =   system(isupdate3 . " ; git fetch ; git checkout " . curxmlfile1[idx2 * 2  + 1])
                                let isupdate2 =   system(isupdate3 . "; git pull --rebase ; git reset --hard  " . curxmlfile1[idx2 * 2])
                                let versionstring = system(isupdate3 . "; git log    --pretty=format:\"\%cr \%cn \%h \%s\" " . curxmlfile[idx2 * 2] . ".." . curxmlfile1[idx2 * 2])
                                if  versionstring ==# ""
                                    let versionstring = "仓库报错 或者commit 相同" .  projectlist[idx2]
                                else
                                    let versiondiff = add(versiondiff ,curxmlfile1[len(curxmlfile1) - 1] . " 大于 " . curxmlfile[len(curxmlfile) - 1])
                                endif
                            else
                                let versiondiff = add(versiondiff ,curxmlfile[len(curxmlfile) - 1] . " 大于 " . curxmlfile1[len(curxmlfile1) - 1])
                            endif
                            let versiondiff = add(versiondiff ,"<<<<<<<<<代码仓开始<<<<<<<<")
                            let versionstring = split(versionstring,"\n")
                            let versionstring = add(versionstring,join(['"','}','}','}','}',">>>>>>>>>>>代码仓修改结尾>>>>>>>>"],"\x00"))
                            let versiondiff = extend(versiondiff ,versionstring)
                            echo curxmlfile[idx2 * 2]   curxmlfile1[idx2 * 2]  "分支相同" projectlist[idx2]
                        else
                            echo "tangxinlou2"
                            let versiondiff = add(versiondiff ,"<<<<<<<<<代码仓开始<<<<<<<<")
                            "let versionstring = CompareversionBranch(isupdate3,curxmlfile,curxmlfile1,idx2 * 2)
                            let versionstring =  CompareTwoBranchChanges(curpath[idx1],curxmlfile,curxmlfile1,idx2 * 2,"tangxinlouosc")
                            let versionstring = add(versionstring,join(['"','}','}','}','}',">>>>>>>>>>>代码仓修改结尾>>>>>>>>"],"\x00"))
                            let versiondiff = extend(versiondiff ,versionstring)
                        endif
                    endif
                endif
                let idx2 += 1
            endwhile
            let idx1 += 1
        endwhile
        let idx1 = 0
        while idx1 < len(projectlist)
            if leftversion[idx1 * 2]  != "1"
                let  leftversion[idx1 * 2] =  leftversion[idx1 * 2] . "    " .  projectlist[idx1]
            endif
            let idx1 += 1
        endwhile
        let versiondiff = extend(versiondiff ,leftversion)
        let idx1 = 0
        while idx1 < len(projectlist)
            if rightversion[idx1 * 2]  != "1"
                let  rightversion[idx1 * 2] =  rightversion[idx1 * 2] . "    " .  projectlist[idx1]
            endif
            let idx1 += 1
        endwhile
        let versiondiff = extend(versiondiff ,rightversion)
        silent call writefile(versiondiff,"version.vim")
    endif
endfunction
"}}}}
"{{{{{2  CompareversionBranch(...) 比较两个分支
function! CompareversionBranch(...)
    let version1 = []
    let version2 = []
    let isupdate2 = ""
    let isupdate3 = a:1
    let curxmlfile = a:2
    let curxmlfile1 = a:3
    let idx2 = a:4
    let idx1 = 0
    let length = len(curxmlfile1) -1
    "let isupdate2 =   system(" git fetch ; git checkout tag_PD2069_ROM13_5.0.0")
    "let isupdate2 =   system(" git pull --rebase ; git reset --hard  1f81f7d4231609e4e0a38e061fde0fbb97862065")
    let isupdate2 =   system(isupdate3 . " ; git fetch ; git checkout " . curxmlfile[idx2 + 1])
    let isupdate2 =   system(isupdate3 . "; git pull --rebase ; git reset --hard  " . curxmlfile[idx2])
    let version1 = system(isupdate3 . " ; git log    --pretty=format:\"\%cr \%cn \%h \%s\" ")
    "let version1 = system(isupdate3 . " ; git log    --pretty=format:\"\%s\" ") "去重使用这个
    "let isupdate2 =   system(" git fetch ; git checkout tag_PD2069_ROM13_5.0.0")
    "let isupdate2 =   system(" git pull --rebase ; git reset --hard  87acb2a52f65fd97318943152abac894f1c2fa75")
    let isupdate2 =   system(isupdate3 . " ; git fetch ; git checkout " . curxmlfile1[idx2 + 1])
    let isupdate2 =   system(isupdate3 . "; git pull --rebase ; git reset --hard  " . curxmlfile1[idx2])
    let version2 = system(isupdate3 . " ; git log    --pretty=format:\"\%cr \%cn \%h \%s\" ")
    "let version2 = system(isupdate3 . " ; git log    --pretty=format:\"\%s\" ") "去重使用这个

    echo  curxmlfile[idx2]  curxmlfile1[idx2]  "分支不同 " isupdate3
    let version1 = split(version1,"\n")
    let version1 = reverse(version1)
    let version2 = split(version2,"\n")
    let version2 = reverse(version2)
    echo  len(version1)  len(version2)
    "echo version1
    "echo version2
    echo  curxmlfile[idx2]
    echo curxmlfile1[idx2]
    if len(version1) > len(version2)
        echo "1"
        while idx1 < len(version2)
            if version1[idx1] ==# version2[idx1]
                call remove(version1,idx1)
                call remove(version2,idx1)
                let idx1 = 0
            else
                let idx1 += 1
            endif
        endwhile
        let version1 = reverse(version1)
        let version2 = reverse(version2)
        if len(version2) ==# 0
            if  curxmlfile1[idx2] ==# curxmlfile[idx2]
                let version1 = insert(version1,"<<<<<<<<<两个版本相同<<<<<<<<")
            else
                let version1 = insert(version1,"<<<<<<<<<" . curxmlfile[length] . " 比 " . curxmlfile1[length] . "多如下提交<<<<<<<<")
            endif
            let version1 = add(version1,">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>")
            return version1
        else
            let version1 = insert(version1,"两个版本分支各不相同，分别有如下提交不同")
            let version1 = insert(version1,"<<<<<<<<<<第一个版本有这些提交<<<<<<<<<<")
            let version1 = insert(version1,curxmlfile[length])
            let version1 = add(version1,">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>")
            let version2 = insert(version2,"<<<<<<<<<<第二个版本有这些提交<<<<<<<<<<")
            let version2 = insert(version2,curxmlfile1[length])
            let version2 = insert(version2,">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>")
            let version1 = extend(version1 ,version2)
            return version1
        endif
    else
        echo "2"
        while idx1 < len(version1)
            if version1[idx1] ==# version2[idx1]
                call remove(version1,idx1)
                call remove(version2,idx1)
                let idx1 = 0
            else
                let idx1 += 1
            endif
        endwhile
        let version1 = reverse(version1)
        let version2 = reverse(version2)
        if len(version1) ==# 0
            if  curxmlfile1[idx2] ==# curxmlfile[idx2]
                let version2 = insert(version2,"<<<<<<<<<两个版本commit相同<<<<<<<<")
            else
                let version2 = insert(version2,"<<<<<<<<<" . curxmlfile1[length] . " 比 " . curxmlfile[length] . "多如下提交<<<<<<<<")
            endif
            let version2 = insert(version2,curxmlfile1[length])
            let version2 = add(version2,">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>")
            return version2
        else
            let version1 = insert(version1,"两个版本分支各不相同，分别有如下提交不同")
            let version1 = insert(version1,"<<<<<<<<<<第一个版本有这些提交<<<<<<<<<<")
            let version1 = insert(version1,curxmlfile[length])
            let version1 = add(version1,">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>")
            let version2 = insert(version2,"<<<<<<<<<<第二个版本有这些提交<<<<<<<<<<")
            let version2 = insert(version2,curxmlfile1[length])
            let version2 = add(version2,">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>")
            let version1 = extend(version1 ,version2)
            return version1
        endif
    endif
endfunction

"}}}}
"{{{{{2  GetMainLine() 获取主线  当前未使用
function! GetMainLine()
    let isblame = "tangxinlou"
    let isblame1 = []
    let line = 0
    let line = line('.')
    echo line
    let isblame = @%
    echo isblame
    execute "normal! ggvG$d0"
    let isblame1 = system("git blame -l" . isblame)
    let isblame1 = split(isblame1,"\n")
    call append(line('.'),isblame1)
    execute "normal! dd"
    call cursor(line,1)
endfunction
"}}}}
"{{{{{2 function! DynamicDiff()                  DynamicDiff 动态选择内容比较  可视模式下逗号 + d 调用
vnoremap <leader>d :<c-u>call <SID>DynamicDiff(visualmode())<cr>
function! s:DynamicDiff(type)
    let saved_unnamed_register = @@
    if a:type ==# 'v'
        normal! `<v`>y
    elseif a:type ==# 'char'
        normal! `[v`]y
    else
        return
    endif
    let tempchar = @@
    let templist = split(tempchar,"\n")

    let relativepath = Homedir("txl/left",1)
    let relativepath1 = Homedir("txl/right",1)
    let relativepath2 = Homedir("txl/1.patch",1)
    let templeft = readfile(relativepath)
    let tempright = readfile(relativepath1)

    if len(templeft) != 0 &&  len(tempright) != 0
        if "yes" ==# input("是否比较")
            call system("diff -Naur " .  relativepath . " " .  relativepath1 . " > " . relativepath2)
            execute "normal! :tabnew " . relativepath1 . "\<cr>"
            execute "normal! :vsplit " . relativepath . "\<cr>"
            if "yes" ==# input("是否清空两个文件，yes 是清空")
                silent call writefile([],relativepath)
                silent call writefile([],relativepath1)
            endif
        else
            echo "两个文件有内容把复制的内容保存在左边"
            silent call writefile(templist,relativepath)
            silent call writefile([],relativepath1)
        endif
    elseif len(templeft) ==# 0 &&  len(tempright) ==# 0

        echo "两个文件都是空的，把复制的内容保存在左边"
        silent call writefile(templist,relativepath)
    elseif len(templeft) != 0 &&  len(tempright) ==# 0

        echo "左边内容已存在，把复制的内容保存在右边"
        silent call writefile(templist,relativepath1)
    endif
    call input("是否继续")
    let @@ = saved_unnamed_register
endfunction
"}}}}
"{{{{{2  FindMergedVersion()            寻找某笔提交什么版本合入
function! FindMergedVersion()
    "{{{{{3 变量定义
    let function = "2183"
    let isexport = ""
    let isdaly = ""
    let isneeddownload = ""
    let androidversion = ""
    let manifestXmlList2 = []
    let manifestXmlList = []
    let isupdate = system("ls -F \| grep -Esi \"/$\"")
    let curpath = split(join(split(isupdate),"\x00"),"/")
    let index = 0
    let commitid = 0
    let curxmlfile = []
    let index1 = 0
    let searchpath = ""
    let runofresults = ""
    let idx = 0
    let projectlist = g:projectlist
    let index2  = 0
    let branchlist = []
    let index3  = 0
    let tempint = 0
    let headnode =  0
    let endnode =  0
    let tempnode = 0
    "}}}}
    "输入必要的选项
    let curpath1 = copy(curpath)
    if len(curpath1) > 15
        echo "路径错误"
        return
    endif
    call AddNumber(curpath1)
    let index = input("请选择所在的仓")
    let isneeddownload = input("是否需要下载yes or no")
    let function = input("请输入项目")
    let isexport = input("是否是外销yes or no")
    let issystem = input("是否是system版本 yes or no")
    let androidversion  = input("输入安卓版本")
    let commitid = input("请输入commitid")
    let idx = index(projectlist,curpath[index])
    echo idx

    "wget 获取所有的manifest
    if isneeddownload == "yes"
        call DownloadManifest(function,isexport,issystem)
    endif

    "根据安卓版本,仓库刷选manifest xml
    if androidversion == "12"
        call system("find ~/manifests -iname '*modem*' | xargs rm -rf")
        call system("find ~/manifests -iname '*vendor*' | xargs rm -rf")
    elseif  androidversion == "13"
        call system("find ~/manifests -iname '*modem*' | xargs rm -rf")
        if "android_vendor_mediatek_proprietary_hardware_connectivity_firmware_rom_patch" == matchstr(curpath[index],"android_vendor_mediatek_proprietary_hardware_connectivity_firmware_rom_patch")
            call system("find ~/manifests -iname '*system*' | xargs rm -rf")
        else
            call system("find ~/manifests -iname '*vendor*' | xargs rm -rf")
        endif
    endif

    "获取当前commit id 在哪些分支上
    let branchlist = split(system("cd ". curpath[index] . " ;git branch -a --contains " . commitid),"\n")

    let index1 = 0
    while  index1 < len(branchlist)
        if "remotes" != matchstr(branchlist[index1],"remotes") || "temp" == matchstr(branchlist[index1],"temp")
            let branchlist[index1] = ""
            echo branchlist[index1]
        else
            let branchlist[index1] = split(branchlist[index1],"/")[2]
        endif
        let index1 += 1
    endwhile
    let branchlist =  split(join(branchlist),"\x00")


    "获取需要查询的manifest xml
    let manifestXmlList = IsCfgfile(function,"~/manifests",androidversion)

    "查询manifest xml 中是否包含commit
    let index1 = 0
    while index1 < len(manifestXmlList)
        let curxmlfile = IsVersion(manifestXmlList[index1])
        let index3  = 0
        let tempint = 0
        echo manifestXmlList[index1]
        while index3 < len(branchlist)
            if  branchlist[index3] ==  curxmlfile[idx * 2 + 1]
                let tempint = 1
                echo curxmlfile[idx * 2 + 1]
            else
            endif
            let index3 += 1
        endwhile

        if tempint == 1
            echo "tangxinlou4"
            silent let searchpath  = join(split(join(["cd"," ",curpath[index]])))
            silent let runofresults  = system(searchpath)
            if "No such file or directory" !=# matchstr(runofresults, "No such file or directory")
                let runofresults =   system(searchpath . " ; git checkout . ")
                let runofresults =   system(searchpath . " ; git fetch ; git checkout " . curxmlfile[idx * 2 + 1])
                let runofresults =   system(searchpath . "; git pull --rebase ; git reset --hard  " . curxmlfile[idx * 2])
                let runofresults =   system(searchpath . " ; git log    --pretty=format:\"\%H\" ")
                let runofresults = split(runofresults,"\n")
                let index2  =  index(runofresults,commitid)
                if  index2 == -1
                    let manifestXmlList[index1] = join([manifestXmlList[index1],"null"])
                else
                    echo "tangxinlou 3"
                    echo manifestXmlList[index1]
                endif
            endif
        else
            echo "tangxinlou5"
        endif

        let index1 +=1
    endwhile
    let manifestXmlList = copy(manifestXmlList)
    call AddNumber(manifestXmlList)
    call input("1255")
    "返回包含当前修改的版本
endfunction
"}}}}
"{{{{{2  DownloadManifest() 下载某个项目的所有的manifest
function! DownloadManifest(...) "1项目 2 是否外销 3 是否系统版本
    "wget -c -r -np -P ~/manifests http://manifests.vivo.xyz/gerrit/manifests/PD2183/SystemTest/
    "wget -c -r -np -P ~/manifests  --accept-regex PD2183.*12.*vivo.*mtk http://manifests.vivo.xyz/gerrit/manifests/PD2183/SystemTest/
    "{{{{{3 变量定义
    let downloadcmd = "wget -c -r -np -P "
    let downloadpath = "~/manifests"
    let downloadlink = "http://manifests.vivo.xyz/gerrit/manifests/"
    let function = "2183"
    let isexport = ""
    let issystem = "SystemTest"
    "}}}}
    if a:0 != 0
        let function = a:1
        if a:2 == "yes"
            let isexport = "F_EX"
        endif
        if a:3 == "no"
            let issystem = "DailyTest"
        endif
    else
    endif
    let downloadcmd = join([downloadcmd,downloadpath,"  ",downloadlink,"PD",function,isexport,"/",issystem,"/"],"\x00")
    echo downloadcmd
    call system(downloadcmd)
endfunction
"}}}}
"{{{{{2 function! DownloadManifest1() 根据版本号下载manifest
function! DownloadManifest1(...) "根据版本号下载manifest
    "curl -s http://manifests.vivo.xyz/gerrit/manifests/ | grep -oE 'href="[^"#]*"' | cut -d'"' -f2 | grep '/$'
    "{{{{{3 变量定义
    let Version = ""
    let Versionend = ""
    let product = ""
    let  product1 = ""
    let curl = "http://manifests.vivo.xyz/gerrit/manifests/"
    let tempcurl = ""
    let index = 0
    let outputpath = Homedir("ftp",2)
    "}}}}
    let product = input("项目")
    let product =  split(QueryCurlSubdirectory(curl,product),'\n')
    let Versionend = input("版本")
    for item1 in product
        echo item1
        let Version = split(QueryCurlSubdirectory(curl . item1  . "SystemTest/",Versionend. ".*vivo_"),'\n')
        let tempcurl = curl . item1  . "SystemTest/"
        for item in Version
            if matchstr(item,"modem") ==# ""  &&  matchstr(item,"_pre") ==# "" && matchstr(item,"vusbd") ==# ""  && matchstr(item,"Bbk") ==# "" && matchstr(item,"test") ==# ""
                if findfile(outputpath . '/' . item,".;") ==# ""
                    echo item
                    call system("wget -P " .  outputpath . " " . tempcurl . item)
                else
                    echo item . "已经存在"
                endif
            endif
        endfor
    endfor
    call input("11")
endfunction
"}}}}
"{{{{{2  QueryCurlSubdirectory() 查curl子目录
function! QueryCurlSubdirectory(...) "查curl子目录
    "curl -s http://manifests.vivo.xyz/gerrit/manifests/ | grep -oE 'href="[^"#]*"' | cut -d'"' -f2 | grep '/$'
    "{{{{{3 变量定义
    let subdirectory = ""
    let curlstring = a:1
    let querycmdbegin = "curl -s "
    let querycmdend = " | grep -oE 'href=\"[^\"#]*\"' | sed -e 's/^href=\"//' -e 's/\"$//'"
    let filterchar = ""
    "}}}}
    if a:0 ==# 1
        let subdirectory = system(querycmdbegin . curlstring . querycmdend)
    elseif a:0 ==# 2
        let filterchar = a:2
        let subdirectory = system(querycmdbegin . curlstring . querycmdend . " | grep \"" . filterchar . "\"")
        echo querycmdbegin . curlstring . querycmdend . " | grep \"" . filterchar . "\""
    endif
    return subdirectory
endfunction
"}}}}
"{{{{{2  function! ModifyCorrespondingCommit(...)  根据提交信息，找到有哪些tag 线
"{{{{{3 注释
"}}}}
function! ModifyCorrespondingCommit(...)
    "{{{{{3 变量定义
    let ModifyChar = "同步lea相关修改"
    let commitlist = []
    let branchlist = []
    let negatebranch = []
    let commitcomand = "git  log --oneline --date=format:\%Y-\%m-\%d --decorate --pretty=format:\%cd+\%H --all  --grep  "
    let branchcomand = "git branch -a --contains "
    let idx1 = 0
    let allbranch = []
    let isdelete = 0
    let templist = []
    let idj1 = 0
    let date = 0
    let commit = ""
    let templist1 = []
    let tempchar = ""
    "}}}}
    let ModifyChar = input("请输入修改")
    if input("是否取反") ==# "yes"
        let isdelete = 1
    endif
    let commitcomand = commitcomand . ModifyChar
    let commitlist = split(system(commitcomand),"\n")
    echo commitlist
    while idx1 < len(commitlist)
        let date = split(commitlist[idx1],'+')[0]
        let commit = split(commitlist[idx1],'+')[1]
        let templist = split(system(branchcomand . commit))
        let negatebranch = extend(negatebranch,templist)
        let idj1 = 0
        while idj1 < len(templist)
            let templist[idj1] = date . " " . templist[idj1]
            let idj1 += 1
        endwhile
        let branchlist = extend(branchlist,templist)
        let idx1 += 1
    endwhile
    let templist = []
    if  isdelete ==# 1
        let allbranch = split(system("git branch -a "))
        let templist = negatebranch
        let branchlist = []
        let idx1 = 0
        while idx1 < len(allbranch)
            if count(templist,allbranch[idx1]) ==# 0
                let branchlist = add(branchlist,allbranch[idx1])
            endif
            let idx1 += 1
        endwhile
    endif
    echo len(branchlist)
    echo len(uniq(sort(branchlist)))
    "echo  uniq(sort(branchlist))
    let idx1 = 0
    while idx1 < len(branchlist)
        if matchstr(branchlist[idx1],"tag") != ""
            let tempchar = split(branchlist[idx1])
            if matchstr(branchlist[idx1],'/') != ""
                "let tempchar = join([tempchar[0],split(tempchar[1],'/')[-1]])
                let templist1 = add(templist1,split(tempchar[1],'/')[-1])
            else
                let templist1 = add(templist1,tempchar[1])
            endif
        endif
        let idx1 += 1
    endwhile
    call append(line("."),uniq(sort(templist1)))
    "call append(line("."),templist1)
endfunction
"}}}}}
"{{{{{2 function! AddNotes(...)      在diff patch 文件每个修改处添加注释                  普通模式下 逗号 + add 调用
let g:addnoteflag = 0
nnoremap <leader>add :call AddNotes()<cr>
function! AddNotes(...)
    "{{{{{3 变量定义
    let bugchar = "B240719-83183"

    let filelen = 0
    let idx1 = 0
    let notesflag = 0
    let noteslastflag = 0
    let noteslinechar = ""
    let notesline = 0
    let spacechar = ""
    let lastline = -1
    let lastnumber = 0
    let laststring = ""
    let startnotes = ""
    "}}}}
    if &filetype != "git" && &filetype != "diff"
        if g:addnoteflag ==# 0
            let startnotes = "//vivo tangxinlou modify for " . bugchar . " begin"
            let g:addnoteflag  = 1
        else
            let startnotes = "//vivo tangxinlou modify for " . bugchar . " end"
            let g:addnoteflag  = 0
        endif
        call append(line('.'), startnotes)
    else
    let idx1 = 1
    let filelen = line('$')
    let bugchar = input("输入bug号")
    let startnotes = "//vivo tangxinlou modify for " . bugchar . " begin"
    let endnotes = "//vivo tangxinlou modify for " . bugchar . " end"
    while idx1 <= filelen
        call cursor(idx1,1)
        if matchstr(getline(idx1),"\^+") != ""  && matchstr(getline(idx1),"+++") != "+++"
            execute "normal :s/\\s\\+$//e\<CR>"
        endif
        let filelen = line('$')
        let idx1 += 1
    endwhile

    let idx1 = 1
    let filelen = line('$')
    while idx1 <= filelen
        call cursor(idx1,1)
        if matchstr(getline(idx1),"@@ -") != "" || idx1 == filelen
            if lastline != -1
                let noteslinechar = split(laststring)
                let notesline =  join([split(noteslinechar[2],",")[0], str2nr( split(noteslinechar[2],",")[1]) - lastnumber],",")
                let noteslinechar[2] = notesline
                call setline(lastline,join(noteslinechar))
            endif
            let lastline = idx1
            let lastnumber = 0
            let laststring = getline(idx1)
        endif
        if  matchstr(getline(idx1),"+") != "" && len(getline(idx1)) ==# 1
            let lastnumber += 1
            execute "normal dd"
            let idx1 -= 1
        endif
        let filelen = line('$')
        let idx1 += 1
    endwhile

    let idx1 = 0
    let filelen = line('$')
    while idx1 < filelen
        let spacechar = ""
        if matchstr(getline(idx1 + 1),"^+") != ""  && matchstr(getline(idx1 + 1),"+++") != "+++"
            let notesflag = 1
        else
            let notesflag = 0
        endif
        if notesflag ==# 1  && noteslastflag ==# 0
            let spacechar = matchstr(getline(idx1 + 1),'+\s\+')
            if spacechar ==# ""
                if len(getline(idx1 +1)) ==# 1
                    let spacechar = "+    "
                else
                    let spacechar = "+"
                endif
            endif
            call append(idx1,spacechar . startnotes)
        elseif notesflag ==# 0 && noteslastflag ==# 1
            let spacechar = matchstr(getline(idx1),'+\s\+')
            if spacechar ==# ""
                if len(getline(idx1)) ==# 1
                    let spacechar = "+    "
                else
                    let spacechar = "+"
                endif
            endif
            call append(idx1,spacechar . endnotes)
        endif

        let noteslastflag = notesflag
        let filelen = line('$')
        let idx1 += 1
    endwhile
    let filelen = line('$')
    let idx1 = 1
    let lastline = -1
    let lastnumber = 0
    let laststring = ""
    while idx1 <= filelen
        if matchstr(getline(idx1),"@@ -") != "" || idx1 == filelen
             if lastline != -1
                 echo  laststring
                 echo lastline
                 let noteslinechar = split(laststring)
                 let notesline =  join([split(noteslinechar[2],",")[0], (lastnumber * 2)+ split(noteslinechar[2],",")[1]],",")
                 let noteslinechar[2] = notesline
                 echo lastnumber * 2
                 call setline(lastline,join(noteslinechar))
                 echo join(noteslinechar)
             endif
             let lastline = idx1
             let lastnumber = 0
             let laststring = getline(idx1)
         endif
         if  matchstr(getline(idx1),startnotes) != ""
             let lastnumber += 1
         endif
        let idx1 += 1
    endwhile

    let filelen = line('$')
    let idx1 = 1
    let lastline = -1
    let lastlastline = -1
    let diffhead = -1
    let lastnumber = -1
    echo "tangxinldjf"
    while idx1 <=  filelen

        if matchstr(getline(idx1),"diff --git") != ""
            let diffhead = idx1
        endif
        if matchstr(getline(idx1),"@@ -") != "" || idx1 == filelen
            if lastnumber ==# 0  && lastline != -1
                "echo lastline
                "echo lastlastline
                "echo idx1
                if diffhead < lastline
                    silent execute ":" . (lastline) . "," . (idx1 -1) . "d"
                    echo "tangxinlou1"
                else
                    silent execute ":" . (lastline) . "," . (diffhead -1) . "d"
                    echo "tangxinlou2"
                endif
                let filelen = line('$')
                let lastnumber = -1
                let lastline = -1
                let lastlastline = -1
                let idx1 = 0
            else
                let lastnumber = 0
                let lastlastline = lastline
                let lastline = idx1
            endif
        endif
        if (matchstr(getline(idx1),"^+") != ""  && matchstr(getline(idx1),"+++") != "+++")
            let lastnumber = 1
        endif
        if (matchstr(getline(idx1),"^-") != ""  && matchstr(getline(idx1),"---") != "---")
            let lastnumber = 1
        endif
        let idx1 +=  1
    endwhile
endif
endfunction
"}}}}}
"{{{{{2 function! CleanUpTheCodeFormat(...)     规整文件格式 先复制后调用                 普通模式下 逗号 + clf 调用
nnoremap <leader>clf :call CleanUpTheCodeFormat()<cr>
function! CleanUpTheCodeFormat(...)
    "{{{{{3 变量定义
    let startline = line('.')
    let codelist = @@
    let srclist = []
    let taillist = []
    let idx1 = 0
    let first_part = ""
    let second_part = ""
    "}}}}
    let codelist = split(codelist,"\n")
    "规整注释//
    let srclist = matchstrpos(codelist[0],"//")
    let idx1 = 1
    while idx1 < len(codelist)
        let taillist = []
        let first_part = ""
        let second_part = ""
        let taillist = matchstrpos(codelist[idx1],"//")
        if taillist[1] != -1
            let first_part = strpart(codelist[idx1], 0, taillist[1] -1)
            let second_part = strpart(codelist[idx1], taillist[1] -1)
            let codelist[idx1] = first_part .  repeat(" ",srclist[1] - taillist[1])  . second_part
        endif
        let idx1 += 1
    endwhile
    call append(line('.'),codelist)
endfunction
"}}}}}
"{{{{{2 function! SelectAndModifyByName(...) 根据名字刷选修改
function!  SelectAndModifyByName(...)
    let idx1 = 0
    let templist = []
    let tempchar = ""
    let path = ""
    let command = "git log --oneline  --decorate --date=format:\%Y-\%m-\%d --pretty=format:\%ad█\%an█\%H█\%s "
    if a:0 ==# 1
        let keychar = a:1
    else
        let keychar = input("查找谁的提交")
        "let keychar = "tangxinlouosc"
        let path = input("查看修改涉及的目录")
        let path = "-- " . path
        let command = command  . path
    endif
    "let command = "git log --oneline  --decorate --date=format:\%Y-\%m-\%d --pretty=format:\%ad█\%an█\%H█\%s -- libs/"
    let resultlist = split(system(command),"\n")
    while idx1 < len(resultlist)
        let tempchar = split(resultlist[idx1],"█")
        if matchstr(tempchar[3],"Merge ") ==# ""
            if keychar ==# "" || matchstr(tempchar[1],keychar) != ""
                let templist = add(templist,resultlist[idx1])
            endif
        endif
        let idx1 += 1
    endwhile
    if a:0 ==# 0
        call append(line('.'),templist)
    end
    return templist
endfunction
"}}}}
"{{{{{2  SwitchBranches() 切分支到最新
function! SwitchBranches(...)
    let branch = a:1
    let commit = a:2
    call system("git fetch")
    call system("git checkout " . branch)
    call system("git pull --rebase")
    call system("git reset --hard " . commit)
endfunction
"}}}}
"{{{{{2  CompareTwoBranchChanges() 比较两分支修改
function! CompareTwoBranchChanges(...)
    let path = a:1
    let curxmlfile = a:2
    let curxmlfile1 = a:3
    let index = a:4
    let keychar = a:5
    let version1 = []
    let version2 = []
    let branch = ""
    let commit = ""
    let Collection = []
    let AB = []
    let BA = []
    let resultlist = []

    call execute(":lcd " . path)
    let branch = curxmlfile[index + 1]
    let commit =  curxmlfile[index]
    call  SwitchBranches(branch,commit)
    let version1 = SelectAndModifyByName(keychar)
    call execute(":lcd  .." )
    call execute(":lcd " . path)
    let branch = curxmlfile1[index + 1]
    let commit =  curxmlfile1[index]
    call  SwitchBranches(branch,commit)
    let version2 = SelectAndModifyByName(keychar)
    call execute(":lcd  .." )
    let Collection = SetOperationsBetweenLists(GetOneOfTheColumns(version1,"█",3),GetOneOfTheColumns(version2,"█",3),"差集")
    if Collection[0] != []
        let AB = SelectionFromTheListByIndex(Collection[0],version1)
        let resultlist = add(resultlist,path ."仓")
        let resultlist = add(resultlist,curxmlfile[-1] ."版本 比")
        let resultlist = add(resultlist,curxmlfile1[-1] ."版本多")
        let resultlist  = extend(resultlist,AB)
    elseif Collection[1] != []
        let BA = SelectionFromTheListByIndex(Collection[1],version2)
        let resultlist = add(resultlist,path ."仓")
        let resultlist = add(resultlist,curxmlfile1[-1] ."版本 比")
        let resultlist = add(resultlist,curxmlfile[-1] ."版本多")
        let resultlist  = extend(resultlist,BA)
    endif
    return resultlist
endfunction
"}}}}
"}}}
"{{{{ fund
"amountdatabase  指数 {时间}
"买的基金金额数据库,每次计算金额的时候，从数据库读金额填充，资金面板
"DataFund.py
"通过python 脚本从网络端获取指数数据和净值
"fund2index
"展示指数和基金的对应关系
"indexdatabase
"指数数据库
"logs
"从网络端获取指数和净值的日志
"numbereddatabase
"指数，基金 name 和 code 之间的对应关系
"panelamount
"金额购买面板
"panelindexvalue
"指数面板
"panelPEvalue
"市盈率面板
"worthdatabase
"净值数据库
"{{{{2  GetFundValue() 通过xml获取元数据
function! GetFundValue(...)
    let fundfilename = "2022-02-17.html"
    let fundtitle = "指数名称,指数类型,PE,PE%,PB,PB%,股息率,ROE,预测PEG"
    let fundnamelow = ""
    let fundnamemid = "1"
    let fundnamehign = ""
    let fundnameunsort = ""
    let fundvaluelow = ""
    let fundvaluemid = ""
    let fundvaluehigh = ""
    let fundvalueunsort = ""
    let fundvalues = [1,2,3,4,5,6,7,8,]
    let fundvalues1 = [1,2,3,4,]
    let logtime = "指数估值,2022-02-17"
    let loglow = "指数低估"
    let logmid = "指数正常"
    let loghigh = "指数高估"
    let logunsort = "指数未定义"
    let idx1 = 1
    let fundvalue = []
    if  a:0 ==# 1
        let fundfilename = a:1
        let fundvalue = readfile(fundfilename)
    else
        let fundvalue = readfile(fundfilename)
    endif
    let logtime =  matchstr(fundvalue[2],"<title>.*<\/title>")
    let fundnamelow =  matchstr(fundvalue[2],"div class=\"con\".*class=\"color-bar low\"")
    let fundnamemid =  matchstr(fundvalue[2],"color-bar low.\\{,300}color-bar mid.*class=\"color-bar mid\"")
    let fundnamehigh =  matchstr(fundvalue[2],"color-bar mid.\\{,300}color-bar high.*class=\"color-bar high\"")
    let fundnameunsort =  matchstr(fundvalue[2],"color-bar high.\\{,300}color-bar unsort.*class=\"color-bar unsort\"")
    let fundvaluelow =  matchstr(fundvalue[2],"<div class=\"ttype\">.*class=\"row normal bg-low\">.\\{,300}class=\"row normal bg-mid\">")
    let fundvaluemid =  matchstr(fundvalue[2],"class=\"row normal bg-mid\"><div class=\"ttype\">.*row normal bg-mid.\\{,300}row normal bg-high")
    let fundvaluehigh =  matchstr(fundvalue[2],"class=\"row normal bg-high\"><div class=\"ttype\">.*row normal bg-high.\\{,300}row normal bg-unsort")
    let fundvalueunsort =  matchstr(fundvalue[2],"class=\"row normal bg-unsort\"><div class=\"ttype\">.*row normal bg-unsort.\\{,400}footer")
    let fundnamelow =  join(split(join(split(join(split(join(split(fundnamelow,"<\/h1>.\\{,300}<h1>"),","),"<\/h1>.*color-bar low\""),"\x00"),"div class.*h1>"),"\x00"),","),",")
    let fundnamemid =  join(split(join(split(join(split(join(split(fundnamemid,"<\/h1>.\\{,300}<h1>"),","),"<\/h1>.*color-bar mid\""),"\x00"),"color-bar low.*h1>"),"\x00"),","),",")
    let fundnamehigh =  join(split(join(split(join(split(join(split(fundnamehigh,"<\/h1>.\\{,300}<h1>"),","),"<\/h1>.*color-bar high\""),"\x00"),"color-bar mid.*h1>"),"\x00"),","),",")
    let fundnameunsort =  join(split(join(split(join(split(join(split(fundnameunsort,"<\/h1>.\\{,300}<h1>"),","),"<\/h1>.*color-bar unsort\""),"\x00"),"color-bar high.*h1>"),"\x00"),","),",")
    let fundvaluelow =  join(split(join(split(join(split(fundvaluelow,"<\/div><div class.\\{,10}>"),","),"<\/div.\\{,100}>"),"%%"),"<div class.*pe\">"),"\x00")
    let fundvaluemid =  join(split(join(split(join(split(join(split(fundvaluemid,"<\/div><div class.\\{,10}>"),","),"<\/div.\\{,100}>"),"%%"),"class=\"row.*pe\">"),"\x00"),"<div class.*bg-high"),"\x00")
    let fundvaluehigh = join(split(join(split(join(split(join(split(fundvaluehigh,"<\/div><div class.\\{,10}>"),","),"<\/div.\\{,100}>"),"%%"),"class=\"row.*pe\">"),"\x00"),"<div class.*bg-unsort"),"\x00")
    let fundvalueunsort = join(split(join(split(join(split(join(split(fundvalueunsort,"<\/div><div class.\\{,10}>"),","),"<\/div.\\{,100}>"),"%%"),"class=\"row.*pe\">"),"\x00"),"<div class.*footer"),"\x00")
    let logtime = join(split(join(split(join(split(logtime,"<title>"),"\x00"),")<\/title>"),"\x00"),"("),",")
    "let fundvaluelow =  join(split(join(split(fundvaluelow,"<\/div><div class.\\{,10}>"),","),"<\/div.\\{,100}>"),",")
    let fundvalues[0] = fundnamelow
    let fundvalues[1] = fundnamemid
    let fundvalues[2] = fundnamehigh
    let fundvalues[3] = fundnameunsort
    let fundvalues[4] = fundvaluelow
    let fundvalues[5] = fundvaluemid
    let fundvalues[6] = fundvaluehigh
    let fundvalues[7] = fundvalueunsort
    "call append(line('.'),fundvalues)
    let idx1 = 0
    while idx1 < 4
        let fundvalues1[idx1] = ConnecTwoList(split(fundvalues[idx1],","),split(fundvalues[idx1 + 4],"%%"))
        let idx1 += 1
        "let list2 =  split(list[idx1],",")
        "let list3 =  split(list[idx1 + 4],"%%")
        "let list1[idx1] = ConnecTwoList(list2,list3)
        "let idx1 += 1
    endwhile
    call insert(fundvalues1[0],loglow)
    call insert(fundvalues1[0],fundtitle)
    call insert(fundvalues1[0],logtime)
    call insert(fundvalues1[1],logmid)
    call insert(fundvalues1[2],loghigh)
    call insert(fundvalues1[3],logunsort)
    "echo fundvalues1
    "call input("32")
    return fundvalues1
endfunction
"}}}}}
"{{{{{2   WriteFile(...)                  获取指数源数据写入fund文件
function! WriteFile(...)
    "{{{{{3 变量定义
    let  indexdict  = {}  "fund.txt 中的已有的指数数据
    "}}}}
    let indexdict = ParseFund()
    let fundkeys = sort(keys(indexdict),"MyCompare1")
    echo fundkeys
endfunction
"}}}}}
"{{{{{2   ConnecTwoList(...)   连接数据和指数名字
function! ConnecTwoList(...)
    let char = " "
    let list = ['a','b']
    let list1 = ['c','d']
    let list2 = []
    let idx1 = 0
    if a:0 ==# 2
        let list = a:1
        let list1 = a:2
        let list2 = list
        if len(list) ==# len(list1)
            while idx1 <len(list)
                let list2[idx1] = join([list[idx1],list1[idx1]],",")
                "echo list2[idx1]
                let idx1 += 1
            endwhile
        else
            return
        endif
    endif
    return list2
endfunction
"}}}}}
"{{{{{2   ParseFund(...)  解析fund数据
function! ParseFund(...)
    let time = " "
    let dict = {}
    let int = 0
    let src = 0
    let tail = 0
    let idx1 = 0
    let idj1 = 0
    let list = ["a"]
    let lists = []
    let lists = readfile(Homedir("work/fund/zhishu/panelindexvalue",1))
    let int = lists[0]
    "echo int
    let list =  repeat(list,int)
    while idx1 < len(lists)
        if idx1 ==# len(lists) - 1
            let list[idj1] = lists[src:idx1]
            "echo idx1
            "echo idj1
            "echo src
        endif
        if len(split(lists[idx1],"|")) ==# 2
            if src ==# 0
                let src = idx1
            else
                let tail = idx1
                let list[idj1] = lists[src:tail - 1]
                let tail = 0
                let src = idx1
                "echo src
                let idj1 +=1
            endif
        endif
        let idx1 += 1
    endwhile
    "call append(line('.'),list[0])
    let idx1 = 0
    while idx1 < len(list)
        let list[idx1] = CutData(list[idx1])
        let idx1 += 1
    endwhile
    let idx1 = 0
    while idx1 < len(list)
        let time = split(list[idx1][0][0],"|")[1]
        "echo time
        let dict[time] = list[idx1]
        let idx1 += 1
    endwhile
    "echo keys(dict)
    "call append(line('.'),dict[keys(dict)[2]][1])
    return dict
endfunction
"}}}}}
"{{{{{2   SplicingData(...)  将四个等级数据list整合成一个
function! SplicingData(...)
    let list1 = [1,2,3,4,]
    let list2 = []
    let lists = []
    let idx1 = 0
    let list1 = a:1
    while idx1 < 4
        let list2 = list1[idx1]
        "echo list2
        let list1[idx1] = List2Format(list2)
        let idx1 += 1
    endwhile
    "echo list1
    let idx1 = 0
    while idx1 < 4
        let lists = extend(lists,list1[idx1])
        let idx1 += 1
    endwhile
    return lists
endfunction
"}}}}}
"{{{{{2   CutData(...)  将fund 分割成  [[[2.22],[low],[mid],[high],[unsort]],[[2.21],[low],[mid],[high],[unsort]]]
function! CutData(...)
    let list1 = []
    let list2 = []
    let lists = [1,2,3,4,5]
    let idx1 = 0
    let intlow = 0
    let intmid = 0
    let inthigh = 0
    let intunsort = 0
    let list2 = a:1
    "echo len(list2)
    while idx1 < len(list2)
        let list1 = split(list2[idx1],"|")
        if len(list1) ==# 1
            if split(list1[0]," \\{3,5}")[0] ==# "指数低估"
                let intlow = idx1
                "echo "low"
            elseif split(list1[0]," \\{3,5}")[0] ==# "指数正常"
                let intmid = idx1
                "echo "mid"
            elseif split(list1[0]," \\{3,5}")[0] ==# "指数高估"
                let inthigh = idx1
                "echo "high"
            elseif split(list1[0]," \\{3,5}")[0] ==# "指数未定义"
                let intunsort = idx1
                "echo "unsort"
            else
            endif
        endif
        let idx1 += 1
    endwhile
    let lists[0] = list2[:intlow - 1]
    let lists[1] = list2[intlow + 1:intmid -1]
    let lists[2] = list2[intmid + 1:inthigh -1]
    let lists[3] = list2[inthigh + 1:intunsort -1]
    let lists[4] = list2[intunsort + 1:]
    "echo lists[4]
    return lists
endfunction
"}}}}}
"{{{{{2   CalculateInvest(...) 计算投资
function! CalculateInvest(...)
    let idx1 = 0
    let indexdict = {}
    let indexall = []
    let investall = []
    let curinvest = []
    let curinvests = []
    let fund2indexall = []
    let fundkeys = []
    let indexidx1 = ""
    let indexdict = ParseFund()
    let fundkeys = sort(keys(indexdict),"MyCompare1")
    echo fundkeys
    let indexidx1 = input("输入需要计算的日期")
    let indexall = indexdict[fundkeys[indexidx1]]
    "call append(line('.'),indexall[0])
    let fund2indexall  = readfile("fund2index.txt")
    let char = input("计算金额还是获取PE值 ，计算金额选1,获取PE选2")
    if char ==# "1"
        let investall = readfile("index.txt")
        let curinvest = CalculateAmount(investall,fund2indexall,indexall,fundkeys[indexidx1],1)
    elseif char ==# "2"
        let investall = readfile("analyze.txt")
        let curinvest = CalculateAmount(investall,fund2indexall,indexall,fundkeys[indexidx1],2)
    endif
    let idx1 = 0
    while idx1 < len(curinvest)
        let curinvests = extend(curinvests ,curinvest[idx1])
        let idx1 += 1
    endwhile
    call append(line('.'),curinvests)
    redraw
    if "yes" ==# input("是否写入")
        if char ==# 1
            silent call writefile(curinvests,"index.txt")
        elseif char ==# 2
            silent call writefile(curinvests,"analyze.txt")
        endif
    endif
endfunction
"}}}}}
"{{{{{2   CalculateAmount(...)          investall , fund2indexall,indexall ,time  flag 计算金额
function! CalculateAmount(...)
    let amounthead = ""
    let amountlow = []
    let amountmid = []
    let amounthigh = []
    let amountunsort = []
    let notindexfund = []
    let invests = [1,2,3,4,5,]
    let amountlow1 = ""
    let amountmid1 = ""
    let amounthigh1 = ""
    let amountunsort1 = ""
    let tmpinvestname = ""
    let tmpfund2indexname = ""
    let tmpindexname = ""
    let time = ""
    let iscontain = ""
    let amount = 0
    let PE = 0
    let initailPE = 0
    let initailamount = 500
    let flag = a:5
    if a:0 ==# 5
        let time = a:4
    endif
    let idx1 = 0
    while idx1 < len(a:1)
        "消除多余空格
        let tmpinvestname = split(split(a:1[idx1],"|")[0]," \\{3,30}")[0]
        if tmpinvestname ==# "基金名" || tmpinvestname ==# "指数名称"
            let amounthead = a:1[idx1] . time . " |"
            "call append(line('.'),amounthead)
        else
            if flag ==# 1
                let iscontain =  IsContain(tmpinvestname,a:2)
            else
                let iscontain = a:1[idx1]
            endif
            if iscontain != ""
                "call append(line('.'),iscontain)
                let tmpfund2indexname = split(split(iscontain,"|")[0]," \\{3,30}")[0]
                let amountlow1 = IsContain(tmpfund2indexname,a:3[1])
                let amountmid1 = IsContain(tmpfund2indexname,a:3[2])
                let amounthigh1 = IsContain(tmpfund2indexname,a:3[3])
                let amountunsort1 = IsContain(tmpfund2indexname,a:3[4])
                if amountlow1 != ""
                    let PE = split(split(amountlow1,"|")[2]," \\{3,30}")[0]
                    if flag ==# 1
                        let initailPE = split(split(a:1[idx1],"|")[3]," \\{3,30}")[0]
                        let amount = str2float(initailamount) * pow(str2float(initailPE) / str2float(PE) ,2)
                        let amount = float2nr(amount)
                        let amount = join([a:1[idx1] , amount ,")(low)", " |"],"\x00")
                    else
                        let amount = join([a:1[idx1] , PE ,")(low)", " |"],"\x00")
                    endif
                    call insert(amountlow,amount)
                elseif amountmid1 != ""
                    let PE = split(split(amountmid1,"|")[2]," \\{2,30}")[0]
                    if flag ==# 1
                        let initailPE = split(split(a:1[idx1],"|")[3]," \\{3,30}")[0]
                        let amount = str2float(initailamount) * pow(str2float(initailPE) / str2float(PE) ,2)
                        let amount = float2nr(amount)
                        let amount = join([a:1[idx1] , amount ,")(mid)" ," |"],"\x00")
                    else
                        let amount = join([a:1[idx1] , PE ,")(mid)" ," |"],"\x00")
                    endif
                    call insert(amountmid,amount)
                elseif amounthigh1 != ""
                    let PE = split(split(amounthigh1,"|")[2]," \\{3,30}")[0]
                    if flag ==# 1
                        let initailPE = split(split(a:1[idx1],"|")[3]," \\{3,30}")[0]
                        let amount = str2float(initailamount) * pow(str2float(initailPE) / str2float(PE) ,2)
                        let amount = float2nr(amount)
                        let amount = join([a:1[idx1] , amount ,")(high)", " |"],"\x00")
                    else
                        let amount = join([a:1[idx1] , PE ,")(high)", " |"],"\x00")
                    endif
                    call insert(amounthigh,amount)
                elseif amountunsort1 != ""
                    let PE = split(split(amountunsort1,"|")[2]," \\{3,30}")[0]
                    if flag ==# 1
                        let initailPE = split(split(a:1[idx1],"|")[3]," \\{3,30}")[0]
                        let amount = str2float(initailamount) * pow(str2float(initailPE) / str2float(PE) ,2)
                        let amount = float2nr(amount)
                        let amount = join([a:1[idx1] , amount ,")(unsort)", " |"],"\x00")
                    else
                        let amount = join([a:1[idx1] , PE ,")(unsort)", " |"],"\x00")
                    endif
                    call insert(amountunsort,amount)
                endif
            else
                let amount = join([a:1[idx1] , "null" ,")(undef)", " |"],"\x00")
                call insert(notindexfund,amount)
                "call append(line('.'),tmpinvestname)
            endif

        endif
        let idx1 += 1
    endwhile
    call insert(amountlow,amounthead)
    "call append(line('.'),amountlow)
    "call append(line('.'),amountmid)
    "call append(line('.'),amounthigh)
    "call append(line('.'),amountunsort)
    "call append(line('.'),notindexfund)
    let invests[0] = amountlow
    let invests[1] = amountmid
    let invests[2] = amounthigh
    let invests[3] = amountunsort
    let invests[4] = notindexfund
    return invests
endfunction
"}}}}}
"{{{{{2   ConsolidateData(...)          整合index 文件，使数据化
function! ConsolidateData(...)
    let indexfilelist = []
    let list2fmt1 = []
    let idx1 = 0
    let idx2 = 0
    let indexfilelist = readfile("index.txt")
    let indexfilelist = SumInvest(indexfilelist,1,0)
    let indexfilelist = CalculateProfit(indexfilelist,2)
    let indexfilelist = SumInvest(indexfilelist,2,0)
    let indexfilelist = SumColumn(indexfilelist,0)
    while idx1 < len(indexfilelist)
        let idx2 = 0
        let list2fmt1 = split(join(split(indexfilelist[idx1],"|")))
        while idx2 < len(list2fmt1)
            if idx2 ==# 0
                let list2fmt1[0] =  SetCharNull(list2fmt1[0],35)
            elseif idx2 ==# 1 || idx2 ==# 2 || idx2 ==# 3
                let list2fmt1[idx2] =  SetCharNull(list2fmt1[idx2],20)
            else
                let list2fmt1[idx2] =  SetCharNull(list2fmt1[idx2],25)
            endif
            let idx2 += 1
        endwhile
        let indexfilelist[idx1] = join(list2fmt1,"\x00")
        let idx1 += 1
    endwhile
    call append(line('.'),indexfilelist)
endfunction
"}}}}}
"{{{{{2   SumInvest(...) index.txt , 1-2   1 求和投资金额，2 求和盈利 , 0-1 1 没有买的也计算收益虚拟收益，0 只有买了的才有收益真实收益
function! SumInvest(...)
    let totalinvestment = 5
    let indexhead = []
    let indexinvestlist = []
    let indexlist = []
    let indexinvestlist = a:1
    let investment = 0
    let idx1 = 1
    let idx2 = 0
    let investment = a:2
    let sumVorR = a:3
    while idx1 < len(indexinvestlist)
        let indexlist = split(indexinvestlist[idx1],"|")
        let idx2 = 4
        let totalinvestment = indexlist[investment] - 1 + 1
        let indexlist[investment] = 0
        while idx2 < len(indexlist)
            if  investment ==# 1
                if "low" ==# matchstr(indexlist[idx2],"low") || "Y" ==# matchstr(indexlist[idx2],"Y")
                    let indexlist[investment] = indexlist[investment] + indexlist[idx2]
                endif
            elseif  investment ==# 2
                if sumVorR ==# 0
                    if "(R)" ==# matchstr(indexlist[idx2],"(R)")
                        let indexlist[investment] = indexlist[investment] + split(indexlist[idx2],")(")[2]
                    endif
                elseif sumVorR ==# 1
                    if "(R)" ==# matchstr(indexlist[idx2],"(R)") || "(V)" ==# matchstr(indexlist[idx2],"(V)")
                        let indexlist[investment] = indexlist[investment] + split(indexlist[idx2],")(")[2]
                    endif
                endif
            endif
            let idx2 += 1
        endwhile
        let indexlist[investment] = split(indexlist[investment]," \\{3,30}")[0]
        if  sumVorR ==# 0
            let indexlist[investment] = join([totalinvestment,")(",indexlist[investment],")(R)"],"\x00")
        else
            let indexlist[investment] = join([totalinvestment,")(",indexlist[investment],")(V)"],"\x00")
        endif
        "call append(line('.'),indexlist[1])
        let indexinvestlist[idx1] = join(indexlist,"|")
        let idx1 += 1
    endwhile
    return  indexinvestlist
endfunction
"}}}}}
"{{{{{2   CalculateProfit(...) 计算各个的盈利
function! CalculateProfit(...)
    let investmentsrc = 5
    let investmentcur = 5
    let investmentinit = 5
    let investvalue = ""
    let investhead = []
    let tmpchar = ""
    let tmpchar1 = ""
    let time1 = ""
    let PEsrc = 0
    let PEcur = 0
    let PEinit = 0
    let iscontain = ""
    let tmpfund2indexname = ""
    let indexlist = []
    let indexinvestlist = a:1
    let investment = a:2
    let idx1 = 1
    let idx2 = 0
    let fund2indexall  = readfile("fund2index.txt")
    let investhead = split(indexinvestlist[0],"|")
    let indexdict = ParseFund()
    let fundkeys = sort(keys(indexdict),"MyCompare1")
    echo fundkeys
    let indexidx1 = input("输入需要计算的日期")
    let time = fundkeys[indexidx1]
    while idx1 < len(indexinvestlist)
        let indexlist = split(indexinvestlist[idx1],"|")
        let tmpinvestname =  split(indexlist[0]," \\{3,30}")[0]
        let idx2 = 4
        let tmpchar1  = split(indexlist[3]," \\{3,30}")[0]
        let PEcur = IsContainPE(tmpfund2indexname,time)
        if  tmpinvestname != "汇添富中证生物科技A"
            while idx2 < len(indexlist)
                let tmpchar = split(indexlist[idx2]," \\{3,30}")[0]
                let iscontain =  IsContain(tmpinvestname,fund2indexall)
                let tmpfund2indexname = split(split(iscontain,"|")[0]," \\{3,30}")[0]
                let time1 = split(investhead[idx2]," \\{3,30}")[0]
                let PEsrc = IsContainPE(tmpfund2indexname,time1)
                let PEcur = IsContainPE(tmpfund2indexname,time)
                let investmentsrc =  1 - 1 + indexlist[idx2]
                let investmentcur =  investmentsrc / (PEsrc / PEcur)
                let investvalue = float2nr(investmentcur - investmentsrc)
                "debug
                if "广发中证养老" ==#  tmpinvestname
                    if time1 ==# "2022-04-18"
                    endif
                endif
                if "low" ==# matchstr(tmpchar,"low") || "Y" ==# matchstr(tmpchar,"Y")
                    let indexlist[idx2] = join([tmpchar,"(",investvalue,")(R)"],"\x00")
                else
                    if  investment ==# 2
                        let indexlist[idx2] = join([tmpchar,"(",investvalue,")(V)"],"\x00")
                    else
                    endif
                endif
                let idx2 += 1
            endwhile
            let PEinit = IsContainPE(tmpfund2indexname,"2022-02-25")
            let indexlist[3] = join([tmpchar1,")(",PEcur,")(R)"],"\x00")
            let investmentinit =  1 - 1 + indexlist[1] -  indexlist[2]
            let investmentcur =  investmentinit / (PEinit / PEcur)
            let investvalue = float2nr(investmentcur - indexlist[1])
            if "天弘恒生科技指数A" ==#  tmpinvestname
                echo investmentinit  indexlist[2]   indexlist[1]    PEinit  PEcur  investmentcur   investvalue
                call input("2222")
            endif
            let indexlist[2] = join([indexlist[2],")(",investvalue,")(R)"],"\x00")
            if "天弘恒生科技指数A" ==#  tmpinvestname
                echo  indexlist[2]
                call input("1111")
            endif
        endif
        let indexinvestlist[idx1] = join(indexlist,"|")
        let idx1 += 1
    endwhile
    "call append(line('.'),indexinvestlist)
    return  indexinvestlist
endfunction



"}}}
"{{{{{2   IsContainPE(...) list 基金指数名 返回对应PE
function! IsContainPE(...)
    let listcur = []
    let idx1 = 0
    let PE = 0
    let indexname = a:1
    let indextime = a:2
    let analyzePE = readfile("analyze.txt")
    let listhead = split(join(split(analyzePE[0]," \\{3,30}"),"\x00"),"|")
    let indexnameiscontain =  IsContain(indexname,analyzePE)
    if indexnameiscontain != ""
        let listcur = split(indexnameiscontain,"|")
        let idx1 = index(listhead,indextime)
        let PE =  split(listcur[idx1]," \\{3,30}")[0]
        let PE =  str2float(PE)
        "debug
        if indextime ==# "2022-04-18"
            if indexname ==# "养老产业"
            endif
        endif
        return PE
    else
        return 0
    endif
endfunction
"}}}}}
"{{{{{2   RestoreOrder(...) 恢复排序
function! RestoreOrder(...)
    let list = a:1
    let idx1 = 0
    let idx3 = 0
    let list2 = []
    let list3 = ['a']
    let char = ""
    let iscontain = ""
    let fundfilename = system("find  /d/work/fund/zhishu -iname '*html'")
    let fundfilename = split(fundfilename,"\n")
    let fundfilename = reverse(fundfilename)
    let fundfilename1 = copy(fundfilename)
    call AddNumber(fundfilename1)
    let filenumber = input("请输入排序的文件")
    let list1 = GetFundValue(fundfilename[filenumber])
    let list1 =  SplicingData(list1)
    let idx2 = len(list)
    let list3 =  repeat(list3,idx2)
    while idx1 < len(list1)
        let list2 = split(list1[idx1],"|")
        if len(list2) > 3
            let char = split(list2[0]," \\{3,30}")[0]
            let iscontain =  IsContain(char,list)
            let list3[idx3] = iscontain
            let idx3 += 1
        endif
        let idx1 += 1
    endwhile
    return list3
endfunction
"}}}}}
"{{{{{2   SumColumn(...) 列求和
function! SumColumn(...)
    let indexinvestlist = a:1
    let investnum = a:2
    let idx1 = 2
    let idx2 = 1
    let value = 0
    let value1 = 0
    let investcolumn = []
    let tmpinvestname = ""
    let investtail = split(indexinvestlist[1],"|")
    let investtail[0] = "统计"
    while  idx1 < len(indexinvestlist )
        let investcolumn = split(indexinvestlist[idx1],"|")
        let tmpinvestname =  split(investcolumn[0]," \\{3,30}")[0]
        let idx2 = 1
        while idx2 < len(investcolumn)
            if idx2 ==# 3
                let investtail[idx2] = "null"
            elseif idx2 ==# 1
                if "(R)" ==# matchstr(investcolumn[idx2],"(R)")
                    let value =  split(investcolumn[idx2],")(")[0] + split(investtail[idx2],")(")[0]
                    let value1 = split(investcolumn[idx2],")(")[1] + split(investtail[idx2],")(")[1]
                    let investtail[idx2] = join([value,")(",value1,")(R)"],"\x00")
                endif
            elseif idx2 ==# 2
                let value =  split(investcolumn[idx2],")(")[0] + split(investtail[idx2],")(")[0]
                let value1 = split(investcolumn[idx2],")(")[1] + split(investtail[idx2],")(")[1]
                let investtail[idx2] = join([value,")(",value1,")(R)"],"\x00")
            elseif idx2 > 3
                if  tmpinvestname !=# "汇添富中证生物科技A"
                    if idx1 ==# 2
                        if "(R)" ==# matchstr(investcolumn[idx2],"(R)")
                            let value =  split(investcolumn[idx2],")(")[0] + split(investtail[idx2],")(")[0]
                            let value1 = split(investcolumn[idx2],")(")[2] + split(investtail[idx2],")(")[2]
                            let investtail[idx2] = join([value,")(",value1,")(R)"],"\x00")
                        endif
                    else
                        if "(R)" ==# matchstr(investcolumn[idx2],"(R)")
                            let value =  split(investcolumn[idx2],")(")[0] + split(investtail[idx2],")(")[0]
                            let value1 = split(investcolumn[idx2],")(")[2] + split(investtail[idx2],")(")[1]
                            let investtail[idx2] = join([value,")(",value1,")(R)"],"\x00")
                        endif
                    endif
                endif
            endif
            let idx2 += 1
        endwhile
        let idx1 += 1
    endwhile
    let investtail = join(investtail,"|")
    let indexinvestlist = add(indexinvestlist,investtail)
    return   indexinvestlist
endfunction
"}}}}}
"{{{{2  InputData()                       一键输入数据
function! InputData()
    silent call writefile()
    echo "获取PE选2"
    call CalculateInvest()
    echo "analyze.txt 选3"
    call WriteFund2Index()

endfunction
"}}}}
"{{{{2  ObtainAmount()                    一键计算金额
function! ObtainAmount()
    echo "金额选1"
    call CalculateInvest()
    echo "index.txt 选2"
    call WriteFund2Index()

endfunction
"}}}}
"{{{{{2   PythonGetIndexValuation(...) 使用python方式获取指数估值
function! PythonGetIndexValuation(...)
    "{{{{{3 变量定义
    let fundtitle = "指数名称,指数类型,PE,PE%,PB,PB%,股息率,ROE,预测PEG,指数编号"
    let logtime = "指数估值,2022-02-17"
    let loglow = "指数低估"
    let logmid = "指数正常"
    let loghigh = "指数高估"
    let logunsort = "指数未定义"
    let indexlow = []
    let indexmid = []
    let indexhigh = []
    let indexunsort = []
    let indexfiledict = a:1
    let tempstring = ""
    let true = 1
    let false = 0
    let datestring = ""
    let indexdata = [indexlow,indexmid,indexhigh,indexunsort]
    let tempindexdata = []
    let indx1 = 0
    let tempstring = ""
    let indextype = ""
    let numbereddatabase = ""
    "}}}}
    let datestring = split(system("date +%F"),"-")[0]
    "let indexfiledict = eval(readfile("/d/work/fund/zhishu/IndexValuation")[0])
    let numbereddatabase = eval(readfile(Homedir("work/fund/zhishu/numbereddatabase",1))[0])
    let tempindexdata = copy(indexfiledict["data"]["items"])
    "echo "debug"
    "echo tempindexdata = indexfiledict["data"]["items"][0]
    let indx1 = 0
    while indx1 < len(tempindexdata)
        if  tempindexdata[indx1]["ttype"] ==# 1
            let indextype = "宽基指数"
        elseif tempindexdata[indx1]["ttype"] ==# 2
            let indextype = "策略指数"
        elseif  tempindexdata[indx1]["ttype"] ==# 3
            let indextype = "行业指数"
        endif
        let tempstring = ""
        if has_key(tempindexdata[indx1],"peg")
            let tempstring = join([tempindexdata[indx1]["name"],indextype,tempindexdata[indx1]["pe"],tempindexdata[indx1]["pe_percentile"],
                        \tempindexdata[indx1]["pb"],tempindexdata[indx1]["pb_percentile"],tempindexdata[indx1]["yeild"],tempindexdata[indx1]["roe"],tempindexdata[indx1]["peg"],tempindexdata[indx1]["index_code"]],",")
        else
            let tempstring = join([tempindexdata[indx1]["name"],indextype,tempindexdata[indx1]["pe"],tempindexdata[indx1]["pe_percentile"],
                        \tempindexdata[indx1]["pb"],tempindexdata[indx1]["pb_percentile"],tempindexdata[indx1]["yeild"],tempindexdata[indx1]["roe"],"--",tempindexdata[indx1]["index_code"]],",")
        endif
        if  has_key(numbereddatabase["index_code"],tempindexdata[indx1]["index_code"]) ==# 0
            let numbereddatabase["index_code"][tempindexdata[indx1]["index_code"]] =  tempindexdata[indx1]["name"]
        endif
        if  has_key(numbereddatabase["name"],tempindexdata[indx1]["name"]) ==# 0
            let numbereddatabase["name"][tempindexdata[indx1]["name"]] =  tempindexdata[indx1]["index_code"]
        endif
        if  tempindexdata[indx1]["eva_type"] ==# "low"
            let indexlow = add(indexlow,tempstring)
        elseif  tempindexdata[indx1]["eva_type"] ==# "mid"
            let indexmid = add(indexmid,tempstring)
        elseif  tempindexdata[indx1]["eva_type"] ==# "high"
            let indexhigh = add(indexhigh,tempstring)
        elseif  tempindexdata[indx1]["eva_type"] ==# "unsort"
            let indexunsort = add(indexunsort,tempstring)
        endif

        "echo "debug" tempstring
        let indx1 += 1
    endwhile
    let datestring ="指数估值," . datestring. "-" .  tempindexdata[0]["date"]
    let indexdata[0] = indexlow
    let indexdata[1] = indexmid
    let indexdata[2] = indexhigh
    let indexdata[3] = indexunsort
    call insert(indexdata[0],loglow)
    call insert(indexdata[0],fundtitle)
    call insert(indexdata[0],datestring)
    call insert(indexdata[1],logmid)
    call insert(indexdata[2],loghigh)
    call insert(indexdata[3],logunsort)
    silent call writefile([string(numbereddatabase)],Homedir("work/fund/zhishu/numbereddatabase",1))
    return  indexdata
endfunction
"}}}}}
"{{{{{2  function! CalculateAmount(...) 后同步金额面板
function! CalculateAmount(...)
    "{{{{{3 变量定义
    "}}}}
    call FillingAcountDataBase()
    call PopulateAmountPanel()
endfunction
"}}}}}
"{{{{{2  function! CalculateData(...)  先同步指数净值面板
"指数和净值数据库的数据库从网络端获取
"把数据库的数据反馈到面板
"panelindexvalue  panelPEvalue
function! CalculateData(...)
    "{{{{{3 变量定义
    "}}}}
   call IndexDataDashboard()
   call IndexCorrespondingFunds()
   call IndexParametersPanel(1)
endfunction
"}}}}}
"{{{{{2  CutIndexPanel(...) 分割panelindexvalue
"{{{{{3 注释
"}}}}
function! CutIndexPanel(...)
    "{{{{{3 变量定义
    let time = " "
    let dict = {}
    let int = 0
    let src = 0
    let tail = 0
    let idx1 = 0
    let idj1 = 0
    let list = ["a"]
    let lists = a:1
    "}}}}
    "let lists = readfile(Homedir("work/fund/zhishu/panelindexvalue",1))
    let int = lists[0]
    let list =  repeat(list,int)
    while idx1 < len(lists)
        if idx1 ==# len(lists) - 1
            let list[idj1] = lists[src:idx1]
        endif
        if len(split(lists[idx1],"|")) ==# 2
            if src ==# 0
                let src = idx1
            else
                let tail = idx1
                let list[idj1] = lists[src:tail - 1]
                let tail = 0
                let src = idx1
                "echo src
                let idj1 +=1
            endif
        endif
        let idx1 += 1
    endwhile
    let idx1 = 0
    while idx1 < len(list)
        let time = split(list[idx1][0],"|")[1]
        let dict[time] = list[idx1]
        let idx1 += 1
    endwhile
    return dict
endfunction
"}}}}}
"{{{{{2   IndexDataDashboardsort(...) 排序panelPEvalue,排序panelindexvalue
"{{{{{3 注释
"}}}}
function! IndexDataDashboardsort(...)
    "{{{{{3 变量定义
    let dict = {}
    let idx1 = 0
    let list = ["a"]
    let lists = []
    let datadashboard = []
    let keys = []
    let tempkey = []
    let isversion = 0
    let Orderedlist  = []
    let currentfilelist = []
    let Parameterslists = []
    let idx1 = 0
    let templist = [""]
    let idj1 = 0
    let index = 0
    let populatechar = "|-"
    "}}}}
    if a:0 ==# 0
        let lists = readfile(Homedir("work/fund/zhishu/panelindexvalue",1))
        let dict = CutIndexPanel(lists)
        let keys = sort(keys(dict))
        let datadashboard = add(datadashboard,lists[0])
        let idx1 = 0
        while idx1 < len(keys)
            let datadashboard = extend(datadashboard,dict[keys[idx1]])
            let idx1 += 1
        endwhile
        if len(datadashboard) < 3
            return
        endif
        silent call writefile(datadashboard ,Homedir("work/fund/zhishu/panelindexvalue",1))
    else
        let Parameterslists = a:1
        let Orderedlist  = a:2
        let currentfilelist = GetOneOfTheColumns(Parameterslists,"|",0)
        let templist =  repeat(templist,len(Parameterslists))
        let templist[0] =  Parameterslists[0]
        let idx1 = 1
        let idj1 = len(currentfilelist) - 1
        while idx1 < len(currentfilelist)
            if  0 !=  count(Orderedlist,currentfilelist[idx1])
                let index = index(Orderedlist,currentfilelist[idx1])
                let index += 1
                let templist[index] =  Parameterslists[idx1]
            else
                if len(split(Parameterslists[idx1])) < len(split(Parameterslists[0]))
                    let Parameterslists[idx1]  = Parameterslists[idx1] . repeat(populatechar,len(split(Parameterslists[0])) - len(split(Parameterslists[idx1])))
                endif
                let templist[idj1] = Parameterslists[idx1]
                let idj1 -= 1
            endif
            let idx1 += 1
        endwhile
        return templist
    endif
endfunction
"}}}}}
"{{{{{2   IndexDataDashboard(...)   批量把指数数据面板填充
"{{{{{3 注释
"}}}}
function! IndexDataDashboard(...)
    "{{{{{3 变量定义
    let dict = {}
    let idx1 = 0
    let list = ["a"]
    let lists = []
    let datadashboard = []
    let boardkeys = []
    let databasekeys = []
    let indexfiledict = {}
    let countnumber = 0
    "}}}}
    let lists = readfile(Homedir("work/fund/zhishu/panelindexvalue",1))
    let dict = CutIndexPanel(lists)
    let boardkeys = sort(keys(dict))
    let datadashboard = readfile(Homedir("work/fund/zhishu/panelindexvalue",1))
    let indexfiledict = eval(readfile(Homedir("work/fund/zhishu/indexdatabase",1))[0])
    let databasekeys = sort(keys(indexfiledict))
    echo databasekeys
    let idx1 = 0
    let lists = []
    while idx1 < len(databasekeys)
        let list = []
        if count(boardkeys,databasekeys[idx1]) ==# 0
            echo databasekeys[idx1]
            let list = PythonGetIndexValuation(indexfiledict[databasekeys[idx1]]["indexvalua"])
            let list =  SplicingData(list)
            let lists = extend(lists,list)
            let countnumber += 1
        endif
        let idx1 += 1
    endwhile
    let datadashboard[0] = datadashboard[0]  + countnumber
    let datadashboard = extend(datadashboard,lists)
    silent call writefile(datadashboard ,Homedir("work/fund/zhishu/panelindexvalue",1))
    call IndexDataDashboardsort()
endfunction
"}}}}}
"{{{{{2   PopulateTheIndexDatabase(...)  填充指数数据库 不需要经常操作
"{{{{{3 注释
"}}}}
function! PopulateTheIndexDatabase(...)
    "{{{{{3 变量定义
    let lists = []
    let dict = {}
    let boardkeys = []
    let databasekeys = []
    let indexfiledict = {}
    let idx1 = 0
    let idj1 = 0
    let templist = []
    let Valuationperrow = []
    let Valuation = []
    let indextype  = 0
    let valuationtype = 0
    let  eva_type  = ""
    "}}}}
    let lists = readfile(Homedir("work/fund/zhishu/panelindexvalue",1))
    let dict = CutIndexPanel(lists)
    let boardkeys = sort(keys(dict))
    let indexfiledict = eval(readfile(Homedir("work/fund/zhishu/indexdatabase",1))[0])
    let databasekeys = sort(keys(indexfiledict))
    echo len(boardkeys)
    echo len(databasekeys)
    echo "tangxinlou"

    while idx1 < len(boardkeys)
        if count(databasekeys,boardkeys[idx1]) ==# 0
            let valuationtype = 0
            let templist = dict[boardkeys[idx1]]
            let templist = ListRemoveSpaces(templist,"|")
            let indexfiledict[boardkeys[idx1]] = {}
            let indexfiledict[boardkeys[idx1]]["indexvalua"] = {}
            let indexfiledict[boardkeys[idx1]]["indexvalua"]["data"] = {}
            let indexfiledict[boardkeys[idx1]]["indexvalua"]["data"]["items"] = []
            let idj1 = 2
            while idj1 < len(templist)
                let Valuation = {}
                let Valuationperrow = split(templist[idj1],"|","2")
                if len(Valuationperrow) > 3
                    let Valuation["name"] = Valuationperrow[0]
                    if  Valuationperrow[1] ==# "宽基指数"
                        let indextype = 1
                    elseif Valuationperrow[1] ==# "策略指数"
                        let indextype = 2
                    elseif  Valuationperrow[1] ==# "行业指数"
                        let indextype = 3
                    endif
                    let Valuation["ttype"] = indextype
                    let Valuation["pe"] = Valuationperrow[2]
                    let Valuation["pe_percentile"] = Valuationperrow[3]
                    let Valuation["pb"] = Valuationperrow[4]
                    let Valuation["pb_percentile"] = Valuationperrow[5]
                    let Valuation["yeild"] = Valuationperrow[6]
                    let Valuation["roe"] = Valuationperrow[7]
                    let Valuation["peg"] = Valuationperrow[8]
                    let Valuation["index_code"] = Valuationperrow[9]
                    if valuationtype ==# 1
                        let Valuation["eva_type"] = "low"
                    elseif valuationtype ==# 2
                        let Valuation["eva_type"] = "mid"
                    elseif  valuationtype ==# 3
                        let Valuation["eva_type"] = "high"
                    elseif  valuationtype ==# 4
                        let Valuation["eva_type"] = "unsort"
                    endif
                    let Valuation["date"] = join([split(boardkeys[idx1],"-")[1],split(boardkeys[idx1],"-")[2]],"-")
                    let indexfiledict[boardkeys[idx1]]["indexvalua"]["data"]["items"] = add(indexfiledict[boardkeys[idx1]]["indexvalua"]["data"]["items"]," ")
                    let indexfiledict[boardkeys[idx1]]["indexvalua"]["data"]["items"][-1] =  Valuation
                elseif len(Valuationperrow) ==# 2
                    let valuationtype += 1
                endif
                let idj1 += 1
            endwhile
        endif
        let idx1 += 1
    endwhile
    silent call writefile([string(indexfiledict)],Homedir("work/fund/zhishu/indexdatabase",1))
endfunction
"}}}}}
"{{{{{2  IndexParametersPanel(...)     指数单个参数面板
"{{{{{3 注释
"参数面板
"}}}}
function! IndexParametersPanel(...)
    "{{{{{3 变量定义
    let Parameterslists = []
    let indexfiledict = {}
    let charinterval = "|"
    let indexkeylist = []
    let Parameters = "pe"
    let templist = [""]
    let tempparalist = []
    let idx1 = 0
    let idj1 = 0
    let firstcolumn = []
    let index = 0
    let tempkey = []
    let Orderedlist  = []
    let currentfilelist = []
    "}}}}
    let Parameterslists = readfile(Homedir("work/fund/zhishu/panelPEvalue",1))
    let Parameterslists =  ListRemoveSpaces(Parameterslists,charinterval)
    let Parameterslists  = ListTo2D(Parameterslists,charinterval)
    let indexfiledict = eval(readfile(Homedir("work/fund/zhishu/indexdatabase",1))[0])
    let indexkeylist = sort(keys(indexfiledict))
    while idx1 < len(indexkeylist)
        if 0 ==# count(Parameterslists[0],indexkeylist[idx1])
            let tempparalist = indexfiledict[indexkeylist[idx1]]["indexvalua"]["data"]["items"]
            let firstcolumn = GetOneOfTheColumns(Parameterslists,"|",0)
            let Parameterslists[0] =  add(Parameterslists[0]," ")
            let Parameterslists[0][-2] = indexkeylist[idx1]
            let idj1 = 0
            while idj1 < len(tempparalist)
                if type(tempparalist[idj1][Parameters]) ==# 5
                    let  tempparalist[idj1][Parameters] = string(tempparalist[idj1][Parameters])
                endif
                if count(firstcolumn,tempparalist[idj1]["name"]) ==# 0
                    let templist  = [""]
                    let templist  =  repeat(templist,len(Parameterslists[0]))
                    let Parameterslists =  add(Parameterslists," ")
                    let Parameterslists[-1] =  templist
                    let Parameterslists[-1][0] =  tempparalist[idj1]["name"]
                    let Parameterslists[-1][-2] =  tempparalist[idj1][Parameters] . ")(" . tempparalist[idj1]["eva_type"] . ")"
                else
                    let index = index(firstcolumn,tempparalist[idj1]["name"])
                    let Parameterslists[index] =  add(Parameterslists[index]," ")
                    let Parameterslists[index][-2] = tempparalist[idj1][Parameters] . ")(" . tempparalist[idj1]["eva_type"] . ")"

                endif
                let idj1 += 1
            endwhile
        endif
        let idx1 += 1
    endwhile
    let Parameterslists = ListTo1D(Parameterslists,charinterval)
    if a:0 ==# 0
        let tempkey = copy(reverse(indexkeylist))
        call AddNumber(tempkey)
        let isversion = input("排序日期")
    else
        let isversion = len(indexkeylist) - 1
    endif
    let Orderedlist  =  repeat([""],len(indexfiledict[indexkeylist[isversion]]["indexvalua"]["data"]["items"]))
    let idx1 = 0
    while idx1 < len(indexfiledict[indexkeylist[isversion]]["indexvalua"]["data"]["items"])
        let Orderedlist[idx1]  = indexfiledict[indexkeylist[isversion]]["indexvalua"]["data"]["items"][idx1]["name"]
        let idx1 += 1
    endwhile
    let Parameterslists   =  ListAddSpaces(Parameterslists,charinterval)
    let Parameterslists =  IndexDataDashboardsort(Parameterslists,Orderedlist)
    silent call writefile(Parameterslists,Homedir("work/fund/zhishu/panelPEvalue",1))
endfunction
"}}}}}
"{{{{{2   IndexCorrespondingFunds(...)指数对应的基金
function! IndexCorrespondingFunds(...)
    "{{{{{3 变量定义
    let indexnum = ""
    let useragent = "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36"
    let url = "https://danjuanfunds.com/djapi/index_eva/related/funds/"
    let command = ""
    let tempfilesname = "tempfile"
    let IndexArchiveDatabase = {}
    let tempfilelist = []
    let idx1 = 0
    let tempchar = ""
    let indexkey = []
    "}}}}
    let IndexArchiveDatabase   = eval(readfile(Homedir("work/fund/zhishu/numbereddatabase",1))[0])
    let indexkey = sort(keys(IndexArchiveDatabase["index_code"]))
    if has_key(IndexArchiveDatabase,"fundcode") ==# 0
        let IndexArchiveDatabase["fundcode"] = {}
    endif
    if has_key(IndexArchiveDatabase,"fundname") ==# 0
        let IndexArchiveDatabase["fundname"] = {}
    endif
    let idx1 = 0
    while idx1 < len(indexkey)
        let indexnum = indexkey[idx1]
        echo IndexArchiveDatabase["index_code"][indexnum]
        let command = "wget " . url . indexnum . " -U "  . "\"" . useragent . "\"" .  " -O " . tempfilesname
        call system(command)
        if findfile(tempfilesname,".;") != ""
            let tempfilelist = eval(readfile(tempfilesname)[0])
            if has_key(IndexArchiveDatabase,"fundtoindex") ==# 0
                let IndexArchiveDatabase["fundtoindex"] = {}
            endif
            if has_key(IndexArchiveDatabase,"indextofund") ==# 0
                let IndexArchiveDatabase["indextofund"] = {}
            endif
            for i in  tempfilelist["data"]
                if has_key(IndexArchiveDatabase["fundtoindex"],IndexArchiveDatabase["index_code"][indexnum]) ==# 0
                    let IndexArchiveDatabase["fundtoindex"][IndexArchiveDatabase["index_code"][indexnum]] = {}
                endif
                if has_key(IndexArchiveDatabase["fundtoindex"][IndexArchiveDatabase["index_code"][indexnum]],i["fd_name"]) ==# 0
                    let IndexArchiveDatabase["fundtoindex"][IndexArchiveDatabase["index_code"][indexnum]][i["fd_name"]] = {}
                endif
                let IndexArchiveDatabase["fundtoindex"][IndexArchiveDatabase["index_code"][indexnum]][i["fd_name"]]["fd_name"] = i["fd_name"]
                let IndexArchiveDatabase["fundtoindex"][IndexArchiveDatabase["index_code"][indexnum]][i["fd_name"]]["fd_code"] = i["fd_code"]
                let IndexArchiveDatabase["fundtoindex"][IndexArchiveDatabase["index_code"][indexnum]][i["fd_name"]]["scale"] = i["scale"]
                if has_key(IndexArchiveDatabase["fundname"],i["fd_name"]) ==# 0
                    let IndexArchiveDatabase["fundname"][i["fd_name"]] = i["fd_code"]
                endif
                if has_key(IndexArchiveDatabase["fundcode"],i["fd_code"]) ==# 0
                    let IndexArchiveDatabase["fundcode"][i["fd_code"]] = i["fd_name"]
                endif
                if has_key(IndexArchiveDatabase["indextofund"],i["fd_name"]) ==# 0
                    let IndexArchiveDatabase["indextofund"][i["fd_name"]] = IndexArchiveDatabase["index_code"][indexnum]
                endif
            endfor
        endif
        call delete(tempfilesname)
        let idx1 += 1
    endwhile
    silent call writefile([string(IndexArchiveDatabase)],Homedir("work/fund/zhishu/numbereddatabase",1))
endfunction
"}}}}}
"{{{{{2   FillingAcountDataBase(...)  填充资金数据库
function! FillingAcountDataBase(...)
    "{{{{{3 变量定义
    let amountDatabase = []
    let amountPanel = []
    let charinterval  = "|"
    let idx1 = 0
    let idj1 = 0
    let templist = []
    "}}}}
    let amountPanel  = readfile(Homedir("work/fund/zhishu/panelamount",1))
    let amountPanel =  ListRemoveSpaces(amountPanel,charinterval)
    let amountPanel = ListTo2D(amountPanel,charinterval)
    let amountDatabase  = eval(readfile(Homedir("work/fund/zhishu/amountdatabase",1))[0])
    let idx1 = 1
    while idx1 < len(amountPanel)
        if has_key(amountDatabase,amountPanel[idx1][0]) ==# 0
            let amountDatabase[amountPanel[idx1][0]] = {}
        endif
        let idj1 = 4
        while idj1 < len(amountPanel[idx1]) - 1
            if has_key(amountDatabase[amountPanel[idx1][0]],amountPanel[0][idj1]) ==# 0
                let amountDatabase[amountPanel[idx1][0]][amountPanel[0][idj1]] = {}
            endif
            let templist = split(amountPanel[idx1][idj1],'\^')
            if len(templist) ==# 1
                let amountDatabase[amountPanel[idx1][0]][amountPanel[0][idj1]] = templist[0]
            else
                let amountDatabase[amountPanel[idx1][0]][amountPanel[0][idj1]]["amount"] = templist[0]
                let amountDatabase[amountPanel[idx1][0]][amountPanel[0][idj1]]["actualpurchase"] = templist[1]
                let amountDatabase[amountPanel[idx1][0]][amountPanel[0][idj1]]["eva_type"] = templist[2]
            endif
            let idj1 += 1
        endwhile
        let idx1 += 1
    endwhile
    silent call writefile([string(amountDatabase)],Homedir("work/fund/zhishu/amountdatabase",1))
endfunction
"}}}}}
"{{{{{2   PopulateAmountPanel(...)  填充资金面板
function! PopulateAmountPanel(...)
    "{{{{{3 变量定义
    let indexfiledict = []
    let indexkeylist = []
    let amountPanel = []
    let charinterval = "|"
    let indexdatavalue = []
    let amountDatabase = []
    let tempkey = []
    let datechar = ""
    let fundname = ""
    let indexname = ""
    let initailamount = 500
    let initailPE = ""
    let curlPE = ""
    let amount = ""
    let ispay = ""
    let templist = ""
    let fund2index = ""
    "}}}}
    let indexfiledict = eval(readfile(Homedir("work/fund/zhishu/indexdatabase",1))[0])
    let indexkeylist = reverse(sort(keys(indexfiledict)))
    let amountDatabase  = eval(readfile(Homedir("work/fund/zhishu/amountdatabase",1))[0])
    let fund2index = readfile(Homedir("work/fund/zhishu/fund2index",1))
    let fund2index  =  ListRemoveSpaces(fund2index,charinterval)
    let amountPanel  = readfile(Homedir("work/fund/zhishu/panelamount",1))
    let amountPanel =  ListRemoveSpaces(amountPanel,charinterval)
    let amountPanel = ListTo2D(amountPanel,charinterval)

    if a:0 ==# 1
        let datechar = a:1
    else
        let tempkey = copy(indexkeylist)
        call AddNumber(tempkey)
        let datechar  = input("排序日期")
        let datechar  = indexkeylist[datechar]
    endif

    let idx1 = 1
    echo amountPanel[0]
    let amountPanel[0] = add(amountPanel[0],"")
    let amountPanel[0][-2] = datechar
    echo amountPanel[0]
    while idx1 < len(amountPanel)
        let fundname = amountPanel[idx1][0]
        let indexname = split(IsContain(fundname,fund2index),"|")[0]
        let initailPE = amountDatabase[fundname]["初始PE"]
        let indexdatavalue = GetIndexData(indexname,indexfiledict[datechar]["indexvalua"]["data"]["items"])
        let curlPE = string(indexdatavalue["pe"])
        let amount = str2float(initailamount) * pow(str2float(initailPE) / str2float(curlPE) ,2)
        let amount = float2nr(amount)

        if indexdatavalue["eva_type"] ==# "low"
            let ispay = "Y"
        else
            let ispay = "N"
        endif

        let amount = join([amount ,"^",ispay,"^",indexdatavalue["eva_type"]],"\x00")
        let amountPanel[idx1] = add(amountPanel[idx1],"")
        let amountPanel[idx1][-2] = amount

        if has_key(amountDatabase,fundname) ==# 0
            let amountDatabase[fundname] = {}
        endif

        if has_key(amountDatabase[fundname],datechar) ==# 0
            let amountDatabase[fundname][datechar] = {}
        endif

        let templist = split(amount,'\^')
        let amountDatabase[fundname][datechar]["amount"] = templist[0]
        let amountDatabase[fundname][datechar]["actualpurchase"] = templist[1]
        let amountDatabase[fundname][datechar]["eva_type"] = templist[2]
        let idx1 += 1
    endwhile
    let amountPanel  = ListTo1D(amountPanel,charinterval)
    let amountPanel =  ListAddSpaces(amountPanel,charinterval)
    silent call writefile(amountPanel,Homedir("work/fund/zhishu/panelamount",1))
    silent call writefile([string(amountDatabase)],Homedir("work/fund/zhishu/amountdatabase",1))
endfunction
"}}}}}
"{{{{{2   GetIndexData(...)   获取指数数据
function! GetIndexData(...)
    "{{{{{3 变量定义
    let indexname = a:1
    let indexdatalist = a:2
    let idx1 = 0
    "}}}}
    while idx1 < len(indexdatalist)
        if indexdatalist[idx1]["name"] ==#  indexname
            return indexdatalist[idx1]
        endif
        let idx1 += 1
    endwhile
endfunction
"}}}}}
"{{{{{2   GenerateRandomNumbers(...)   生成随机数
function! GenerateRandomNumbers(...)
    "{{{{{3 变量定义
    "let initialvalue = a:1
    "let endvalue = a:2
    "}}}}
    " 设置随机数种子
    let seed = localtime()
    call srand(seed)

    let random_float = 0
    let original_integer = rand()
    let float_with_decimal = original_integer / 10000000000.0
    "let random_float = initialvalue  + float_with_decimal  * (endvalue - initialvalue)
    let random_float = 1.7049 + float_with_decimal  * (2.3070 - 1.7049)
    " 打印格式化的随机浮点数
    echo "Random float between 1.7049 and 2.3070: " . printf("%.4f", random_float)
endfunction
"}}}}}
"}}}
"{{{{{ code
"协助写出代码流程文档
"循环查找结构体声明子节点,并把整个节点打印出来
"结构体声明，结构体定义，结构体初始化
"{{{{2  ParseCode()   解析code
function! ParseCode(...) "文件内容列表，解析的标志
    let sourcecode = a:1
    let codeflag = split(a:2,"|")
    let idx1 = 0
    let idj1 = 0
    let src = 0
    let tail = 0
    let cmpcount = 0
    let coutchapter = 0
    let targetcode = ["1"]
    let matchstr = ""
    let line = 0
    "寻找函数指针的过程
    let isignore = 0
    "寻找到的函数指针
    let isaddflag = 0
    if len(codeflag) ==# 1  " flag 只有1个
        echo "tangxinlou1"
        if codeflag[0] ==# "# "
            let matchstr = "^# "
        elseif codeflag[0] ==# "## "
            let matchstr = "^## "
        elseif codeflag[0] ==# "### "
            let matchstr = "^### "
        endif
        let cmpcount = GetMatchNumber(sourcecode,codeflag[0])
        let coutchapter = count(sourcecode,"```c")
        let targetcode =  repeat(targetcode,cmpcount)
        echo  cmpcount coutchapter  len(targetcode)  "tangxinlou1"
        while idx1 < len(sourcecode)
            if idx1 ==# len(sourcecode) - 1
                if src != 0
                    let targetcode[idj1] = sourcecode[src:idx1]
                    let targetcode[idj1][0] = targetcode[idj1][0] . "|" . (coutchapter * 2 + cmpcount * 4 + src + 2 + 1)
                    "echo "debug" idx1 idj1 src tail codeflag[0]  targetcode[idj1][0] coutchapter  cmpcount
                endif
            endif
            if codeflag[0] ==# matchstr(sourcecode[idx1], matchstr)
                echo "tangxinlou23"
                if src ==# 0
                    let src = idx1
                else
                    let tail = idx1
                    let targetcode[idj1] = sourcecode[src:tail - 1]
                    let targetcode[idj1][0] = targetcode[idj1][0] . "|" . (coutchapter * 2 + cmpcount * 4 + src + 2 + 1)
                    "echo "debug" idx1 idj1 src tail codeflag[0]  targetcode[idj1][0] coutchapter  cmpcount
                    let tail = 0
                    let src = idx1
                    let idj1 +=1
                endif
            endif
            let idx1 += 1
        endwhile
    else
        let cmpcount = count(sourcecode,codeflag[0])
        let targetcode =  repeat(targetcode ,cmpcount)
        if "|" ==# matchstr(sourcecode[0],"|")
            let line = split(sourcecode[0],"|")[1]
            echo "此章节解析" codeflag[0]  "有"  cmpcount "个,章节基础行是" line "行"
        else
            let line = cmpcount * 2 + 2 + 1
            echo "no chapter"
        endif
        while idx1 < len(sourcecode)
            if codeflag[0] ==# matchstr(sourcecode[idx1], "```c$")
                let src = idx1
            endif
            if "```d" ==# matchstr(sourcecode[idx1], "```d$")
                let isignore = 1
                let isaddflag = 1
            endif
            if codeflag[1] ==# matchstr(sourcecode[idx1], "```$")
                if isignore ==# 0
                    let tail = idx1
                    if idj1 < cmpcount
                        let targetcode[idj1]  = sourcecode[src:tail]
                        if isaddflag ==# 1
                            let targetcode[idj1][0] = targetcode[idj1][0] . "|" . (line + src) . " point"
                            let isaddflag = 0
                        else
                            let targetcode[idj1][0] = targetcode[idj1][0] . "|" . (line + src)
                        endif
                    endif
                    let idj1 += 1
                else
                    let isignore = 0
                endif
            endif
            let idx1 += 1
        endwhile
        let targetcode[0][0] = targetcode[0][0] . "|" .  cmpcount
    endif
    if cmpcount ==# 0
        return 0
    else
        return targetcode
    endif
endfunction



"}}}}
"{{{{{ function! AnalyzeCode()                   分析code                      普通模式<F11>调用
"<p> </p >  包起来不改变空格
nnoremap <F11>  :call AnalyzeCode()<cr>
function! AnalyzeCode()
    let targetcode = []
    let codedict = {}
    let tempdictlist = []
    let numberfunc = []
    let src = 0
    let tail = 0
    let idx1 = 0
    let idj1 = 0
    let relativepath = Homedir("txl/parse",1)
    let codefile = readfile(expand("%:p"))
    if count(codefile,"《《《《《《《") && count(codefile,"》》》》》》》")
        echo "之前修改过"
        let src = index(codefile,"《《《《《《《")
        let tail = index(codefile,"》》》》》》》")
        call remove(codefile,src,tail)
        echo src tail
    endif
    let targetcode =  ParseCode(codefile,"# ")
    if type(targetcode) ==# 3
        while idx1 < len(targetcode)
            echo targetcode[idx1][0]
            let codedict[idx1 . "|"  . targetcode[idx1][0]] = targetcode[idx1]
            "let codedict[idx1] = targetcode[idx1]
            let idx1 += 1
        endwhile
        let dictkeys =  sort(keys(codedict))
        let numberfunc = copy(dictkeys)
        echo dictkeys
        "echo codedict
        let idx1 = 0
        while idx1 < len(dictkeys)
            let codedict[dictkeys[idx1]] = ParseCode(codedict[dictkeys[idx1]],"```c|```")
            let idx1 += 1
        endwhile
        "silent call writefile(codedict[dictkeys[4]],"/opt6/tangxinlouosc/txl/parse")
        let idx1 = 0
        while idx1 < len(dictkeys)
            let tempdictlist = codedict[dictkeys[idx1]]
            let idj1 = 0

            while idj1 < len(tempdictlist)
                if idj1 ==# 0
                    let numberfunc[idx1] = split(tempdictlist[0][0],"|")[2]
                endif
                "debug
                "echo idx1 idj1
                let tempdictlist[idj1] =  ListKeyWords(tempdictlist[idj1])
                let idj1 += 1
            endwhile
            let codedict[dictkeys[idx1]] = tempdictlist
            let idx1 += 1
        endwhile
        let idx1 = 0
        while idx1 < len(dictkeys)
            let codedict[dictkeys[idx1]] =  DrawTimingDiagram(codedict[dictkeys[idx1]])
            let codedict[dictkeys[idx1]] =  ListAddSpaces(codedict[dictkeys[idx1]],"|")
            let codedict[dictkeys[idx1]] =  insert(codedict[dictkeys[idx1]],"")
            let codedict[dictkeys[idx1]] =  insert(codedict[dictkeys[idx1]],join(["第",1 + split(dictkeys[idx1],"|")[0],"章",split(split(dictkeys[idx1],"|")[1])[1]," 流程图"]))
            let codedict[dictkeys[idx1]] =  add(codedict[dictkeys[idx1]]," ")
            let idx1 += 1
        endwhile
        echo numberfunc
        let idx1 = 0
        let tempdictlist = []
        while idx1 < len(dictkeys)
            let tempdictlist = extend(tempdictlist,codedict[dictkeys[idx1]])
            let idx1 += 1
        endwhile
        let tempdictlist = insert(tempdictlist,"《《《《《《《")
        let tempdictlist = add(tempdictlist,"》》》》》》》")
        silent call writefile(tempdictlist,relativepath)
        call extend(codefile,tempdictlist,8)
        silent call writefile(codefile,expand("%:p"))
        execute "normal! :e " .  expand("%:p") . "\<cr>"
    else
        let codedict = ParseCode(codefile,"```c|```")
        let idj1 = 0
        while idj1 < len(codedict)
            let codedict[idj1] =  ListKeyWords(codedict[idj1])
            let idj1 += 1
        endwhile
        let codedict =  DrawTimingDiagram(codedict)
        let codedict =  ListAddSpaces(codedict,"|")
        let codedict = insert(codedict,"《《《《《《《")
        let codedict = add(codedict,"》》》》》》》")
        silent call writefile(codedict,relativepath)
        call extend(codefile,codedict,8)
        silent call writefile(codefile,expand("%:p"))
        execute "normal! :e " .  expand("%:p") . "\<cr>"
    endif
endfunction
"}}}}}

"{{{{{  ListKeyWords()  获取关键词
function! ListKeyWords(...)
    "{{{{{3 变量定义
    let listwords = a:1
    let idx1 = 0
    let line = ""
    let codeline = 0
    let filename = ""
    let keywords = ""
    let filenameidx1 = 0
    let templist = []
    let isstorage = 0
    let isreturn = 0
    let listkeywords = ""
    let notes = ""
    let tempvalue = 0
    let flag = 0
    let returnkeywords = ['void',
                \ 'int',
                \ 'char',
                \ 'long',
                \ 'Return<void>',
                \ 'bool',
                \ 'size_t',
                \ 'hci_t*',
                \ 'Uri',
                \ 'BluetoothOppReceiveFileInfo',
                \ 'interface',
                \ 'boolean',
                \ 'uint16_t',
                \ 'uint8_t',
                \ 'tBTA_STATUS',
                \ 'jint']
    let storagekeywords = ['auto',
                \ 'static',
                \ 'extern',
                \ 'register',
                \ 'const',
                \ 'private',
                \ 'public']
    let codeidx1 = 0
    "}}}}}
    while idx1 < len(listwords)
        if "" != matchstr(listwords[idx1],"/.*/.*/")
            let filename = split(split(listwords[idx1],":")[0],"/")
            let filename = filename[len(filename) - 1]
            let filenameidx1 = idx1
        endif
        if "" != matchstr(listwords[idx1],") {") && "" ==# matchstr(listwords[idx1],";") &&  "" != matchstr(listwords[idx1],"(") && len(split(split(listwords[idx1],"(")[0])) > 1
            if flag ==# 0
                let tempvalue = split(listwords[0],"|")
                "echo "debug" tempvalue[1]  idx1
                let tempvalue[1] =  idx1 + tempvalue[1]
                let listwords[0] = join(tempvalue,"|")
                let codeidx1 = idx1
                let flag = 1
            endif
        endif
        let idx1 += 1
    endwhile
    "找到了文件名，刷选文件名下一行的关键词
    if codeidx1 ==# 0
        let tempvalue = split(listwords[0],"|")
        "echo "debug" tempvalue[1]  idx1
        let tempvalue[1] =  filenameidx1 + tempvalue[1] + 1
        let listwords[0] = join(tempvalue,"|")
        let codeidx1 = filenameidx1 + 1
    endif
    "debug 行数
    let codeline = split(listwords[0],"|")[1]
    let templist = split(listwords[codeidx1],"\x00")
    echo templist
    if count(storagekeywords,templist[0])
        let isstorage = 1
        if count(returnkeywords,templist[1])
            let isreturn = 2
        elseif count(storagekeywords,templist[1])
            let isstorage = 2
            if count(returnkeywords,templist[2])
                let isreturn = 3
            endif
        endif
    elseif  count(returnkeywords,templist[0])
        let isreturn = 1
    endif


    if isstorage ==# 1 && isreturn ==# 2
        "echo templist filename filenameidx1 line     debug
        let keywords = split(templist[2],"(")[0]
    elseif isstorage ==# 0 && isreturn ==# 1
        let keywords = split(templist[1],"(")[0]
    elseif  isstorage ==# 2 && isreturn ==# 3
        let keywords = split(templist[3],"(")[0]
    else
        let keywords = join(templist)
        if "(" ==# matchstr(keywords,"(")
            let keywords = split(keywords,"(")[0]
        endif
    endif

    if count(templist,"class")
        if count(templist,"private") || count(templist,"public")
            let keywords =  templist[index(templist,"class") + 1]
        endif
    endif
    if count(templist,"const")
        if count(templist,"=")
            let idx1 = index(templist,"=")
            let keywords = templist[idx1 - 1]
        endif
    endif

    if count(templist,"#define")
        let idx1 = index(templist,"#define")
        let keywords = templist[idx1 + 1]
    endif

    if count(templist,"=") && len(templist) ==# 3
        let idx1 = index(templist,"=")
        let keywords = templist[idx1 + 1]
    endif

    if "::" ==# matchstr(keywords,"::")
        let keywords = split(keywords,"::")[1]
    endif

    if count(templist,"if") || count(templist,"else")
        let keywords =  "if()"
    endif

    "let listkeywords[0] = filename
    "let listkeywords[1] = keywords
    let notes = listwords[filenameidx1 - 1] . " "
    let keywords = keywords . ":" . codeline
    let listkeywords = filename . "|" . keywords . "|" . notes
    return listkeywords
endfunction
"}}}}}

"{{{{{  DrawTimingDiagram()  画时序图
function! DrawTimingDiagram(...)
    let drawcode = a:1
    let drawlist = [" "]
    let idx1 = 0
    let tempindex = 0
    let prvindex = 0
    let drawhead = []
    let templist = []
    let tempnotes = []
    let tempcodelist = []
    let drawlist =  repeat(drawlist,len(drawcode) * 2)
    while idx1 < len(drawcode)
        let templist = split(drawcode[idx1],"|")
        if 0 ==# count(drawhead,templist[0])
            let drawhead = add(drawhead,templist[0])
        endif
        let idx1 += 1
    endwhile
    let drawhead = add(drawhead," ")
    let drawhead = insert(drawhead," ")
    let idx1 = len(drawcode)
    while idx1 > 0
        let templist = [" "]
        let tempnotes = [" "]
        let templist =  repeat(templist,len(drawhead))
        let tempnotes =  repeat(tempnotes,len(drawhead))
        let tempcodelist = split(drawcode[idx1 - 1],"|")
        let tempindex = index(drawhead,tempcodelist[0])
        let templist[tempindex] = tempcodelist[1]
        let tempnotes[tempindex] = tempcodelist[2]
        if idx1 < len(drawcode)
            if prvindex > tempindex
                let templist[tempindex  + 1] = "》》"
            elseif prvindex ==# tempindex
                let templist[tempindex  + 1] = "V"
            elseif  prvindex <  tempindex
                let templist[tempindex  - 1] = "《《"
            endif
        endif
        let drawlist[idx1 * 2 - 1] = templist
        let drawlist[idx1 * 2 - 2] = tempnotes
        let prvindex = tempindex
        let idx1 -= 1
    endwhile
    let drawlist = insert(drawlist,drawhead)
    let idx1 = 0
    while idx1 < len(drawlist)
        let drawlist[idx1] = join(drawlist[idx1],"|")
        let idx1 += 1
    endwhile
    return drawlist
endfunction
"}}}}}

"{{{{{  GetMatchNumber()  获取匹配次数
function! GetMatchNumber(...)
    let matchlist = a:1
    let matchstr = a:2
    let idx1 = 0
    let matchcount = 0
    if matchstr ==# "# "
        let matchstr = "^# "
    elseif matchstr ==# "## "
        let matchstr = "^## "
    elseif matchstr ==# "### "
        let matchstr = "^### "
    endif
    echo matchstr
    while idx1 < len(matchlist)
        if a:2  ==# matchstr(matchlist[idx1], matchstr)
            let matchcount += 1
        endif
        let idx1 += 1
    endwhile
    return matchcount
endfunction
"}}}}}

"{{{{{2   SelectCode(...) 选中代码
function! SelectCode(...)
    "{{{{{3 变量定义
    let filesname = a:1
    let matchchar = a:2
    let structname = ""
    let fileslist = []
    let matchnum = 0
    let strunctindex = 0
    let structclass = ['union',
                \'struct' ]
    let structtype = ""
    let toward = 0
    let indx1 = 0
    let Cycles = 0
    let src = 0
    let tail = 0
    let returnstruct = []
    "}}}}
    if a:0 ==# 3
        let structname = a:3
    endif
    "读取文件
    let fileslist = readfile(filesname)
    let matchnum = count(fileslist,matchchar )
    let strunctindex = index(fileslist,matchchar )
    echo  matchchar  . " 只有一个匹配,匹配项在" . (strunctindex + 1) . "行"
    if strunctindex ==# 0
        echo "找不到匹配项"
        return "error"
    endif
    "判断结构体类型
    let matchchar = split(matchchar)
    if len(matchchar) != 0
        if len(matchchar) != 1
            "判断朝向
            if matchchar[len(matchchar) - 1] ==# "{"
                "朝下匹配
                let toward = 1
            elseif matchchar[0] ==# "}"
                "朝上匹配
                let toward = 2
            endif
            "判断class 待续
        else
            "只有结构体
        endif
    else
        "error
    endif
    "选中code
    if toward ==# 1
        echo "toward = 1,朝下匹配"
        let Cycles = len(fileslist) - strunctindex - 1
        let indx1 =  strunctindex
        while indx1 < len(fileslist)
            if "}" ==# matchstr(fileslist[indx1],"}")
                let src = strunctindex
                let tail = indx1
                let returnstruct = fileslist[src:tail]
                "echo returnstruct
                return returnstruct
                break
            endif
            let indx1 += 1
        endwhile
    elseif toward ==# 2
        echo "toward = 2,朝上匹配"
        let Cycles = 0
        let indx1 =  strunctindex
        while indx1 > 0
            if "{" ==# matchstr(fileslist[indx1],"{")
                let src = indx1
                let tail = strunctindex
                let returnstruct = fileslist[src:tail]
                "echo returnstruct
                return returnstruct
                break
            endif
            let indx1 -= 1
        endwhile
    endif

endfunction
"}}}}}

"{{{{{2 function!  TraverseNodes(...)            遍历结构体                    普通模式<F8>调用
"nnoremap <F8>  :call TraverseNodes("/opt6/tangxinlouosc/aosp/packages/modules/Bluetooth/system/bta/av/bta_av_int.h","union tBTA_AV_DATA {")<cr>
nnoremap <F8>  :call TraverseNodes("tBTA_AV_DATA")<cr>
"nnoremap <F8>  :call TraverseNodes("tAVRC_MSG")<cr>
"nnoremap <F8>  :call TraverseNodes("tBTA_AV_API_ENABLE")<cr>
function! TraverseNodes(...)
    "{{{{{3 变量定义
    let filespath = ""
    let matchchar = ""
    let fileslist = []
    let headnode = []
    let childnode = []
    let memberclass = []
    let membertype = []
    let structname = ""
    let childstructname = ""
    let pathmatchchar = ""
    let nodeformat = {'0path':'xx',
                \'1matchchar':'xx',
                \'2structname':'xx',
                \'5structuremember':'xx',
                \'00structuremembername':'xx',
                \'3structtype':'xx'}
    let structdictall = {}
    let structdict = {}
    let tempreturn = ""
    let idx1 = 0
    let blacklist = ['uint16_t', 'uint8_t', 'RawAddress', 'bool', 'uint32_t']
    let structtypeblack = ["enum","class"]
    let ischildcall = 0
    let codenote = 0
    let dictlist = []
    "}}}}
    if a:0 ==# 2
        let filespath = a:1
        let matchchar = a:2
    elseif a:0 ==# 1 || a:0 ==# 4
        let structname = a:1
        "echo structname . "首节点"
        let pathmatchchar = ResultJudgment(structname)
        if pathmatchchar != "error"
            let filespath = split(pathmatchchar,":")[0]
            let matchchar = split(pathmatchchar,":")[1]
            if a:0 ==# 4
                let ischildcall = 1
                let structdictall = a:3
                let structdict = a:4
                "echo "传下来的数组"
            endif
            "获取首节点
            let headnode = SelectCode(filespath,matchchar)
            if type(headnode) ==# 1 && tempreturn ==# "error"
                return "error"
            elseif type(headnode) ==# 3
                let structdictall[structname] = ListToDict(filespath,matchchar,structname,headnode)
                if ischildcall ==# 0
                    execute "normal! :r!date +\\%F-\\%T\<cr>"
                    call cursor(line('.') + 1,1)
                    let structdictall[structname].00structuremembername = structname
                    let structdictall["blacklist"] = blacklist
                elseif  ischildcall ==# 1
                    let structdictall[structname].00structuremembername = a:1 . " " . a:2
                    let blacklist = structdictall["blacklist"]
                endif
            endif
            let structdict = copy(structdictall[structname])
            if  structdict.3structtype != "error" && 1 ==# count(structtypeblack,structdict.3structtype)
                "echo structdict.3structtype . "这个结构体类型不需要找"
                return structdict
            endif
            "循环获取次节点
            let idx1 = 0
            while idx1 < len(structdict.5structuremember)
                let codenote = 0
                let childstructname = copy(structdict.5structuremember[idx1])
                let codenote = Isnote(childstructname)
                let childstructname = split(join(split(childstructname,'*')))
                "echo "tangxinlou4355"
                if codenote ==# 0
                    "判断是否需要搜索
                    "echo  structdict.5structuremember[idx1]
                    if 0 ==# count(keys(structdictall),childstructname[0])
                        if 0 ==# count(blacklist,childstructname[0])
                            if  "BACK" != matchstr(structdict["5structuremember"][idx1],"BACK")
                                let tempreturn  =  TraverseNodes(childstructname[0],childstructname[1],structdictall,structdict.5structuremember[idx1])
                                if type(tempreturn) ==# 1 && tempreturn ==# "error"
                                    let structdict.5structuremember[idx1] = structdict.5structuremember[idx1]
                                    let structdictall["blacklist"] = add(structdictall["blacklist"],childstructname[0])
                                    "echo  structdict.structuremember[idx1]  . childstructname[0] . " 没有找到加入到blacklist"
                                elseif type(tempreturn) ==# 4
                                    "echo  "找到了"
                                    let structdict.5structuremember[idx1] = tempreturn
                                endif
                            else
                                "echo  structdict.structuremember[idx1]  . childstructname[0] . "回调函数指针不需要找"
                                let structdict.5structuremember[idx1] = structdict.5structuremember[idx1]
                            endif
                        else
                            let structdict.5structuremember[idx1] = structdict.5structuremember[idx1]
                        endif
                    else
                        let structdict.5structuremember[idx1] = structdictall[childstructname[0]]
                        let structdict.5structuremember[idx1].00structuremembername = childstructname[0]. " " . childstructname[1]
                    endif
                else
                    "let structdict.5structuremember[idx1] =  structdict.5structuremember[idx1] . "注释不需要搜索"
                    let structdict.5structuremember[idx1] =  ""
                endif
                let idx1 += 1
            endwhile
            "echo "tangxinlou666"
            "call append(line("."),structdict["structuremembername"] )
            if ischildcall ==# 0
                execute "normal! :r!date +\\%F-\\%T\<cr>"
                call cursor(line('.') + 1,1)
                call append(line("."),string(structdict))
                call cursor(line('.') + 1,1)
                let dictlist = PrintDict(structdict)
                call append(line("."),dictlist)
                call cursor(line('.') + 1,1)
                " call append(line("."),"tangxinloufakdfklad")
                " call cursor(line('.') + 1,0)
                " call append(line("."),structdictall["blacklist"])
                " call cursor(line('.') + 1,0)
                " call append(line("."),string(structdictall))
                " call cursor(line('.') + 1,0)
            endif
            echo "所有搜索过的"
            "echo structdictall
            return structdict
        else
            echo "head node get fail"
            return "error"
        endif
    endif
    "let headnode = SelectCode(filespath,matchchar)
    "call append(line("."),headnode )
endfunction
"}}}}}

"{{{{{2   ResultJudgment(...) 判断搜索结果
"nnoremap <F8>  :call ResultJudgment("tBTA_AV_DATA")<cr>
function! ResultJudgment(...)
    "{{{{{3 变量定义
    let grepcmd = ""
    let structname = a:1
    let resultreturn = ""
    let indx1 = 0
    let tempreturnchar = ""
    let returndown = structname . " " . ".*" . "{"
    let returnup = "}" . " " . structname . ";"
    let counter = 0
    "}}}}
    "echo system("grep -Esinr  --include=*.h \"tBTA_AV_DATA\"")
    let grepcmd = "grep -Esinr  --include=*.h "
    let resultreturn = system(grepcmd . " " . structname )
    "silent call append(line('.'), split(resultreturn,"\n"))
    "有两种朝上和朝下
    let resultreturn = split(resultreturn,"\n")
    "call append(line("."),resultreturn)
    let idx1 = 0
    while idx1 < len(resultreturn)
        if "" != matchstr(resultreturn[idx1],returndown)
            let tempreturnchar = resultreturn[idx1]
            let counter += 1
        elseif  "" != matchstr(resultreturn[idx1],returnup)
            let tempreturnchar = resultreturn[idx1]
            let counter += 1
        endif
        let idx1 +=1
    endwhile
    if counter ==# 1
        let tempreturnchar = join([split(tempreturnchar,":")[0],join(split(split(tempreturnchar,":")[2],"\x00"))],":")
        echo structname  . " 搜索成功"
        return  tempreturnchar
    else
        return "error"
    endif
endfunction
"}}}}}

"{{{{{2   ListToDict(...) 填充字典
function! ListToDict(...)
    "{{{{{3 变量定义
    let path = a:1
    let matchchar = a:2
    let structname = a:3
    let List = a:4
    let nodeformat = {'0path':'xx',
                \'1matchchar':'xx',
                \'2structname':'xx',
                \'5structuremember':'xx',
                \'00structuremembername':'xx',
                \'3structtype':'xx'}
    let structtype = ["enum","class","struct","union"]
    let counter = 0
    let idx1 = 0
    "}}}}
    let idx1 = 0
    while idx1 < len(structtype)
        if structtype[idx1] ==# matchstr(List[0],structtype[idx1])
            let nodeformat.3structtype = structtype[idx1]
            let counter += 1
        elseif structtype[idx1] ==#  matchstr(List[len(List) - 1],structtype[idx1])
            let nodeformat.3structtype = structtype[idx1]
            let counter += 1
        endif
        let idx1 += 1
    endwhile
    let nodeformat.0path = path
    let nodeformat.1matchchar = matchchar
    let nodeformat.2structname = structname
    let nodeformat.5structuremember = List[1:len(List) - 2]
    let nodeformat.00structuremembername =  structname
    if counter != 1
        let nodeformat.3structtype = "error"
    endif
    return nodeformat
endfunction
"}}}}}

"{{{{{2   Isnote(...) 判断是否是注释
function! Isnote(...)
    "{{{{{3 变量定义
    let char = a:1
    let isnote = 0
    "}}}}
    if ";"!= matchstr(char,';')
        let isnote = 1
        "echo char . "是注释"
    else
        "echo char . "不是注释"
    endif
    return isnote
endfunction
"}}}}}

"{{{{{2   PrintDict(...) 打印字典
function! PrintDict(...)
    "{{{{{3 变量定义
    let ischildcall = 0
    let appendparameter = a:1
    let appendprintlist = []
    let idx1 = 0
    let loopcounter = 1
    let temploopcounter = 0
    let printtype = 0
    let keyintem = []
    let idj1 = 0
    let tempchar = '*'
    let tempchar1 = "├── "
    let tempchar2 = "│   "
    "}}}}
    if a:0 ==# 3
        let ischildcall = 1
        let appendprintlist = a:2
        let loopcounter = a:3
    endif
    "let loopcounter += 1
    let printtype = type(appendparameter)
    if printtype ==# 1
        let tempchar = '*'
        let tempchar =  repeat(tempchar,loopcounter)
        let appendprintlist = add(appendprintlist,tempchar . join(split(appendparameter)))
    elseif  printtype ==# 3
        while idx1 < len(appendparameter)
            let temploopcounter = copy(loopcounter)
            let printtype = type(appendparameter[idx1])
            if  printtype ==# 1 && appendparameter[idx1] != ""
                let tempchar = '*'
                let tempchar =  repeat(tempchar2,temploopcounter - 1) . tempchar1
                let appendprintlist = add(appendprintlist,tempchar . join(split(appendparameter[idx1])))
            elseif  printtype ==# 3 || printtype ==# 4
                if printtype ==# 4
                    let temploopcounter += 1
                endif
                let appendprintlist = PrintDict(appendparameter[idx1],appendprintlist,temploopcounter)
            endif
            let idx1 += 1
        endwhile
    elseif  printtype ==# 4
        let keyintem = sort(keys(appendparameter))
        let idx1 = 0
        while idx1 < len(keyintem)
            let temploopcounter = copy(loopcounter)
            let printtype = type(appendparameter[keyintem[idx1]])
            if  printtype ==# 1  && appendparameter[keyintem[idx1]] != ""
                if  keyintem[idx1] ==# "00structuremembername" &&  temploopcounter > 1
                    let temploopcounter = temploopcounter - 1
                endif
                let tempchar = '*'
                let tempchar =  repeat(tempchar2,temploopcounter - 1) . tempchar1
                if keyintem[idx1] != "1matchchar" && keyintem[idx1] != "2structname" && keyintem[idx1] != "0path"
                    let appendprintlist = add(appendprintlist,tempchar . join(split(appendparameter[keyintem[idx1]])))
                endif
            elseif  printtype ==# 3 || printtype ==# 4
                if printtype ==# 4
                    let temploopcounter += 1
                endif
                let appendprintlist = PrintDict(appendparameter[keyintem[idx1]],appendprintlist,temploopcounter)
            endif
            let idx1 += 1
        endwhile
    endif
    return  appendprintlist

endfunction
"}}}}}

"{{{{{2   StructureDefinition(...) 结构体定义
"nnoremap <F8>  :call StructureDefinition("tBTA_AV_API_ENABLE")<cr>
function! StructureDefinition(...)
    "echo system("grep -Esinr  --include=*.h \"tBTA_AV_DATA\"")
    "echo system("grep -Esinr  --include=*.h \"tBTA_AV_DATA .*{\"")
    "{{{{{3 变量定义
    let grepcmd = "grep -Esinr "
    let structname = a:1

    "}}}}

endfunction
"}}}}}

"{{{{{2   GetFoldLevel(...) 获取每行的foldlevel
nnoremap getfold :call GetFoldLevel()<cr>
function! GetFoldLevel(...)
    "{{{{{3 变量定义
    let filename = a:1
    let filelist = []
    let foldlist = []
    let idx1 = 0
    "}}}}
    "let filename = Homedir("aosp/packages/modules/Bluetooth/android/app/src/com/android/bluetooth/btservice/ActiveDeviceManager.java",1)
    "let filename = expand("%:p")
    let filelist = readfile(filename)
    let foldlist = copy(filelist)
    execute "normal! :tabnew \<cr>:e " . filename . " \<cr>"
    setlocal foldmethod=syntax
    redraw
    while idx1 < len(foldlist)
        let foldlist[idx1] = foldlevel(idx1 + 1)
        let idx1 += 1
    endwhile
    execute "normal! :bd" . bufnr('$') ."\<cr>"
    execute "normal! :q!\<cr>"
    return foldlist
endfunction
"}}}}}

"{{{{{2 function!  ParseCodeFiles(...)           解析代码文件                  普通模式par调用
nnoremap par :call ParseCodeFiles()<cr>
function! ParseCodeFiles(...)
    "{{{{{3 变量定义
    let filename = ""
    let filelist = []
    let foldlist = []
    let idx1 = 0
    let nodeformat  = {"1-dictname":"xx",
                \"2-dictlen":"0-0",
                \"3-dictnodemember":[],
                \}
    "                \"4-dictnodemembername":[],
    "                \"5-dictAssignmentmember":"0-0",
    "                \"6-filename":"xx",
    let foldlevellist = []
    let idx1 = 0
    let flag = 0
    let codedict = []
    let startpoint = 0
    let codelist = []
    let winwidthnum = 0
    let line = 0
    let col = 0
    let winnrnum = 0
    let winid = 0
    let resultdict = {}
    let mode = 0
    "}}}}
    if a:0 ==# 0
        let winnrnum = tabpagewinnr(tabpagenr(),'$')
        echo winnrnum
        if winnrnum  >  1
            execute "normal! \<c-w>h"
            execute "normal! :q!\<cr>"
        endif
        let filename = expand("%:p")
    else
        let filename = a:1
        let mode = a:2
        execute "normal! :tabnew \<cr>:e " . filename . " \<cr>"
        setlocal foldmethod=syntax
        redraw
    endif
    let winid = win_getid()
    let line = line('.')
    let col = col('.')
    call FormatCode(filename)
    let filelist = readfile(filename)
    let foldlevellist = GetFoldLevel(filename)
    call win_gotoid(winid)
    let codedict = LoopToDillDictionary(nodeformat,foldlevellist,"",flag,filename,codelist)
    if a:0 ==# 0
        let codelist = ListFunctionAamesAndClassNames(codelist)
        let winwidthnum  = float2nr(winwidth('%')  * 0.3)
        execute "normal! :vne\<cr>"
        execute "vert resize " . winwidthnum
        call setline(1,codelist)
        execute "normal! \<c-w>l"
        call cursor(line,col)
        let @/ = "█1█.*$"
    else
        if mode ==# 1
            let codelist = ListFunctionAamesAndClassNames(codelist)
        endif
        let resultdict["codelist"] =  codelist
        let resultdict["codedict"] =  codedict
        call cursor(line,col)
        let &foldlevel=100
        echo filename . "tangxinlouend"
        execute "normal! :wq!\<cr>"
        return resultdict
    endif
endfunction
"}}}}}

"{{{{{2   LoopToDillDictionary(...) 填充本节点，循环填下一节点
function! LoopToDillDictionary(...)
    "{{{{{3 变量定义
    let dictformart  = a:1
    let nodeformat = {}
    let foldlevellist = a:2
    let listlen = a:3
    let flag = copy(a:4)
    let filename = a:5
    let codelist1 = a:6
    let idx1 = 0
    let start = 0
    let end = 0
    let idj1 = 0
    let maxflag = 0
    let startpoint = 0
    let endpoint = 0
    let endnodeformat  = {}
    let tempchar = ""
    let tempchar1 = "├──"
    let tempchar2 = "│  █"
    "}}}}
    "字典拷贝一定要deepcopy,不然字典里面第二层成员还是同一个地址
    let nodeformat = deepcopy(dictformart)
    if listlen ==# ""
        let startpoint = 0
        let endpoint = len(foldlevellist)
    else
        let startpoint = str2nr(split(listlen,'-')[0])
        let endpoint = str2nr(split(listlen,'-')[1])
    endif
    let idx1 = startpoint
    "echo filename . "tangxin begin" . "listlen " . startpoint  . " - "  . endpoint  . "flag" . flag
    while idx1 < endpoint
        if flag ==# foldlevellist[idx1]
            "echo filename . "tangxinlog begin" . "listlen " . startpoint  . " - "  . endpoint  . "flag" . flag
            "设置头结点字典成员
            if flag != 0
                let &foldlevel=flag -1
                let start = foldclosed(idx1 + 1)
                let end = foldclosedend(idx1 + 1)
                let nodeformat["1-dictname"] = getline(idx1 + 1)
                let nodeformat["2-dictlen"] = string(start -1) . '-' . string(end -1)
                "let nodeformat["6-filename"] = filename
                if matchstr(nodeformat["1-dictname"],'\/\*') ==# ""
                    "echo "line " . idx1 .  "flag " . flag . nodeformat["1-dictname"]
                    let tempchar = ""
                    let tempchar =  repeat(tempchar2,flag - 1) . tempchar1
                    let codelist1 = add(codelist1,start ."-" .end .  "█" . flag . "█" . tempchar .  "█" . split(nodeformat["1-dictname"],"^\\s\\+")[0])
                endif
            else
                let start = 1
                let end = endpoint
            endif
            let listlen = string(start -1) . '-' . string(end -1)
            "echo listlen
            "设置条件判断是否循环获取下一结点
            if max(foldlevellist[start -1:end -1]) != min(foldlevellist[start -1:end -1])
            "if flag < 4
                while start < end
                    let endnodeformat  = LoopToDillDictionary(dictformart,foldlevellist,listlen,flag + 1,filename,codelist1)
                    if endnodeformat["2-dictlen"] != "0-0"
                        "通过这个值控制是否加入到数据库
                        if matchstr(endnodeformat["1-dictname"],'\/\*') ==# ""
                            let nodeformat["3-dictnodemember"] = add(nodeformat["3-dictnodemember"],endnodeformat)
                        endif
                        let start = str2nr(split(endnodeformat["2-dictlen"],'-')[1]) + 1
                        let listlen = string(split(endnodeformat["2-dictlen"],"-")[1] + 1) . '-' . string(end -1)
                    else
                        let start = end
                    endif
                endwhile
            else
            endif
            let idx1 = endpoint
            "echo filename . "tangxinlog end" . "listlen " . startpoint  . " - "  . endpoint . "flag" . flag
            "if input("123") ==# "123"
            "    return
            "endif
        endif
        let idx1 += 1
    endwhile
    "echo filename . "tangxin end" . "listlen " . startpoint  . " - "  . endpoint  . "flag" . flag
    return nodeformat
endfunction
"}}}}}

"{{{{{2   ExtractKeyCodes(...) 提取关键代码
nnoremap <leader>a :call ExtractKeyCodes()<cr>
"nnoremap <leader>a :echo ExtractKeyCodes(line('.'),1)<cr>
function! ExtractKeyCodes(...)
    "{{{{{3 变量定义
    let codelist = []
    let idx1 = 0
    let start = 0
    let tempchar = ""
    let realityline = 0
    let path = ""
    let foldstring = ""
    let srcnum = 0
    let tailnum = 0
    let idk1 = 0
    let numberlist = []
    let col = ""
    let result = ""
    let tempstring = ""
    let lastline = -1
    let g:alldebugflag = "true"
    let functionline = "-1"
    let filename = expand("%:t")
    let filetype =  IsFileType(filename)
    let stackflag = ""
    "}}}}
    setlocal foldmethod=syntax
    if a:0 ==# 0
        let realityline = line('.')
        if 22 > g:debugflag | call Dbug( "clebegin",22,0) | endif
        "call ClearBracket()
        if 22 > g:debugflag | call Dbug( "cleend",22,0) | endif
        if 20 > g:debugflag | call Dbug( "begin1",20,0) | endif
    elseif a:0 != 0
        call cursor(a:1,1)
        let realityline = a:1
    endif
    let col = col('.')
    let foldstring = getline(realityline)
    "echom realityline
    "echom string(expand("%:t"))
    if (count(foldstring,'(') != count(foldstring,')')) || matchstr(foldstring,';') ==# "" || matchstr(foldstring,'{') ==# ""
        if 3 > g:debugflag | call Dbug( "11",3,0) | endif
        let numberlist = MergeLinesOfCode(realityline)
        if numberlist ==# []
            let foldstring = ""
        else
            let srcnum  = numberlist[0]
            let tailnum = numberlist[1]
            if srcnum < tailnum
                let foldstring =  GatherIntoRow(srcnum,tailnum)
            endif
        endif
    endif
    let codelist = add(codelist,foldstring)
    let idx1 = 1
    let lastline = realityline
    while idx1 > 0
        if 11 > g:debugflag | call Dbug( "findbegin",11,0) | endif
        "let col = match(getline('.'), '\S')
        let tempstring = ""
        let tempstring = StandardCharacters(line('.'))
        if tempstring != ""
            let col = match(tempstring, '\S')
        else
            let col = match(getline('.'), '\S')
            call remove(codelist,0)
        endif
        if col > 4
            let start = FindAnotherBracketPosition('}')
        elseif col <= 4
            if matchstr(expand("%:t"),'\.java') != ""
                let idx1 = 0
                let start = FindAnotherBracketPosition('}',1)
            else
                if col ==# 0
                    let idx1 = 0
                    break
                endif
                let start = FindAnotherBracketPosition('}')
            endif
        endif
        if 11 > g:debugflag | call Dbug( "findend",11,0) | endif
        let foldstring = StandardCharacters(start[0])
        if !(CheckStringIsObtainOfList(foldstring,g:nonfunctionlist))
            let functionline = start[0]
        endif
        if 11 > g:debugflag | call Dbug( foldstring,11,0) | endif
        "目标行格式不对
        if 11 > g:debugflag | call Dbug( "ifbegin",11,0) | endif
        if ((count(foldstring,'(') != count(foldstring,')')) && matchstr(foldstring,") {") ==# ") {") || matchstr(foldstring,"  implements ") != ""
            let numberlist = MergeLinesOfCode(start[0])
            let srcnum  = numberlist[0]
            let tailnum = numberlist[1]
            if srcnum <= tailnum
                let foldstring =  GatherIntoRow(srcnum,tailnum)
            endif
        endif
        "当前是switch
        if matchstr(foldstring," switch")  != ""
            "前一个不是case
            if 11 > g:debugflag | call Dbug( "switbegin",11,0) | endif
            if matchstr(codelist[0]," case .*:")  ==# ""
                let end = FindAnotherBracketPosition('{')
                let tempchar = getline(start[0],end[0])
                let idk1 = lastline - start[0]
                while idk1 > 0
                    let tempstring = ""
                    let tempstring = matchstr(tempchar[idk1],"^.*case .*:")
                    if tempstring != ""
                        let codelist = insert(codelist,tempstring)
                        break
                    endif
                    let idk1 -= 1
                endwhile
            endif
            if 11 > g:debugflag | call Dbug( "switchend",11,0) | endif
        endif
        let codelist = insert(codelist,foldstring)
        call cursor(start[0],start[1])
        let lastline = start[0]
        if 11 > g:debugflag | call Dbug( "ifend",11,0) | endif
    endwhile
    let tempstring =  ""
    if a:0 ==# 0
        let idx1 = 0
        let stackflag = 1
        while idx1 < len(codelist)
            let result = WhichFunctionIsIn(codelist[idx1])
            if IdentificationCodeComponents(codelist[idx1],filetype) ==# "func"
                if stackflag > 0
                    if result != ""
                        if tempstring ==# ""
                            let tempstring =  result
                        else
                            let tempstring = tempstring . "█" . result
                        endif
                    endif
                    let stackflag -= 1
                endif
            else
                if result != ""
                    if tempstring ==# ""
                        let tempstring =  result
                    else
                        let tempstring = tempstring . "█" . result
                    endif
                endif
            endif
            let idx1 += 1
        endwhile

        let path = expand("%:p")
        let path =  substitute(path , g:homedir . '/' , '', 'g')
        let codelist = insert(codelist,path.':'. realityline  .':')
        call cursor(realityline,col)
        let @d = string(codelist)
        call AddNumber3(codelist)
        if filetype ==# "cc"
            let tempstring = expand("%:t") . "█" . tempstring
        endif
        echo tempstring
    elseif a:0 ==# 1
        call cursor(realityline,col)
        let idx1 = 0
        let stackflag = 1
        while idx1 < len(codelist)
            let result = WhichFunctionIsIn(codelist[idx1])
            if IdentificationCodeComponents(codelist[idx1],filetype) ==# "func"
                if stackflag > 0
                    if result != ""
                        if tempstring ==# ""
                            let tempstring =  result
                        else
                            let tempstring = tempstring . "█" . result
                        endif
                    endif
                    let stackflag -= 1
                endif
            else
                if result != ""
                    if tempstring ==# ""
                        let tempstring =  result
                    else
                        let tempstring = tempstring . "█" . result
                    endif
                endif
            endif
            let idx1 += 1
        endwhile
        if filetype ==# "cc"
            let tempstring = expand("%:t") . "█" . tempstring
        endif
        return tempstring
    elseif a:0 ==# 2
        call cursor(realityline,col)
        return functionline
    endif
endfunction
"}}}}}

"{{{{{2   FillInNotes(...) 填充关键代码
nnoremap <leader>p :call FillInNotes()<cr>
"```c
"由什么搜索过来的
"当前关键代码行
"代码流程图上的注释
"文件+行数
"code
"```
function! FillInNotes(...)
    "{{{{{3 变量定义
    let codelist = []
    "}}}}
    let codelist = eval(@d)
    let codelist = insert(codelist,"")
    let codelist = insert(codelist,codelist[-1])
    if len(@i) > 1 && @i != codelist[-1]
        let codelist = insert(codelist,@i)
    else
        let codelist = insert(codelist," ")
    endif
    let codelist = insert(codelist,"")
    let codelist = insert(codelist,"")
    let codelist = insert(codelist,"```c")
    let codelist = add(codelist,"```")
    call setline(line("."),codelist)
    let @i = ""
endfunction
"}}}}}

"{{{{{2   FormatCode(...) 格式化文件
function! FormatCode(...)
    "{{{{{3 变量定义
    let filename = a:1
    let filelist = []
    let filelen = 0
    let idx1 = 0
    let left = 0
    let right = 0
    let tempchar = 0
    let start = 0
    let end = 0
    let flag = 0
    let up = 0
    let middle = 0
    let down = 0
    let col = 0
    let col1 = 0
    let idj1 = 0
    "}}}}
    "把所有括号变成一行
    "let filename = Homedir("aosp/packages/modules/Bluetooth/system/bta/av/bta_av_main.cc",1)
    execute "normal! :tabnew \<cr>:e " . filename . " \<cr>"
    setlocal foldmethod=syntax
    let filelen = line('$')
    let idx1 = 1
    let tempchar = ""
    while idx1 <= filelen
        let flag = 0
        let tempchar = getline(idx1)
        let left = count(tempchar,'(')
        let right = count(tempchar,')')
        call cursor(idx1,1)
        redraw
        "echo idx1
        "echo tempchar
        "call input("11")
        if idx1 == 798
        endif
        if  (matchstr(tempchar,") {") ==# ") {"  ||  (count(tempchar,')') != 0 && count(tempchar,'{') != 0)) || (matchstr(tempchar,");") ==# ");"  ||  (count(tempchar,')') != 0 && count(tempchar,';') != 0))
            "锁定行中带){的行 和);的行
            let end = idx1
            silent execute "normal! $F)%"
            let start = line('.')
            if left != right && start < end
                let flag = 1
            endif
            if flag ==# 1
                "去除多行里面的注释
                silent execute ":" . (start) . "," . end . "y"
                let tempchar = @@
                "把//注释清理
                if matchstr(tempchar,"//") != ""
                    silent execute ":" . (start) . "," . end . "s/\\/\\/.*$//g"
                endif
                "把/* 注释清理 错误了会导致问题
                "if  matchstr(tempchar,'\/\*') != ""
                "    silent execute ":" . (start) . "," . end . "s/\\/\\*.*$//g"
                "endif
                "把文件开头到第一个字符的空口清理
                silent execute ":" . (start + 1) . "," . end . "s/^\\s\\+//g"
                call cursor(start,1)
                "把换行符去掉
                silent execute ":" . start . "," . (end - 1) . ":s/\\n//g"
                silent execute "normal! \<esc>"
                let idx1 = start -1
            else
                if (count(tempchar,'  .') != 0) || (count(tempchar,"  :") != 0)
                    "锁定 . 或者  ：的行
                    if matchstr(getline((idx1)),"//") != ""
                        silent execute ":" (idx1) . "s/\\/\\/.*$//g"
                    endif
                    silent execute ":" . (idx1) . "s/^\\s\\+//g"
                    silent execute ":" . (idx1 -1) . ":s/\\n//g"
                    let idx1 = idx1 -2
                endif
            endif
        elseif (count(tempchar,'{') != 0) && (count(tempchar,')') ==# 0)  && split(tempchar)[0] ==# '{'
           "锁定关键词和{不在同一行,花括号直接占一行
           if matchstr(getline((idx1 - 1)),"//") != ""
               silent execute ":" (idx1 - 1) . "s/\\/\\/.*$//g"
           endif
           "if  matchstr(getline((idx1 - 1)),'\/\*') != ""
           "    silent execute ":". (idx1 - 1). "s/\\/\\*.*$//g"
           "endif
           silent execute ":" . (idx1) . "s/^\\s\\+//g"
           silent execute ":" . (idx1 - 1) . ":s/\\n//g"
           let idx1 = idx1 -2
       elseif (count(tempchar,'implements') != 0) && (count(tempchar," class ") ==# 0)
           " implements 和 class 不在同一行
           if matchstr(getline((idx1 - 1)),"//") != ""
               silent execute ":" (idx1 - 1) . "s/\\/\\/.*$//g"
           endif
           "if  matchstr(getline((idx1 - 1)),'\/\*') != ""
           "    silent execute ":". (idx1 - 1). "s/\\/\\*.*$//g"
           "endif
           silent execute ":" . (idx1) . "s/^\\s\\+//g"
           silent execute ":" . (idx1 - 1) . ":s/\\n/ /g"
           let idx1 = idx1 -2
       elseif (count(tempchar,'  .') != 0) || (count(tempchar,"  :") != 0)
           "锁定 . 或者  ：的行
           if matchstr(getline((idx1)),"//") != ""
               silent execute ":" (idx1) . "s/\\/\\/.*$//g"
           endif
           silent execute ":" . (idx1) . "s/^\\s\\+//g"
           silent execute ":" . (idx1 -1) . ":s/\\n//g"
           let idx1 = idx1 -2
       elseif (count(tempchar,'implements') != 0) && (count(tempchar,"class") != 0) && (count(tempchar,"Stub") != 0)
           "删掉binder stub的代码
           call cursor(idx1,1)
           let start = idx1
           silent execute "normal! 0f{%"
           let end = line('.')
           silent execute ":" . (start) . "," . end . "d"
           let idx1 = start -1
       elseif ((count(tempchar,' =') != 0) && (count(tempchar,'==') ==# 0) && (count(tempchar,';') ==# 0)) ||((count(tempchar,'append') != 0) && (count(tempchar,';') ==# 0))
           "锁定= 和;不在同一行的行 ,append 和;不在一行的行
           let start  = idx1
           let idj1 = idx1
           while idj1 != -1
               if count(getline(idj1),';') != 0
                   let end = idj1
                   let idj1 = -1
               else
                   let idj1 += 1
               endif
           endwhile
           "去除多行里面的注释
           silent execute ":" . (start) . "," . end . "y"
           let tempchar = @@
           "把//注释清理
           if matchstr(tempchar,"//") != ""
               silent execute ":" . (start) . "," . end . "s/\\/\\/.*$//g"
           endif
           "把/* 注释清理
           "if  matchstr(tempchar,'\/\*') != ""
           "    silent execute ":" . (start) . "," . end . "s/\\/\\*.*$//g"
           "endif
           "把文件开头到第一个字符的空口清理
           silent execute ":" . (start + 1) . "," . end . "s/^\\s\\+//g"
           call cursor(start,1)
           "把换行符去掉
           silent execute ":" . start . "," . (end - 1) . ":s/\\n//g"
           silent execute "normal! \<esc>"
           let idx1 = start
       else
           "行中有不成对的小括号这种行会造成折叠不准确，直接删除
            if left != right
                call cursor(idx1,1)
                let start = idx1
                silent call execute("normal! 0f(")
                let col = col('.')
                silent call execute("normal! 0f(%")
                let col1 = col('.')
                let end = line('.')
                if start ==# end && count(tempchar,'(') != 0 && col ==# col1
                    call cursor(idx1,1)
                    silent execute "normal! dd"
                    let idx1 = idx1 -1
                endif
            endif
            "//{ 和//}的注释行直接删除
            if matchstr(tempchar,'\/\/.*{') != "" || matchstr(tempchar,'\/\/.*}') != ""
                call cursor(idx1,1)
                silent execute ":" idx1 . "s/\\/\\/.*\*\\///g"
                if len(split(getline(idx1))) ==# 0
                    silent execute "normal! dd"
                endif
                let idx1 = idx1 -1
            endif
            " <--------------- 这种行直接删除
            if matchstr(tempchar,"<---------------") != ""
                call cursor(idx1,1)
                silent execute "normal! dd"
                let idx1 = idx1 -1
            endif
        endif
        let filelen = line('$')
        let idx1 += 1
    endwhile
    "删除所有注释，log 打印和空行
    let filelen = line('$')
    let idx1 = 1
    while idx1 <= filelen
        let tempchar = getline(idx1)
        call cursor(idx1,1)
        redraw
        "call input("11")
        if  matchstr(tempchar,'//') != ""  && count(tempchar,';') ==# 0
            call cursor(idx1,1)
            silent execute ":" idx1 . "s/\\/\\/.*$//g"
            call cursor(idx1,1)
            if len(split(getline(idx1))) ==# 0
                silent execute "normal! dd"
            endif
            let idx1 = idx1 -1
        elseif matchstr(tempchar,'//') != ""  && count(tempchar,';') != 0
            silent execute ":" idx1 . "s/\\/\\/.*$//g"
            let idx1 = idx1 -1
        elseif (matchstr(tempchar,'log\..') != ""  && count(tempchar,';') != 0) || (matchstr(tempchar,' log(') != ""  && count(tempchar,';') != 0)
            call cursor(idx1,1)
            silent execute "normal! dd"
            let idx1 -= 1
        elseif matchstr(tempchar,'\/\*') != "" && matchstr(tempchar,'\*\/') ==# ""
            let end = 0
            let start  = idx1
            let idj1 = idx1
            while idj1 != -1
                if count(getline(idj1),"\*\/") != 0
                    let end = idj1
                    let idj1 = -1
                else
                    let idj1 += 1
                endif
            endwhile
            if end != 0
                silent execute ":" . (start) . "," . end . "d"
                let idx1 = start -1
            endif
        elseif matchstr(tempchar,'\/\*') != "" && matchstr(tempchar,'\*\/') != ""
            call cursor(idx1,1)
            silent execute ":" idx1 . "s/\\/\\*.*$//g"
            call cursor(idx1,1)
            if len(split(getline(idx1))) ==# 0
                silent execute "normal! dd"
            endif
            let idx1 = idx1 -1
        elseif len(tempchar) ==# 0
            call cursor(idx1,1)
            silent execute "normal! dd"
            let idx1 = idx1 -1
        endif
        let filelen = line('$')
        let idx1 += 1
    endwhile
    let filelen = line('$')
    let idx1 = 1
    while idx1 <= filelen
        let tempchar = getline(idx1)
        call cursor(idx1,1)
        redraw
        if matchstr(tempchar,'@') != ""  && count(tempchar,'{') ==# 0 && count(tempchar,'}') ==# 0  && count(tempchar,';') ==# 0
            call cursor(idx1,1)
            silent execute "normal! dd"
            let idx1 -= 1
        endif
        let filelen = line('$')
        let idx1 += 1
    endwhile
    execute "normal! :bd" . bufnr('$') ."\<cr>"
    execute "normal! :wq!\<cr>"
endfunction
"}}}}}

 "{{{{{2  AddDebugLog(...) 添加debug日志
nnoremap <F5> :call AddDebugLog()<cr>
"package jni stack 添加debug日志
function! AddDebugLog(...)
    "{{{{{3 变量定义
    let packagechar = "Log.e"
    let jnichar = "ALOGE"
    let stackchar = "__android_log_print(6,\""
    let debugchar = "tangxinlou debug "
    let functionname = " new Object(){}.getClass().getEnclosingMethod().getName()"
    let line = 0
    let TAGchar = "\"txl\""
    let abnormallist = [" super(",
                \" this("]
    let funcflag = "__FUNCTION__"
    let casestr = ""
    let tempchar = ""
    let cursor = []
    let vimrcdebug = ""
    "}}}}
    if a:0 == 0
        let line = line('.')
        if matchstr(expand('%:t'),"vimrc") != "vimrc"
            if g:debugid ==# 0
                echo "上一次最后保存的debugid" . string(@s)
                let g:debugid = input("设置初始debug值")
            endif
        endif
    else
        let line = a:1

        let tempchar = a:2
        if matchstr(tempchar,'"') != ""
            let tempchar = substitute(tempchar, '\"', '', 'g')
        endif
        let tempchar = "\""  . tempchar . "\""
        let functionname = tempchar
        let casestr = tempchar
    endif
    echo "g:debugid" . g:debugid

    let filename = expand("%:t") . ":" . (line + 1)
    set noignorecase
    if search(" TAG = ") != 0
        let TAGchar = "TAG"
    endif
    if matchstr(expand('%:t'),".cpp") ==# ".cpp"
        let jnichar = jnichar . "(\"" . debugchar . g:debugid ."\");"
        call append(line('.'),jnichar)
    elseif  matchstr(expand('%:t'),".cc") ==# ".cc"

        if search("#include <android\/log.h>") ==# 0
            silent execute "normal! gg"
            if search("#include") ==# 0
            else
                let stackchar = stackchar  . filename . " "  . casestr  . "\",\"" . debugchar .  g:debugid ." %s\"," . funcflag .  ");"
                call append(line,stackchar)
                call cursor(line + 1,1)
                silent execute "normal! =="

                silent execute "normal! gg"
                call  search("#include")
                call append(line('.'),"#include <android\/log.h>")
                if line('.') < line
                    let line += 1
                endif
            endif
        else
            let stackchar = stackchar  . filename . " "  . casestr  . "\",\"" . debugchar .  g:debugid ." %s\"," . funcflag .  ");"
            call append(line,stackchar)
            call cursor(line + 1,1)
            silent execute "normal! =="
        endif
        call cursor(line,1)
    elseif  matchstr(expand('%:t'),".java") ==# ".java"
        let packagechar  = packagechar   . "(" . TAGchar . ",\"" . filename ." " .  debugchar . g:debugid  . "\" + " . functionname . ");"
        if CheckStringIsObtainOfList(getline(line + 1),abnormallist)
            call cursor(line + 1,1)
            silent execute "normal! 0f(%"
            call append(line('.'),packagechar)
            call cursor(line('.') + 1,1)
            let line = line('.')
        else
            call append(line,packagechar)
            call cursor(line + 1,1)
        endif
        silent execute "normal! =="
        if search("import \.*.Log;") ==# 0
            silent execute "normal! gg"
            call search("^package ")
            call append(line('.'),"import com.android.bluetooth.vivo.Log;")
            if line('.') < line
                let line += 1
            endif
        endif
        call cursor(line,1)
    elseif matchstr(expand('%:t'),"vimrc") ==# "vimrc"
        call cursor(line,1)
        let cursor = searchpairpos('function!', '', 'endfunction', 'b')
        let tempchar = getline(cursor[0])
        echom tempchar
        echom line
        let tempchar = split(tempchar,'(')[0]
        let tempchar = split(tempchar)[-1]
        let tempchar = string(tempchar . " " . g:vimrcid)
        let vimrcdebug = "call Dbug1( ,10,0 ,". tempchar .")"
        call cursor(line,1)
        call append(line('.'),vimrcdebug)
        call cursor(line + 1,1)
        silent execute "normal! =="
        call search("(")
        let g:vimrcid += 1
        call setline(2,"let g:vimrcid = " . g:vimrcid)
    endif

    set ignorecase
    let @s = g:debugid
    let g:debugid += 1
    return line
endfunction
"}}}}}

"{{{{{2  ListFunctionAamesAndClassNames(...) 列出函数名和类名
"列出函数名和类名
function! ListFunctionAamesAndClassNames(...)
    "{{{{{3 变量定义
    let codelist = copy(a:1)
    let idx1 = 0
    "在这个列表就不选中
    let uncheck = ["if(",
                \"if (",
                \"try{",
                \"try {",
                \"for(",
                \"for (",
                \"synchronized (",
                \"synchronized(",
                \"switch (",
                \"else{",
                \"else {",
                \"case ",
                \"default:",
                \"do {",
                \"do {",
                \"switch ",
                \"while (",
                \"while(",
                \"<-----",
                \"static {",
                \"static{"]
    let uncheckflag = 0
    let tempcodelist = []
    "}}}}
    while idx1 < len(codelist)
        let uncheckflag = 0
        for char in uncheck
            if "" != matchstr(codelist[idx1],char)
                let uncheckflag = 1
            endif
        endfor
        if uncheckflag ==# 0
            let tempcodelist = add(tempcodelist,codelist[idx1])
        endif
        let idx1 += 1
    endwhile
    let codelist = tempcodelist
    return codelist
endfunction
"}}}}}

"{{{{{2 function!  OrganizeJavaCodeLogic(...) 整理代码逻辑
function! OrganizeJavaCodeLogic(...)
    "{{{{{3 变量定义
    let files = []
    let filename = ""
    let classdict = {}
    let idx1 = 0
    "}}}}
    let files = split(system("find -iname '*.java'"),"\n")
    while idx1 < len(files)
        let filename = split(files[idx1],'/')[-1]
        let classdict[filename] = ParseCodeFiles(files[idx1],1)
        let idx1 += 1
    endwhile
    call append(line('.'),string(classdict))
endfunction
"}}}}}

"{{{{{2 function!  SimplifyCurrentFileFunctions(...)           简化当前文件的函数                  普通模式sif调用
nnoremap sif :call SimplifyCurrentFileFunctions()<cr>
function! SimplifyCurrentFileFunctions(...)
    "{{{{{3 变量定义
    let filename = ""
    let codedict = []
    let codelist = []
    let winwidthnum = 0
    let line = 0
    let col = 0
    let winnrnum = 0
    let winid = 0
    let resultdict = {}
    let mode = 0
    let classlist = []
    let classmember = []
    let binder = []
    let functionname = []
    let classname = []
    let functionnameline = []
    let functionlength = []
    let classlength = []
    let listlength = 0
    let curlitem = ""
    let nextitem = ""
    let tempchar = ""
    let templist = []
    let indexnum = 0
    let resultdict = {}
    let resultdictkeyslist = []
    let functionindex = -1
    let classindex = -1
    let tempdictkeyname = ""
    let tempdictvaluename = ""
    let codelist111 = []
    let dictfiles = {}
    "}}}}
    if a:0 ==# 0
        let winnrnum = tabpagewinnr(tabpagenr(),'$')
        echo winnrnum
        if winnrnum  >  1
            execute "normal! \<c-w>h"
            execute "normal! :q!\<cr>"
        endif
        let filename = expand("%:p")
    else
        let filename = a:1
        let mode = a:2
        execute "normal! :tabnew \<cr>:e " . filename . " \<cr>"
        setlocal foldmethod=syntax
        redraw
    endif
    let winid = win_getid()
    let line = line('.')
    let col = col('.')
    let tempkey = split(filename,'/')[-1]
    let dictfiles[tempkey] = InventoryFiles(filename,1)
    call Dbug("函数行数",3)
    let  functionlength = dictfiles[tempkey]["twicelist"][2]
    echo functionlength
    call Dbug("类行数",3)
    let classlength = dictfiles[tempkey]["twicelist"][6]
    echo classlength
    call Dbug("类名字",3)
    let classname = dictfiles[tempkey]["twicelist"][5]
    echo classname
    call Dbug("函数名字",3)
    let functionname = dictfiles[tempkey]["twicelist"][0]
    echo functionname
    call  Dbug("函数名字行数",3)
    let  functionnameline = dictfiles[tempkey]["twicelist"][3]
    call Dbug(functionnameline,3)
    call Dbug("所有成员",3)
    let idx1 = 1
    "逐个搜索当前文件的函数
    while idx1 < len(functionname)
        let templist = split(EncapsulateDifferentGrep(filename,"fuc",functionname[idx1]),"\n")
        let tempnr = functionnameline[idx1]
        let functionindex1 = LogicalJudgment(functionlength,tempnr,'I')
        let classindex1 = LogicalJudgment(classlength,tempnr,'I')
        "被调用的函数
        let tempdictvaluename   = functionnameline[functionindex1] . '-' . classname[classindex1] . '-' .functionname[functionindex1]
       " if  functionname[idx1] ==#  "ConnectionStateChangedReceiver"
       "     echo tempnr
       "     echo functionindex1
       "     echo classindex1
       "     echo "tangxinlou2"
       "     echo tempdictvaluename
       " endif
        if len(templist) != 0
            for item in templist
                let tempnr = split(item,':')[0]
                if count(functionnameline,str2nr(tempnr)) ==# 0
                    let functionindex = LogicalJudgment(functionlength,tempnr,'I')
                    let classindex = LogicalJudgment(classlength,tempnr,'I')
                    "调用者
                    let tempdictkeyname  = functionnameline[functionindex] . '-' . classname[classindex] . '-' .functionname[functionindex]
                    if has_key(resultdict,tempdictkeyname) ==# 0
                        let resultdict[tempdictkeyname] = {}
                    endif
                    let resultdict[tempdictkeyname][str2nr(tempnr)] = tempdictvaluename
                endif
            endfor
        endif
        let idx1 += 1
    endwhile
    call Dbug("未替换的字典",3)
    "字典按照字典名 = 函数所在行数 + 类名 + 函数名   key 行数：valus =  函数所在行数 + 类名 + 函数名
    echo resultdict
    let resultdictkeyslist = keys(resultdict)
    let g:charinterval = '-'
    let g:listnumber = 0
    let g:listmembertype = "nr"
    let g:comparedirect = "s-b"
    let resultdictkeyslist = sort(resultdictkeyslist,"MyCompare")
    call Dbug("字典的key",3)
    call Dbug(resultdictkeyslist,3)
    echo resultdictkeyslist

    let codelist111 = []
    let resultdict = LoopThroughDictionaries(resultdict,deepcopy(resultdict),"respace",0)
    call Dbug("替换后的字典",3)
    call Dbug(resultdict,3)
    call  LoopThroughDictionaries(resultdict,codelist111,"print",0)
    call Dbug("打印后的字典",3)
    echo resultdict
    echo codelist111
    call input("11")
    if a:0 ==# 0
        let winwidthnum  = float2nr(winwidth('%')  * 0.3)
        execute "normal! :vne\<cr>"
        execute "vert resize " . winwidthnum
        "call setline(1,codedict["codelist"])
        call setline(1,codelist111)
        execute "normal! \<c-w>l"
        call cursor(line,col)
        let @/ = "█1█.*$"
        redraw
    else
        if mode ==# 1
            let codelist = ListFunctionAamesAndClassNames(codelist)
        endif
        call cursor(line,col)
        let &foldlevel=100
        execute "normal! :wq!\<cr>"
        return resultdict
    endif
endfunction
"}}}}}

"{{{{{2   EncapsulateDifferentGrep(...) 封装grep 指令
function! EncapsulateDifferentGrep(...)
    "{{{{{3 变量定义
    let filename = a:1
    let greptype = a:2
    let grepchar = a:3
    let revertchar = '@' . grepchar
    let revertgrepcmd = "grep -v "
    let revertgrepcmd = "grep -v "  .  revertchar
    if filename ==# ""
        let grepcmd = "grep -Esnrw --binary-files=without-match  --include=*{.c,.cc,.cpp,.java,.h} "
    else
        let grepcmd = "grep -Esnrw --binary-files=without-match --include=*{.c,.cc,.cpp,.java,.h} "
    endif
    let result = ""
    "}}}}
    if greptype ==# "fuc"
        "let grepchar = '"' . grepchar . '\(|' . grepchar . ' |' . grepchar. ',' .'"'
        let grepchar = '"' . grepchar  .'" '
        let grepcmd = grepcmd . grepchar . filename
        silen echom grepcmd
        silent echom revertgrepcmd
        let result = system(grepcmd . " | " . revertgrepcmd)
    elseif greptype ==# "class"
        let grepchar = '"class ' . grepchar  .'" '
        let grepcmd = grepcmd . grepchar . filename
        silent echom grepcmd
        let result = system(grepcmd)
    endif
    return result
endfunction
"}}}}}

"{{{{{2   LoopThroughDictionaries(...) 循环处理字典
function! LoopThroughDictionaries(...)
    "{{{{{3 变量定义
    let Loopdict = deepcopy(a:1)
    let Loopconstant = a:2
    let Loopfunc = a:3
    let loopflag = a:4
    let looptypes = ""
    let loopkeylist = []
    let idx1 = 0
    let tempmember = ""
    let tempmemberkey = ""
    let tempchar = ""
    let tempchar1 = "├──"
    let tempchar2 = "│  █"
    "}}}}
    let loopkeylist = keys(Loopdict)
    let g:charinterval = '-'
    let g:listnumber = 0
    let g:listmembertype = "nr"
    let g:comparedirect = "s-b"
    let loopkeylist  = sort(loopkeylist,"MyCompare")
    let tempkey = ""
    if Loopfunc ==# "respace"
        "递归替换
        while idx1 < len(loopkeylist)
            let tempmember = deepcopy(Loopdict[loopkeylist[idx1]])
            let tempmemberkey = deepcopy(loopkeylist[idx1])
            let looptypes = type(tempmember)
            if looptypes ==# 1   "字典成员是字符
                if has_key(Loopconstant,tempmember) ==# 1
                    call remove(Loopdict,tempmemberkey)
                    let tempmemberkey = tempmemberkey  . '-' . tempmember
                    let Loopdict[tempmemberkey] = LoopThroughDictionaries(deepcopy(Loopconstant[tempmember]),Loopconstant,Loopfunc,loopflag - 1)
                else
                    call remove(Loopdict,tempmemberkey)
                    let tempmemberkey = tempmemberkey  . '-' . tempmember
                    let Loopdict[tempmemberkey] = tempmember
                endif
            elseif looptypes ==# 4  "字典成员是字典
                let Loopdict[tempmemberkey] = LoopThroughDictionaries(tempmember,Loopconstant,Loopfunc,loopflag - 1)
            endif
            let idx1 += 1
        endwhile
        return Loopdict
    elseif Loopfunc ==# "print"
        while idx1 < len(loopkeylist)
            let tempmember = deepcopy(Loopdict[loopkeylist[idx1]])
            let tempmemberkey = deepcopy(loopkeylist[idx1])
            let looptypes = type(tempmember)
            if looptypes ==# 1   "字典成员是字符
                let tempchar = ""
                let tempchar =  repeat(tempchar2,loopflag) . tempchar1
                let Loopconstant = add(Loopconstant , loopflag . "█" . tempchar .  "█" . tempmemberkey)
            elseif looptypes ==# 4  "字典成员是字典
                let tempchar = ""
                let tempchar =  repeat(tempchar2,loopflag) . tempchar1
                let Loopconstant = add(Loopconstant , loopflag . "█" . tempchar .  "█" . tempmemberkey)
                call LoopThroughDictionaries(tempmember,Loopconstant,Loopfunc,loopflag + 1)
            endif
            let idx1 += 1
        endwhile
    endif
endfunction
"}}}}}

"{{{{{2  function! TagListFiles(...) 列出当前变量在当前文件分布
let g:Tagwindidlistvalue = []
let g:Tagwindidlistkey = []
function! TagListFiles(...)
    "{{{{{3 变量定义
    let tagwinidvalue = 0
    let tagwinidkey = 0
    let winwidthnum  = float2nr(winwidth('%')  * 0.2)
    let indexnum = -1
    let filename = expand("%:p")
    let keywords = @@
    let grepchar = "grep -Esin  "
    let searchstarge =  ""
    "}}}}

    if count(g:Tagwindidlistkey,tagwinidvalue) != 0
        return
    endif
    let command  = grepchar . " \"" .  keywords   . "\" " . filename
    let searchstarge =  split(system(command),'\n')
    echo searchstarge
    let tagwinidvalue = win_getid()
    if count(g:Tagwindidlistvalue,tagwinidvalue) ==# 0
        silent execute "normal! :vne\<cr>"
        call  execute(["vert resize " . winwidthnum])
        let tagwinidkey = win_getid()
        let g:Tagwindidlistvalue = add(g:Tagwindidlistvalue,tagwinidvalue)
        let g:Tagwindidlistkey = add(g:Tagwindidlistkey,tagwinidkey)
    else
        let indexnum = index(g:Tagwindidlistvalue,tagwinidvalue)
        if win_gotoid(g:Tagwindidlistkey[indexnum]) ==# 0
            call remove(g:Tagwindidlistvalue,indexnum)
            call remove(g:Tagwindidlistkey,indexnum)
            silent execute "normal! :vne\<cr>"
            call  execute(["vert resize " . winwidthnum])
            let tagwinidkey = win_getid()
            let g:Tagwindidlistvalue = add(g:Tagwindidlistvalue,tagwinidvalue)
            let g:Tagwindidlistkey = add(g:Tagwindidlistkey,tagwinidkey)
        endif
    endif
endfunction
"}}}}}

"{{{{{2 function!  InventoryFiles(...) 清查当前文件
"二级表
" 函数名 类型,分布,首行,参数,classname classrang,末行

"类管理函数
"{子类:[],子函数:[]}
"
"
function! InventoryFiles(...)
    "{{{{{3 变量定义
    let twicelist = []
    let typelist = []
    let ranglist = []
    let filename = a:1
    let filetype = a:2
    let firstlinelist = []
    let lastlinelist = []
    let parameterlist = []
    let classdict = {}
    let functionnamelist = []
    let idx1 = 0
    let lastclass = ""
    let classname = []
    let classrang = []
    "}}}}
    let codedict = ParseCodeFiles(filename,1)
    let codelist = codedict["codelist"]
    "获取函数首行和尾行
    let ranglist  = GetOneOfTheColumns(codelist,"█",0)
    "提取关键节点,函数名列表，函数首行列表，class列表，class 成员列表
    let listlength = len(codelist)
    for i in range(0,listlength - 1)
        let curlitem = codelist[i]
        if matchstr(curlitem,"class") != ""
            let tempchar = split(curlitem,'█')[-1]
            let tempchar = split(tempchar)
            let indexnum = index(tempchar,"class")
            let functionnamelist  = add(functionnamelist,tempchar[indexnum + 1])
            let classname = add(classname,tempchar[indexnum + 1])
            let tempchar = split(curlitem,'█')[0]
            let tempchar = str2nr(split(tempchar,'-')[0])
            let firstlinelist  = add(firstlinelist,tempchar)
            let tempchar = split(curlitem,'█')[0]
            let tempchar = str2nr(split(tempchar,'-')[1])
            let lastlinelist  = add(lastlinelist,tempchar)
            let typelist = add(typelist,"class")
            let parameterlist = add(parameterlist,0)
            let classrang = add(classrang,ranglist[i])
        else
            let tempchar = split(curlitem,'█')[-1]
            let tempchar = split(tempchar,'(')[0]
            let tempchar = split(tempchar)
            let functionnamelist  = add(functionnamelist ,tempchar[-1])
            let tempchar = split(curlitem,'█')[0]
            let tempchar = str2nr(split(tempchar,'-')[0])
            let firstlinelist  = add(firstlinelist,tempchar)
            let tempchar = split(curlitem,'█')[0]
            let tempchar = str2nr(split(tempchar,'-')[1])
            let lastlinelist  = add(lastlinelist,tempchar)
            let typelist = add(typelist,"func")
            let parameterlist = add(parameterlist,count(curlitem,",") + 1)
        endif
    endfor
    let twicelist = add(twicelist,functionnamelist)
    let twicelist = add(twicelist,typelist)
    let twicelist = add(twicelist,ranglist)
    let twicelist = add(twicelist,firstlinelist)
    let twicelist = add(twicelist,parameterlist)
    let twicelist = add(twicelist,classname)
    let twicelist = add(twicelist,classrang)
    let twicelist = add(twicelist,lastlinelist)
    echo twicelist
    let idx1 = 0
    let parentclass = ""
    let childclass = ""
    let childfunc = ""
    let index = 0
    let tempkey = ""
    while idx1 < len(typelist)
        let tempkey = ""
        if typelist[idx1] ==# "class"
            let tempkey = functionnamelist[idx1]
            if has_key(classdict,tempkey) ==# 0
                let classdict[tempkey] = {}
            endif
            "let index = LogicalJudgment(classrang,firstlinelist[idx1],'I')
            "if classname[index] != functionnamelist[idx1]
            "endif
        elseif typelist[idx1] ==# "func"
            let index = LogicalJudgment(classrang,firstlinelist[idx1],'I')
            let tempkey = classname[index]
            if has_key(classdict,tempkey) ==# 0
                let classdict[tempkey] = {}
            endif
            if has_key(classdict[tempkey],"childfunc") ==# 0
                let classdict[tempkey]["childfunc"] = []
            endif
            let classdict[tempkey]["childfunc"] = add(classdict[tempkey]["childfunc"],firstlinelist[idx1])
        endif
        let idx1 += 1
    endwhile

    if has_key(classdict,"twicelist") ==# 0
        let classdict["twicelist"] = []
    endif
    let classdict["twicelist"] = twicelist
    echo classdict
    return classdict
endfunction
"}}}}}

"{{{{{2   WhichFunctionIsIn(...) 此行代码在哪个函数里面
function! WhichFunctionIsIn(...)
    "{{{{{3 变量定义
    let codestring = copy(a:1)
    let templist = []
    let tempchar = ""
    "}}}}
    "函数
    "判断
    "调用
    if matchstr(codestring,"class ") != ""
        let templist = split(codestring)
        let indexnum = index(templist,"class")
        return templist[indexnum + 1]
    elseif matchstr(codestring," interface ") != ""
        let templist = split(codestring)
        let indexnum = index(templist,"interface")
        return templist[indexnum + 1]
    elseif  matchstr(codestring,";") != ""
    elseif  join(split(codestring)) ==# "{"
    elseif  matchstr(codestring,"case ") != ""
        let tempchar = matchstr(codestring," case .*:")
        if tempchar  != ""
            return join(split(tempchar))
        else
            return join(split(codestring))
        endif
    elseif !(CheckStringIsObtainOfList(codestring,g:nonfunctionlist))
        "echom  codestring
        let codestring = split(codestring,'(')[0]
        let templist = split(codestring)
        return templist[-1]
    endif
    return ""
endfunction
"}}}}}

"{{{{{2   WhichFunctionToCall(...) 此行调用哪个函数
function! WhichFunctionToCall(...)
    "{{{{{3 变量定义
    let line = a:1
    let codestring =  ""
    "}}}}
    "按照标准代码获取整行
    set noignorecase
    let numberlist = MergeLinesOfCode(realityline)
    let srcnum  = numberlist[0]
    let tailnum = numberlist[1]
    if srcnum <= tailnum
        let codestring  =  GatherIntoRow(srcnum,tailnum)
    endif
    if matchstr(codestring,';') != ""
        if count(codestring,'(') ==# 0 && count(codestring,')') ==# 0
        else

        endif
    else
    endif
    "判断当前行是否继续调用函数
      "有分号行
        "单纯赋值没有调用
        "回调
        "调用函数
         "调用本文件函数
         "调用其他文件函数
           "找到这个函数的类
      "无分号行
        "调用几个函数
    set ignorecase
    return ""
endfunction
"}}}}}

"{{{{{2   CallStack(...) 打印调用栈
function! CallStack(...)
    "{{{{{3 变量定义
    let mode = a:1
    let result = a:2
    let line = a:3
    let flag = a:4
    let laststackstring = copy(a:5)
    let searchstarge = ""
    let g:debugflag = 20
    let idx1 = 0
    let templist = ""
    let tempchar = ""
    let stackstring = ""
    let allstackstring = a:6
    let path = expand("%")
    let debugflag = "false"
    let calledstring = ""
    let index = -1
    "}}}}
    if mode ==# 0
        "当前行是怎么调用下来的

        "当前行是在哪个函数里面
        if laststackstring ==# ""
            let laststackstring  = ExtractKeyCodes(line)
        endif
        let result = add(result,repeat(" ",flag * 4) . laststackstring)
        "所在的函数在哪些地方被调用
        if matchstr(laststackstring,"case ") != ""
            let index = count(laststackstring,"case ")
            let index = -1 - index
            let tempchar = split(laststackstring,"█")[index]
        else
            echom laststackstring
            let tempchar = split(laststackstring,"█")[-1]
        endif
        if count(tempchar,"::") != 0
            let tempchar = split(tempchar ,"::")[-1]
        endif
        let searchstarge  = EncapsulateDifferentGrep("","fuc",tempchar)
        let searchstarge = SelectEntireCode(copy(searchstarge))
        let resultlist = ResultClassification(searchstarge)
        if debugflag ==# "true"
            echom tempchar
            echom string(laststackstring)
            echom string(resultlist)
        endif
        "if len(resultlist[0]) != 0 && flag < 6
        if len(resultlist[0]) != 0
            "有调用
            let resultlist[0] = ListTo1D(resultlist[0] ,"█")
            let idx1 = 0
            while idx1 < len(resultlist[0])
                "当前行是怎么被调用下来的
                let templist = split(resultlist[0][idx1],":")
                if debugflag ==# "true"
                    echom resultlist[0][idx1]
                endif
                call SwitchBuff(templist[0])
                echom templist[0]
                echom string(templist[1])
                echom tempchar
                let calledstring = FindTheCalledParty(templist[1],tempchar)
                if  calledstring  ==#  ""
                    call Dbug1(resultlist[0][idx1],10,0 ,'CallStack 4 这个函数识别错误')
                elseif matchstr(laststackstring,calledstring) ==# calledstring
                    let stackstring = ExtractKeyCodes(templist[1])
                    if debugflag ==# "true"
                    endif
                    if stackstring ==# laststackstring
                        let result = add(result,repeat(" ",(flag + 1) * 4) . stackstring)
                    else
                        if count(allstackstring,stackstring) ==# 0
                            let allstackstring = add(allstackstring,copy(stackstring))
                            if  flag < 5
                                call CallStack(0,result,templist[1],copy(flag  + 1),stackstring,allstackstring)
                            endif
                        else
                            let result = add(result,repeat(" ",(flag + 1) * 4) . stackstring)
                        endif
                    endif
                endif
                let idx1 += 1

            endwhile
        else
            "没有调用

        endif
        if flag ==# 0
            echom string(result)
            call SwitchBuff(path)
            call cursor(line,1)
            let g:debuglist = result
            return result
            syntax on
        endif
    elseif mode ==# 1
        "当前行调用了哪些接口
        "


    endif
    return ""
endfunction
"}}}}}

"{{{{{2 function!  IdentificationCodeComponents(...) 识别当前行代码成分,是函数定义，调用，赋值，还是判断
function! IdentificationCodeComponents(...)
    "{{{{{3 变量定义
    let codestring = a:1
    let filetype = a:2
    let matchstr = ""
    if a:0 ==# 3
        let matchstr = a:3
    endif
    let flag = ""
    let package = 0                    "包名
    let import = 1                     "导包
    let class = 2                      "类
    let def = 3                        "定义值
    let specify = 4                    "赋值指定值
    let specifydef = 5                 "定义并指定初值
                                       "判断
    let judge = ["if (",
                \"if(",
                \"for(",
                \"for (",
                \]
    "let cycle = 7                      "循环
    let cycle   = [" for (",
                \" for(",
                \" while(",
                \" while (",
                \]

                                        "switch
    let switch  = [" switch (",
                \" switch(",
                \]
    let case = 9                       "case
    let default = 10                   "default
    let return = 11                    "返回值
    let call = 12
    let func = 13
    let statement = 14
    let break = 15
    "}}}}
     "判断当前行是否继续调用函数
      "有分号行
        "单纯赋值没有调用
        "回调
        "调用函数
         "调用本文件函数
         "调用其他文件函数
           "找到这个函数的类
      "无分号行
        "调用几个函数
        if matchstr(codestring," case ") != ""
            let flag = flag . "case"
            return flag
        elseif matchstr(codestring," break") != ""
            let flag = flag . "break"
            return flag
        elseif matchstr(codestring," default:") != ""
            let flag = flag . "default"
            return flag
        elseif matchstr(codestring,";") != ""
            "{{{{3 有分号
            if CheckStringIsObtainOfList(codestring,judge)
                let flag = flag . "judge;"
                return flag
            endif
            if matchstr(codestring,"package ") != ""
                let flag = flag . "package"
                return flag
            endif
            if matchstr(codestring,"import ") != ""
                let flag = flag . "import"
                return flag
            endif


            if matchstr(codestring," return ") != ""
                let flag = flag . "return"
                if  matchstr(codestring,"(") != ""
                    let flag = flag . "call"
                endif
                return flag
            endif
            if matchstr(codestring," default:") != ""
                let flag = flag . "default"
                return flag
            endif

            if matchstr(codestring," =") != ""
                let flag = flag . "specify"
                if len(split(split(codestring," = ")[0])) > 1
                    let flag = flag . "def"
                endif
                if  matchstr(codestring,"(") != ""  && matchstr(codestring,'"(') ==# ""
                    let flag = flag . "call"
                endif
                return flag
            endif



            if  matchstr(codestring,"(") != ""
                if len(split(split(codestring,"(")[0])) ==# 1
                    let flag = flag . "call"
                else
                    let flag = flag . "statement"
                endif
                return flag
            endif

            if len(split(codestring)) > 1
                let flag = flag . "def"
                return flag
            endif
            "}}}}
        elseif  matchstr(codestring,"{") != ""
            "{{{{3  有括号
            if CheckStringIsObtainOfList(codestring,switch)
                let flag = flag . "switch"
                return flag
            endif
            if CheckStringIsObtainOfList(codestring,judge)
                let flag = flag . "judge"
                return flag
            endif
            if CheckStringIsObtainOfList(codestring,cycle)
                let flag = flag . "cycle"
                return flag
            endif
            if matchstr(codestring," class ") != ""
                let flag = flag . "class"
                return flag
            endif

            if !CheckStringIsObtainOfList(codestring,g:nonfunctionlist)
                let flag = flag . "func"
                return flag
            endif

            "}}}}
        endif
    return "unkonwn"
endfunction
"}}}}}

"{{{{{2   StringComponents(...)判断字符串是什么成分和IdentificationCodeComponents混用
"echo  StringComponents("service","def",getline('.'))
function! StringComponents(...)
    "{{{{{3 变量定义
    let keystr = a:1
    let flag = a:2
    let codestring = a:3
    let tempchar = ""
    let result = 0
    "}}}}
    if flag ==# "def"
        if matchstr(codestring,"=") != ""
            "赋值语句
            let tempchar = split(codestring,";")[0]
            let tempchar = split(tempchar,"=")[0]
            let tempchar = split(tempchar)[-1]
        else
            "非赋值语句
            let tempchar = split(codestring,";")[0]
            let tempchar = split(tempchar)[-1]
        endif
        if tempchar ==#  keystr
            let result = 1
        endif
    "elseif flag ==# "call"
    endif
   return result
endfunction
"}}}}}

"{{{{{2 function!  IdentifyTheCurrentFile(...) 当前文件每行成分
nnoremap <F3> :call IdentifyTheCurrentFile()<cr>
"call IdentifyTheCurrentFile(1396,1401,"","service")
function! IdentifyTheCurrentFile(...)
    "{{{{{3 变量定义
    let codelist = []
    let filename = expand("%:t")
    let filetype =  IsFileType(filename)
    let line = 1
    let numberlist = []
    let srcnum  = -1
    let tailnum = -1
    let codestring  = ""
    let  realityline = -1
    let g:debugflag = 20
    let flag = ""
    let srcline = line
    let tailline = line('$')
    let type = ""
    let matchstr = ""
    if a:0 != 0
        let srcline = a:1
        let tailline = a:2
        let type = a:3
        let matchstr = a:4
        let line = srcline
    endif
    "}}}}
    set noignorecase
    while line <= tailline
        let  realityline = line
        " echo  MergeLinesOfCode(line('.'))
        let numberlist = MergeLinesOfCode(realityline)
        if numberlist != []
            let srcnum  = numberlist[0]
            let tailnum = numberlist[1]
            if srcnum <= tailnum
                let codestring  =  GatherIntoRow(srcnum,tailnum)
                let line = tailnum + 1
                if  matchstr  ==# "" || matchstr(codestring,matchstr) != ""
                    let flag = IdentificationCodeComponents(codestring,filetype)
                    if type ==# "" || matchstr(flag,type) != ""
                        let codestring  = realityline . codestring
                        let codestring  = flag  . "    " . codestring
                        let codelist = add(codelist,codestring)
                    endif
                endif
            else
                let line += 1
            endif
        else
            let line += 1
        endif
    endwhile
    let g:debuglist = codelist
    return codelist
endfunction
"}}}}}

"{{{{{2   FunctionCallParsing(...) 函数调用解析
"call  FunctionCallParsing("               enforceCdmAssociation(service.mCompanionDeviceManager, service,source.getPackageName(), Binder.getCallingUid(), device);", "getCallingUid")
function! FunctionCallParsing(...)
    "{{{{{3 变量定义
    let codestring = a:1
    let funcstring = a:2
    "}}}}
    "for if 里面的子调用，调用里面嵌套调用，子线程调用

endfunction
"}}}}}

"{{{{{2   FuncToDefine(...) 函数调用找到对应函数定义
"echom FuncToDefine(982,1011,"params")
"echo FuncToDefine(ExtractKeyCodes(line('.'),1),line('.'),"service")
"echom FuncToDefine(1785,1797,"receiver")
function! FuncToDefine(...)
    "{{{{{3 变量定义
    let funcline = a:1
    let curline = a:2
    let funcstring = a:3
    let localvariable = ""
    let flag = ""
    let filename = expand("%:t")
    let filetype =  IsFileType(filename)
    let codestring = ""
    let cursor = []
    let tempchar = ""
    let AbsolutePath = expand("%:p:h")
    "}}}}
    "第三种同路径的包名
    let searchstarge  = EncapsulateDifferentGrep(AbsolutePath ,"class",funcstring)
    if matchstr(searchstarge,funcstring) ==# funcstring
        return funcstring
    endif
    "第一种当前函数里面局部变量
    "let localvariable = IdentifyTheCurrentFile(1396,1401,'func\|def',"service")
    "echom  string(IdentifyTheCurrentFile(1785,1797,'def',"service"))
    let localvariable = IdentifyTheCurrentFile(funcline,curline,'def',funcstring)
    if localvariable != []
        let codestring = join(split(localvariable[-1])[2:])
        if  StringComponents(funcstring ,"def",codestring)
            if count(codestring,"<") != 0
                let tempchar = split(codestring,"<")[0]
                let tempchar = split(tempchar)[-1]
            elseif matchstr(codestring,"=") != ""
                let tempchar = split(codestring,";")[0]
                let tempchar = split(tempchar,"=")[0]
                let tempchar = split(tempchar)[-2]
            else
                let tempchar = split(codestring,";")[0]
                let tempchar = split(tempchar)[-2]
            endif

            if tempchar != ""
                return tempchar
            endif
        endif
    endif
    "第二种函数参数
    let localvariable = IdentifyTheCurrentFile(funcline,curline,'func',funcstring)
    if localvariable != []
        let codestring = join(split(localvariable[0])[2:])
        let tempchar = split(codestring,'(')[1]
        let tempchar = split(tempchar,')')[0]
        let tempchar = split(tempchar,',')
        let iscontain =  IsContain(funcstring,tempchar)
        let tempchar = split(iscontain)[0]
        return tempchar
    endif

    "第四种全局变量
    "第五种包名
    "echo searchpos('\<' . "service" . '\>','w')
    "let flag = IdentificationCodeComponents(codestring,filetype)
    call cursor(1,1)
    let cursor = searchpos('\<' . funcstring . '\>','w')
    while IsComment(cursor[0]) ==# 1
        call cursor(cursor[0] + 1,1)
        let cursor = searchpos('\<' . funcstring . '\>','w')
    endwhile
    if cursor != []
        let codestring  = StandardCharacters(cursor[0])
        let flag = IdentificationCodeComponents(codestring,filetype)
        if flag ==# "import"
            let tempchar = split(codestring,";")[0]
            let tempchar = split(tempchar,'\.')[-1]
        elseif matchstr(flag,"def") != ""
            if  StringComponents(funcstring ,"def",codestring)
                if count(codestring,"<") != 0
                    let tempchar = split(codestring,"<")[0]
                    let tempchar = split(tempchar)[-1]
                elseif matchstr(codestring,"=") != ""
                    let tempchar = split(codestring,";")[0]
                    let tempchar = split(tempchar,"=")[0]
                    let tempchar = split(tempchar)[-2]
                else
                    let tempchar = split(codestring,";")[0]
                    let tempchar = split(tempchar)[-2]
                endif
            endif
        endif
        call cursor(curline,1)
        if tempchar != ""
            return tempchar
        endif
    endif
    return tempchar
endfunction
"}}}}}

"{{{{{2   FindTheCalledParty(...) 查找是调用的哪个函数
"echo  FindTheCalledParty(1776,"getConnectedDevices")
function! FindTheCalledParty(...)
    "{{{{{3 变量定义
    let line = a:1
    let funcname = a:2
    let classname = ""
    let tempstring = ""
    let iscontain =  ""
    let codestring = ""
    let fucline = -1
    let result  = ""
    let filename = expand("%:t")
    let filetype =  IsFileType(filename)
    let position = []
    let idx1 = 0
    let srcnum = -1
    let tailnum = -1
    let objectname = ""
    "}}}}
    let codestring = StandardCharacters(line)
    if matchstr(codestring,'"') != "" && ItString(codestring,funcname) ==# 1
    else
        let tempstring = copy(codestring)
        let tempstring = ClearingStringsInCode(tempstring)
        let position =   ChildStringPosition(tempstring ,funcname . '(')
        if position != []
            if tempstring[position[0] - 1] != "."
                let classname = split(ExtractKeyCodes(line),"█")[0]
                let result  = classname . "█" . funcname
            else
                let idx1 = position[0] - 2
                let tailnum = position[0] - 2
                while idx1 >= 0
                    if tempstring[idx1] ==# " "
                        let srcnum = idx1 + 1
                        break
                    elseif tempstring[idx1] ==# ")"
                        let idx1 = FindCorrespondingBracketPosition(tempstring,idx1)
                    elseif tempstring[idx1] ==# "("
                        let srcnum = idx1 + 1
                        break
                    elseif tempstring[idx1] ==# "."
                        let tailnum = idx1 -1
                    endif
                    let idx1 -= 1
                endwhile
                let objectname = tempstring[srcnum:tailnum]
                let fucline = ExtractKeyCodes(line,1)

                "echom objectname 
                "echom fucline
                "echom line
                if objectname ==# "super"
                    let classname = ExtractKeyCodes(line)
                    let result  = classname
                else
                    let classname = FuncToDefine(fucline ,line,objectname)
                    let result  = classname . "█" . funcname
                endif
            endif
        endif
    endif
    return result
endfunction
"}}}}}

"{{{{{2 function!  IdentifyAllCalls(...) 识别当前文件所有行调用
"call IdentifyAllCalls(1396,1401,"","service")
function! IdentifyAllCalls(...)
    "{{{{{3 变量定义
    let codelist = []
    let filename = expand("%:t")
    let filetype =  IsFileType(filename)
    let line = 1
    let numberlist = []
    let srcnum  = -1
    let tailnum = -1
    let codestring  = ""
    let  realityline = -1
    let g:debugflag = 20
    let flag = ""
    let srcline = line
    let tailline = line('$')
    let type = ""
    let matchstr = ""
    if a:0 != 0
        let srcline = a:1
        let tailline = a:2
        let type = a:3
        let matchstr = a:4
        let line = srcline
    endif
    "}}}}
    set noignorecase
    while line <= tailline
        let  realityline = line
        " echo  MergeLinesOfCode(line('.'))
        let numberlist = MergeLinesOfCode(realityline)
        if numberlist != []
            let srcnum  = numberlist[0]
            let tailnum = numberlist[1]
            if srcnum <= tailnum
                let codestring  =  GatherIntoRow(srcnum,tailnum)
                echom codestring 
                let line = tailnum + 1
                if  matchstr  ==# "" || matchstr(codestring,matchstr) != ""
                    let flag = IdentificationCodeComponents(codestring,filetype)
                    if type ==# "" || matchstr(flag,type) != ""
                        let codestring  = realityline . codestring
                        let codestring  = flag  . "    " . codestring
                        echom codestring  
                        let codelist = add(codelist,codestring)
                    endif
                endif
            else
                let line += 1
            endif
        else
            let line += 1
        endif
    endwhile
    let g:debuglist = codelist
    return codelist
endfunction
"}}}}}

"{{{{{2   IdentifyCalls(...) 识别当前行调用
"echom IdentifyCalls(getline('.'))
function! IdentifyCalls(...)
    "{{{{{3 变量定义
    let codestring = a:1
    let tempstring = ""
    let idx1 = 0
    let idj1 = 0
    let srcnum = -1
    let tailnum = -1
    let funcname = ""
    let result = []
    "}}}}
    let tempstring = copy(codestring)
    let tempstring = ClearingStringsInCode(tempstring)
    let indexlist = StringPosition(tempstring,"(")

    while idx1 < len(indexlist)
        let tailnum = indexlist[idx1] - 2
        let idj1 = tailnum
        while idj1 >= 0
            if tempstring[idj1] ==# " "
                let srcnum = idj1 + 1
                break
            elseif tempstring[idj1] ==# "("
                let srcnum = idj1 + 1
                break
            elseif tempstring[idj1] ==# "!"
                let srcnum = idj1 + 1
                break
            elseif tempstring[idj1] ==# "."
                let srcnum = idj1 + 1
                break
            elseif tempstring[idj1] ==# ">"
                let srcnum = idj1 + 1
                break
            endif
            let idj1 -= 1
        endwhile
        let funcname = tempstring[srcnum:tailnum]
        echom funcname
        if funcname ==# "if" || funcname ==# ""
        else
            let result = add(result,funcname)
        endif
        let idx1 += 1
    endwhile
    return string(result)
endfunction
"}}}}}

"}}}}}
"{{{{ 定时器

"{{{{{  FindFiles()  find回调
if len(timer_info()) ==# 0
    let g:windowfindid = 0
    let g:firstfindflag = 0
    let g:lastfilter = ""
    let g:lastfindlen = 0
endif
function! FindFiles(timer)
    let searchs = ""
    let idx1 = 0
    let idj1 = 0
    let clear = [""]
    let command = ""
    let searchs = getline(1)
    let searchstarge = []
    if g:firstfindflag ==# 0
        let g:windowfindid = win_getid()
        let g:firstfindflag = 1
    endif
    if  g:windowfindid != win_getid()
        return
    endif
    if g:lastfilter ==# searchs
        return
    endif
    if len(searchs) < 2
        return
    endif
    let command = "find -iname " . "'*" . searchs ."*'"
    echo command
    let searchstarge =  system(command)
    let searchstarge = split(searchstarge,"\n")
    if len(searchstarge) > 300
        let searchstarge  = searchstarge[0:300]
    endif
    let clear =  repeat([""],g:lastfindlen)
    call setline(2, clear)
    call setline(2, searchstarge)
    let g:lastfilter = searchs
    let g:lastfindlen = len(searchstarge)
    redraw
endfunction
"}}}}}

"{{{{{  Searcher()  搜索器  普通模式<F9>调用
nnoremap <F9> :call   Searcher()<cr>
function! Searcher()
    "[{'id': 1, 'repeat': -1, 'remaining': 185, 'time': 500, 'paused': 0, 'callback': function('MyHandler')}]
    let idx1 = 0
    let timeinfo = []
    let funtionname = ["FindFiles"]
    let tempname = ""
    let timeinfo = timer_info()
    let winwidthnum  = 0
    let timerflag = 0
    let timerid = 0
    if g:windowfindid != win_getid() && g:windowfindid != 0
        if win_gotoid(g:windowfindid) ==# 1
            if @@ != ""
                call setline(1,@@)
                call cursor(1,1)
            endif
            return
        endif
    else
        if len(tabpagebuflist()) ==# 1 && g:windowfindid ==# 0
            "let winwidthnum  = float2nr(winwidth('%')  * 0.3)
            let winwidthnum  = float2nr(winheight('%')  * 0.2)
            echo winwidthnum
            execute "normal! :new\<cr>"
            "execute "normal! :vne\<cr>"
            execute "normal! \<c-w>J"
            execute "normal! :res " . winwidthnum . "\<cr>"
            "execute "normal! :vertical res " . winwidthnum . "\<cr>"
            redraw
        endif
    endif
    if  len(timeinfo) > 0
        let idx1 = 0
        while idx1 <  len(timeinfo)
            let tempname =  split(string(timeinfo[idx1]["callback"]),"'")[1]
            if  count(funtionname,tempname)
                if tempname ==# "FindFiles"
                    let timerflag = 1
                    let timerid = idx1
                endif
            endif
            let idx1 += 1
        endwhile
    endif
    if  timerflag  ==#  1
        echo "有这个定时器回调函数清除"
        call timer_stop(timeinfo[timerid]["id"])
        silent execute "normal! :q!\<cr>"
        let g:firstfindflag = 0
        let g:windowfindid = 0

    else
        let timer = timer_start(200, 'FindFiles', {'repeat': -1})
        echo "开启定时器" timer
        redraw
    endif
endfunction
"}}}}}

"{{{{{  GrepChars()  grep回调
if len(timer_info()) ==# 0
    let g:windowgrepid = 0
    let g:firstgrepflag = 0
    let g:lastgrepfilter = ""
    let g:lastgreplen = 0
    let g:lastgrepfile = ""
    let g:grepnumberlist = []
endif
function! GrepChars(timer)
    let searchs = ""
    let idx1 = 0
    let idj1 = 0
    let command = ""
    let searchs = getline(1)
    let searchstarge = []
    let tempchar = ""
    let line = 0
    let col = 0
    if g:firstgrepflag ==# 0
        let g:windowgrepid = win_getid()
        let g:firstgrepflag = 1
    endif
    if  g:windowgrepid != win_getid()
        return
    endif
    if g:lastgrepfilter ==# searchs
        return
    endif
    if len(searchs) < 4
        return
    endif
    let g:lastgrepfilter = searchs
    if @/ != searchs
        let @/ = searchs
    endif
    let searchs =  substitute(searchs , '(', '\\(', 'g')
    let searchs =  split(searchs,"\x00",1)
    if searchs[0] ==# ''
        let tempchar = searchs[1:]
        let searchs = ' ' . join(tempchar,".*")
    else
        if searchs[-1] ==# ''
            call remove(searchs,-1)
        endif
        let searchs = join(searchs,".*")
    endif
    if g:lastgrepfile != "" && ("analy.txt" ==# matchstr(g:lastgrepfile,"analy.txt"))
        let command = "grep -EsinR --binary-files=without-match  --include=*{.c,.cc,.cpp,.xml,.java,.h,*} " . "'" . searchs . "'"
    else
        let command = "grep -EsinR --binary-files=without-match  --include=*{.c,.cc,.cpp,.xml,.java,.h,.bp,.go} " . "'" . searchs . "'"
    endif
    echo command
    if @/ != searchs
        let @/ = substitute(searchs , '\\(', '(', 'g')
    endif
    let searchstarge =  system(command)
    if len(split(searchstarge,"\n")) < 600  && ("analy.txt" != matchstr(g:lastgrepfile,"analy.txt"))
        let searchstarge = SelectEntireCode(copy(searchstarge))
    endif
    let searchstarge = SimplifySearchResults(copy(searchstarge))
    let searchstarge = insert(searchstarge,@g)
    call win_gotoid(g:windowgrepid)
    if line('$') > 3
        let line = line('.')
        let col = col('.')
        execute "normal! \<esc>"
        silent execute ":" . 2 . "," . line('$') . "d"
        execute "normal! i"
        call cursor(line,col)
        redraw
    endif
    call setline(2,searchstarge)
    let g:lastgreplen = len(searchstarge)
    let @@ = ""
    syntax on
    redraw
endfunction
"}}}}}

"{{{{{  SearcherChars()  grep搜索字符串普通模式<F10>调用
nnoremap <F10> :call   SearcherChars()<cr>
function! SearcherChars()
    "[{'id': 1, 'repeat': -1, 'remaining': 185, 'time': 500, 'paused': 0, 'callback': function('MyHandler')}]
    let idx1 = 0
    let timeinfo = []
    let funtionname = ["GrepChars"]
    let tempname = ""
    let timeinfo = timer_info()
    let winwidthnum  = 0
    let timerflag = 0
    let timerid = 0
    let targetlist = []
    let register = ""
    let line = -1
    let col = -1
    let index = -1
    if g:windowgrepid != win_getid() && g:windowgrepid != 0
        let @i = getline('.')
        let g:lastgrepfile = expand("%:p")
        if win_gotoid(g:windowgrepid) ==# 1
            if @@ != ""
                call setline(1,@@)
                call cursor(1,1)
            endif
            return
        endif
    else
        if len(tabpagebuflist()) ==# 1 && g:windowgrepid ==# 0
            "let winwidthnum  = float2nr(winwidth('%')  * 0.3)
            let winwidthnum  = float2nr(winheight('%')  * 0.2)
            echo winwidthnum
            silent execute  "normal! :cle\<cr>"
            execute "normal! :new\<cr>"
            "execute "normal! :vne\<cr>"
            execute "normal! \<c-w>J"
            execute "normal! :res " . winwidthnum . "\<cr>"
            "execute "normal! :vertical res " . winwidthnum . "\<cr>"
            redraw
        else
           if line('.') ==# 2
               let line = line('.')
               let col = col('.')
               let register = split(getline(2),"█")
               let indexlist = StringPosition(getline(2),'█')
               let index = ListIndex(indexlist,col)
               let targetlist = g:grepnumberlist[index]
               call setline(3,targetlist)
               return
           endif
        endif
    endif
    "是否有当前搜索器
    if  len(timeinfo) > 0
        let idx1 = 0
        while idx1 <  len(timeinfo)
            let tempname =  split(string(timeinfo[idx1]["callback"]),"'")[1]
            if  count(funtionname,tempname)
                if tempname ==# "GrepChars"
                    let timerflag  = 1
                    let timerid = idx1
                endif
            endif
            let idx1 += 1
        endwhile
    endif

    "有搜索器就把当前搜索器停掉,没有就新建
    if  timerflag ==#  1
        echo "有这个定时器回调函数,清除"
        call timer_stop(timeinfo[timerid]["id"])
        silent execute "normal! :q!\<cr>"
        let g:firstgrepflag = 0
        let g:windowgrepid = 0
    else
        let timer = timer_start(200, 'GrepChars', {'repeat': -1})
        echo "开启定时器" timer
        redraw
    endif
endfunction
"}}}}}

"{{{{{  GreplogChars()  grep log 回调

function! GreplogChars(timer)
    let searchs = ""
    let idx1 = 0
    let idj1 = 0
    let command = ""
    let searchs = getline(1)
    let searchstarge = []
    let tempchar = ""
    let line = 0
    let col = 0
    let grepchar = "grep -Esin  "
    let currentwindowsid = win_getid()
    let currenttabid = tabpagenr()
    let currenttimerwindowsidlist  = GetOneOfTheColumns(g:greplog2list,"|",1)
    let curenttabidlist = GetOneOfTheColumns(g:greplog2list,"|",2)
    if count(currenttimerwindowsidlist,currentwindowsid) ==# 0
        return
    endif
    if count(curenttabidlist,currenttabid) ==# 0
        return
    endif
    let index = index(currenttimerwindowsidlist,currentwindowsid)
    if index ==# -1
        return
    endif

    if line('.') > 18
        let g:greplog2list[index][7] = split(getline('.'),":")[0]
    endif
    if g:greplog2list[index][6] ==# searchs
        return
    endif
    if len(searchs) < 4
        return
    endif
    if matchstr(searchs,'.$') ==# '|'
        return
    endif
    if len(split(searchs,'|')[-1]) < 3
        return
    endif
    let g:greplog2list[index][4] = "true"
    let g:greplog2list[index][6] = searchs
    if @/ != searchs
        let @/ = searchs
    endif
    let searchs =  substitute(searchs , '(', '\\(', 'g')

    let command  = grepchar . " \"" .  searchs  . "\" " . g:greplog2list[index][5]
    silent echo command
    let searchs = substitute(searchs , '\\(', '(', 'g')
    let searchs = substitute(searchs , '|', '\\|', 'g')
    if @/ != searchs
        let @/ = substitute(searchs , '\\(', '(', 'g')
    endif
    silent let searchstarge =  system(command)
    let searchstarge =  split(system(command),'\n')
    let searchstarge = insert(searchstarge,@l)
    sleep 200m
    if line('$') > 3
        let line = line('.')
        let col = col('.')
        execute "normal! \<esc>"
        silent execute ":" . 2 . "," . line('$') . "d"
        execute "normal! i"
        call cursor(line,col)
        redraw
    endif
    call setline(2,searchstarge)
    let @@ = ""
    redraw
endfunction
"}}}}}

"{{{{{  SearcherlogChars()  搜索log 普通模式逗号 f 调用
if len(timer_info()) ==# 0
    "winid serarchwinid tapid timerid firstgrep grepfile grepchar"记录上次停留的log
    let g:greplog1list = ['','','','','','','','']
    let g:greplog2list = []
endif
nnoremap <leader>f :call SearcherlogChars()<cr>
function! SearcherlogChars()
    "[{'id': 1, 'repeat': -1, 'remaining': 185, 'time': 500, 'paused': 0, 'callback': function('MyHandler')}]
    let idx1 = 0
    let timeinfo = []
    let funtionname = ["GreplogChars"]
    let tempname = ""
    let timeinfo = timer_info()
    let winwidthnum  = 0
    let timerflag = 0
    let timerid = 0
    let currentwinid = win_getid()
    let currenttabnr = tabpagenr()
    let timerwindowsid = -1
    let currenttimerwindowsidlist = []
    let currentwinidlist = []
    let searchwindowid = -1
    let tabinfodict = Parsetabinfo("tabwindict")
    let windlist = Parsetabinfo("windlist")
    let grepfile = expand("%:p")
    let index = -1
    if len(g:greplog2list) !=  0
        "去除列表中多余数据
        let idx1 = 0
        let currenttimerwindowsidlist  = GetOneOfTheColumns(g:greplog2list,"|",1)
        while idx1 < len(currenttimerwindowsidlist)
            let currenttimerwindowsidlist  = GetOneOfTheColumns(g:greplog2list,"|",1)
            if count(windlist,currenttimerwindowsidlist[idx1]) ==# 0
                let index = index(currenttimerwindowsidlist,currenttimerwindowsidlist[idx1])
                call timer_stop(g:greplog2list[index][3])
                call remove(g:greplog2list,index)
                if len(g:greplog2list) != 0
                    let idx1 = 0
                else
                    let idx1 += 1
                endif
            else
                let idx1 += 1
            endif
        endwhile
    endif


    if len(tabinfodict[currenttabnr]) ==# 1
        let g:greplog2list = add(g:greplog2list,copy(g:greplog1list))
        let winwidthnum  = float2nr(winheight('%')  * 0.4)
        silent execute  "normal! :cle\<cr>"
        execute "normal! :new\<cr>"
        "execute "normal! :vne\<cr>"
        execute "normal! \<c-w>J"
        execute "normal! :res " . winwidthnum . "\<cr>"
        "execute "normal! :vertical res " . winwidthnum . "\<cr>"

        let timerwindowsid = win_getid()
        let timer = timer_start(200, 'GreplogChars', {'repeat': -1})
        let g:greplog2list[-1][0] = currentwinid
        let g:greplog2list[-1][1] = timerwindowsid
        let g:greplog2list[-1][2] = currenttabnr
        let g:greplog2list[-1][3] = timer
        let g:greplog2list[-1][4] = "false"
        let g:greplog2list[-1][5] = grepfile
        redraw
    else
        let currentwinidlist = GetOneOfTheColumns(g:greplog2list,"|",0)
        let currenttimerwindowsidlist  = GetOneOfTheColumns(g:greplog2list,"|",1)
        let index = index(currentwinidlist,currentwinid)
        if count(currenttimerwindowsidlist,currentwinid) ==# 0
            if win_gotoid(g:greplog2list[index][1]) ==# 1
                if @@ != ""
                    call setline(1,@@)
                    call cursor(1,1)
                endif
            endif
        else
            if line('.') ==# 1
                call search(g:greplog2list[index][7])
                return
            endif
            if index != -1
                call timer_stop(g:greplog2list[index][3])
                silent execute "normal! :q!\<cr>"
                call remove(g:greplog2list,index)
            endif
        endif
    endif
endfunction
"}}}}}

"}}}}
"{{{{ 批量处理
"{{{{{  BatchHandle()  批量处理
function! BatchHandle()
    let files = ""
    let searchflag = "find -iname strings.xml"
    let files = system(searchflag)
    let files = split(files,"\n")
    let idx1 = 0
    while idx1 < len(files)
        call ProcessFiles(files[idx1],"<plurals.*noti_caption_unsuccessful")
        call ProcessFiles(files[idx1],"<plurals.*noti_caption_success")
        let idx1 += 1
    endwhile
endfunction
"}}}}}
"{{{{{  ProcessFiles()  批量处理
function! ProcessFiles(...)
    let filename = a:1
    "let filename = "values-bo-rCN/strings.xml"
    let fileslist = readfile(filename)
    "let indexwords = "<plurals.*noti_caption_unsuccessful"
    let indexwords = a:2
    let indexwords2 = "</plurals>"
    let keywords = ""
    let vertiefung = ""
    let forwardlist = []
    let middlelist = []
    let backlist = []
    let idx1 = 0
    let src = 0
    let tail = 0
    let ReplaceList = ["    <string name=\"noti_caption_unsuccessful\"> {count, plural,",
                \ "        =1    {# 个文件传输失败。}",
                \ "        other {# 个文件传输失败。}",
                \ "    }</string>"]
    while idx1 < len(fileslist)
        if "" != matchstr(fileslist[idx1],indexwords)
            let src = idx1
            echo src "src"
        elseif  "" != matchstr(fileslist[idx1],indexwords2)
            if src < idx1 && tail ==# 0 && src != 0
                let tail = idx1
                echo tail "tail"
            endif
        endif
        let idx1 += 1
    endwhile
    let forwardlist = fileslist[:src-1]
    let middlelist = fileslist[src:tail]
    let backlist = fileslist[tail + 1:]
    if src  ==# 0 && tail ==# 0
        return
    endif
    call setline(1,middlelist)
    if "noti_caption_unsuccessful" ==# matchstr(middlelist[0],"noti_caption_unsuccessful")
        let keywords = split(split(middlelist[1],"g>")[1],"<")[0]
        let vertiefung = split(middlelist[0],"<plurals")[0]
        let ReplaceList[0] = join([vertiefung, "<string name=\"" , "noti_caption_unsuccessful" , "\"> {count, plural,"],"\x00")
        let ReplaceList[1] = join([vertiefung, vertiefung, "=1    {# " , keywords , "}"],"\x00")
        let ReplaceList[2] = join([vertiefung, vertiefung, "other {# " , keywords , "}"],"\x00")
        let ReplaceList[3] = join([vertiefung, "}</string>"],"\x00")
    elseif "noti_caption_success" ==# matchstr(middlelist[0],"noti_caption_success")
        let keywords = split(split(middlelist[1],"g>")[1],"%")[0]
        let vertiefung = split(middlelist[0],"<plurals")[0]
        let ReplaceList[0] = join([vertiefung, "<string name=\"" , "noti_caption_success" , "\"> {count, plural,"],"\x00")
        let ReplaceList[1] = join([vertiefung, vertiefung, "=1    {# " , keywords , "}"],"\x00")
        let ReplaceList[2] = join([vertiefung, vertiefung, "other {# " , keywords , "}"],"\x00")
        let ReplaceList[3] = join([vertiefung, "}</string>"],"\x00")
    endif
    echo  ReplaceList
    let forwardlist = extend(forwardlist  ,ReplaceList)
    let forwardlist = extend(forwardlist  ,backlist)
    silent call writefile(forwardlist,filename)
endfunction
"}}}}}
"}}}}
"{{{{ 解冲突
"{{{{{  ResolveConflict()  解冲突
function! ResolveConflict()
    let saved_unnamed_register = @@
    execute "normal! yy"
    let filestmp = @@
    let filestmp = split(split(filestmp,"\x00")[0],'\.')
    let filesrej = filestmp[0] . '.' .  filestmp[1] . '.' . filestmp[2]
    let filesorg = filestmp[0] . '.' .  filestmp[1]
    echo  filesrej
    echo  filesorg
    call ParsingRej(filesrej,filesorg)
    silent execute "normal! :tabnew\<cr>"
    silent execute "normal! :e " . filesorg . "\<cr>"
    silent execute "normal! :tabnew\<cr>"
    silent execute "normal! :e " . filesrej . "\<cr>"
    let @@ = saved_unnamed_register
endfunction
"}}}}}
"{{{{{  ParsingRej() 解析rej文件
function! ParsingRej(...)
    let rejfiles = a:1
    let orgfiles = a:2
    let idx1 = 0
    let idx2 = 0
    let flag = 0
    let tempsearch = ""
    let rejfile = readfile(rejfiles)
    let orgfile = readfile(orgfiles)

    while idx1 < len(rejfile)
        "echo len(join(split(rejfile[idx1],"\x00"),"\x00"))
        if "+" ==#  matchstr(rejfile[idx1], "+") ||
                    \  "-" ==#  matchstr(rejfile[idx1], "-") ||
                    \ "@@" ==#  matchstr(rejfile[idx1], "@@") ||
                    \  len(join(split(rejfile[idx1],"\x00"),"\x00")) < 6
        else
            let flag = 0
            let tempsearch = join(split(join(split(rejfile[idx1],'*')," "),"\x00"),'.*')
            echo tempsearch
            let idx2 = 0
            while idx2 < len(orgfile)
                if "" ==# matchstr(orgfile[idx2], tempsearch) || flag ==# 1
                else
                    let rejfile[idx1] = rejfile[idx1] . '|' . idx2
                    "echo "tangxinlou456"
                    "echo  matchstr(orgfile[idx2], tempsearch)
                    let flag = 1
                endif
                let idx2 += 1
            endwhile

        endif
        let idx1 += 1
    endwhile
    silent execute "normal! :tabnew\<cr>"
    call append(0,rejfile)
    "silent call writefile(rejfile,rejfiles)

endfunction
"}}}}}
"}}}}
"{{{{ 文件管理
"主要功能：每个文件夹下导入README 文件，文件中记录当前文件夹下所有文件的功能
"子目录的README 文件包含到上一级中
"{{{{{2 function! s:TreeContens(type)            图形目录打开对应目录文件      可视模式下 逗号 + r 调用
"vnoremap <leader>r :<c-u>call <SID>TreeContens(visualmode())<cr>
nnoremap <leader>r :call TreeContens()<cr>
function! TreeContens(...)
    "let saved_unnamed_register = @@
    let tempfile = ""
    let tempfile = @@
    let classfunc = ""
    let searchstarge  = ""
    let searchstarge = ""
    let resultlist = ""
    let tempchar = ""
    let templist = []
    let idx1 = 0
    let g:debugflag = 20
    if matchstr(tempfile,"█") ==# ""
        let tempfile = split(system("find -iname  " . tempfile),"\n")[0]
        silent execute "normal! :tabnew\<cr>"
        silent execute "normal! :e " . tempfile . "\<cr>"
    else
        silent execute "normal! :tabnew\<cr>"
        let classfunc = copy(tempfile)
        let tempchar = split(classfunc,"█")[-1]
        if matchstr(classfunc,' case ') != ""
        else
            let searchstarge  = EncapsulateDifferentGrep("","fuc",tempchar)
            let searchstarge = SelectEntireCode(copy(searchstarge))
            let resultlist = ResultClassification(searchstarge)
            echom string(resultlist[1])
            let resultlist[1] = ListTo1D(resultlist[1] ,"█")
            if len(resultlist[1]) != 0
                while idx1 < len(resultlist[1])
                    let templist = split(resultlist[1][idx1],":")
                    call SwitchBuff(templist[0])
                    let stackstring = ExtractKeyCodes(templist[1])
                    if stackstring ==# classfunc
                        silent call cursor(templist[1],1)
                        return
                    endif
                    let idx1 += 1
                endwhile
            else
                echom "没有找到函数"
            endif
        endif
    endif
    "let @@ = saved_unnamed_register
endfunction
"}}}}}
"{{{{{2 function! s:UpdateTreeContens(...)      更新图形目录                  普通模式下 逗号 + u 调用
nnoremap <leader>u :call UpdateTreeContens()<cr>
function! UpdateTreeContens(...)
    "{{{{{3 变量定义
    let contensfile = []
    let src  = 0
    let tail = 0
    let prvcontesfile = []
    let curcontesfile = []
    let len = 0
    let idx1 = 0
    let index = 0
    let filename = ""
    let description = ""
    "}}}}
    let contensfile = readfile(expand("%:p"))
    let curcontesfile = split(system("tree -L 20"),"\n")[1:-3]
    if count(contensfile ,"<<<<<<<<<<<<<<<<") && count(contensfile ,">>>>>>>>>>>>>>>")
        echo "之前修改过"
        let src = index(contensfile,"<<<<<<<<<<<<<<<<")
        let tail = index(contensfile,">>>>>>>>>>>>>>>")
        let prvcontesfile = contensfile[src + 1:tail - 1]
        call remove(contensfile,src,tail)
        echo src tail
    else
        echo "第一次生成目录"
    endif
    let idx1 = 0
    while idx1 < len(curcontesfile)
        if len(split(curcontesfile[idx1])) > 1
            let filename  =  split(curcontesfile[idx1])[-1]
            let description = GetItemFromFile("Description  :",filename)
            if description != ""
                echo  filename
                echo description
                let curcontesfile[idx1] =join([curcontesfile[idx1] . repeat(" ", 80 - strwidth(curcontesfile[idx1]) - 1),"  " . join(split(split(description,":")[1],"\x00"))],"█")
            endif
        endif
        let idx1 += 1
    endwhile
    let curcontesfile = insert(curcontesfile,"<<<<<<<<<<<<<<<<")
    let curcontesfile = add(curcontesfile,">>>>>>>>>>>>>>>")
    call extend(contensfile,curcontesfile,9)
    silent call writefile(contensfile,expand("%:p"))
    silent execute "normal! :e "  . expand("%:p") . "\<cr>"
endfunction
"}}}}}
"{{{{{2 GetItemFromFile(...)             获取对应文件的某一项
function! GetItemFromFile(...)
    "{{{{{3 变量定义
    let string = ""
    let files = ""
    let path = ""
    let tempresult = ""
    let tempchar1 = ""
    "}}}}
    let string = a:1
    let files = a:2
    let tempresult = system("find -iname " . files . " -type f")
    if  len(split(tempresult,"\n")) ==# 1
        let path = split(tempresult,"\n")[0]
        let files = readfile(path)
        let tempchar1 = ""
        let tempchar1 = IsContain(string,files)
        return  tempchar1
    else
        return ""
    endif
endfunction
"}}}}}
"}}}}
"fold{{{{  markdown  txt 类型文件折叠和高亮
"{{{{{2   GetPotionFold(...) 计算foldlevel
function! GetPotionFold(lnum)
    if getline(a:lnum) =~? '\v^\s*$'
        "echom a:lnum
        "echom "tangxinlou1"
        return '-1'
    elseif  getline(a:lnum) =~? "```c" || getline(a:lnum) =~? "```"
        return '0'
    elseif  getline(a:lnum) =~? "<<<<<<<<<<<<<<<<" || getline(a:lnum) =~? ">>>>>>>>>>>>>>>"
        return '0'
    elseif "├" ==# matchstr(getline(a:lnum),'├') || "└" ==# matchstr(getline(a:lnum),'└')
        if matchstr(getline(a:lnum),"█") ==# "█"
            return count(split(getline(a:lnum),'█'),'│  ')
        else
            return count(split(getline(a:lnum)),'│  ')
        endif
    else
        return '1'
    endif
endfunction
"}}}}}
"{{{{{2   GetPotionFold1(...) 计算foldlevel
function! GetPotionFold1(lnum)
endfunction
"}}}}}

"}}}
"csv files {{{{  表格文件
"每行每列添加空格，增加可读性，保存时把空格消除不影响功能
"{{{{{2   VisualiZationcsv(...) 可视化表格文件
"call VisualiZationcsv(2,",")
nnoremap <F2>  :call VisualiZationcsv(1,',')<cr>
function! VisualiZationcsv(...)
    "{{{{{3 变量定义
    let dimensional1 = []   "一维表格
    let dimensional2 = []   "二维表格
    let idx1 = 0
    let mode = a:1            "1 增加空格，2减少空格
    let templist = ["-"]       "手动修改默认添加的字符串
    let LenOfListHead =  0  "表格第一行有多少列
    let LenOfListcur =   0  "表格当前行有多少列
    let charinterval = a:2
    "}}}}
    if &filetype ==# "csv"
        let templist = [""]       "手动修改默认添加的字符串
    endif
    if &filetype ==# "vim"
        return
    endif
    "读取当前文件,找到数据最长的一行,对缺少空格的行补逗号
    if mode ==# 1
        if "UTF-8" != matchstr(system("file " . expand("%:p")),"UTF-8")
            "call system("iconv -f cp936 -t utf-8 102.csv -o 102.csv")
            call system("iconv -f cp936 -t utf-8 " . expand("%:p") . " -o " . expand("%:p"))
        endif
    endif
    let dimensional1 = readfile(expand("%:p"))
    if count(dimensional1[0],"|")  > 2
        let charinterval = "|"
    endif
    if mode ==# 1
        let LenOfListHead = count(dimensional1[0],charinterval)
        let idx1 = 0
        while idx1 < len(dimensional1)
            if  count(dimensional1[idx1],charinterval) >  LenOfListHead
                let LenOfListHead = count(dimensional1[idx1],charinterval)
            endif
            let idx1 += 1
        endwhile
        let idx1 = 0
        while idx1 < len(dimensional1)
            let LenOfListcur =  count(dimensional1[idx1],charinterval)
            if  LenOfListHead !=  LenOfListcur
                let dimensional1[idx1] =  dimensional1[idx1]  . join(repeat(templist,LenOfListHead - LenOfListcur + 1),charinterval)
            endif
            let idx1 += 1
        endwhile
    endif
    let dimensional2 = copy(dimensional1)
    let dimensional1 = ExpansionAndContraction(dimensional2,mode,charinterval)
    silent call writefile(dimensional1,expand("%:p"))
    if mode ==# 1
        execute "normal! :e " .  expand("%:p") . "\<cr>"
    else
        call system("iconv -f utf-8 -t cp936 " . expand("%:p") . " -o " . expand("%:p"))
    endif
endfunction
"}}}}}

"{{{{{2   JoinTwoTables(...) 拼接两个表格
function! JoinTwoTables(...)
    "{{{{{3 变量定义
    let tableA = []
    let tableB = []
    let fileA = "87.csv"
    let fileB = "90.csv"
    let colnum = ""
    let listcol = []
    let idx1 = 0
    let iscontain  = ""
    "}}}}

    "let fileA = input("Afilename")
    "let fileB = input("Bfilename")
    let colnum = str2nr(input("按照多少列拼接"))
    let tableA = readfile(fileA)
    let tableB = readfile(fileB)
    let listcol   = GetOneOfTheColumns(tableA,",",colnum)
    while idx1 < len(listcol)
        let iscontain =  IsContain(listcol[idx1],tableB)
        let tableA[idx1] = tableA[idx1] . "," . iscontain
        let idx1 += 1
    endwhile
    let g:debuglist = tableA
endfunction
"}}}}}

"{{{{{2   ExpansionAndContraction(...) 填充空格和消除空格
function! ExpansionAndContraction(...)
    "{{{{{3 变量定义
    let filelists = a:1
    let listlength = [" "]
    let mode = a:2
    let idx1 = 0
    let idx2 = 0
    let charinterval = a:3
    let templength = 0
    let templistlength = 0
    "}}}}
    if mode ==# 1
        let filelists = ListAddSpaces(filelists,charinterval)
    elseif mode ==# 2
        let filelists = ListRemoveSpaces(filelists,charinterval)
    endif
    return  filelists
endfunction
"}}}}}

"}}}
"{{{{  自动分析日志
"\([0-9A-Fa-fxX]\{2\}:\)\{5\}[0-9A-Fa-fxX]\{2\}
"bluetoothbond.*=> \w\+  vim
"bluetoothbond.*=>\s*\w+ notepad ++
"echo matchstr("59157:02-21 19:43:30.190671 12806 12900 D A2dpStateMachine: Connection state CC:81:2A:DC:F2:12: CONNECTING->CONNECTED","A2dpStateMachine: Connection state.*->\w\+")
"windows git-bash 运行脚本时，可以把git-bash 加入到系统环境变量,这样可以快速调出git-bash
"{{{{{2 function!  FtpDownLoadFile(...) ftp 下载文件
function! FtpDownLoadFile(...)
    "{{{{{3 变量定义
    "lftp -u stability,ofhmE5899  172.25.102.85
    let ftp_host='172.25.102.85'
    let ftp_user='stability'
    let ftp_passwd='ofhmE5899'
    let remote_file = 'triage_result.txt'
    let local_file = '/opt6/tangxinlouosc/autoanaly/triage_result.txt'
    let remote_dir = 'stability/WHQ/2346/3-24-3'
    let remote_dir = input("输入要下载的路径")
    let local_dir = '/opt6/tangxinlouosc/autoanaly'
    let base_ls_cmd = " -e ' set ftp:charset \"gbk\" ;set file:charset \"UTF-8\" ; ls -l " . remote_dir
    let base_quit_cmd = ";quit'"
    let base_cmd = "lftp -u " . ftp_user . "," . ftp_passwd . " " . ftp_host
    let lftp_ls_cmd = base_cmd . base_ls_cmd . base_quit_cmd
    let downloadlogfile = Homedir("autoanaly/download",1)
    let downlog = []
    let idx1 = 0
    "}}}}

    let downlog = readfile(downloadlogfile )
    let downlog = add(downlog, "###########################")
    let downlog = add(downlog, strftime("%Y-%m-%d %H:%M:%S") . "开始下载" .  remote_dir )
    let local_dir = local_dir . '/' . split(remote_dir,'/')[-1]
    if "" ==# findfile(local_dir)
        call system("mkdir " . local_dir)
    else
        echo local_dir
    endif

    "获取远端目录
    let directory = system(lftp_ls_cmd)
    let directory = split(directory, "\n")
    let directory = ListTo2D(directory,"")
    let directory = GetOneOfTheColumns(directory,"",len(directory[0]) - 1)
    let downlog = add(downlog, strftime("%Y-%m-%d %H:%M:%S") . remote_dir . "有" .string(directory))
    echo string(directory)
    "获取文件
    while idx1 < len(directory)
        let remote_file = directory[idx1]
        echo remote_file
        let local_file = local_dir . '/' . remote_file
        if "" ==# findfile(local_file )
            let base_get_cmd = " -e 'set ftp:charset \"gbk\" ;set file:charset \"UTF-8\" ; get " . remote_dir . '/' . remote_file . " -o " . local_file
            let lftp_download_cmd = base_cmd . base_get_cmd . base_quit_cmd
            let downlog = add(downlog, strftime("%Y-%m-%d %H:%M:%S") . "开始下载" .  remote_file )

            let lftp_return = system(lftp_download_cmd)
            if lftp_return != ""
                let downlog = add(downlog, strftime("%Y-%m-%d %H:%M:%S") . "下载失败" .  remote_file )
            else
                let downlog = add(downlog, strftime("%Y-%m-%d %H:%M:%S") . "下载成功" .  remote_file )
            endif

            if "auto_export" ==# matchstr(directory[idx1],"auto_export")
                if "" ==# findfile(string(split(local_file,".zip")[0]))
                    let downlog = add(downlog, strftime("%Y-%m-%d %H:%M:%S") . "开始解压" .  directory[idx1])
                    call system("unzip " . local_file . " -d " . local_dir)
                    let downlog = add(downlog, strftime("%Y-%m-%d %H:%M:%S") . "解压完成" .  directory[idx1])
                    call system("rm -rf " . local_file)
                endif
            endif
        endif
        let idx1 += 1
    endwhile

    let downlog = add(downlog, strftime("%Y-%m-%d %H:%M:%S") . "下载完成" .  remote_dir )
    let downlog = add(downlog, "###########################")
    call writefile(downlog,downloadlogfile )

endfunction
"}}}}}

"{{{{{2   DifferentiateLogFiles(...) 区分log文件
function! DifferentiateLogFiles(...)
    "{{{{{3定义
    let filespathdict = {'main':[],
                \ 'adsp': []}
    let findcmd = "find -iname "
    let findresult = []
    "}}}}
    let findcmd = "find -iname " . "'*main_log*'"
    let findresult = system(findcmd)
    if  findresult != ""
        let filespathdict["main"] = sort(split(findresult,"\n"))
    endif

    let findcmd = "find -iname " . "'*adsp_*'"
    let findresult = system(findcmd)
    if  findresult != ""
        let filespathdict["adsp"] = sort(split(findresult,"\n"))
    endif
    return filespathdict
endfunction
"}}}}}

"{{{{{2   SearchFile(...)搜索拼接日志文件
function! SearchFile(...)
    "{{{{{3 变量定义
    let path = copy(a:1)
    let filterchar = a:2
    let grepcmd = "grep -Esi \"" . a:2 . "\" "
    let idx1 = 0
    let grepresult = []
    let tempresult = []
    "}}}}
    let path = SortByExpression(path)
    if type(path) ==# 1
    elseif type(path) ==# 3
        while idx1 < len(path)
            let tempresult  =  system(grepcmd . path[idx1])
            if tempresult != ""
                let grepresult = extend(grepresult,split(tempresult,"\n"))
            endif
            let idx1 += 1
        endwhile
    endif
    if len(grepresult) > 2000
        let grepresult = grepresult[-2000:]
    endif
    let grepresult = UniqueList(grepresult)
    return grepresult
endfunction
"}}}}}

"{{{{{2 function!  AutoAnalyzer(...)自动分析
function! AutoAnalyzer(...)
    "{{{{{3 变量定义
    let filedict = {}
    let resultlist = []
    let loglist = []
    let filterchar = g:filterchar
    let smallestunit = g:smallestunitdict
    let Removeduplicates = g:Removeduplicates
    let fileindexchar = ""
    let idx1 = 0
    let filterkey = []
    let filterkeytem = []
    let indexfilter = 0
    let indexfilter1 = 0
    let allresultlist = []
    let tempfilterchar = ""
    let downloadpin = ""
    let index = 0
    let saveresult = Homedir("autoanaly/result",2)
    redraw
    if a:0 ==# 1
        let modeflag = a:1
    endif
    let historysele = []
    let temphistorysele = []
    let systemversion = ""
    let fwversion = ""
    let hcifiles = ""
    let curitem = ""
    let preitem = ""
    let daildate = ""
    let emptylist = []
    let Multidimensionaldict = {}
    let Multidimensionalresult = []
    let Multidimensionallist = []
    let templist = []
    let MultiDimensionalAnalysresult = []
    "}}}}
    let g:Dimensionalflag = []
    silent execute "normal! :tabnew \<cr>"
    let daildate = daildate ."开始" .  system("date '+%Y%m%d-%H.%M.%S'")
    let filterkey = sort(keys(filterchar))
    if a:0 ==# 0
        let filterkeytem = copy(filterkey)
        call AddNumber(filterkeytem)
        let indexfilter1 = input("请输入mode a 是全搜索")
    endif
    let systemversion = BinaryFileSearch("properties","\\[ro.vivo.product.version\\]")
    let fwversion = BinaryFileSearch("properties","vendor.connsys.bt_fw_ver\\]")
    let allresultlist = add(allresultlist,systemversion)
    let allresultlist = add(allresultlist,fwversion)
    if indexfilter1 ==# 'a' || a:0 ==# 1
        let hcifiles = Findbluetoothlogs()
        let allresultlist = extend(allresultlist,hcifiles)
    endif
    let filedict = DifferentiateLogFiles()
    while idx1 < len(filterkey)
        let loglist = []
        let resultlist = []
        if a:0 ==# 0 && indexfilter1 != 'a'
            let idx1 = len(filterkey) - 1
            let indexfilter = filterkey[indexfilter1]
            if indexfilter ==# "00temp"
                let historysele = split(@l,'█')
                let temphistorysele = copy(historysele)
                echo temphistorysele
                call AddNumber2(temphistorysele)
                let tempfilterchar = input("输入关键词")
            endif
        else
            let indexfilter = filterkey[idx1]
        endif
        echo indexfilter
        if indexfilter ==# "卡音"
            let fileindexchar = "adsp"
            let loglist = SearchFile(filedict[fileindexchar],filterchar[indexfilter])
        elseif  indexfilter ==#"卡音1"
            let fileindexchar = "main"
            let loglist = SearchFile(filedict[fileindexchar],filterchar[indexfilter])
            if len(loglist) != 0
                let loglist = insert(loglist,"<<<<<<<<<<<<<<<<")
                let loglist = insert(loglist,indexfilter . " 源数据")
                let loglist = add(loglist,">>>>>>>>>>>>>>>")
            endif
        elseif indexfilter ==# "00temp"
            if indexfilter1 != 'a'
                let fileindexchar = "main"
                let loglist = SearchFile(filedict[fileindexchar],tempfilterchar)
                    let @/ = substitute(tempfilterchar , '|', '\\|', 'g')
                if matchstr(@/,'+') != ""
                    "关键词里面有+
                    let @/ = substitute(@/ , '+', '\\+', 'g')
                endif
                if count(split(@l,'█'),tempfilterchar) ==# 0
                    let tempfilterchar = tempfilterchar  . '█'  . @l
                    if len(split(tempfilterchar,"█")) > 10
                        let tempfilterchar = split(tempfilterchar,"█")
                        let tempfilterchar = tempfilterchar[0:9]
                        let tempfilterchar = join(tempfilterchar,"█")
                    endif
                    let @l = tempfilterchar
                endif
            endif
        else
            let fileindexchar = "main"
            let loglist = SearchFile(filedict[fileindexchar],filterchar[indexfilter])
            "去重
            for item in copy(loglist)
                for item1 in Removeduplicates
                    if matchstr(item,item1) != ''
                        let curitem = join(split(item)[5:-2])
                        if curitem ==# preitem && preitem != ""
                            call remove(loglist, index(loglist, item))
                        endif
                        let preitem = curitem
                        break
                    endif
                endfor
            endfor
            if has_key(smallestunit,indexfilter) ==# 1 && len(loglist) != 0
                let resultlist = AnalyzeLogResults(loglist,indexfilter)
                let resultlist = insert(resultlist,"<<<<<<<<<<<<<<<<")
                let resultlist = insert(resultlist,indexfilter . " 结果分析")
                let resultlist = add(resultlist,">>>>>>>>>>>>>>>")
            endif
            if len(loglist) != 0
                let Multidimensionaldict[indexfilter] = copy(MultidimensionalAnalysis(loglist))
                let loglist = insert(loglist,"<<<<<<<<<<<<<<<<")
                let loglist = insert(loglist,indexfilter . " 源数据")
                let loglist = add(loglist,">>>>>>>>>>>>>>>")
            endif
        endif
        let allresultlist  = extend(allresultlist,resultlist)
        let allresultlist  = extend(allresultlist,loglist)
        redraw
        let idx1 += 1
    endwhile
    silent execute ":" . 1 . "," . line('$') . "d"
    let Multidimensionallist = []
    let filterkey = sort(keys(Multidimensionaldict))
    for item in filterkey
        let templist = copy(Multidimensionaldict[item])
        let templist = filter(templist, 'matchstr(v:val,"█") ==# ""')
        let Multidimensionallist = extend(Multidimensionallist,Multidimensionaldict[item])
    endfor
    let MultiDimensionalAnalysresult = MultidimensionalAnalyst(Multidimensionallist)
    let allresultlist  = extend(MultiDimensionalAnalysresult,allresultlist)
    let downloadpin = split(system("pwd"),'\n')[0]
    let allresultlist = insert(allresultlist,downloadpin)
    if matchstr(downloadpin,"delay") != ""
        let downloadpin = split(downloadpin,'_')
        let index = index(downloadpin,"delay")
    else
        let downloadpin = split(downloadpin,'_')
        let index = index(downloadpin,"fbk")
    endif
    let downloadpin = downloadpin[index -1] . "_" . downloadpin[index -2]
    let saveresult = saveresult . '/' . downloadpin
    let daildate = daildate ."结束" .  system("date '+%Y%m%d-%H.%M.%S'")
    let allresultlist = insert(allresultlist,string(daildate))
    if findfile(saveresult) != ""
        let emptylist = readfile(saveresult)[0:9]
        let allresultlist  = extend(emptylist,allresultlist)
    else
        let emptylist = repeat([" "],10)
        let allresultlist  = extend(emptylist,allresultlist)
    endif
    echo daildate
    if matchstr(system("pwd"),"delay_core") ==# "" &&  matchstr(system("pwd"),"_fbk_") ==# ""
        call writefile(allresultlist,"./analy.txt")
        silent execute "normal! :e ./analy.txt  \<cr>"
    else
        call writefile(allresultlist,saveresult)
        silent execute "normal! :e  " . saveresult . "\<cr>"
    endif
    echo g:Dimensionalflag
    if a:0 ==# 0
        call input("11")
    endif
    redraw
endfunction
"}}}}}

"{{{{{2   AnalyzeLogResults(...)分析日志结果
"{{{{{3  自动分析工具，各个角度分析日志
"蓝牙打开了几次，什么时候打开，打开耗时多少
"蓝牙连接了多少个设备，什么时候连接，连接耗时，是否有失败
"蓝牙有发起几次播放，什么时候播放，播放了多久，每次播放耗时是否正常
"蓝牙有发起了几次通话，什么时候通话，通话了多久，通路是什么
"audio 发起的播放和通话时间是否符合要求
"播放和通话的编解码器和采样率，音量
"gatt 发起连接扫描时间，上报的设备
"卡音关键词，蓝牙打不开关键，服务进程死掉

"自动分析策划
"1 确认整份日志通路，分割通路，记录每次蓝牙通路段，记录蓝牙通路端的stream 3的音量


"开发计划
" g:smallestunitdict 每个项关键词都编个号码，以便后期多维度分析.每个项都分0 -1 -2 三个flag，分别是0显示计算，-2 只显示, -1 不计算不显示
" g:filterchar 多添加一些日志好在源数据中看出问题（后期也要做到自动化分析里面）
"{{{{{4  BinaryFileSearch(...) 二进制文件搜索
function! BinaryFileSearch(...)
    "{{{{{3 变量定义
    let filename = a:1
    let fiterchar = a:2
    let result = ""
    let cmd = ""
    "}}}}
    let filename = join(split(system("find -iname " . filename)))
    let cmd = " grep -Esi -a \"" . fiterchar . "\" " . filename
    "echo cmd
    if filename ==# ""
        return
    else
        let result = system(cmd)
        return result
    endif
endfunction
"}}}}}
"{{{{{4  Findbluetoothlogs(...) 查找hci日志和fw日志
function! Findbluetoothlogs(...)
    "{{{{{3 变量定义
    let homedir = ""
    let downloadpin = ""
    let index = ""
    let findcmd = ""
    let hcipath = ""
    let hcifileresult = []
    let templist = []
    let hcilist = []
    let fwlist = []
    let a2dpdumplist = []
    let vmlist = []
    let tempflag = 0
    let tempnr = 1
    let idx1 = 0
    "}}}}
    let hcifileresult = add(hcifileresult,"hci fw log")
    let hcifileresult = add(hcifileresult,"<<<<<<<<<<<<<<<<")
    let homedir = system("pwd")
    while idx1 < len(split(homedir,'/'))
        if matchstr(split(homedir,'/')[idx1],"_delay_core") != ""
            let tempnr = idx1
        endif
        let idx1 += 1
    endwhile
    if matchstr(homedir,"debuglogger") != ""
    elseif matchstr(homedir,"_delay_core") != ""
        let downloadpin = split(matchstr(homedir,'[0-9]\{6\}_delay_core'),"_delay_core")[0]
        let index = index(split(homedir,'/'),"mobilelog")
        let findcmd = "find /" . join(split(homedir,'/')[0:tempnr -1],'/')  . " -iname '*delay_common_pvt*' | grep \"" . downloadpin . "\""
        let hcipath = split(system(findcmd),'\n')
        if len(hcipath) ==# 1
            let findcmd = "find " .  hcipath[0] . " -iname "
            let hcifileresult = add(hcifileresult,"固件日志和hci日志在" . hcipath[0])
            let templist = split(system(findcmd . '*BT_HCI*'),'\n')
            "find -iname '*BT_HCI*' -o -iname '*bt_hci*'
            if len(templist) != 0
                let templist  = filter(templist, 'system("stat -c %s " . v:val) != "0\n"')
                let templist = map(templist,'split(v:val, "/")[-1]')
                if matchstr(templist[0], "\\d\\{4\\}_\\d\\{4\\}_\\d\\{6\\}") ==# ''
                    let templist = map(templist, 'substitute(matchstr(v:val, "\\d\\{8\\}_\\d\\{6\\}"),"_","","g")')
                else
                    let templist = map(templist, 'substitute(matchstr(v:val, "\\d\\{4\\}_\\d\\{4\\}_\\d\\{6\\}"),"_","","g")')
                endif
                let hcilist =  uniq(sort(templist))
                if len(hcilist) > 1
                let hcifileresult = add(hcifileresult,"hci日志".'-'. hcilist[0] . "-" . hcilist[-1])
                endif
            endif
            let templist = split(system(findcmd . '*BT_FW*'),'\n')
            if len(templist) != 0
                let templist  = filter(templist, 'system("stat -c %s " . v:val) != "0\n"')
                let templist = map(templist,'split(v:val, "/")[-1]')
                let templist = map(templist, 'substitute(matchstr(v:val, "\\d\\{4\\}_\\d\\{4\\}_\\d\\{6\\}"),"_","","g")')
                let fwlist =  uniq(sort(templist))
                if len(fwlist) > 1
                    let hcifileresult = add(hcifileresult,"fw日志".'-'. fwlist[0] . "-" . fwlist[-1])
                endif
            endif
            if  (len(hcilist) > 1 && len(fwlist) > 1)&& (hcilist[0] - fwlist[0] > 0 ||  hcilist[-1] - fwlist[-1] < 0)
                let hcifileresult = add(hcifileresult,"fw 日志可能没有抓到")
            endif
        endif
        let findcmd = "find /" . join(split(homedir,'/')[0:tempnr -1],'/')  . " -iname '*delay_third_pvt*' | grep \"" . downloadpin . "\""
        let hcipath = split(system(findcmd),'\n')
        if len(hcipath) ==# 1
            let findcmd = "find " .  hcipath[0] . " -iname "
            let templist = split(system(findcmd . '*.mp4'),'\n')
            if len(templist) != 0
                let hcifileresult = add(hcifileresult,"录屏在". hcipath[0])
                let templist  = filter(templist, 'system("stat -c %s " . v:val) != "0\n"')
                let templist = map(templist,'split(v:val, "/")[-1]')
                let templist = map(templist, 'substitute(matchstr(v:val, "\\d\\{8\\}_\\d\\{6\\}"),"_","","g")')
                let templist  = filter(templist, 'system("stat -c %s " . v:val) != "0\n"')
                let templist =  uniq(sort(templist))
                if len(templist) > 1
                    let hcifileresult = add(hcifileresult,"录屏".'-'. templist[0] . "-" . templist[-1])
                endif
            endif
        endif
        let findcmd = "find /" . join(split(homedir,'/')[0:tempnr -1],'/')  . " -iname '*modem_audio_pvt*' | grep \"" . downloadpin . "\""
        let hcipath = split(system(findcmd),'\n')
        if len(hcipath) != 0
            let findcmd = "find " .  hcipath[0] . " -iname "
            let templist = split(system(findcmd . 'streamout.*pcm.*AudioALSAStreamOut.*.wav'),'\n')
            if len(templist) != 0
                let hcifileresult = add(hcifileresult,"audio dump在". hcipath[0])
                let templist  = filter(templist, 'system("stat -c %s " . v:val) != "0\n"')
                let templist = map(templist,'split(v:val, "/")[-1]')
                let templist = map(templist, 'substitute(matchstr(v:val, "\\d\\{8\\}_\\d\\{6\\}"),"_","","g")')
                let a2dpdumplist =  uniq(sort(templist))
                if len(a2dpdumplist) > 1
                    let hcifileresult = add(hcifileresult,"a2dpdump日志".'-'. a2dpdumplist[0] . "-" . a2dpdumplist[-1])
                endif
            endif
            let templist = split(system(findcmd . 'VML*.vm'),'\n')
            if len(templist) != 0
                let hcifileresult = add(hcifileresult,"vm log在". hcipath[0])
                let templist  = filter(templist, 'system("stat -c %s " . v:val) != "0\n"')
                if len(templist) ==# 0
                    let hcifileresult = add(hcifileresult,"log 大小为0")
                endif
                let templist = map(templist,'split(v:val, "/")[-1]')
                let templist = map(templist, 'substitute(matchstr(v:val, "\\d\\{4\\}_\\d\\{2\\}_\\d\\{2\\}_\\d\\{6\\}"),"_","","g")')
                let vmlist  =  uniq(sort(templist))
                if len(vmlist) > 1
                    let hcifileresult = add(hcifileresult,"vmlog日志".'-'. vmlist[0] . "-" . vmlist[-1])
                endif
            endif
        endif
    endif
    let hcifileresult = add(hcifileresult,">>>>>>>>>>>>>>>")
    return hcifileresult
endfunction
"}}}}}
"{{{{{4  MultidimensionalAnalysis(...) 多维度分析编号
function! MultidimensionalAnalysis(...)
    "{{{{{3 变量定义
    let DimensionalAnalysis = g:DimensionalAnalysis
    let keywords = GetOneOfTheColumns(DimensionalAnalysis,"",0)
    let label = GetOneOfTheColumns(DimensionalAnalysis,"",1)
    let analyloglist = a:1
    let Multidimensionalresult = []
    let Dimensionalflag = 0
    "}}}}
    for item in analyloglist
        for item1 in keywords
            if matchstr(item,item1) != ''
                let Dimensionalflag = label[index(keywords,item1)]
                if  count(g:Dimensionalflag,Dimensionalflag) ==# 0
                    let g:Dimensionalflag = add(g:Dimensionalflag,Dimensionalflag)
                endif
                let analyloglist[index(analyloglist,item)] = Dimensionalflag  . '█' . item
                let Multidimensionalresult = add(Multidimensionalresult,Dimensionalflag  . '█' . item)
            endif
        endfor
    endfor
    return Multidimensionalresult
endfunction
"}}}}}
"{{{{{4  MultidimensionalAnalysisToObtainOperationTime(...)多维度分析获取操作时长
function! MultidimensionalAnalysisToObtainOperationTime(...)
    "{{{{{3 变量定义
    let begin = a:1
    let end = a:2
    let loglist = copy(a:3)
    let resultlist = []
    let tempaddr = ""
    let beginflag = -1
    let src = -1
    let tail = -1
    let idx1 = 0
    "}}}}
    if count(g:Dimensionalflag,a:1) ==# 0 || count(g:Dimensionalflag,a:2) ==# 0
        return []
    endif
    "\d\d-\d\d \d\d:\d\d:\d\d\.\d\{6\}
    " echo matchstr("",'\d\d-\d\d \d\d:\d\d:\d\d\.\d\{6\}')
    let loglist  = filter(loglist,'split(v:val, "█")[0] ==# begin || split(v:val, "█")[0] ==# end')
    let loglist   = UniqueList(loglist)
    while idx1 < len(loglist)
        if matchstr(loglist[idx1],begin . '█') ==#  begin . '█'
            let src = matchstr(loglist[idx1],'\d\d-\d\d \d\d:\d\d:\d\d\.\d\{6\}')
        endif
        if matchstr(loglist[idx1],end . '█') ==#  end . '█'
            let tail = matchstr(loglist[idx1],'\d\d-\d\d \d\d:\d\d:\d\d\.\d\{6\}')
            if tail > src && src != -1
                let resultlist = add(resultlist,src . '█' . tail)
            endif
        endif
        let idx1 += 1
    endwhile
    return resultlist
endfunction
"}}}}}
"{{{{{4  MultidimensionalAnalyst(...)多维度分析
function! MultidimensionalAnalyst(...)
    "{{{{{3 变量定义
    let Multidimensionallist  = copy(a:1)
    let MultiDimensionalAnalysisSolution = g:MultiDimensionalAnalysisSolution
    let period = []
    let Asolutionlist = []
    let tempsolution = []
    let temptime = []
    let beginchar = ""
    let endchar = ""
    let outputstring = []
    let datetime = '\d\d-\d\d \d\d:\d\d:\d\d\.\d\{6\}'
    let MultiDimensionalAnalysresult = []
    "}}}}
    for item in MultiDimensionalAnalysisSolution
        if item[-1] ==# 'A'
            let period = MultidimensionalAnalysisToObtainOperationTime(item[0],item[1],Multidimensionallist )
            let Asolutionlist = MultidimensionalAnalystExtract(item[2],Multidimensionallist)
            if len(period) > 0
                for item1 in period
                    let outputstring = []
                    let temptime = split(item1,'█')
                    let beginchar = DatePlus1s(temptime[0],"-1")
                    let endchar = DatePlus1s(temptime[1],"-1")
                    let tempsolution = copy(Asolutionlist)
                    let tempsolution = filter(tempsolution,'matchstr(v:val, datetime) > beginchar && matchstr(v:val, datetime) < endchar' )
                    for item2 in tempsolution
                        "处理通路log行
                        if "AUDIO_DEVICE_OUT_BLUETOOTH_SCO" ==# matchstr(item2,"AUDIO_DEVICE_OUT_BLUETOOTH_SCO")
                            if count(outputstring,"AUDIO_DEVICE_OUT_BLUETOOTH_SCO") ==# 0
                                let outputstring = add(outputstring,"AUDIO_DEVICE_OUT_BLUETOOTH_SCO")
                            endif
                        elseif "AUDIO_DEVICE_OUT_BLUETOOTH_A2DP" ==# matchstr(item2,"AUDIO_DEVICE_OUT_BLUETOOTH_A2DP")
                            if count(outputstring,"AUDIO_DEVICE_OUT_BLUETOOTH_A2DP") ==# 0
                                let outputstring = add(outputstring,"AUDIO_DEVICE_OUT_BLUETOOTH_A2DP")
                            endif
                        endif
                    endfor
                    "echo item[-2] . " " .  join(temptime,"-") . " 通路 ".  join(outputstring)
                    let MultiDimensionalAnalysresult = add(MultiDimensionalAnalysresult,item[-2] . " " .  join(temptime,"-") . " 通路 ".  join(outputstring))
                endfor
            endif
        endif
    endfor
    return MultiDimensionalAnalysresult
endfunction
"}}}}}
"{{{{{4  MultidimensionalAnalystExtract(...) 提取一个参数
function! MultidimensionalAnalystExtract(...)
    "{{{{{3 变量定义
    let begin = a:1
    let loglist = copy(a:2)
    "}}}}
    let loglist  = filter(loglist,'split(v:val, "█")[0] ==# begin')
    let loglist = UniqueList(loglist)
    return loglist
endfunction
"}}}}}
"}}}}}
function! AnalyzeLogResults(...)
    "{{{{{3 变量定义
    let loglist = copy(a:1)
    let fileindexchar = a:2

    "["keywords","时间","msg"]
    let smallestunit = g:smallestunitdict[fileindexchar]
    let idx1 = 0
    let idj1 = 0
    let resultlist = []
    let keywords = []
    let timelength = []
    let msg = []
    let tempaddr = ""
    let curitem = ""
    let preitem = ""
    let tempresult = []
    "}}}}
    let keywords = GetOneOfTheColumns(smallestunit,"",0)
    let timelength  = GetOneOfTheColumns(smallestunit,"",1)
    let msg = GetOneOfTheColumns(smallestunit,"",2)
    let lasttime = -1
    let curltime = -1
    let lastlogtime = 0
    let curllogtime = 0
    let deviceaddr = []
    let idx1 = 0
    let typeflag = 0
    while idx1 < len(loglist)
        let idj1 = 0
        while idj1 < len(keywords)
            if matchstr(loglist[idx1],keywords[idj1]) != ""
                if type(timelength[idj1]) ==# 3
                    let curltime = timelength[idj1][1]
                    let typeflag = timelength[idj1][0]
                else
                    let curltime = timelength[idj1]
                    let typeflag = 0
                endif
                if curltime != -1
                    let curllogtime = ParseTimestamp(split(loglist[idx1])[1])
                    let resultlist = add(resultlist,loglist[idx1])
                    if msg[idj1] != ""
                        let resultlist[-1] = resultlist[-1] . msg[idj1]
                    endif
                    if lasttime != -1  && typeflag != -2 && curltime > lasttime
                        if ((curllogtime - lastlogtime)) > ((curltime - lasttime) * 1.25)
                            let resultlist[-1] = resultlist[-1]  . " 花费 " .  string((curllogtime - lastlogtime) / 1000) . "s标准是"  . string(((curltime - lasttime) * 1.25)) . "ms"
                        endif
                    endif
                endif
            endif
            let idj1 += 1
        endwhile
        let lasttime = curltime
        let lastlogtime = curllogtime
        let idx1 += 1
    endwhile
    for item in resultlist
        let tempaddr = matchstr(item,'\([0-9A-Fa-fxX]\{2\}:\)\{5\}[0-9A-Fa-fxX]\{2\}')
        if tempaddr != "" && (count(deviceaddr,tempaddr) ==# 0)
            let deviceaddr = add(deviceaddr,tempaddr)
        endif
    endfor
    if len(deviceaddr) != 0
        let tempresult = copy(resultlist)
        let resultlist = []
        for item in deviceaddr
            let resultlist = add(resultlist,"设备" . item)
            for item1 in tempresult
                if matchstr(item1,'\([0-9A-Fa-fxX]\{2\}:\)\{5\}[0-9A-Fa-fxX]\{2\}') ==# ""
                    let resultlist = add(resultlist,item1)
                else
                    if matchstr(item1,item) ==# item
                        let resultlist = add(resultlist,item1)
                    endif
                endif
            endfor
        endfor
        let resultlist = tempresult
    endif
    return resultlist
endfunction
"}}}}}

"{{{{{2 function!  EntryStandardProcess(...) 录入标准流程
function! EntryStandardProcess(...)
    "{{{{{3 变量定义
    let path = Homedir("autoanaly/process",1)
    let processlist = []
    let filterchar = g:filterchar
    let idx1 = 0
    let filterkey = []
    let filterkeytem = []
    let filterlist = []
    let firsttime = 0
    let finalfilterword = 0
    let finalkeywords = ""
    "}}}}
    let filterkey = keys(filterchar)
    let filterkeytem = copy(filterkey)
    call AddNumber(filterkeytem)
    let indexfilter = input("请输入mode")
    let indexfilter = filterkey[indexfilter]
    let processlist = readfile(path)
    let firsttime = ParseTimestamp(split(processlist[0])[1])
    echo filterchar[indexfilter]
    echo processlist[0]
    "echo substitute(filterchar[indexfilter], '|', '\\|', 'g')
    let finalfilterword = filterchar[indexfilter]
    let finalfilterword = substitute(finalfilterword , '|', '\\|', 'g')
    if matchstr(filterchar[indexfilter],'+') != ""
        "关键词里面有+
        let finalfilterword = substitute(finalfilterword , '+', '\\+', 'g')
    endif
    echo finalfilterword
    while idx1 < len(processlist)
        let finalkeywords = matchstr(processlist[idx1],finalfilterword)
        let finalkeywords = substitute(finalkeywords, '\([0-9A-Fa-fxX]\{2\}:\)\{5\}[0-9A-Fa-fxX]\{2\}', '.*', 'g')
        echo finalkeywords
        let filterlist = add(filterlist,[])
        let filterlist[-1] = ["","",""]
        let filterlist[-1][0] = finalkeywords
        let filterlist[-1][1] = ParseTimestamp(split(processlist[idx1])[1]) - firsttime
        let idx1 += 1
    endwhile
    call append(line('.'),string(filterlist))
endfunction
"}}}}}

"{{{{{2 function!  UnzipFiles(...) extract 解压文件
function! UnzipFiles(...)
    "{{{{{3 变量定义
    let downloadlogfile = Homedir("autoanaly/zipDetails",1)
    let curpath = Homedir("autoanaly/result",2)
    let filetype = ".zip"
    let filename = []
    let targetfilepath = ""
    let findcmd = ""
    let idx1 = 0
    let findmode = ""
    let extractcmd = "unzip "
    let isdelete = ""
    let isloop = ""
    let tempfilename = ""
    let changetime = ""
    let curtime = ""
    let pathsstring = ""
    let deletefile = []
    "}}}}
    if  (Homedir("autoanaly/result",2) ==# split(system("pwd"),"\n")[0] ) || ("/d/Download" != split(system("pwd"),"\n")[0])
        return
    endif
    if a:0 ==# 1
        let findmode = "-maxdepth 1"
        let isdelete = "yes"
    else
        if input("1 当前目录，2递归") ==# 2
            let findmode = ""
        else
            let findmode = "-maxdepth 1"
        endif

        if input("是否删除") ==# "yes"
            let isdelete = "yes"
        endif

        if input("是否直接分析") ==# "yes"
            let isloop = "yes"
        endif
    endif
    echo system('date')
    let curtime = system('date +%s')
    let pathsstring = ""
    let pathsstring = system("find  . -mindepth 1 -maxdepth 1 -type d")
    let findcmd = "find " . findmode . " -iname '*"  . filetype . "'"
    echo findcmd
    let filename = split(system(findcmd),"\n")
    let downlog = readfile(downloadlogfile )
    let downlog = add(downlog, "###########################")
    let downlog = add(downlog, strftime("%Y-%m-%d %H:%M:%S") . "开始解压" .  filetype)
    echo system('date')
    echo "tangxinlou4"
    while idx1 < len(filename)
        if "" ==# matchstr(filename[idx1],"(")
            let targetfilepath = split(filename[idx1],filetype)[0]
            if matchstr(pathsstring,targetfilepath) ==# ""
                call system(extractcmd  . filename[idx1] . " -d " . targetfilepath)
                let downlog = add(downlog, strftime("%Y-%m-%d %H:%M:%S") . "解压end" .  filename[idx1])
            endif
            "let changetime = system('stat -c %Y '. filename[idx1])
            "echo  isdelete ==# "yes" && (str2nr(curtime) - str2nr(changetime) > 86400)
        else
            let tempfilename = split(filename[idx1],"/")
            let  tempfilename[-1] = "'" . tempfilename[-1] . "'"
            let tempfilename = join(tempfilename,"/")
            call system("rm -rf " . tempfilename)
            let downlog = add(downlog, strftime("%Y-%m-%d %H:%M:%S") . "删除了" .  tempfilename)
        endif
        let idx1 += 1
    endwhile
    "删除5天前zip
    let deletefile = split(system(findcmd .  " -mtime +5"),'\n')
    echo system('date')
    echo "tangxinlou5"
    "call system("rm -rf *.7z")
    if isdelete ==# "yes" && len(deletefile)  != 0
        "echo deletefile
        for item in deletefile
            if "" != matchstr(item,"(")
                let  item = "'" . item . "'"
                echo item
            endif
            call system("rm -rf " . item)
        endfor
    endif
    echo "tangxinlou6"
    "删除10天前的所以文件
    let deletefile = split(system("find . -maxdepth 1 -type f -mtime +10"),'\n')
    if isdelete ==# "yes" && len(deletefile)  != 0
        "echo deletefile
        for item in deletefile
            if "" != matchstr(item,"(")
                let  item = "'" . item . "'"
                echo item
            endif
            call system("rm -rf " . item)
        endfor
    endif
    let downlog = add(downlog, strftime("%Y-%m-%d %H:%M:%S") . "解压完成" .  filetype)
    let downlog = add(downlog, "###########################")
    call writefile(downlog,downloadlogfile )
    echo system('date')
    call ChangeDirectoryName()
    echo system('date')
    if a:0 ==# 0
        if isloop ==# "yes"
            call LoopAnalysis(isloop)
        else
            call input('111')
        endif
    else
        redraw
    endif
endfunction
"}}}}}

"{{{{{2 function!  LogSearcher(...) 日志搜索器
function! LogSearcher()
    "{{{{{3 变量定义
    let keywords = ""
    let grepchar = "grep -Esin  "
    let path = expand("%:p")
    let grepcmd  = ""
    "let grepcmd  = grepchar  .keywords
    let result = []
    let historysele = []
    let temphistorysele = []
    let  flag = ""
    "}}}}
    let historysele = split(@l,'█')
    let temphistorysele = copy(historysele)
    call AddNumber2(temphistorysele)
    let flag = input("请输入搜索的关键词")
    "echo flag
    "echo len(flag)
    if flag ==# "no"
        let keywords = @@
    else
        if len(flag) > 3
            let keywords = flag
        else
            let keywords = historysele[flag]
        endif
    endif
    let grepcmd  = grepchar . " \"" .  keywords . "\" " . path
    let @/ = substitute(keywords, '|', '\\|', 'g')
    "echo split(@l,'█')
    if count(split(@l,'█'),keywords) ==# 0
        let keywords = keywords . '█'  . @l
        if len(split(keywords,"█")) > 100
            let keywords = split(keywords,"█")
            let keywords = keywords[0:9]
            let keywords = join(keywords,"█")
        endif
        let @l = keywords
    endif
    silent cgetexpr  system(grepcmd)
    silent redraw | silent copen
    silent set modifiable
    silent execute "normal! \<c-w>J"
endfunction
"}}}}}

"{{{{{2 function!  LoopAnalysis(...) 循环分析
function! LoopAnalysis(...)
    "{{{{{3 变量定义
    let paths = []
    let findcmd = "find -iname  'mobilelog' -type d"
    let grepchar = ""
    let directory = ""
    let idx1 = 0
    let tempchar = ""
    let isloop = ""
    if a:0 ==# 1
        let isloop = a:1
    endif
    "}}}}
    if isloop ==# "yes"
        let tempchar = ManageExtractionCode()
    else
        echo ManageExtractionCode()
        let tempchar = input("输入提取码")
    endif
    if tempchar != ''
        let findcmd = findcmd . " | grep -E \"" . tempchar . "\""
    endif
    let paths = split(system(findcmd),"\n")
    echo len(split(tempchar,'|'))
    echo split(tempchar,'|')
    if len(paths) != len(split(tempchar,'|'))
        call UnzipFiles(1)
        let paths = split(system(findcmd),"\n")
    endif
    echo paths
    while idx1 < len(paths)
        redraw
        let directory = split(paths[idx1],'/')[1]
        echo "tangxinlou 2" . directory
        execute 'cd ' . directory
        echo directory
        redraw
        call AutoAnalyzer(1)
        execute 'cd ..'
        let idx1 += 1
    endwhile
    "execute 'cd auto_export_20240125184947_20240125200343_234883337'
endfunction
"}}}}}

"{{{{{2 function!  ChangeDirectoryName(...) 改变目录名字
"echo split("./20240112_86629XXXXX35756_8931_272035",'/')
"echo systemlist('find 20240305_86989XXXXX70873_70952_354028 -name "*_core" -type d')
function! ChangeDirectoryName(...)
    "{{{{{3 变量定义
    let paths = []
    let keyword = ["delay_*_core",
                \"delay_*_common",
                \"*fbk_*_core",
                \"*fbk_*_common",
                \"*fbk_*_common_pvt",
                \"*fbk_*_modem_audio_pvt",
                \"*fbk_*_third_pvt",
                \"delay_*_third_pvt",
                \"delay_*_common_pvt",
                \"delay_*_modem_audio_pvt",
                \]
    let findcmd = ""
    let resultchar = ""
    let currentTime = ""
    let folderTime = ""
    let Extractioncodefile = readfile(Homedir("autoanaly/Extractioncode",1))
    let Extractioncodelist = GetOneOfTheColumns(Extractioncodefile,',',1)
    let tempchar = ''
    "}}}}
    echo system('date')
    let currentTime = system('date +%s')
    "删除7天前的目录
    let paths = split(system("find . -mindepth 1 -maxdepth 1 -type d -mtime +14 -printf \"%T@ %p\n\" | sort -n -r"),"\n")
    let paths  = map(paths, 'split(v:val, "/")[1]')
    echo system('date')
    for item in paths
        if "" != matchstr(item,"(")
            let  item = "'" . item . "'"
            echo item
        endif
        call system('rm -rf ' . item)
    endfor
    let paths = []
    let paths = split(system("find . -mindepth 1 -maxdepth 1 -type d"),"\n")
    let paths  = map(paths, 'split(v:val, "/")[1]')
    echo system('date')
    for item in paths
        if "" != matchstr(item,"(")
            let  item = "'" . item . "'"
        endif
        if matchstr(item,"delay_") ==# "" && matchstr(item,"_fbk_") ==# ""
            for item1 in keyword
                let findcmd = "find " . item . " -name '" . item1 . "' -type d"
                let resultchar = systemlist(findcmd)
                if len(resultchar) != 0
                    let tempchar = substitute(item1, '_\*', '', 'g')
                    let tempchar = substitute(tempchar, '\*', '', 'g')
                    if matchstr(item1,"fbk_") ==# 'fbk_'
                        echo  "mv " . item . " " . item . "_delay_" . tempchar
                        call system("mv " . item . " " . item . "_" . tempchar )
                    else
                        "echo  "mv " . item . " " . item . "_" . tempchar
                        call system("mv " . item . " " . item . "_" . tempchar)
                    endif
                    if item1 ==# "delay_*_core" || item1 ==# "*fbk_*_core"
                        let tempchar = split(item,'_')
                        if count(Extractioncodelist,tempchar[-1]) ==# 0
                            let Extractioncodefile = insert(Extractioncodefile,"new,". tempchar[-1])
                        endif
                    endif
                    break
                endif
            endfor
            if matchstr(item,"delay_") ==# ""
                call system("mv " . item . " " . item . "_" . "delay_temp")
            endif
        endif
    endfor
    call writefile(Extractioncodefile,Homedir("autoanaly/Extractioncode",1))
endfunction
"}}}}}

"{{{{{2   ManageExtractionCode(...)管理提取码文件Extractioncode
function! ManageExtractionCode(...)
    "{{{{{3 变量定义
    "nnoremap <leader>ee :tabnew<cr>:execute "e " . Homedir("autoanaly/Extractioncode",1)<cr>
    let Alreadyanalyzed = ""
    let templist = ""
    let Extractioncodefile = readfile(Homedir("autoanaly/Extractioncode",1))
    let Extractioncodelist = GetOneOfTheColumns(Extractioncodefile,',',1)
    "}}}}
    let Alreadyanalyzed = system("ls " . Homedir("autoanaly/result",2))
    echo Extractioncodelist
    for item in Extractioncodelist
        if matchstr(Alreadyanalyzed,item) ==# ""
            let templist = item . '|' . templist
        endif
    endfor
    return join(split(templist,'|'),'|')
endfunction
"}}}}}
"}}}
"{{{{  python

"{{{{{2   PythonTest(...) python test 传参数
function! PythonTest()
    "{{{{{3 变量定义
    let pythontest = ""
    let path = "par from vimscript into python"
    "}}}}
python3 <<EOM
import vim
import os
var = vim.eval("path")
print(var)
var = "%s,add string in python now"%var
vim.command("let path = '%s'"%var)
EOM
    echo "tangxinlou"
    echo path
endfunction
"}}}}}
"{{{{{2  function! ExecutePythonScript(...) 查看当前android.bp编译了哪些文件
" 执行 Python 脚本
function! ExecutePythonScript()
python3 << EOF
import os
import ast

# 递归遍历目录
def traverse_directory(directory):
    for root, dirs, files in os.walk(directory):
        for file in files:
            if file.endswith('Android.bp'):
                android_bp_path = os.path.join(root, file)
                with open(android_bp_path, 'r') as f:
                    content = f.read()
                    try:
                        tree = ast.parse(content)
                        # 提取编译规则中的文件信息
                        for node in ast.walk(tree):
                            if isinstance(node, ast.Call) and hasattr(node.func, 'id') and node.func.id == 'cc_library':
                                if 'srcs' in [keyword.arg for keyword in node.keywords]:
                                    srcs_node = [keyword.value.elts for keyword in node.keywords if keyword.arg == 'srcs'][0]
                                    srcs = [os.path.join(root, src.s) for src in srcs_node]
                                    print(f"{android_bp_path} 编译了以下文件：{srcs}")
                    except SyntaxError as e:
                        print(f"在解析文件 {android_bp_path} 时出现语法错误：{e}")

# 调用递归遍历函数
traverse_directory('.')
EOF
call input("11")
endfunction
"}}}}}

"}}}
"{{{{  调整窗口
"{{{{{2   WidChanged(...) 调整窗口
"let g:windowid = 0
function! WidChanged(...)
    "{{{{{3 变量定义
    let windowinfo = ""
    "}}}}
    let windowinfo = getwininfo()
    "echo windowinfo
    let windowinfo[0].width = 50
    let windowinfo[0].height = 6
    "echo windowinfo
    "这个1是winnr ，resize设置高度 vert resize 设置宽度 不可以指定窗口id 设置,可以用win_gotoid跳到对应 窗口设置
    call  execute(["1resize 32","vert 1resize 135"])
    "call  execute("vert resize 135")
    "call  execute('vert 1resize 135')
endfunction
"}}}}}
"{{{{{2 function!  ModifyColors(...) 调整颜色
let g:ModifyColors = 0
function! ModifyColors(...)
    "{{{{{3 变量定义
    let ModifyColors = g:ModifyColors
    let colors = ["blue",
                \"darkblue",
                \"default",
                \"delek",
                \"desert",
                \"elflord",
                \"evening",
                \"habamax",
                \"industry",
                \"koehler",
                \"lunaperche",
                \"morning",
                \"murphy",
                \"pablo",
                \"peachpuff",
                \"quiet",
                \"retrobox",
                \"ron",
                \"shine",
                \"slate",
                \"sorbet",
                \"torte",
                \"wildcharm",
                \"zaibatsu",
                \"zellner",]
    "}}}}
    echo  colors[ModifyColors]
    execute 'colorscheme ' . colors[ModifyColors]
    let g:ModifyColors += 1
    call input("111")
endfunction
"}}}}}
"}}}
"{{{{  拉安卓代码
"https://blog.csdn.net/qq_26914291/article/details/127729612
"下载repo
"windows python3 找不到可以去安装路径复制一个python3
"./git-repo/repo init -u https://aosp.tuna.tsinghua.edu.cn/platform/manifest -b android-13.0.0_r1

"}}}
"{{{{  popup 弹窗
function! ColorSelected(id, result)
    " use a:result
endfunction
"call popup_menu(['red', 'green', 'blue'], #{callback: 'ColorSelected'})
function! ShowPopupMenu()
    let choices = ['Option 1', 'Option 2', 'Option 3']
    echo  popup_menu(choices, {'\t': 'Select an option:', 'title': 'Options'})
endfunction
"}}}
"{{{{ 通过log确定代码流程
"{{{{{2 function!  FouncAddLog(...) 为每个文件的函数添加一行打印
function! FouncAddLog(...)
    "{{{{{3 变量定义
    let files = []
    let filename = ""
    let classdict = {}
    let idx1 = 0
    let mode = 0
    let g:debugflag = 20
    "}}}}
    let mode = input("1是加log2是删log")
    let filetype = input("1是java2是cc3是cpp")
    if filetype ==# 1
        let files = split(system("find -iname '*.java'"),"\n")
    elseif filetype ==# 2
        let files = split(system("find -iname '*.cc'"),"\n")
    elseif filetype ==# 3
        let files = split(system("find -iname '*.cpp'"),"\n")
    endif
    let g:debugid = 0
    while idx1 < len(files)
        let filename = split(files[idx1],'/')[-1]
        if mode ==# 1
            let classdict[filename] = FileAddLog(files[idx1],1)
        elseif mode ==# 2
            let classdict[filename] = FouncDeleLog(files[idx1],1)
        endif
        let idx1 += 1
    endwhile
    call append(line('.'),string(classdict))
endfunction
"}}}}}

"{{{{{2 function!  FileAddLog(...) 当前文件每个转折都打印一行log
function! FileAddLog(...)
     "{{{{{3 变量定义
    let filename = ""
    let idx1 = 0
    let targetline = 0
    let currentString  = ""
    let abnormallist = ["new ",
                \" switch ",
                \"{}",
                \"(){",
                \"//",
                \"; }",
                \";}",
                \"\\",
                \"\\[\\]",
                \"constexpr ",
                \"\\[this\\]",
                \" switch("]
    let uncheck = ["if(",
                \"if (",
                \"try{",
                \"try {",
                \"for(",
                \"for (",
                \"synchronized (",
                \"synchronized(",
                \"switch (",
                \"else{",
                \"else {",
                \"case ",
                \"default:",
                \"do {",
                \"do {",
                \"switch(",
                \"while (",
                \"while(",
                \"} catch",
                \"}catch",
                \"static {",
                \"static{"]
    let functionname = ""
    let tempchar = ""
    let g:debugflag = 20

    "}}}}
    if a:0 ==# 0
        let winnrnum = tabpagewinnr(tabpagenr(),'$')
        echo winnrnum
        if winnrnum  >  1
            execute "normal! \<c-w>h"
            execute "normal! :q!\<cr>"
        endif
        let filename = expand("%:p")
    else
        let filename = a:1
        let mode = a:2
        execute "normal! :tabnew \<cr>:e " . filename . " \<cr>"
        setlocal foldmethod=syntax
        redraw
    endif
    let idx1 = 0
    while idx1 <= line('$')
        let currentString  = getline(idx1)
        if IsComment(idx1) ==# 0
        if (matchstr(currentString,") {") ==# ") {"  ||  matchstr(currentString,"){") ==# "){" )
            call cursor(idx1,1)
            let tempchar = StandardCharacters(line('.'))
            if CheckStringIsObtainOfList(tempchar,abnormallist)
            else
                if !CheckStringIsObtainOfList(tempchar,uncheck)
                    if line('.') ==# idx1
                        let targetline = idx1
                        "let functionname = split(split(getline('.'),'(')[0])[-1]
                        let functionname = ExtractKeyCodes(targetline )
                        let idx1 =  AddDebugLog(targetline,functionname)
                    else
                    endif
                endif
            endif
            if a:0 ==# 0
                call input("11")
            endif
        endif
        if matchstr(currentString,"  case .*:") != "" &&  matchstr(currentString," return ") ==# ""
            call cursor(idx1,1)
            if line('.') ==# idx1
                let targetline = idx1
                "let functionname = matchstr(currentString,"case .*:")
                let functionname = ExtractKeyCodes(targetline )
                let idx1 =  AddDebugLog(targetline,functionname)
            else
            endif
            if a:0 ==# 0
                call input("11")
            endif
        endif
    endif
        redraw
        let idx1 += 1
    endwhile
    if a:0 ==# 0
    else
        execute "normal! :wq!\<cr>"
    endif
endfunction
"}}}}}

"{{{{{2 function!  FouncDeleLog(...) 删除打印
function! FouncDeleLog()
    "{{{{{3 变量定义
    let filename = ""
    let idx1 = 0
    let targetline = 0
    let currentString  = ""
    "}}}}
    if a:0 ==# 0
        let winnrnum = tabpagewinnr(tabpagenr(),'$')
        echo winnrnum
        if winnrnum  >  1
            execute "normal! \<c-w>h"
            execute "normal! :q!\<cr>"
        endif
        let filename = expand("%:p")
    else
        let filename = a:1
        let mode = a:2
        execute "normal! :tabnew \<cr>:e " . filename . " \<cr>"
        setlocal foldmethod=syntax
        redraw
    endif
    let idx1 = 0
    while idx1 <= line('$')
        let currentString  = getline(idx1)
        if matchstr(currentString,"tangxinlou debug") ==# "tangxinlou debug"
            call cursor(idx1,1)
            silent execute "normal! dd"
        else
            let idx1 += 1
        endif
        redraw
    endwhile
    if a:0 ==# 0
    else
        execute "normal! :wq!\<cr>"
    endif
endfunction
"}}}}}

"}}}}
"{{{例子

function! Exeample()
     "{{{{{3 变量定义
    let filename = ""
    set noautoindent
    set noswapfile
    set nobackup
    set nowritebackup
    set undolevels=1000
    set undofile
    set synmaxcol=150
    set lazyredraw
    set nohlsearch
    set buftype=nowrite
    set bufhidden=unload
    "syntax off
    set lazyredraw
    set noundofile
    set hidden
    set norelativenumber
    set nocursorline
    "}}}}
    if a:0 ==# 0
        "处理当前文件
        "let winnrnum = tabpagewinnr(tabpagenr(),'$')
        "echo winnrnum
        "if winnrnum  >  1
        "    execute "normal! \<c-w>h"
        "    execute "normal! :q!\<cr>"
        "endif
        "let filename = expand("%:p")
        "execute "normal! :r!date +\\%F-\\%T.\\%3N\<cr>"
        if 3 > g:debugflag | call Dbug( "begin",3,0) | endif
        silent tabnew
        if 3 > g:debugflag | call Dbug( "middle",3,0) | endif
        "silent execute "edit  " . "AdapterService.java"
        silent execute "args  " . "AdapterState.java BluetoothSocketManagerBinder.java"
        ":q!
        if 3 > g:debugflag | call Dbug( "end1",3,0) | endif
        b 2
        if 3 > g:debugflag | call Dbug( "end",3,0) | endif
       "execute "normal! :r!date +\\%F-\\%T.\\%3N\<cr>"
       "silent tabnew
       "silent edit  AdapterService.java
       ":q!
       "if 3 > g:debugflag | call Dbug( "end",3,1) | endif
        "execute "normal! :r!date +\\%F-\\%T.\\%3N\<cr>"
    else
        "处理传过来的文件
        let filename = a:1
        let mode = a:2
        "execute "normal! :tabnew \<cr>:e " . filename . " \<cr>"

        setlocal foldmethod=syntax
        redraw
    endif
    if a:0 ==# 0
    else
        execute "normal! :wq!\<cr>"
    endif
endfunction
"}}}
"winnr() 窗口id
"tabpagebuflist() 缓冲区列表
"gettabinfo()标签页信息
"echo winheight('%') winwidth('%')
"set lines=35 columns=118
"winrestcmd()
"forgroundTimeForWifi.\{,20}",
"%g!/唐新楼重新指派了缺陷/d
"g/```c\_.\{-}\ze```/yank B | quit
"%s/```c\_.\{-}\ze```/\=setreg('A', submatch(0), 'l')/gn
"find -iname . -type d -name 'out_*' | xargs rm -rf
"repo init -u https://aosp.tuna.tsinghua.edu.cn/platform/manifest -b android-13.0.0_r1
"let item = {}
"let item.filename = "com/android/bluetooth/a2dp/A2dpService.java"
"let item.lnum = 1229
"let item.text = "Log.e(TAG, \"setActiveDeviceInternal(\" + device + \"): Cannot set as active"
"call setqflist([item])
"grep -Esinr参数
"-E 表示使用扩展的正则表达式进行匹配。
"-s 表示禁止输出错误信息。
"-o 表示只显示匹配的部分，而不是整行。
"-i 表示忽略大小写进行匹配。
"-n 表示显示匹配的行号。
"let splitStrings = map(strings, 'split(v:val, ",")')
