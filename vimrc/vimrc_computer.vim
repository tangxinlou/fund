"设置标志位
let mapleader = ","
"设置作者和版权信息{{{{
map <F6> :call TitleDet()<cr>
function! AddTitle()
    call append(0,"/*******************************************************")
    call append(1,"$ Author       : 唐新楼 ")
    call append(2,"$ Last modified: ".strftime("%Y-%m-%d %H:%M"))
    call append(3,"$ Email        : **************")
    call append(4,"$ blog         : https://blog.csdn.net/daweigongting")
    call append(5,"$ Filename     : ".expand("%:t"))
    call append(6,"$ Description  : ")
    call append(7,"*******************************************************/")
    echohl WarningMsg | echo "Successful in adding copyright." | echohl None
endfunction
function! UpdateTitle()
    normal m'
    execute '/$ Last modified/s@:.*$@\=strftime(":\t%Y-%m-%d %H:%M")@'
    normal ''
    normal mk
    execute '/$ Filename/s@:.*$@\=":\t".expand("%:t")@'
    execute "noh"
    normal 'k
    echohl WarningMsg | echo "Successful in updating the copyright." | echohl None
endfunction
function! TitleDet()
    let n=1
    while n < 10
        let line = getline(n)
        if line =~ '^\$\s*\S*Last\smodified\S*.*$'
            call UpdateTitle()
            return
        endif
        let n = n + 1
    endwhile
    call AddTitle()
endfunction
"}}}}
"vimdiff 颜色配置{{{
if &diff
    "    colorscheme evening
    syntax off
endif
"}}}
"设置屏幕效果按za打开折叠{{{{
"设置折叠的颜色
hi Folded term=standout ctermfg=darkcyan ctermbg=NONE guifg=Black guibg=#e3c1a5
set nocompatible
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set fileencodings=utf-8,gb2312,gbk,gb18030,big5
set fenc=utf-8
set enc=utf-8
set hlsearch
set incsearch
set number
set modifiable
set ignorecase
set ruler
set magic
set fileformats=unix
"set fileformats=dos
set laststatus=2
set statusline=%F
set statusline+=%=
set statusline+=%l
set statusline+=/
set statusline+=%v
set statusline+=/
set statusline+=%L
"set statusline=%f
set foldenable
set foldmethod=syntax
set foldlevel=99
set foldignore=
"set foldmethod=marker
"set mouse=nv
syntax on
"set showmode
set nowrap
"set wrap
set ve=all
set smartindent
set backspace=2
"set spell
"colorscheme peachpuff
set browsedir=current
set scrollbind
set scrollopt=hor
"set snoscrollbind
set scrolloff=7
set shortmess=a
set cmdheight=2
"}}}}}
"abbr 缩写{{{{
"iabbrev com tangxinlou@wingtech.com
iabbrev txl tangxinlou
iabbrev find find -iname
iabbrev grep grep -Esinr
iabbrev vimg vimgrep! //j %:p
"iabbrev bt ap/android/vendor/qcom/opensource/commonsys
"iabbrev vendor ap/android/vendor/qcom/proprietary/bluetooth/
"iabbrev fram ap/android/frameworks/base/core/java/android/bluetooth
"}}}
"禁止用的键{{{
"nnoremap <c--> <nop>
"inoremap <esc> <nop>
"}}}
"auto command自动命令{{{
"创建空文件和自动注释
"设置折叠
augroup filetype_vim
    autocmd FileType vim  setlocal foldmethod=marker
augroup END
"保存文件打印
augroup testgroup
    "清除组命令
    autocm!
    "保存文件是自动打印
    autocmd BufWrite * :echom "cat"
