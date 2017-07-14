" -----------------------------------------------------------------------------
" SpaceVim Config
" -----------------------------------------------------------------------------

" Core options
" -----------------------------------------------------------------------------

let g:spacevim_enable_googlesuggest = 1
let g:spacevim_enable_vimfiler_welcome = 0
let g:spacevim_enable_debug = 1
let g:spacevim_enable_tabline_filetype_icon = 1
let g:spacevim_enable_os_fileformat_icon = 1
let g:spacevim_buffer_index_type = 1
let g:spacevim_realtime_leader_guide = 1
let g:spacevim_colorscheme = 'hybrid_reverse'
let g:spacevim_filemanager = 'nerdtree'

" Disable swap warning
set shortmess+=A

" Layers
" -----------------------------------------------------------------------------

call SpaceVim#layers#load('incsearch')
call SpaceVim#layers#load('lang#ocaml')
call SpaceVim#layers#load('lang#scala')
call SpaceVim#layers#load('lang#go')
call SpaceVim#layers#load('lang#c')
call SpaceVim#layers#load('lang#rust')
call SpaceVim#layers#load('lang#java')
call SpaceVim#layers#load('lang#javascript')
call SpaceVim#layers#load('lang#vim')
call SpaceVim#layers#load('lang#python')
call SpaceVim#layers#load('lang#xml')
call SpaceVim#layers#load('lang#haskell')
call SpaceVim#layers#load('lang#elixir')
call SpaceVim#layers#load('lang#kotlin')
call SpaceVim#layers#load('lang#tmux')
call SpaceVim#layers#load('lang#lisp')
call SpaceVim#layers#load('tools#screensaver')
call SpaceVim#layers#load('shell')

" Autocmds
" -----------------------------------------------------------------------------
function! g:Delayed(cmd)
    let timer = timer_start(500, {-> execute(a:cmd, "")})
endfunction

" Auto-start dir browseer
augroup startup
    let dirHome = '/\(Users\|home\)/\w*\%$'
    let dirCode = '/\(Users\|home\)/\w*/\(dev\|code\)/\w*' 
    if match(getcwd(), dirHome) == 0
        " Open bookmarks menu when in home dir
        if match(getcwd(), dirCode) == 0
            call Delayed("call BookmarkShowAll()")
        endif
    else
        " Otherwise open NERDTree
        autocmd VimEnter * NERDTree
        autocmd VimEnter * wincmd p

        " Code dir = open Denite file_rec/git
        if match(getcwd(), dirCode) == 0
            call Delayed("Unite file_rec/git")
        endif
    endif
augroup END

augroup reloadVimrc
    " Automatically reload vimrc when changes are made
    au!
    au BufWritePost init.vim,keybindings.vim,plugins.vim so $MYVIMRC
augroup END

augroup customFormatting
    " Custom formatting
    autocmd FileType make,erlang setlocal noexpandtab
    autocmd FileType go setlocal tabstop=4 shiftwidth=4 noexpandtab
    autocmd FileType go autocmd BufWritePre <buffer> GoFmt
augroup END

augroup fixFiletypes
    " Aliasing file types
    autocmd BufNewFile,BufRead *.todo set syntax=markdown
    autocmd BufNewFile,BufRead *.alias set syntax=zsh
    autocmd BufNewFile,BufRead *.html.eex set syntax=elixir
augroup END

" Source files
" ------------------------------------------

runtime! plugins.vim
runtime! keybindings.vim
runtime! uikit.vim
