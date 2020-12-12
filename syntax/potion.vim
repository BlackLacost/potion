if exists("b:current_syntax")
    finish
endif

syntax keyword potionKeyword loop to times while
syntax keyword potionKeyword if elsif else
syntax keyword potionKeyword class return

syntax keyword potionFunction print join string

" \v - very magic mode
syntax match potionComment "\v#.*$"

" Более спецефичные операторы (+=, *=, ...), нужно определять
" после более общих (=)
syntax match potionOperator "\v\."
syntax match potionOperator "\v\="
syntax match potionOperator "\v\*"
syntax match potionOperator "\v/"
syntax match potionOperator "\v\+"
syntax match potionOperator "\v-"
syntax match potionOperator "\v\?"
syntax match potionOperator "\v\*\="
syntax match potionOperator "\v/\="
syntax match potionOperator "\v\+\="
syntax match potionOperator "\v-\="

syntax match potionNumber "\v\d+"
syntax match potionNumber "\v0x[abcdef\d]+"
syntax match potionNumber "\v\d+\.\d+"
syntax match potionNumber "\v\d+\.?\d*e[-\+]\d+"

highlight link potionKeyword Keyword
highlight link potionFunction Function
highlight link potionComment Comment
highlight link potionOperator Operator
highlight link potionNumber Number

let b:current_syntax = "potion"