augroup END
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
nnoremap <leader>cn :cn<cr>
nnoremap <leader>cp :cn<cr>
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
nnoremap <leader>s :set mouse=r<cr>:set nonumber<cr>:set wrap <cr>
"nnoremap <leader>wc :tabnew<cr>:!ls -lR |grep "^-"
"nnoremap <leader>f viwyq:ig/<esc>pa/p<cr>
inoremap <C-h> <Left>
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-l> <Right>
"inoremap <bs> <bs>
"inoremap <leader>java <cr><bs><cr><esc>ki<tab><tab>
inoremap {} {}<esc>i<cr><esc>O
inoremap "" ""<esc>i
"inoremap `` ``<esc>i
inoremap '' ''<esc>i
inoremap () ()<esc>i
inoremap [] []<esc>i
nnoremap <leader>d q:ig/<esc>pa/d<cr>
"在log文件中批量删除某些行
"nnoremap rr :tabnew<cr>:e ~/tang1.txt<cr>$a:g/<esc>pa/d<<esc>acr><esc>:wq<cr>
"在log文件中查找多个字符串
nnoremap <leader>rr :tabnew<cr>:e ~/tang1.txt<cr>$pa\<bar><esc>:wq<cr>
nnoremap zr zR
nnoremap zm zM
"删除log文件中的杂乱log
nnoremap <leader>rep     :g/audio_hw_primary:/d<cr>:g/ANDR-PERF-LM:/d<cr>:g/ANDR-PERF-JNI:/d<cr>:g/msm8974_platform:/d<cr>:g/hardware_info:/d<cr>:g/soundtrigger:/d<cr>:g/audio_route:/d<cr>:g/audio_hw_utils:/d<cr>:g/ACDB-LOADER:/d<cr>:g/ANDR-IOP:/d<cr>:g/CompatibilityInfo:/d<cr>:g/Activity:/d<cr>:g/audio_hw_extn:/d<cr>:g/        :/d<cr>:g/ActivityTrigger:/d<cr>:g/ShellView:/d<cr>:g/system_server:/d<cr>:g/PrefCtrlListHelper:/d<cr>:g/InstrumentedPrefFrag:/d<cr>:g/TileUtils:/d<cr>:g/TopLevelSettings:/d<cr>:g/BatteryExternalStatsWorker:/d<cr>:g/statsd  :/d<cr>:g/FaceService:/d<cr>:g/hwservicemanager:/d<cr>:g/PackageManagerEx:/d<cr>:g/WosPackageSettingBase:/d<cr>:g/WosPackageManagerService:/d<cr>:g/WosPackageSettingBase:/d<cr>:g/WosPackageManagerService:/d<cr>:g/KernelCpuSpeedReader:/d<cr>:g/netd    :/d<cr>:g/CpuPowerCalculator:/d<cr>:g/BatteryInfo:/d<cr>:g/BatteryInfo:/d<cr>:g/AvatarViewMixin:/d<cr>:g/StatusBar:/d<cr>:g/AdrenoGLES:/d<cr>:g/RenderThread:/d<cr>:g/AdrenoUtils:/d<cr>:g/BatteryTipLoader:/d<cr>:g/Gralloc3:/d<cr>:g/PmsExtImpl:/d<cr>:g/BatteryTipLoader:/d<cr>:g/audio_hw_hfp:/d<cr>:g/linker  :/d<cr>:g/ServiceManagement:/d<cr>:g/SupportService:/d<cr>:g/QDMA_UI :/d<cr>:g/SubSettings:/d<cr>:g/ConnectedDeviceFrag:/d<cr>:g/chatty  :/d<cr>:g/SliceManager:/d<cr>:g/OpenGLRenderer:/d<cr>:g/ActivityThread:/d<cr>:g/UserRestrictionsUtils:/d<cr>:g/MediaRouter:/d<cr>:g/TaskPersister:/d<cr>:g/System  :/d<cr>:g/Zygote  :/d<cr>:g/droid.bluetoot:/d<cr>:g/Perf    :/d<cr>:g/AdapterServiceConfig:/d<cr>:g/Perf    : /d<cr>:g/bt_device_interop:  /d<cr>:g/SDM/d<cr>:g/PowerManagerService:/d<cr>:g/UsageStatsService:/d<cr>:g/DreamManagerService:/d<cr>:g/DreamController:/d<cr>:g/ActivityManager:/d<cr>:g/WingOsSystemUI/d<cr>:g/DreamManagerService: /d<cr>:g/KeyguardViewMediator:/d<cr>:g/AutofillManagerService: /d<cr>:g/WosQSHeaderImpl:/d<cr>:g/ QSAnimator: /d<cr>:g/CmFireWallManager: /d<cr>:g/LightsService:/d<cr>:g/ DisplayPowerController/d<cr>:g/sensors-hal:/d<cr>:g/KeyguardUpdateMonitor: /d<cr>:g/vol.Events:/d<cr>:g/WhiteListUtil:/d<cr>:g/ConnectivityManager:/d<cr>:g/MobileDataTile: /d<cr>:g/ DisplayPowerController:/d<cr>:g/ProximityListener:/d<cr>:g/sensors-hal: /d<cr>:g/libEGL  : /d<cr>:g/SurfaceFlinger: /d<cr>:g/CarrierTextController:/d<cr>:g/LockWpUtils: /d<cr>:g/LockWpUtils:/d<cr>:g/View    : /d<cr>:g/QC-time-services: /d<cr>:g/QTI PowerHAL: /d<cr>:g/SurfaceControl:/d<cr>:g/WosNotificationService:/d<cr>:g/ AlarmManager: /d<cr>:g/DPMJ    : /d<cr>:g/SUI_svcsock:/d<cr>:g/ FpcExtension: /d<cr>:g/qdlights: /d<cr>:g/sound_trigger_hw:/d<cr>:g/wt_audio_cust:/d<cr>:g/NfcService:/d<cr>:g/vol.Events:/d<cr>:g/PowerGuruService:/d<cr>:g/fpc_fingerprint_hal:/d<cr>:g/KeyguardClockSwitch:/d<cr>:g/DisplayDevice:/d<cr>:g/DisplayManagerService:/d<cr>:g/KeyguardStatusView:/d<cr>:g/libnfc_nci:/d<cr>:g/AlarmAlignHelper:/d<cr>:g/KeyguardClockSwitch:/d<cr>:g/NetspeedView:/d<cr>:g/DisplayManagerService:/d<cr>:g/StackScroller:/d<cr>:g/KeyguardStatusView:/d<cr>:g/libnfc_nci:/d<cr>:g/AlarmAlignHelper: /d<cr>:g/fpc_fingerprint_hal:/d<cr>:g/AlarmAlignHelper:/d<cr>:g/WosPhoneWindowManager:/d<cr>:g/SecondUIViewManager:/d<cr>:g/KeyguardUsbWaterView:/d<cr>:g/BatteryService:/d<cr>:g/libprocessgroup:/d<cr>:g/AudioService.PlaybackActivityMonitor:/d<cr>:g/AndroidRuntime:/d<cr>:g/WindowManager:/d<cr>:g/QMI_FW  :/d<cr>:g/KeyguardSecurityView:/d<cr>:g/QISL    :/d<cr>:g/vold    :/d<cr>:g/Zygote32Timing:/d<cr>:g/Zygote64Timing:/d<cr>:g/irsc_util:/d<cr>:g/TLOC    :/d<cr>:g/PackageParser:/d<cr>:g/ContextImpl:/d<cr>:g/storaged:/d<cr>:g/HealthServiceWrapper:/d<cr>:g/EntropyMixer:/d<cr>:g/SettingsState:/d<cr>:g/SystemServerTiming:/d<cr>:g/InputManager:/d<cr>:g/WatchlistSettings:/d<cr>:g/WatchlistLoggingHandler:/d<cr>:g/ZygoteInitTiming_lazy:/d<cr>:g/DropBoxManagerService:/d<cr>:g/SystemServerTimingAsync:/d<cr>:g/SystemServerInitThreadPool:/d<cr>:g/imsrcsd :/d<cr>:g/Looper  :/d<cr>:g/UsageStatsDatabase:/d<cr>:g/Watchdog:/d<cr>:g/PersistentDataBlockService:/d<cr>:g/OemLock :/d<cr>:g/Looper  :/d<cr>:g/NsdService:/d<cr>
"获取当前文件名及目录
nnoremap <leader>n :let @" = expand("%:p").':'.line(".").':'<cr>
"复制到系统黏贴板
vnoremap <leader>m "+y
"删除window下添加^M
nnoremap <leader>vm :%s/<c-v><c-M>/<cr>/g
"自动复制文本所在的当前行及文件名
vnoremap <leader>a "dy<esc>:let @c= expand("%:p").':'.line(".").':'<cr>
"复制文本及当前行
"nnoremap <leader>p i```c<cr>```<esc>O<esc>0"cpli<cr><esc>0"dp
nnoremap <leader>p i<cr>```c<cr><cr>```<esc>O<cr><esc>k0"cpli<cr><esc>0"dpi<bs><esc>lki<bs><esc>
nnoremap <leader>txl :tabnew<cr>:e ~/tang1.txt<cr>
"nnoremap <leader>co :copen<cr>:set modifiable<cr><c-w>H
nnoremap <leader>co :call <SID>QuckfixToggle()<cr>
nnoremap <leader>br :vsplit<cr>:browse e<cr>
nnoremap <leader>viff :diffthis<cr><c-w>l:diffthis<cr><c-w>h
"添加uml
nnoremap <leader>uml i```mermaid<esc>osequenceDiagram<esc>o```<esc>O
"markdown 注释多余的#
nnoremap <leader>map :%g/^#[a-z]\{1,3\}/normal 0i//<esc>
"nnoremap <leader>h1 yiwq:i:2match DiffChange /\<<c-r>"\>/<CR>
nnoremap <leader>h1 yiwkq:i:/\<<c-r>"\>/<CR>
nnoremap <leader>/  q:i/<esc>p<cr>
"}}}
"取消的映射{{{{
"nnoremap b :normal!  yt|
"nnoremap bn :normal! yi|
"黏贴
"noremap <a-r>v :execute "normal! p"
"得到文件名
"nnoremap <leader>t :%p<cr>
"nnoremap <leader>tt  :%:p:hp<cr>
"按,gsn后没有感叹号会跳转到第一个结果的文件中来,用cn和cp可以切换文件
"nnoremap <leader>gsn :execute "grep -R" "something" "."<cr>
"按,vjcn后可以跳转到第一个结果的文件中来,用cn和cp切换源文件
"nnoremap <leader>vjcn :execute "vim" shellescape(expand("<cword>"))"**/*.java"<cr>
"按,gcn后可以跳转到第一个结果中来,并用cn和cp切换文件
"nnoremap <leader>gcn :execute "grep -R " shellescape(expand("<cword>"))
"."<cr>
"将本行下移动一行
"noremap - ddjp
"augroup bufnefile
"     autocmd!
"     autocmd bufNewFile *.txt :write
"     autocmd FileType vim  nnoremap <buffer> <leader>c //<esc>
"augroup END
"按,<c-d>后在插入模式删除一行
"inoremap <leader><c-d> <esc>ddi
"按,<c-u>后在插入模式将光标变大写
"inoremap <leader><c-u> <esc>lviwUi
"按,<c-j>后在插入模式将光标下单词变小写
"inoremap <leader><c-j> <esc>lviwui
"}}}}
"编辑vimrc文件{{{
"编辑vimrc文件
nnoremap <leader>ev :tabnew<cr>:e $MYVIMRC<cr>
nnoremap <leader>et :tabnew<cr>:e ~/.vimrc_tt<cr>
"加载vimrc文件
nnoremap <leader>sv :source $MYVIMRC<cr>
nnoremap <leader>tt :source ~/.vimrc_tt<cr>
""}}}
"搜索命令{{{{
"第一个搜索映射,搜索something:会在搜索到something后用一个新的修改区保起来
"grep!没有感叹号就会跳转第一个结果中,有了感叹号就会直接调到新的修改区,
"但是这个也有好处可以直接来到相应的文件中看代码,用cn和cp切换代码文件
"按,gs后可以搜索something出现的个数和文件位置用一个新的修改区保存下来
"nnoremap <leader>gs :execute "grep! -R" "something" "."<cr>:copen<cr>
"nnoremap <leader>gs q:ir!find -iname  <esc>pa .<cr>:copen<cr><c-w>H<esc><cr>
nnoremap gf  :execute  "grep! -sirn"  shellescape(expand(@@)) "~/txl/txl"<cr>:!clear<cr>:copen<cr>:set modifiable<cr><c-w>H
nnoremap <leader>gg :tabnew<cr>q:0ir!grep -sirn "<esc>pa" . <cr>
"按,vjc后可以使用vim内置的grep在java文件中搜索光标下的单词的个数和文件位置用新的修改区保存起来
nnoremap <leader>vjc :execute "vim!" shellescape(expand("<cword>"))"**/*.java"<cr>:!clear<cr>:copen<cr>:set modifiable<cr><c-w>H
"nnoremap <leader>f  :execute "grep! -Esirn" shellescape(expand(@@)) "%:p"<cr>:!clear<cr>:copen<cr>:set modifiable<cr><c-w>H
nnoremap <leader>f  :execute "grep! -Esirn" shellescape(expand(@@))  "%:p"<cr>:!clear<cr>:copen<cr>:set modifiable<cr><c-w>H
"在vimrc文件中|不可以映射，可以使用<bar>代替|
"nnoremap <leader>ff   q:ivimgrep! /\<bar>headset\<bar>a2dp/j  %:p <cr>:copen<cr><esc><cr>
"nnoremap <leader>ff   :tabnew<cr>:e ~/tang1.txt<cr>0wv$3hy:q!<cr>:tabm 0<cr>q:ivimgrep! /<esc>pa/j %:p <cr>:copen<cr>:set modifiable<cr><esc><c-w>H
nnoremap <leader>ff   q:ivimgrep! /<esc>"/pa/j %:p <cr>:copen<cr>:set modifiable<cr><esc><c-w>H
"按,gc后会使用外置的grep搜索光标下的单词的个数和文件位置并用新的修改区保存起来
nnoremap <leader>gc :execute "grep! -R " shellescape(expand("<cword>"))"."<cr>:!clear<cr>:copen<cr>:set modifiable<cr><c-w>H
nnoremap <leader>vhc :execute "vim!" shellescape(expand("<cword>"))"**/*.h"<cr>:!clear<cr>:copen<cr>:set modifiable<cr><c-w>H
"执行命令
nnoremap <leader>xx <esc>0v$hyGq:0ir!<esc>p<cr>o<cr><cr>
""}}}}
"文件路径切换{{{{
"更改到当前文件所在的目录
nnoremap <leader>lcd :lcd %:p:h
"打开选中的的文件,并新开一个tap
"omap i:  f:lvf:h
nnoremap <leader>y :normal! yt:<cr>
nnoremap <leader>cd :tabnew<cr>:execute "e" expand(@@)<cr>
nnoremap <leader>cv  0"ayt:0f:lvf:h"by0:tabnew<cr>:execute "e" expand(@a)<cr>:@b<cr>
nnoremap <leader>cc  0"ayt\|0f\|lvf\|h"by0:tabnew<cr>:execute "e" expand(@a)<cr>:@b<cr>
"打开find搜索的文件
nnoremap <leader>zz  0v$hy:tabnew<cr>q:ie <esc>p<cr>
"}}}}
"函数{{{{
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
    silent execute "grep! -EsinR " . shellescape(@@) . " ."
    copen
    set modifiable
    silent execute "!clear"
    silent execute "normal! \<c-w>H"
    "execute "normal! 'q:i!clear<cr>:copen<cr>:set modifiable<cr><c-w>H<esc>'"
    let @@ = saved_unnamed_register
