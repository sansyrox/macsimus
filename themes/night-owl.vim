if (has("termguicolors"))
 set termguicolors
endif

" For Neovim 0.1.3 and 0.1.4
let $NVIM_TUI_ENABLE_TRUE_COLOR=1

""""" enable the theme

syntax enable
colorscheme nightfly

" call s:HL('BufTabLineActive', s:colors.foreground, s:colors.background)  
" call s:HL('BufTabLineHidden', s:colors.foreground, s:colors.background)  
:hi TabLineFill ctermfg=LightGreen ctermbg=DarkGreen
:hi TabLine ctermfg=Blue ctermbg=Yellow
:hi TabLineSel ctermfg=Red ctermbg=Yellow
:hi Title ctermfg=LightBlue ctermbg=Magenta

let g:lightline = { 'colorscheme': 'nightfly' }

let g:nightflyCursorColor = 1
let g:nightflyNormalFloat = 1
let g:nightflyTransparent = 1
let g:nightflyUnderlineMatchParen = 1
" Vimscript initialization file
let g:nightflyWinSeparator = 2

hi VertSplit ctermbg=NONE guibg=NONE
set encoding=utf8

