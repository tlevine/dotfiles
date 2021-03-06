syntax on
set noswapfile
set number

" http://stackoverflow.com/a/21323445
" Only do this part when compiled with support for autocommands.
if has("autocmd")
    " Use filetype detection and file-based automatic indenting.
    filetype plugin indent on

    " Use actual tab chars in Makefiles.
    autocmd FileType make set tabstop=8 shiftwidth=8 softtabstop=0 noexpandtab
endif

" For everything else, use a tab width of 4 space chars.
set tabstop=4       " The width of a TAB is set to 4.
                    " Still it is a \t. It is just that
                    " Vim will interpret it to be having
                    " a width of 4.
set shiftwidth=4    " Indents will have a width of 4.
set softtabstop=4   " Sets the number of columns for a TAB.
set expandtab       " Expand TABs to spaces.
" set history 100000

"Set the Message-Id for an email and put a link to the message's
"future location on the Dada Portal.
function! DadaMail()
    let @m=strftime('%Y%m%d.%H%M%S') . '.' . system('printf $RANDOM') . '@' . system('hostname')
    normal gg"mPgg^iMessage-Id: 
    normal G"mp^i---This email is also available here.http://thomaslevine.com/mail/$a/
endfunction
nnoremap m :call DadaMail()<CR>
