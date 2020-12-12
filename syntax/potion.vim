if exists("b:current_syntax")
    finish
endif

syntax keyword potionKeyword loop to times while
syntax keyword potionKeyword if elsif else
syntax keyword potionKeyword class return

highlight link potionKeyword Keyword

let b:current_syntax = "potion"
