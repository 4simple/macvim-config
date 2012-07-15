" Vim color file
" Maintainer:   wondger <wondger@gmail.com>
" Last Change:  2012-05-17 00:03:08
" URL:  http://omiga.org/vim/colors/simple.vim
" Version:  simple.vim v0.1
" http://ajaxorg.github.com/ace/build/kitchen-sink.html idleFingers

" cool help screens
" :he group-name
" :he highlight-groups
" :he cterm-colors

se bg=dark
if version > 580
    " no guarantees for version 5.8 and below, but this makes it stop
    " complaining
    hi clear
    if exists("syntax_on")
	syntax reset
    endif
endif

"let g:colors_name="simple"
let g:colors_name = expand('<sfile>:t:r')

hi Comment guifg=#666666
hi Constant	guifg=#CF6A4C
hi String guifg=#619F40
hi link Character String
hi Number guifg=#CF6A4C
hi Boolean guifg=#CF6A4C
hi link Float Constant

hi Identifier guifg=#CF6A4C
hi Function	guifg=#AAAAAA

hi Statement guifg=#FBB800 gui=none
hi Conditional guifg=#CF6A4C
hi link Repeat Conditional
hi link Label Conditional
hi Operator guifg=#FBB800
hi Keyword guifg=#7E3132
hi link Exception Conditional

hi PreProc guifg=#494F92
hi link Include PreProc
hi link Define PreProc
hi link Macro PreProc
hi link PreCondit PreProc

hi Type guifg=#F77B01 gui=none
hi link StorageClass Type
hi link Structure Type
hi link Typedef Type

hi Special guifg=#8B251E
hi link SpecialChar Special
hi link Tag Special
hi link Delimiter Special
hi link SpecialComment Special
hi Debug guifg=#930103
hi link SpecialChar Special

hi Underlined guifg=#3366CC

hi Ignore guifg=#666666 guibg=#1F1F1F

hi Error guifg=#FFFFFF guibg=#FF0000

hi Todo guifg=#8C7A3B guibg=#1F1F1F

"ColorColumn	used for the columns set with 'colorcolumn'
"Conceal		placeholder characters substituted for concealed
hi Cursor guifg=#000000 guibg=#AAAAAA
hi link CursorIM Cursor
hi CursorLine guibg=#000000
hi CursorColumn guibg=#000000
hi Directory guifg=#86A144
"DiffAdd
"DiffChange
"DiffDelete
"DiffText
hi ErrorMsg guifg=#FFFFFF guibg=#FF0000
hi VertSplit guifg=#666666 guibg=#000000
hi Folded guifg=#AAAAAA guibg=#292929
hi link FoldColumn Folded
"SignColumn
hi IncSearch guifg=#FFFFFF guibg=#000000
hi LineNr guifg=#404040 guibg=#000000
"MatchParen
hi link ModeMsg ErrorMsg
hi link MoreMsg ErrorMsg
"NonText
hi Normal guifg=#AAAAAA guibg=#1F1F1F
"Pmenu
"PmenuSel
"PmenuSbar
"PmenuThumb
"Question
hi Search guifg=#FFFFFF guibg=#00509D
"SpecialKey
"SpellBad
"SpellCap
"SpellLocal
"SpellRare
hi StatusLine guifg=#AAAAAA guibg=#072560 gui=none
hi StatusLineNC guifg=#494949 guibg=#19191A gui=none
hi TabLine guifg=#AAAAAA guibg=#666666
" hi TabLineFill guibg=#FFFFFF
hi TabLineSel guibg=#000000
hi Title guifg=#D21A18
hi Visual guifg=#898989 guibg=#333333
"VisualNOS
hi link WarningMsg ErrorMsg
hi WildMenu guifg=#FFFFFF guibg=#86A144

"custom group-name
hi OutTextWidth guifg=#333333
