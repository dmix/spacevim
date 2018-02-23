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
let g:spacevim_colorscheme = 'iceberg'
let g:spacevim_filemanager = 'nerdtree'
let g:indentLine_enabled = 0
let g:spacevim_enable_neomake = 1

" Disable swap warning
set shortmess+=A

" Layers
" -----------------------------------------------------------------------------

call SpaceVim#layers#load('autocomplete', {
        \ 'auto-completion-return-key-behavior' : 'smart',
        \ 'auto-completion-tab-key-behavior' : 'smart',
        \ 'auto-completion-complete-with-key-sequence' : 'nil',
        \ 'auto-completion-complete-with-key-sequence-delay' : 0.1,
        \ })
call SpaceVim#layers#load('incsearch')
call SpaceVim#layers#load('shell')
call SpaceVim#layers#load('colorscheme')
call SpaceVim#layers#load('checkers')
call SpaceVim#layers#load('lsp')
call SpaceVim#layers#load('denite')

call SpaceVim#layers#load('lang#c')
call SpaceVim#layers#load('lang#clojure')
call SpaceVim#layers#load('lang#crystal')
call SpaceVim#layers#load('lang#dart')
"call SpaceVim#layers#load('lang#elixir')
call SpaceVim#layers#load('lang#go')
call SpaceVim#layers#load('lang#haskell')
call SpaceVim#layers#load('lang#html')
call SpaceVim#layers#load('lang#java')
call SpaceVim#layers#load('lang#javascript')
call SpaceVim#layers#load('lang#json')
call SpaceVim#layers#load('lang#julia')
call SpaceVim#layers#load('lang#kotlin')
call SpaceVim#layers#load('lang#lisp')
call SpaceVim#layers#load('lang#lua')
call SpaceVim#layers#load('lang#markdown')
call SpaceVim#layers#load('lang#ocaml')
call SpaceVim#layers#load('lang#perl')
call SpaceVim#layers#load('lang#php')
call SpaceVim#layers#load('lang#pony')
call SpaceVim#layers#load('lang#ps1')
call SpaceVim#layers#load('lang#puppet')
call SpaceVim#layers#load('lang#python')
call SpaceVim#layers#load('lang#ruby')
call SpaceVim#layers#load('lang#rust')
call SpaceVim#layers#load('lang#scala')
call SpaceVim#layers#load('lang#sh')
call SpaceVim#layers#load('lang#solidity')
call SpaceVim#layers#load('lang#swig')
call SpaceVim#layers#load('lang#tmux')
call SpaceVim#layers#load('lang#typescript')
call SpaceVim#layers#load('lang#vim')
call SpaceVim#layers#load('lang#xml')

call SpaceVim#layers#load('tools#screensaver')

" Functions
" ------------------------------------------

function! g:Delayed(cmd)
    let timer = timer_start(500, {-> execute(a:cmd, "")})
endfunction

function! g:CustomFormatting()
    augroup customFormatting
        " Custom formatting
        autocmd FileType make,erlang setlocal noexpandtab
        autocmd FileType go setlocal tabstop=4 shiftwidth=4 noexpandtab
        autocmd FileType go autocmd BufWritePre <buffer> GoFmt
        autocmd FileType eelixir setlocal tabstop=4 shiftwidth=4 noexpandtab
    augroup END
endfunction

" Source files
" ------------------------------------------

runtime! plugins.vim
runtime! keybindings.vim
runtime! uikit.vim

" Autocmds
" -----------------------------------------------------------------------------

" Disable indent lines
" call Delayed("g:CustomFormatting()")

" Auto-start dir browseer
" augroup startup
"     let dirHome = '/\(Users\|home\)/\w*\%$'
"     let dirCode = '/\(Users\|home\)/\w*/\(dev\|code\)/\w*' 
"     if match(getcwd(), dirHome) == 0
"         " Open bookmarks menu when in home dir
"         if match(getcwd(), dirCode) == 0
"             call Delayed("call BookmarkShowAll()")
"         endif
"     else
"         " Otherwise open NERDTree
"         autocmd VimEnter * NERDTree
"         autocmd VimEnter * wincmd p
"
"         " Code dir = open Denite file_rec/git
"         if match(getcwd(), dirCode) == 0
"             call Delayed("Unite file_rec/git")
"         endif
"     endif
" augroup END

augroup reloadVimrc
    " Automatically reload vimrc when changes are made
    au!
    au BufWritePost init.vim,keybindings.vim,plugins.vim so $MYVIMRC
augroup END

" augroup resurrectSession 
"     " Aliasing file types
"     autocmd FileType elixir,ruby,javascript autocmd BufWritePre <buffer> Obsess
" augroup END

augroup startifyOptions
    autocmd VimEnter *
                \   if !argc()
                \ |   Startify
                \ |   wincmd w
                \ | endif
augroup END

augroup fixFiletypes
    " Aliasing file types
    autocmd BufNewFile,BufRead *.todo set syntax=markdown
    autocmd BufNewFile,BufRead *.alias set syntax=zsh
    autocmd BufNewFile,BufRead *.html.eex set syntax=elixir
    autocmd BufNewFile,BufRead *.html.eex set syntax=eelixir
augroup END

augroup fixFiletypes
    " Aliasing file types
    autocmd BufNewFile,BufRead *.todo set syntax=markdown
    autocmd BufNewFile,BufRead *.alias set syntax=zsh
    autocmd BufNewFile,BufRead *.html.eex set syntax=elixir
    autocmd BufNewFile,BufRead *.html.eex set syntax=eelixir
augroup END
