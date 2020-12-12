setlocal foldmethod=expr
setlocal foldexpr=GetPotionFold(v:lnum)

function! NextNonBlankLine(lnum)
    " line('$') номер последней строки в файле
    let numlines = line('$')
    let current = a:lnum + 1

    while current <= numlines
        if getline(current) =~? '\v\S'
            return current
        endif
        " -1: the fold level is undefined, use the fold level of a line
        " before or after this line, whichever is the lowest.
        let current += 1
    endwhile

    return -2
endfunction

function! IndentLevel(lnum)
    return indent(a:lnum) / &shiftwidth
endfunction

function! GetPotionFold(lnum)
    if getline(a:lnum) =~? '\v^\s*$'
        "
        return '-1'
    endif

    let this_indent = IndentLevel(a:lnum)
    let next_indent = IndentLevel(NextNonBlankLine(a:lnum))

    if next_indent == this_indent
        return this_indent
    elseif next_indent < this_indent
        return this_indent
    elseif next_indent > this_indent
        " >inden 'special' foldlevel. It tells Vim that the current line
        " should open a fold of the given level.
        return '>' . next_indent
    endif
endfunction
