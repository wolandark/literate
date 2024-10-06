function! ExecuteCodeBlock()
    let l:save_pos = getpos(".")

    let l:current_line = line('.')

    if getline(l:current_line) !~ '^BEGIN \(\w\+\)'
        echo "No BEGIN token found on the current line"
        return
    endif

    let l:line_text = getline(l:current_line)
    let l:lang = matchstr(l:line_text, '^BEGIN \zs\w\+')

    let l:end_line = search('^END', 'n')
    if l:end_line == 0
        echo "No END token found after BEGIN"
        return
    endif

    let l:code = join(getline(l:current_line + 1, l:end_line - 1), "\n")

    if l:lang ==# 'sh'
        let l:shell = '/bin/sh'
    elseif l:lang ==# 'python'
        let l:shell = '/usr/bin/python3'
    elseif l:lang ==# 'ksh'
        let l:shell = '/usr/bin/perl'
    elseif l:lang ==# 'perl'
        let l:shell = '/usr/bin/perl'
    else
        echo "Unsupported language: " . l:lang
        return
    endif

    let l:output = system(l:shell, l:code)

    call setpos('.', [0, l:end_line + 1, 1, 0])
    call append('.', split(l:output, "\n"))
		call append('.', 'RESULT:')

    call setpos('.', l:save_pos)
endfunction

nnoremap <C-c><C-c> :call ExecuteCodeBlock()<CR>
