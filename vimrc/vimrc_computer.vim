"设置标志位
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
set enc=utf-8
set hlsearch
set incsearch
set number
set modifiable
set ignorecase
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
"}}}}}
"vimdiff 颜色配置{{{
if &diff
    "colorscheme morning
    "colorscheme industry
    "set diffopt-=internal
    "set diffopt+=iwhite
    "diff模式关闭颜色高亮
    colorscheme default
    syntax off
endif
"}}}
"快捷输入{{{{
"iabbrev com tangxinlou@wingtech.com
"iabbrev txl tangxinlou
"iabbrev r r!
iabbrev find find -iname
iabbrev grep grep -Esinr
iabbrev vimg vimgrep! //j %:p
iabbrev gitstatus git status .
iabbrev gitreflog git reflog
"git log --graph --pretty=oneline --abbrev-commit --decorate
"查看这个commit 在哪些分支合入了
iabbrev gitbranch git branch -a --contains
"iabbrev gitlog git log --graph --oneline  --decorate
"repo sync --local-only
iabbrev gitlog  git log --graph --oneline  --decorate  --pretty=format:"\%cr \%cn \%H \%s"
iabbrev gitcherrypick  git cherry-pick
iabbrev gitlogbranch git log --graph --decorate --oneline --all
iabbrev gitfile git log  --pretty=oneline
iabbrev gitchange git  log --oneline  --decorate --pretty=format:"\%cr \%cn \%H \%s" --all  --grep
iabbrev gittime git reflog show --date=iso
iabbrev gitcfg git config my.log-compliance-check false
"}}}
"auto command自动命令{{{
"创建空文件和自动注释
"设置折叠
augroup filetype_vim
    autocmd FileType vim  setlocal foldmethod=marker
augroup END
augroup filetype_make
    autocmd FileType make  setlocal  noexpandtab
augroup END
augroup filetype_markdown
    "autocmd FileType markdown  setlocal foldmethod=manual syntax marker
    "autocmd FileType markdown  setlocal foldmethod=indent
    "autocmd FileType markdown  setlocal foldignore=
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
    autocmd QuitPre *.csv   :call VisualiZationcsv(2,",")
