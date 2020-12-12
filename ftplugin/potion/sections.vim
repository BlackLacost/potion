function! s:NextSection(type, backwards, visual)
    if a:visual
        normal! gv
    endif

    if a:type == 1
        " %^ regex для vim, означающий начало файла
        let pattern = '\v(\n\n^\S|%^)'
        " Чтобы курсор после поиска ставился в конец
        let flags = 'e'
    elseif a:type == 2
        let pattern = '\v^\S.*\=.*:$'
        let flags = ''
    endif

    if a:backwards
        let dir = '?'
    else
        let dir = '/'
    endif

    execute 'silent normal! ' . dir . pattern . dir . flags . "\r"
endfunction

" noremap чтобы можно было работать в operator-pending mode
noremap <script> <buffer> <silent> ]]
        \ :call <SID>NextSection(1, 0, 0)<cr>
noremap <script> <buffer> <silent> [[
        \ :call <SID>NextSection(1, 1, 0)<cr>

noremap <script> <buffer> <silent> []
        \ :call <SID>NextSection(2, 0, 0)<cr>
noremap <script> <buffer> <silent> ][
        \ :call <SID>NextSection(2, 1, 0)<cr>


" Если в visual mode нажать :, то появится :'<,'>
" чтобы это удалить нужно нажать <c-u> (CTRL-u)
vnoremap <script> <buffer> <silent> ]]
        \ :<c-u>call <SID>NextSection(1, 0, 1)<cr>
vnoremap <script> <buffer> <silent> [[
        \ :<c-u>call <SID>NextSection(1, 1, 1)<cr>

vnoremap <script> <buffer> <silent> []
        \ :<c-u>call <SID>NextSection(2, 0, 1)<cr>
vnoremap <script> <buffer> <silent> ][
        \ :<c-u>call <SID>NextSection(2, 1, 1)<cr>