endfunction
let g:quickfix_is_open = 0
function! s:QuckfixToggle()
    if g:quickfix_is_open
        cclose
        let g:quickfix_is_open = 0
    else
        copen
        set modifiable
        silent execute "normal! \<c-w>H"
        let g:quickfix_is_open = 1
    endif
endfunction
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
"}}}}
"{{{{有意思的代码
function! s:getchar()
    let c = getchar()
    if c =~ '^\d\+$'
        let c = nr2char(c)
    endif
    return c
endfunction
" Interactively change the window size
function! InteractiveWindow()
    let char = "s"
    while char =~ '^\w$'
        echo "(InteractiveWindow) TYPE: h,j,k,l to resize or a for auto resize"
        let char = s:getchar()
        if char == "h" | call SetWindowSize("incr" ,-5 ,0) | endif
        if char == "j" | call SetWindowSize("incr" ,0 ,5) | endif
        if char == "k" | call SetWindowSize("incr" ,0 ,-5) | endif
        if char == "l" | call SetWindowSize("incr" ,5 ,0) | endif
        if char == "a" | call SetWindowSize("abs" ,0 ,0) | endif
        redraw
    endwhile
endfunction
"}}}}
"{{{{{自动提交命令
"{{{{{2  GitStatus()
function! GitStatus()
    let Gitstatus = "tangxinlou"
    let Preadd = []
    let idx1 = 0
    "echom Gitstatus
    let isstatus = IsStatus()
    if  "not a respository" ==#  isstatus
        echom isstatus
        return
    endif
    let Gitstatus = system("git status . \| grep -v -Esi \"branch|Changes not|use.*git|Untracked files:|^$|Changes to be\"")
    call setline(line('.'),Gitstatus)
    let Preadd = split(Gitstatus,"\x00 ")
    call append(line('.'),Preadd)
    call cursor(line('.') + len(Preadd),0)
    while idx1 < len(Preadd)
        if "modified:" ==# matchstr(Preadd[idx1],"modified:")
            let idx1 += 2
        elseif "deleted:" ==# matchstr(Preadd[idx1],"deleted:")
            let idx1 += 2
        else
            if ".sw" ==# matchstr(Preadd[idx1],".sw")
                "Preadd->remove(idx1)
                call remove(Preadd,idx1)
                let idx1 = 0
            endif
            let idx1 += 1
        endif
    endwhile
    call append(line('.'),Preadd)
    call cursor(line('.') + len(Preadd),0)
    return Preadd
