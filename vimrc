""==============================================================================================================
"" DesCRiption: 适合自己使用的vimrc文件，for Linux
"" Last Change: 2020年09月25日
"" Author:      ShaoJX
""==============================================================================================================

syntax on				" 自动语法高亮
set number				" 显示行号

set tabstop=4				" 设定 tab 长度为 4
set shiftwidth=4			" 设置自动缩进宽度
set autoindent				" 设置自动缩进
set cindent				" 设置使用C/C++的缩进方式
set autoread				" 设置文件在vim外改动时自动载入

set ignorecase				" 搜索时忽略大小写
set incsearch				" 输入搜索内容时就显示搜索结果
" set hlsearch				" 搜索时高亮显示被找到的文本

set helplang=cn				" 设置中文帮助
set encoding=utf-8			" 设置编码为UTF-8
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 启用pathogen
call pathogen#infect()
filetype plugin indent on
" 定位到文件头,文件尾
nnoremap <BS> gg
nnoremap <CR> G

" 自动补全
:inoremap ( ()<ESC>i
:inoremap ) <c-r>=ClosePair(')')<CR>
:inoremap [ []<ESC>i
:inoremap ] <c-r>=ClosePair(']')<CR>
:inoremap { {}<ESC>i
:inoremap " ""<ESC>i
:inoremap ' ''<ESC>i
func ClosePair(char)
	if getline('.')[col('.') - 1] == a:char
		return "\<Right>"
	else
		return a:char
	endif
endfunc
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 新建指定类型文件时，调用SetTitle函数 
autocmd BufNewFile *.cpp,*.c,*.h,*.py,*.sh exec ":call SetTitle()" 
" 定义函数SetTitle，自动插入文件头 
func SetTitle()
	if &filetype == 'python'
		call setline(1,	         "\#===================================================================================")
		call append(line(".")+0, "\#	Copyright (C) ".strftime("%Y")." by Jiaxing Shao. All rights reserved")
		call append(line(".")+1, "\# 	文 件 名: ".expand("%"))
		call append(line(".")+2, "\# 	作    者: Jiaxing Shao")
		call append(line(".")+3, "\# 	创建时间: ".strftime("%Y年%m月%d日"))
		call append(line(".")+4, "\#    描    述:  ")
		call append(line(".")+5, "\#===================================================================================*/")
		call append(line(".")+6, "")
		call append(line(".")+7, "\#!/usr/bin/python3")
		call append(line(".")+8,"")
	elseif &filetype == 'sh'
		call setline(1,	         "\#===================================================================================")
		call append(line(".")+0, "\#	Copyright (C) ".strftime("%Y")." by Jiaxing Shao. All rights reserved")
		call append(line(".")+1, "\# 	文 件 名: ".expand("%"))
		call append(line(".")+2, "\# 	作    者: Jiaxing Shao")
		call append(line(".")+3, "\# 	创建时间: ".strftime("%Y年%m月%d日"))
		call append(line(".")+4, "\#    描    述:  ")
		call append(line(".")+5, "\#===================================================================================*/")
		call append(line(".")+6, "")
		call append(line(".")+7, "\#!/bin/bash")
		call append(line(".")+8,"")
	elseif &filetype == 'c' || &filetype == 'cpp' || &filetype == 'h'
		call setline(1,          "\/\/ =====================================================================================")
		call append(line(".")+0, "\/\/  Copyright (C) ".strftime("%Y")." by Jiaxing Shao. All rights reserved")
		call append(line(".")+1, "\/\/  文 件 名:  ".expand("%"))
		call append(line(".")+2, "\/\/  作    者:  Jiaxing Shao")
		call append(line(".")+3, "\/\/  版 本 号:  1.0")
		call append(line(".")+4, "\/\/  创建时间:  ".strftime("%Y年%m月%d日"))
		call append(line(".")+5, "\/\/  Compiler:  g++")
		call append(line(".")+6, "\/\/  描    述:  ")
		call append(line(".")+7,"\/\/ =====================================================================================")
		call append(line(".")+8,"")
	endif
	"新建文件后，自动定位到文件末尾
	autocmd BufNewFile * normal G
endfunc
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" 自定义快捷键
nnoremap <F3> :NERDTreeToggle<CR>
nnoremap <F4> :TlistToggle<CR>
nnoremap <F5> :!ctags -R<CR>
map <C-s> :wq<CR>
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" NERDTreeToggle config

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Taglist config
let Tlist_Show_One_File=1               "只显示当前文件的tags
let Tlist_Exit_OnlyWindow=1             "tagList窗口是最后一个窗口，则退出Vim
let Tlist_Use_Right_Window=1            "在Vim窗口右侧显示taglist窗口
let Tlist_WinHeight=100                 "设置Taglist高度
let Tlist_WinWidth=40                   "设置taglist宽度
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" ctags config

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" omnicppcomplete config
set completeopt=menu,menuone
let OmniCpp_GlobalScopeSearch=1         "全局查找控制。0:禁止；1:允许(缺省)
let OmniCpp_NamespaceSearch=1           "命名空间查找控制, 0,禁止; 1, 查找当前文件缓冲区内的命名空间(缺省); 2, 查找当前文件缓冲区和包含文件中的命名空间
let OmniCpp_MayCompleteDot=1            "操作符 .  号后自动提示; 0, 否; 1, 是
let OmniCpp_MayCompleteArrow=1          "操作符 -> 号后自动提示; 0, 否; 1, 是
let OmniCpp_MayCompleteScope=1          "操作符 :: 号后自动提示; 0, 否; 1, 是
let OmniCpp_DisplayMode=0               "类成员显示控制(是否显示全部公有(public)私有(private)保护(protected)成员). 0:自动; 1:显示所有成员
let OmniCpp_ShowPrototypeInAbbr = 1     "显示函数参数列表 
let OmniCpp_DefaultNamespace=["std"]    "默认命名空间列表, 项目间使用','隔开.
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

