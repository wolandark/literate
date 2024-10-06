" lit.vim - Syntax file for literate programming files

if exists("colors_name")
    colorscheme lit_colors
endif

syntax keyword litBegin BEGIN
syntax keyword litEnd END

highlight link litBegin Statement
highlight link litEnd Statement

syntax keyword litResult RESULT
highlight link litResult Identifier