endfunction
"}}}}
"{{{{2  GitAdd()
function! GitAdd()
    let Gitadd1 = "tangxinlou"
    let Precommit = []
    let idx2 = 0
    let isempty = 0
    let isstatus = ""
    let isstatus = IsStatus()
    if  "is modified" ==#  isstatus
        echom isstatus
    elseif  "is added file" ==#  isstatus
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
        if "modified:" ==# matchstr(Precommit[idx2],"modified:")
            call system("git add " . Precommit[idx2 + 1])
            let idx2 += 2
        elseif "deleted:" ==# matchstr(Precommit[idx2],"deleted:")
            call system("git rm " . Precommit[idx2 + 1])
            let idx2 += 2
        else
            call system("git add " . Precommit[idx2])
            let idx2 += 1
        endif
    endwhile
endfunction
"}}}}
"{{{{2  IsStatus()
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
"{{{{2  GitCommit()
function! GitCommit()
    let iscommit = "tangxinlou"
    call GitAdd()
    "silent call system("git commit")
    silent !git commit
    "silent let iscommit =  system("git push origin master")
    call append(line('.'),iscommit)
endfunction
"}}}}
"{{{{2  GitBranch()
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
    "call cursor(line('.') + len(Prebranch),0)
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
    let Prebranch1 = copy(Prebranch)
    let idx1 = 0
    while idx1 < len(Prebranch1)
        let GitBranch = join([idx1,Prebranch1[idx1]," "])
        let Prebranch1[idx1]  = GitBranch
        let idx1 += 1
    endwhile
    "call append(line('.'),Prebranch1)
    "call cursor(line('.') + len(Prebranch1),0)
    return Prebranch
