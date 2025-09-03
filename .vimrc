syntax on
set number
set tabstop=2
set shiftwidth=2
set expandtab
set ai
set wrap
set hlsearch
set ruler
set encoding=utf-8
set background=dark
highlight Comment ctermfg=green
set laststatus=2
set statusline=%m%=%#BranchLine#%{Branch()}

hi StatusLine ctermfg=16 guifg=black
hi BranchLine ctermfg=green guifg=green

function! Branch()
    let l:dir = len(expand("%")) > 0 ? expand("%:p:h") : getcwd()
    if executable("git")
        let l:branch = systemlist("git -C " . shellescape(l:dir) . " rev-parse --abbrev-ref HEAD 2>/dev/null")
        if v:shell_error == 0 && !empty(l:branch)
            return "[" . l:branch[0] . "] "
        endif
    endif

    return ""
endfunction