augroup END
augroup filetype_python
    autocmd BufNewFile *.py      :call OpenPythonfile()
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
nnoremap <leader>s :set mouse=r<cr>:set nonumber<cr>:set wrap <cr>
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
vnoremap <leader>a "dy<esc>:let @c= expand("%:p").':'.line(".").':'<cr>
"复制文本及当前行
"nnoremap <leader>p i```c<cr>```<esc>O<esc>0"cpli<cr><esc>0"dp
nnoremap <leader>p i<cr>```c<cr><cr><cr>```<esc>O<cr><esc>kkk"7pjj0"cpli<cr><esc>0"dpi<bs><esc>lki<bs><esc>
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
nnoremap <leader>cp i//vivo tangxinlou modify for B211201-1894 begin<cr>//vivo tangxinlou modify for B211201-1894 end<esc>Oif (Log.isHostLoggable && Log.isLoggableModel) {}<esc>i<cr><esc>O<esc>p?//vivo tangxinlou<cr>v/// vivo tangaolin add .*end<cr>=
"inoremap <F3>  <cr><esc>gg0jvG$dk0v$hyq:0ir!find -iname '*<esc>pa*'<cr>gg0$a
"早期debug 映射
nnoremap <leader>rm :echom "hello"
nnoremap <leader>y :call AddLineNumber()<cr>
"echo winheight('%') winwidth('%')
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
"加载vimrc文件
nnoremap <leader>sv :source $MYVIMRC<cr>
nnoremap <leader>tt :source ~/.vimrc_tt<cr>
""}}}
"搜索命令{{{{
nnoremap gf  :execute  "grep! -sirn"  shellescape(expand(@@)) "~/txl/tang.txl"<cr>:!clear<cr>:copen<cr>:set modifiable<cr><c-w>H
nnoremap <leader>gg :tabnew<cr>q:0ir!grep -sirn "<esc>pa" . <cr>:tabm<cr>
nnoremap <leader>f  :execute "grep! -Esirn" shellescape(expand(@@))  "%:p"<cr>:!clear<cr>:copen<cr>:set modifiable<cr><c-w>H
"在vimrc文件中|不可以映射，可以使用<bar>代替|
"nnoremap <leader>ff   q:ivimgrep! /\<bar>headset\<bar>a2dp/j  %:p <cr>:copen<cr><esc><cr>
nnoremap <leader>ff   q:ivimgrep! /<esc>"/pa/j %:p <cr>:copen<cr>:set modifiable<cr><esc><c-w>H
"按,gc后会使用外置的grep搜索光标下的单词的个数和文件位置并用新的修改区保存起来
nnoremap <leader>gc "7yy:execute "grep! -R " shellescape(expand("<cword>"))"."<cr>:!clear<cr>:let winwidthnum  = float2nr(winheight('%')  * 0.2)<cr>:copen<cr>:set modifiable<cr><c-w>J:execute "res " . winwidthnum<cr>::let winwidthnum = 0<cr>
"nnoremap <leader>vhc :execute "vimgrep!" shellescape(expand("<cword>")) " **/*.h"<cr>:!clear<cr>:copen<cr>:set modifiable<cr><c-w>H
nnoremap <leader>vh "7yy:execute "grep! -Esinr --include=*.h "shellescape(expand("<cword>"))"."<cr>:!clear<cr>:let winwidthnum  = float2nr(winheight('%')  * 0.2)<cr>:copen<cr>:set modifiable<cr><c-w>J:execute "res " . winwidthnum<cr>::let winwidthnum = 0<cr>
nnoremap <leader>vc "7yy:execute "grep! -Esinr --include=*{.c,.cc} "shellescape(expand("<cword>"))"."<cr>:!clear<cr>:let winwidthnum  = float2nr(winheight('%')  * 0.2)<cr>:copen<cr>:set modifiable<cr><c-w>J:execute "res " . winwidthnum<cr>::let winwidthnum = 0<cr>
nnoremap <leader>vj "7yy:execute "grep! -Esinr --include=*.java "shellescape(expand("<cword>"))"."<cr>:!clear<cr>:let winwidthnum  = float2nr(winheight('%')  * 0.2)<cr>:copen<cr>:set modifiable<cr><c-w>J:execute "res " . winwidthnum<cr>::let winwidthnum = 0<cr>
"执行命令
nnoremap <leader>xx <esc>0v$hyGq:0ir!<esc>p<cr>o<cr><cr><esc>
""}}}}
"文件路径切换{{{{
"更改到当前文件所在的目录
nnoremap <leader>lcd :lcd %:p:h
"打开选中的的文件,并新开一个tap
"omap i:  f:lvf:h
"nnoremap <leader>y :normal! yt:<cr>
nnoremap <leader>cd :tabnew<cr>:execute "e" expand(@@)<cr>
nnoremap <leader>cv  0"ayt:0f:lvf:h"by0:tabnew<cr>:execute "e" expand(@a)<cr>:@b<cr>:tabm<cr>
nnoremap <leader>cc  0"ayt\|0f\|lvf\|h"by0:tabnew<cr>:execute "e" expand(@a)<cr>:@b<cr>:tabm<cr>
"打开find搜索的文件
nnoremap <leader>zz  0v$hy:tabnew<cr>q:ie <esc>p<cr>
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
            \ "android_vendor_mediatek_proprietary_packages_modules_Bluetooth",
            \ "vendor_vivo_source_frameworks_services",
            \ "android_cts",
            \ "android_vendor_mediatek_kernel_modules_connectivity_bt_linux_v2",
            \ "android_vendor_qcom_opensource_commonsys_packages_apps_Bluetooth",
            \ "android_vendor_mediatek_proprietary_tinysys_adsp_HIFI3",
            \ "android_vendor_mediatek_proprietary_tinysys_common",
            \ "android_vendor_mediatek_proprietary_tinysys_adsp_common",
            \ "android_device_mediatek_common",
            \ "android_vendor_mediatek_proprietary_custom"]
"}}}}}
"{{{{{2   Homedir(...) 家目录
let g:homedir = "/d"
function! Homedir(...)
    "{{{{{3 变量定义
    let dirpath = a:1
    "}}}}
    let dirpath = g:homedir . "/" . dirpath
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
    silent execute "grep! -EsinR " . shellescape(@@) . " ."
    let winwidthnum  = float2nr(winheight('%')  * 0.2)
    copen
    set modifiable
    silent execute "!clear"
    silent execute "normal! \<c-w>J"
    execute "normal! :res " . winwidthnum . "\<cr>"
    "execute "normal! 'q:i!clear<cr>:copen<cr>:set modifiable<cr><c-w>H<esc>'"
    let @@ = saved_unnamed_register
endfunction
"}}}}}
"{{{{{2 function! s:Copy2file(type)              拷贝内容到本地                可视模式下逗号 + m 调用
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
    let relativepath = Homedir("txl/transplant.txt")
    let templist = split(tempchar,"\n")
    if  @@ ==# " "
        let templist = readfile(relativepath)
        echo "复制公共文件到本地"
        while idx1 < len(templist)
            call append(line('.'), templist[idx1])
            call cursor(line('.') + 1,0)
            let idx1 += 1
        endwhile
    else
        echo "复制到公共文件"
        call writefile(templist,relativepath)
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
        echo  "关闭鼠标"
        let g:quickfix_is_open = 0
        colorscheme default
        highlight Folded   term=standout ctermfg=6 ctermbg=none guifg=Black guibg=#e3c1a5
        highlight CursorColumn    term=reverse ctermbg=0 guibg=Grey40
        "call append(line('.'),split(execute("highlight"),"\n"))
        highlight MyGroup1 term=reverse ctermbg=black ctermfg=White guibg=Grey40
        let m = matchadd("MyGroup1", "_")
    else
        let g:quickfix_is_open = 1
        set mouse=a
        colorscheme morning
        highlight MyGroup1 term=reverse ctermbg=White ctermfg=black guibg=Grey40
        let m = matchadd("MyGroup1", "_")
        echo "打开鼠标"
    endif
endfunction
"}}}}}
"{{{{{2   OpenQuickfix(...) 快速打开窗口
nnoremap <F3> :call OpenQuickfix()<cr>
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
"{{{{{2 function! s:Shellfunc(type)              批量删除文件                  可视模式下 逗号 + sh 调用
"nnoremap <leader>sh :set operatorfunc=<SID>Shellfunc<cr>g@
vnoremap <leader>sh :<c-u>call <SID>Shellfunc(visualmode())<cr>
function! s:Shellfunc(type)
    let saved_register = @@
    if a:type ==# 'v'
        normal! `<v`>y
    elseif a:type ==# 'char'
        normal! `[v`]y
    else
        return
    endif
    let a:Order = split(@@)
    let a:instruction = a:Order[0]
    let a:parameter = a:Order[1]
    let a:len = a:Order[2]
    let c = a:Order[2]
    let a:instruc = join([a:Order[0],a:Order[1]]," ")
    echom a:instruction a:parameter a:len  a:Order[3]
    while c <= a:Order[3]
        call cursor(c,1)
        silent execute "normal! ^v$hy"
        silent call system(a:instruc . " " . @@)
        let c += 1
    endwhile
    let @@ = saved_register
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
    let @/ = searchchar
    let @@ = saved_unnamed_register
endfunction
"}}}}}
"{{{{{2 function! MakeCompressedPackage()        制作push压缩包
function! MakeCompressedPackage()
    "{{{{{{3 定义变量
    let curpath = ""
    let intentpath = Homedir("copy/cp")
    let batfile = "cp64.host.R.bat"
    let command = ""
    let iscopyconf = ""
    let iscopyapk = ""
    let iscopyso = ""
    let templist = []
    let zipname = ""
    "}}}}}
    let command = "pwd"
    "set fileformats=dos
    call system("rm *.tar")
    call system("rm  -rf cp")
    let iscopyconf = input("是否打包conf 文件")
    let iscopyapk = input("是否打包apk 文件")
    let iscopyso = input("是否打包so 文件")
    let curpath = system(command)
    call system("cp -rf " . intentpath . " ./ ")
    let batfile = readfile("./cp/cp64.host.R.bat")

    if iscopyso ==# "yes"
        let command = "cp -rf libbluetooth_jni.so libbluetooth.so ./cp/cp/system/lib64 "
        call system(command)
        let templist = join(split(batfile[9])[1:])
        let batfile[9] = templist
        let templist = join(split(batfile[10])[1:])
        let batfile[10] = templist
    endif

    if iscopyapk ==# "yes"
        let command = "cp -rf Bluetooth.apk  ./cp/cp/system/app "
        call system(command)
        let templist = join(split(batfile[8])[1:])
        let batfile[8] = templist
    endif

    if iscopyconf ==# "yes"
        let command = "cp -rf interop_database.conf  ./cp/cp/system "
        call system(command)
        let templist = join(split(batfile[11])[1:])
        let batfile[11] = templist
    endif
    call writefile(batfile,"./cp/cp64.host.R.bat")
    call append(line("."),batfile)
    silent execute "normal! :tabnew\<cr>"
    silent execute "normal! :e ./cp/cp64.host.R.bat\<cr>"
    silent execute "normal! \<c-v>G$A\<c-v>\<c-m>\<esc>"
    silent execute "normal! :wq\<cr>"
    let zipname = "tar -cvf " .  split(split(system("pwd"),"/")[-1],"\n")[0]  . ".rar" . " ./cp"
    call system(zipname)
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
func! MyCompare1(i1, i2)
    return a:i2 == a:i1 ? 0 : a:i2 > a:i1 ? 1 : -1
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
    "}}}}
    while idx1 < len(list)
        let char = matchstr(list[idx1],string)
        if matchstr(list[idx1],string) != ""
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
"{{{{2 function! DictTest()                      测试字典
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
                \'5structuremember':'xx',
                \'00structuremembername':'xx',
                \'3structtype':'xx'}
    let char[1003] = "txlws"
    let char.1004 = "1234"
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
    let dict1  = eval(stringdict)
    echo eval(string(char3))
    echo "tangxinlou333"
    echo dict1
    echo dict1[1003]
    echo "tangxinlou22"
    echo char[1003]
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
    call writefile(indexfile,"/d/work/fund/zhishu/indexvaluepanel")

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
"{{{{{2  function! WriteFund2Index1(...) 格式化fund2index
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
    call writefile(temp_files,"/d/txl/test/2.csv")
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
"{{{{{2   printf(...) 打印log的函数
function! Printf(...)
    "{{{{{3 变量定义

    "}}}}
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
    endif

    "nnoremap <leader>y :%s/^/\=line(".")." "/<cr>
endfunction
"}}}}}
"{{{{{2   SetFileType(...) 设置filetype
function! SetFileType(...)
    "{{{{{3 变量定义

    "}}}}
    if &filetype ==# ""
        setfiletype  special
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
"{{{{{2   ListAddSpaces(...)
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
    "计算哪行最长
    while idx1 < len(listof2d)
        if len(listlength) < len(listof2d[idx1])
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
"{{{{{2   ListRemoveSpaces(...)
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
            "有些空口只有一个，去不掉
            let templen = len(listof2d[idx1][idj1])       if  len(split(listof2d[idx1][idj1]," \\{2,30}"))  != 0
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
    "let filelist = readfile(Homedir("work/fund/zhishu/panelPEvalue"))
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
    "}}}}
    "let filelist = readfile(Homedir("test/fund/zhishu/panelPDvalue"))
    let typelist = type(filelist[0])
    let templist  =  repeat(templist,len(filelist))
    if  typelist ==# 1
        let filelist =  ListRemoveSpaces(filelist,charinterval)
        let filelist = ListTo2D(filelist,charinterval)
    endif
    while idx1 < len(filelist)
        let templist[idx1] = filelist[idx1][columns]
        let idx1 += 1
    endwhile
    return templist
endfunction
"}}}}}
"{{{{{2  WaveformGraph(...)  波形图
nnoremap test :call WaveformGraph()<cr>
"{{{{{3 注释
"}}}}
function! WaveformGraph(...)
    "{{{{{3 变量定义
    let  WaveformGraph = ""
    let Rowcoordinates = ""
    let Columncoordinates = ""
    "}}}}
    let filelist = readfile(Homedir("work/fund/zhishu/panelPEvalue"))
    let Rowcoordinates = split(filelist,"|")[0]
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
    execute "normal! 03f\"lvllllly05f\"lvlllllp015f\"ci\"\<esc>:r!pwd\<cr>0v$hdk015f\"p0jddk"
    " "execute "normal! 011f\"ci\"system ../../../../make_*_images.log ../../../../out/build*.log\<esc>"
    execute "normal! 011f\"ci\"../../../../out_sys/target/product/mssi_64_cn_armv82/system/app/Bluetooth/Bluetooth.apk ../../../../out_sys/target/product/mssi_64_cn_armv82/system/lib64/libbluetooth_jni.so ../../../../out_sys/target/product/mssi_64_cn_armv82/system/lib64/libbluetooth.so ../../../../out_sys/target/product/mssi_64_cn_armv82/system/framework/framework.jar system/app/Bluetooth/Bluetooth.apk  system/lib64/libbluetooth_jni.so system/lib64/libbluetooth.so system/framework/framework.jar ../../../../make_*_images.log ../../../../out/build*.log"
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
    execute "normal! 017f\"yi\""
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
        call cursor(line('.') + 1,0)
    else
        echom "tangxinlou len <1"
        silent let a:MyGroup =  system("git status . \| grep  \"On branch\"")
        let  a:MyGroup = join(split(a:MyGroup))
        if "On branch" ==# matchstr(a:MyGroup, "On branch")
            silent call append(line('.'), a:MyGroup)
            call cursor(line('.') + 1,0)
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
"}}}}
"{{{{实践 vim
"call append(line('.'), readfile("1.txt"))
"call setline(line('.'), readfile("1.txt"))
"call setline(5, ['aaa', 'bbb', 'ccc'])
"call writefile(["tangxinlog"], "1.txt", "a")
"echo matchstr("testing", "ing", 5)
"if input("Coffee or beer? ") == "beer"
"   echom "Cheers!"
"else
"   echom "tangxinlou"
"endif
"}}}}
"{{{{{ 有意思的代码
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
    "echom Gitstatus
    let isstatus = IsStatus()
    if  "not a respository" ==#  isstatus
        echom isstatus
        return
    endif
    let Gitstatus = system("git status . \| grep -v -Esi \"branch|Changes not|use.*git|Untracked files:|^$|a sparse checkout|Changes to be\"")
    call setline(line('.'),Gitstatus)
    let Preadd = split(Gitstatus,"\x00 ")
    "call append(line('.'),Preadd)
    "call cursor(line('.') + len(Preadd),0)
    while idx1 < len(Preadd)
        if "modified:" ==# matchstr(Preadd[idx1],"modified:")
            let idx1 += 2
        elseif "deleted:" ==# matchstr(Preadd[idx1],"deleted:")
            let idx1 += 2
        else
            if ".sw" ==# matchstr(Preadd[idx1],".sw") || ".patch" ==# matchstr(Preadd[idx1],".patch") || "out_" ==# matchstr(Preadd[idx1],"out_") || "buildconfig.ini" ==# matchstr(Preadd[idx1],"buildconfig.ini") || "tangxinlouosc_buildurl.txt" ==# matchstr(Preadd[idx1],"tangxinlouosc_buildurl.txt") || "build.log" ==# matchstr(Preadd[idx1],"build.log") || "new file" ==# matchstr(Preadd[idx1],"new file")
                "Preadd->remove(idx1)
                call remove(Preadd,idx1)
                let idx1 = 0
            else
                let idx1 += 1
            endif
        endif
    endwhile
    "call append(line('.'),Preadd)
    "call cursor(line('.') + len(Preadd),0)
    return Preadd
endfunction
"}}}}}
"{{{{{2 function! GitAdd()                       git add 为git commit 做准备
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
            "call system("git add " . Precommit[idx2])
            let idx2 += 1
        endif
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
"{{{{{2 function! GitCommit()                    git comit 之后可以在这个函数添加push的指令
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

    return Prebranch
endfunction
"}}}}}
"{{{2 function! GitCheckout()                    checkout 切换分支 既可以从列表选一个分支，也可以切换到a分支
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
"}}}
"{{{{{2 function! GitPatch()                     可以 批量切换2.txt 文件中的分支，然后分别打patch commit
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
    call AddNumber(curpath1)
    call cursor(line('.') + len(curpath1) + 1,0)
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
    call writefile(curxmlfile,"1.txt")
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
    let isdiffpatch = Homedir("txl/1.txt")
    let diffshfile = Homedir("txl/diffdir.sh")
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
            call writefile(curadddiff,isdiffpatch)
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
            call writefile(curadddiff,isdiffpatch)
            echo "选择右边文件\n"
        endif
    else
        let curadddiff = add(curadddiff,isadddiff)
        call writefile(curadddiff,isdiffpatch)
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
    call cursor(line,0)
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
    let relativepath = Homedir("txl/version")
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
        call writefile(cmplist,relativepath )
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
                            let versionstring = CompareversionBranch(isupdate3,curxmlfile,curxmlfile1,idx2 * 2)
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
        call writefile(versiondiff,"version.vim")
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
    "let isupdate2 =   system(" git fetch ; git checkout tag_PD2069_ROM13_5.0.0")
    "let isupdate2 =   system(" git pull --rebase ; git reset --hard  87acb2a52f65fd97318943152abac894f1c2fa75")
    let isupdate2 =   system(isupdate3 . " ; git fetch ; git checkout " . curxmlfile1[idx2 + 1])
    let isupdate2 =   system(isupdate3 . "; git pull --rebase ; git reset --hard  " . curxmlfile1[idx2])
    let version2 = system(isupdate3 . " ; git log    --pretty=format:\"\%cr \%cn \%h \%s\" ")

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
    call cursor(line,0)
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

    let relativepath = Homedir("txl/left")
    let relativepath1 = Homedir("txl/right")
    let relativepath2 = Homedir("txl/1.patch")
    let templeft = readfile(relativepath)
    let tempright = readfile(relativepath1)

    if len(templeft) != 0 &&  len(tempright) != 0
        if "yes" ==# input("是否比较")
            call system("diff -Naur " .  relativepath . " " .  relativepath1 . " > " . relativepath2)
            execute "normal! :tabnew " . relativepath1 . "\<cr>"
            execute "normal! :vsplit " . relativepath . "\<cr>"
            if "yes" ==# input("是否清空两个文件，yes 是清空")
                call writefile([],relativepath)
                call writefile([],relativepath1)
            endif
        else
            echo "两个文件有内容把复制的内容保存在左边"
            call writefile(templist,relativepath)
            call writefile([],relativepath1)
        endif
    elseif len(templeft) ==# 0 &&  len(tempright) ==# 0

        echo "两个文件都是空的，把复制的内容保存在左边"
        call writefile(templist,relativepath)
    elseif len(templeft) != 0 &&  len(tempright) ==# 0

        echo "左边内容已存在，把复制的内容保存在右边"
        call writefile(templist,relativepath1)
    endif
    call input("是否继续")
    let @@ = saved_unnamed_register
endfunction
"}}}}
"{{{{{2 function! FindMergedVersion()            寻找某笔提交什么版本合入
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
"{{{{{2  function! ModifyCorrespondingCommit(...)  根据提交信息，找到有哪些tag 线
"{{{{{3 注释
"}}}}
function! ModifyCorrespondingCommit(...)
    "{{{{{3 变量定义
    let ModifyChar = "同步lea相关修改"
    let commitlist = []
    let branchlist = []
    let commitcomand = "git  log --oneline  --decorate --pretty=format:\"\%H\" --all  --grep  "
    let branchcomand = "git branch -a --contains "
    let idx1 = 0
    "}}}}
    let ModifyChar = input("请输入修改")
    let commitcomand = commitcomand . ModifyChar
    let commitlist = split(system(commitcomand),"\n")
    echo commitlist
    while idx1 < len(commitlist)
        echo  split(system(branchcomand . commitlist[idx1]))
        let branchlist = extend(branchlist,split(system(branchcomand . commitlist[idx1])))
        let idx1 += 1
    endwhile
    echo len(branchlist)
    echo len(uniq(sort(branchlist)))
    "echo  uniq(sort(branchlist))
    call append(line("."),branchlist)
endfunction
"}}}}}
"}}}
"{{{{ fund
"每次需要调用 24 WriteFile 把新的数据写到fund中
"需要调用 31  CalculateInvest 选2  把pe写到analyze
"把pe写到analyze,调用30 WriteFund2Index 选3把analyze格式化
"调用  31CalculateInvest 金额，选1 把金额写到index中
"调用  30 WriteFund2Index 选2把index格式化
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
"{{{{{2  function! WriteFile(...)                  获取指数源数据写入fund文件
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
"{{{{{2 function!  CalculateInvest(...) 计算投资 普通模式<F5>调用
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
"{{{{{2  function! CalculateAmount(...)          investall , fund2indexall,indexall ,time  flag 计算金额
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
    call input("2343")
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
"{{{{{2 function!  ConsolidateData(...)          整合index 文件，使数据化
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
"{{{{2 function! InputData()                       一键输入数据
function! InputData()
    call WriteFile()
    echo "获取PE选2"
    call CalculateInvest()
    echo "analyze.txt 选3"
    call WriteFund2Index()

endfunction
"}}}}
"{{{{2 function! ObtainAmount()                    一键计算金额
function! ObtainAmount()
    echo "金额选1"
    call CalculateInvest()
    echo "index.txt 选2"
    call WriteFund2Index()

endfunction
"}}}}
"{{{{{2   PythonGetIndexValuation(...) 使用python方式获取指数估值
nnoremap <F3> :call PythonGetIndexValuation()<cr>
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
    let numbereddatabase = eval(readfile(Homedir("work/fund/zhishu/numbereddatabase"))[0])
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
    call writefile([string(numbereddatabase)],Homedir("work/fund/zhishu/numbereddatabase"))
    return  indexdata
endfunction
"}}}}}
"{{{{{2   CalculateAmount(...)
function! CalculateAmount(...)
    "{{{{{3 变量定义
    "}}}}
endfunction
"}}}}}
"{{{{{2   CalculatePE(...)
function! CalculatePE(...)
    "{{{{{3 变量定义
    "}}}}
endfunction
"}}}}}
"{{{{{2  CutIndexPanel(...)
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
    "let lists = readfile(Homedir("work/fund/zhishu/panelindexvalue"))
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
"{{{{{2   IndexDataDashboardsort(...)
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
        let lists = readfile(Homedir("work/fund/zhishu/panelindexvalue"))
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
        call writefile(datadashboard ,Homedir("work/fund/zhishu/panelindexvalue"))
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
    let lists = readfile(Homedir("work/fund/zhishu/panelindexvalue"))
    let dict = CutIndexPanel(lists)
    let boardkeys = sort(keys(dict))
    let datadashboard = readfile(Homedir("work/fund/zhishu/panelindexvalue"))
    let indexfiledict = eval(readfile(Homedir("work/fund/zhishu/indexdatabase"))[0])
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
    call writefile(datadashboard ,Homedir("work/fund/zhishu/panelindexvalue"))
    call IndexDataDashboardsort()
endfunction
"}}}}}
"{{{{{2   PopulateTheIndexDatabase(...)  填充数据库
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
    let lists = readfile(Homedir("work/fund/zhishu/panelindexvalue"))
    let dict = CutIndexPanel(lists)
    let boardkeys = sort(keys(dict))
    let indexfiledict = eval(readfile(Homedir("work/fund/zhishu/indexdatabase"))[0])
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
    call writefile([string(indexfiledict)],Homedir("work/fund/zhishu/indexdatabase"))
endfunction
"}}}}}
"{{{{{2  IndexParametersPanel(...)     单个参数面板
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
    let Parameterslists = readfile(Homedir("work/fund/zhishu/panelPEvalue"))
    let Parameterslists =  ListRemoveSpaces(Parameterslists,charinterval)
    let Parameterslists  = ListTo2D(Parameterslists,charinterval)
    let indexfiledict = eval(readfile(Homedir("work/fund/zhishu/indexdatabase"))[0])
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
    let tempkey = copy(reverse(indexkeylist))
    call AddNumber(tempkey)
    let isversion = input("排序日期")
    let Orderedlist  =  repeat([""],len(indexfiledict[indexkeylist[isversion]]["indexvalua"]["data"]["items"]))
    let idx1 = 0
    while idx1 < len(indexfiledict[indexkeylist[isversion]]["indexvalua"]["data"]["items"])
        let Orderedlist[idx1]  = indexfiledict[indexkeylist[isversion]]["indexvalua"]["data"]["items"][idx1]["name"]
        let idx1 += 1
    endwhile
    let Parameterslists   =  ListAddSpaces(Parameterslists,charinterval)
    let Parameterslists =  IndexDataDashboardsort(Parameterslists,Orderedlist)
    call writefile(Parameterslists,Homedir("work/fund/zhishu/panelPEvalue"))
endfunction
"}}}}}
"{{{{{2   IndexCorrespondingFunds(...)指数对应的基金
nnoremap test :call IndexCorrespondingFunds()<cr>
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
    let IndexArchiveDatabase   = eval(readfile(Homedir("work/fund/zhishu/numbereddatabase"))[0])
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
        echo IndexArchiveDatabase["index_code"][indexnum ]
        let command = "wget " . url . indexnum . " -U "  . "\"" . useragent . "\"" .  " -O " . tempfilesname
        call system(command)
        if findfile(tempfilesname,".;") != ""
            let tempfilelist = eval(readfile(tempfilesname)[0])
            if has_key(IndexArchiveDatabase,"fundtoindex") ==# 0
                let IndexArchiveDatabase["fundtoindex"] = {}
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
            endfor
        endif
        call delete(tempfilesname)
        let idx1 += 1
    endwhile
    call writefile([string(IndexArchiveDatabase)],Homedir("work/fund/zhishu/numbereddatabase"))
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
    let relativepath = Homedir("txl/parse")
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
        call writefile(tempdictlist,relativepath)
        call extend(codefile,tempdictlist,8)
        call writefile(codefile,expand("%:p"))
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
        call writefile(codedict,relativepath)
        call extend(codefile,codedict,8)
        call writefile(codefile,expand("%:p"))
        execute "normal! :e " .  expand("%:p") . "\<cr>"
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
    let tempvalue = 0
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
        if "" != matchstr(listwords[idx1],"\/txl.*\/.*\/")
            let tempvalue = split(listwords[0],"|")
            "echo "debug" tempvalue[1]  idx1
            let tempvalue[1] =  idx1 + tempvalue[1] + 1
            let listwords[0] = join(tempvalue,"|")
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

"{{{{{2   TraverseNodes(...) 遍历结构体
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
                    call cursor(line('.') + 1,0)
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
                call cursor(line('.') + 1,0)
                call append(line("."),string(structdict))
                call cursor(line('.') + 1,0)
                let dictlist = PrintDict(structdict)
                call append(line("."),dictlist)
                call cursor(line('.') + 1,0)
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

"}}}}}
"{{{{ 定时器

"{{{{{  FindFiles()  回调
let g:windowfindid = 0
let g:firstfindflag = 0
let g:lastfilter = ""
function! FindFiles(timer)
    let searchs = ""
    let idx1 = 0
    let idj1 = 0
    let clear = [""]
    let command = ""
    let searchs = getline(1)
    let searchstarge = []
    let clear =  repeat(clear,50)
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
    if searchs ==# ""
        return
    endif
    let command = "find -iname " . "'*" . searchs ."*'"
    echo command
    let searchstarge =  system(command)
    let searchstarge = split(searchstarge,"\n")
    "let searchstarge = insert(searchstarge,searchs)
    call setline(2, searchstarge)
    call setline(len(searchstarge) + 2,clear)
    let g:lastfilter = searchs
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
    if g:windowfindid != win_getid() && g:windowfindid != 0
        if win_gotoid(g:windowfindid) ==# 1
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
    echo "是否有定时器，0 没有 1有" len(timeinfo)
    if  len(timeinfo) > 0
        echo "准备清空定时器"
        let idx1 = 0
        while idx1 <  len(timeinfo)
            let tempname =  split(string(timeinfo[idx1]["callback"]),"'")[1]
            if  count(funtionname,tempname)
                call timer_stop(timeinfo[idx1]["id"])
                echo "有这个定时器回调函数"
                if tempname ==# "FindFiles"
                    let g:firstfindflag = 0
                    let g:windowfindid = 0
                endif
            endif
            let idx1 += 1
        endwhile
    else
        let timer = timer_start(200, 'FindFiles', {'repeat': -1})
        echo "开启定时器" timer
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
    call writefile(forwardlist,filename)
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
    "call writefile(rejfile,rejfiles)

endfunction
"}}}}}
"}}}}
"{{{{ 文件管理
"主要功能：每个文件夹下导入README 文件，文件中记录当前文件夹下所有文件的功能
"子目录的README 文件包含到上一级中
"{{{{{2 function! s:TreeContens(type)            图形目录打开对应目录文件      可视模式下 逗号 + r 调用
vnoremap <leader>r :<c-u>call <SID>TreeContens(visualmode())<cr>
function! s:TreeContens(type)
    let saved_unnamed_register = @@
    if a:type ==# 'v'
        normal! `<v`>y
    elseif a:type ==# 'char'
        normal! `[v`]y
    else
        return
    endif
    let tempfile = ""
    let tempfile = @@
    let tempfile = system("find -iname  " . tempfile)
    silent execute "normal! :tabnew\<cr>"
    silent execute "normal! :e " . tempfile . "\<cr>"
    let @@ = saved_unnamed_register
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
    let tempchar = ""
    let tempchar1 = ""
    "}}}}
    let contensfile = readfile(expand("%:p"))
    let curcontesfile = split(system("tree -L 4"),"\n")[1:-3]
    echo curcontesfile
    if count(contensfile ,"<<<<<<<<<<<<<<<<") && count(contensfile ,">>>>>>>>>>>>>>>")
        echo "之前修改过"
        let src = index(contensfile,"<<<<<<<<<<<<<<<<")
        let tail = index(contensfile,">>>>>>>>>>>>>>>")
        let prvcontesfile = contensfile[src + 1:tail - 1]
        call remove(contensfile,src,tail)
        echo src tail
        let idx1 = 0
        while idx1 < len(curcontesfile)
            if len(split(curcontesfile[idx1])) > 1
                let tempchar =  split(curcontesfile[idx1])[1]
                let tempchar1 = ""
                let tempchar1 = IsContain(tempchar,prvcontesfile)
                if tempchar1 != ""
                    "echo "tangxinlou1"
                    let curcontesfile[idx1] = tempchar1
                else
                    echo  tempchar
                    let tempchar1 = GetItemFromFile("Description  ",tempchar)
                    if tempchar1 != ""
                        let curcontesfile[idx1] =join([curcontesfile[idx1] . repeat(" ",52 - strwidth(curcontesfile[idx1]) - 1),join(split(split(tempchar1,":")[1],"\x00"))],"|")
                    endif
                    echo "tangxinlou2"
                endif
            endif
            let idx1 += 1
        endwhile
    else
        echo "第一次生成目录"
    endif
    let curcontesfile = insert(curcontesfile,"<<<<<<<<<<<<<<<<")
    let curcontesfile = add(curcontesfile,">>>>>>>>>>>>>>>")
    call extend(contensfile,curcontesfile,9)
    if "yes" ==# input("是否更新目录")
        call writefile(contensfile,expand("%:p"))
    endif
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
    let tempresult = system("find -iname " . files)
    if  len(split(tempresult,"\n")) ==# 1
        let path = split(tempresult,"\n")[0]
    else
        echo "有相同文件名的文件"
        return
    endif
    let files = readfile(path)
    let tempchar1 = ""
    let tempchar1 = IsContain(string,files)
    return  tempchar1
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
        return count(split(getline(a:lnum)),'│  ')
    else
        return '1'
    endif
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
    "读取当前文件,找到数据最长的一行,对缺少空格的行补逗号
    if mode ==# 1
        if "UTF-8" != matchstr(system("file " . expand("%:p")),"UTF-8")
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
    call writefile(dimensional1,expand("%:p"))
    if mode ==# 1
        execute "normal! :e " .  expand("%:p") . "\<cr>"
    else
        call system("iconv -f utf-8 -t cp936 " . expand("%:p") . " -o " . expand("%:p"))
    endif
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
"{{{{  python
"{{{{{2   OpenPythonfile(...) 打开python文件触发
function! OpenPythonfile()
    "{{{{{3 变量定义
    let pythonfile = ""
    "}}}}
    call setline(1,"#!/usr/bin/python3")
endfunction
"}}}}}

"{{{{{2   PythonTest(...) python test 传参数
function! PythonTest()
    "{{{{{3 变量定义
    let pythontest = ""
    let path = "par from vimscript into python"
    "}}}}
python <<EOM
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

"}}}
"{{{{  调整窗口
"{{{{{2   WidChanged(...) 调整窗口
nnoremap <F10> :call WidChanged()<cr>
"let g:windowid = 0
function! WidChanged()
    "{{{{{3 变量定义
    let windowinfo = ""
    "}}}}
    let windowinfo = getwininfo()
    "echo windowinfo
    let windowinfo[0].width = 50
    let windowinfo[0].height = 6
    "echo windowinfo
    call  execute(["1resize 46","vert 1resize 135"])
    "call  execute("vert resize 135")
    "call  execute('vert 1resize 135')
endfunction
"}}}}}
"}}}

"winnr() 窗口id
"tabpagebuflist() 缓冲区列表
"gettabinfo()标签页信息
"echo winheight('%') winwidth('%')
"set lines=35 columns=118
"winrestcmd()

"forgroundTimeForWifi.\{,20}",
"%g!/唐新楼重新指派了缺陷/d