endfunction
"}}}}
"{{{{2  GitCheckout(...)
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
    call cursor(line('.') + len(Precheckout),0)
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
                call cursor(line('.') + 1,0)
            endif
            return
        else
            for i in Precheckout
                if  IsBranch() !=#  GitCheckout
                    if GitCheckout ==# i
                        silent let ischeckout1  = system("git checkout " . GitCheckout)
                        call append(line('.'),ischeckout1)
                        call cursor(line('.') + 1,0)
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
                call cursor(line('.') + 1,0)
                return
            endif
        endif
    endfor
    echom "分支不存在"
endfunction
"}}}}
"{{{{2  GitPatch()
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
"}}}}
"{{{{  IsBranch()
function! IsBranch()
    let IsBranch = "tangxinlou"
    let CurBranch = []
    let IsBranch = system("git status . \| grep -Esi \"On branch\"")
    let CurBranch = split(IsBranch)
    if "On branch" ==# matchstr(IsBranch,"On branch")
        "echom CurBranch[2]
    else
        return
    endif
    return  CurBranch[2]
endfunction
"}}}}
"{{{{2  GetKey()
function GetKey()
    let c = getchar()
    while c == "\<CursorHold>"
        let c = getchar()
    endwhile
    return c
endfunction
"}}}}
"{{{{{2 function! FunList() 目前实现的函数
nnoremap <F4> :call FunList()<cr>
function! FunList()
    let funname = "tangxinlou"
    let idx1 = 0
    let curfunname = []
    let curfunname3 = []
    let curfunname1 = []
    let curfunname = split(system("grep -Esin \"^function\" ~/.vimrc"),"\n")
    let curfunname1 = copy(curfunname)
    call AddNumber(curfunname)
    let char = 0
    let char1 = ""
    while 1  "char =~ '^\d\+$'
        echo "(InteractiveWindow) TYPE: h,j,k,l to resize or a for auto resize"
        let char1 = Getchar()
        let char = str2nr(char1)
        if char ==# 0 && char1 != "0"
            if char1  ==# 'q'
                return
            endif
            if char1  ==# 'k'
                execute "normal! \<c-u>"
            endif
            if char1  ==# 'j'
                execute "normal! \<c-f>"
            endif
            redraw
        else
            echo type(char)
            echo len(curfunname)
            echo char
            if char < len(curfunname)
                let char = split(split(split(curfunname[char],"!")[1],"(")[0],"\x00")[0]
                call call(char,curfunname3)
            else
                break
            endif
            redraw
        endif

    endwhile
