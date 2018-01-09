" =============================================================================
" Author: Nick A.
" License: MIT License
" Last Change: 09:12PM Mon Jan 08, 2018 
" =============================================================================

if exists('g:lazytools')
  finish
endif
let g:lazytools = 1

function! lazytools#CoutTokens()
    " toggles between
    "    std::cout << " blah1: " << blah1 << " blah2: " << blah2 << " blah3: " << blah3 << std::endl;
    " and
    "    blah1 blah2 blah3
    "
    let line=getline('.')

    " turn into cout statement or reverse, depending on if
    " line contains std::cout"
    let newstr = ""
    if line =~ "std::cout"
        let words = split(line," << ")
        for word in words
            " if token has these things then it's not a variable by itself
            if word =~ "std::" || word =~ ": "
                continue
            endif
            let newstr .= word . " "
        endfor
    else
        let words = split(line)
        let newstr .= "std::cout << "
        for word in words
            " if there's a quote in the variable, replace it with single tick
            let escword = substitute(word, "\"", "'", "g")
            let newstr .= " \" " . escword . ": \" << " . word . " << "
        endfor
        let newstr .= " std::endl;"
    endif

    :d
    :-1put =newstr
    execute "norm! =="
endfu