endfunction
"}}}}}
"{{{{{2 function! AddNumber() 在列表最后一个成员每项前加个标号并打印出来,第二次调用时会原处刷新，如果打印需要保留需要将光标下移
function! AddNumber(...)
    let isnumber = "tangxinlou"
    let isnumber2 = []
    let isnumber3 = []
    execute "normal! $lvG$d0"
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
        "call cursor(line('.') + len(isnumber2),0)
        redraw
    endif
    return
endfunction
"}}}}}
"{{{{2
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
"}}}}
"{{{{2  Gettt()
function! Gettt()
    let char = ""
    let list = []
    let char = "InteractiveWindow"
    "let Char1 = function(char,list)
    call call(char,list)
    "call Char1
endfunction
"}}}}
"}}}}


"每次需要调用 24 WriteFile 把新的数据写到fund中
"需要调用 31  CalculateInvest 选2  把pe写到analyze
"把pe写到analyze,调用30 WriteFund2Index 选3把analyze格式化
"调用  31CalculateInvest 金额，选1 把金额写到index中
"调用  30 WriteFund2Index 选2把index格式化
"{{{{ fund
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
    return fundvalues1
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
"{{{{2  List2Format(...)    把字符后面补空格
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
"{{{{2  DictTest()   测试字典
"noremap <F4> :call  DictTest()
function! DictTest()
    let char1 = "aaaaaaaa"
    let char2 = "指数名称"
    let list = ['a', 'b', 'c', 'd', 'e']
    let char = {'a': 1, 100: 'foo',1001:list}
    let char = {5:1}
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
    echo len(char)
    echo keys(char)
    echo values(char)
    echo items(char)
endfunction
"}}}}
"{{{{{2   WriteFile(...)  获取指数源数据写入fund文件
"noremap <F5> :call  WriteFile()
function! WriteFile(...)
    let idx1 = 0
    let filenumber = 0
    let fundfilename = "指数估值(2022-02-18).html"
    let fundfilename1 = []
    let templist = []
    let lists = []
    let list = []
    let list1 = [1,2,3,4,]
    let fundfilename = system("find  /d/work/fund/zhishu -iname '*html'")
    let fundfilename = split(fundfilename,"\n")
    let fundfilename = reverse(fundfilename)
    let fundfilename1 = copy(fundfilename)
    call AddNumber(fundfilename1)
    let filenumber = input("请输入待输入指数文件")
    let lists = readfile("fund.txt")
    let list1 = GetFundValue(fundfilename[filenumber])
    let list =  SplicingData(list1)
    call append(line('.'),list)
    echo "lists len " . len(lists)
    if len(lists) ==# 1
        echo "tangxinlou"
        let idx1 = 1
        let lists = copy(list)
        call insert(lists,idx1)
        if len(lists) < 5
            return
        endif
        if "yes" ==# input("是否写入")
            call writefile(lists,"fund.txt")
        endif
    else
        echo "tangxinlou1"
        let idx1 = 0
        while idx1 < len(lists)
            let templist = split(lists[idx1],"|")
            if len(templist) ==# 2
                echo templist
                echo split(list[0],"|")[1]
                if templist[1] ==# split(list[0],"|")[1]
                    echo "tangxinlou2"
                    return
                endif
            endif
            let idx1 += 1
        endwhile
        let lists[0]  += 1
        let lists = extend(lists,list)
        if len(lists) < 5
            return
        endif
        redraw
        if "yes" ==# input("是否写入")
            call writefile(lists,"fund.txt")
        endif
    endif
endfunction
"}}}}}
"{{{{{2   ConnecTwoList(...)   连接数据和指数名字
"noremap <F4> :call  ConnecTwoList()
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
"noremap <F4> :call  ParseFund()
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
    let lists = readfile("fund.txt")
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
                    let list2fmt1[idx2] =  SetCharNull(list2fmt1[idx2],25)
                endif
            elseif char ==# "3"
                if idx2 ==# 0
                    let list2fmt1[0] =  SetCharNull(list2fmt1[0],15)
                else
                    let list2fmt1[idx2] =  SetCharNull(list2fmt1[idx2],15)
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
            call writefile(list2fmt,"fund2index.txt")
        endif
    elseif char ==# "2"
        let list2fmt2 = copy(list2fmt)
        call sort(list2fmt2,"MyCompare")
        call append(line('.'),list2fmt2)
        redraw
        if "yes" ==# input("是否写入")
            call writefile(list2fmt,"index.txt")
        endif
    elseif char ==# "3"
        let list2fmt = RestoreOrder(list2fmt)
        if "yes" ==# input("是否写入")
            call writefile(list2fmt,"analyze.txt")
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
                let list2fmt1[idx2] =  SetCharNull(list2fmt1[idx2],60)
            endif
            let idx2 += 1
        endwhile
        let list2fmt[idx1] = join(list2fmt1,"\x00")
        let idx1 += 1
    endwhile
    if char ==# "1"
        if "yes" ==# input("是否写入")
            call writefile(list2fmt,"fund2index.txt")
        endif
    elseif char ==# "2"
        let list2fmt2 = copy(list2fmt)
        call sort(list2fmt2,"MyCompare")
        call append(line('.'),list2fmt2)
        redraw
        if "yes" ==# input("是否写入")
            call writefile(list2fmt,"index.txt")
        endif
    elseif char ==# "3"
        let list2fmt = RestoreOrder(list2fmt)
        if "yes" ==# input("是否写入")
            call writefile(list2fmt,"analyze.txt")
        endif
    elseif char ==# "4"
        return list2fmt
    endif
endfunction
"}}}}}
"{{{{{2   CalculateInvest(...) 计算投资
noremap <F5> :call  CalculateInvest()
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
            call writefile(curinvests,"index.txt")
        elseif char ==# 2
            call writefile(curinvests,"analyze.txt")
        endif
    endif
endfunction
"}}}}}
"{{{{{2   MyCompare(i1, i2) 使用sort 排序list
function! MyCompare(i1, i2)
    let list = []
    let list1 = []
    let char = ""
    let char1 = ""
    let list = split(a:i1,"|")
    let list1 = split(a:i2,"|")
    "echo list
    "echo list1
    return list1[2] - list[2]
endfunction
func MyCompare1(i1, i2)
    return a:i2 == a:i1 ? 0 : a:i2 > a:i1 ? 1 : -1
endfunc
"}}}}}
"{{{{{2   CalculateAmount(...) investall , fund2indexall,indexall ,time  flag 计算金额
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
                    let PE = split(split(amountmid1,"|")[2]," \\{3,30}")[0]
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
"{{{{{2   IsContain(...) string list返回对应 列表项
function! IsContain(...)
    let string = ""
    let char = ""
    let list = []
    let idx1 = 0
    let string = a:1
    let list = a:2
    while idx1 < len(list)
        let char = matchstr(list[idx1],string)
        if matchstr(list[idx1],string) != ""
            return list[idx1]
        endif
        let idx1 += 1
    endwhile
endfunction
"}}}}}
"{{{{{2   ConsolidateData(...) 整合index 文件，使数据化
noremap <F5> :call  ConsolidateData()
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
"{{{{2  InputData()   一键输入数据
"noremap <F4> :call  InputData()
function! InputData()
    call WriteFile()
    echo "选择2"
    call CalculateInvest()
    echo "选择3"
    call WriteFund2Index()

endfunction
"}}}}
"{{{{2  ObtainAmount()   一键计算金额
"noremap <F4> :call  ObtainAmount()
function! ObtainAmount()
    echo "选择1"
    call CalculateInvest()
    echo "选择2"
    call WriteFund2Index()

endfunction
"}}}}

"}}}

"{{{{{{1 code

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
        echo  cmpcount   len(targetcode)
        while idx1 < len(sourcecode)
            if idx1 ==# len(sourcecode) - 1
                if src != 0
                    let targetcode[idj1] = sourcecode[src:idx1]
                    let targetcode[idj1][0] = targetcode[idj1][0] . "|" . (coutchapter * 2 + cmpcount * 2 + src + 1 + 2)
                endif
            endif
            if codeflag[0] ==# matchstr(sourcecode[idx1], matchstr)
                echo "tangxinlou23"
                if src ==# 0
                    let src = idx1
                else
                    let tail = idx1
                    echo idx1 idj1 src tail codeflag[0]  sourcecode[idx1]
                    let targetcode[idj1] = sourcecode[src:tail - 1]
                    let targetcode[idj1][0] = targetcode[idj1][0] . "|" . (src + 1)
                    let tail = 0
                    let src = idx1
                    "echo src
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
            echo cmpcount  codeflag[0] line
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
                            let targetcode[idj1][0] = targetcode[idj1][0] . "|" . (line + src + 1) . " point"
                            let isaddflag = 0
                        else
                            let targetcode[idj1][0] = targetcode[idj1][0] . "|" . (line + src + 1)
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

"{{{{{  AnalyzeCode()  分析code
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
    let codefile = readfile(expand("%:p"))
    if count(codefile,"<<<<<<<<<<<<<<<<") && count(codefile,">>>>>>>>>>>>>>>")
        echo "之前修改过"
        let src = index(codefile,"<<<<<<<<<<<<<<<<")
        let tail = index(codefile,">>>>>>>>>>>>>>>")
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
        "call writefile(codedict[dictkeys[4]],"/opt6/tangxinlouosc/txl/parse")
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
            let codedict[dictkeys[idx1]] =  WriteFund2Index(codedict[dictkeys[idx1]])
            let codedict[dictkeys[idx1]] =  insert(codedict[dictkeys[idx1]],join(["第",idx1 + 1,"章节流程图"]))
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
        let tempdictlist = insert(tempdictlist,"<<<<<<<<<<<<<<<<")
        let tempdictlist = add(tempdictlist,">>>>>>>>>>>>>>>")
        "      call writefile(tempdictlist,"/opt6/tangxinlouosc/txl/parse")
        call extend(codefile,tempdictlist,8)
        call writefile(codefile,expand("%:p"))
    else
        let codedict = ParseCode(codefile,"```c|```")
        let idj1 = 0
        while idj1 < len(codedict)
            let codedict[idj1] =  ListKeyWords(codedict[idj1])
            let idj1 += 1
        endwhile
        let codedict =  DrawTimingDiagram(codedict)
        let codedict =  WriteFund2Index(codedict)
        let codedict = insert(codedict,"<<<<<<<<<<<<<<<<")
        let codedict = add(codedict,">>>>>>>>>>>>>>>")
        "      call writefile(codedict,"/opt6/tangxinlouosc/txl/parse")
        call extend(codefile,codedict,8)
        call writefile(codefile,expand("%:p"))
    endif
endfunction
"}}}}}

"{{{{{  ListKeyWords()  获取关键词
function! ListKeyWords(...)
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
    while idx1 < len(listwords)
        if "" != matchstr(listwords[idx1],"\/work.*\/.*\/")
            let filename = split(split(listwords[idx1],":")[0],"/")
            let filename = filename[len(filename) - 1]
            let line = split(listwords[idx1],":")[1]
            let filenameidx1 = idx1
        endif
        let idx1 += 1
    endwhile
    let codeline = split(listwords[0],"|")[1]
    "找到了文件名，刷选文件名下一行的关键词
    let templist = split(listwords[filenameidx1 + 1],"\x00")
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
                let templist[tempindex  + 1] = ">>>>"
            elseif prvindex ==# tempindex
                let templist[tempindex  + 1] = "V"
            elseif  prvindex <  tempindex
                let templist[tempindex  - 1] = "<<<<"
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

"}}}}
if &diff
    syntax off
endif