" -----------------------------------------------------------------------------
" SpaceVim Keybindings
" -----------------------------------------------------------------------------

" Denite config
" -----------------------------------------------------------------------------

if has('python3')
    let g:ctrlp_map = ''
    nnoremap <silent> <C-p> :Denite file_rec/git<CR>
endif

" Config shortcut
" -----------------------------------------------------------------------------

nnoremap vrc <Esc> :e ~/.SpaceVim.d/init.vim <CR>
nnoremap zrc <Esc> :e ~/zsh/src/init.zsh <CR>
nnoremap arc <Esc> :e ~/zsh/plugins/zsh-coder-aliases <CR>

" Keybindings
" -----------------------------------------------------------------------------

" Common typos
command! Q q!
command! QQ q!
command! QQQ q!
command! W w
command! WW w!
command! WWW w!
command! Ww w!
command! WQ wq!
command! Wq wq!

" Stupid help menu
map <F1> <Esc>
imap <F1> <Esc>

" Writing/exiting shortcuts
inoremap qq <Esc>
nnoremap qqq <Esc> :quit!  <CR>
nnoremap QQ <Esc> :quit!   <CR>
nnoremap WW <Esc> :write!  <CR>
nnoremap WQ <Esc> :wq!     <CR>

" Autocmds
" -----------------------------------------------------------------------------

:augroup fixcmds
    " Custom formatting
    autocmd FileType make,erlang setlocal noexpandtab
    autocmd FileType go setlocal tabstop=4 shiftwidth=4 noexpandtab
    autocmd FileType go autocmd BufWritePre <buffer> GoFmt

    " Aliasing file types
    autocmd BufNewFile,BufRead *.todo set syntax=markdown
    autocmd BufNewFile,BufRead *.alias set syntax=zsh
    autocmd BufNewFile,BufRead *.html.eex set syntax=eelixir
:augroup END

" Copy/paste
" -----------------------------------------------------------------------------

set clipboard=unnamedplus
vmap <c-c> "+yi
vmap <c-x> "+c
vmap <c-v> c<esc>"+p
imap <c-v> <esc>"+pa
imap <c-v> <esc><c-v>a
set pastetoggle=<F6>
map <F6> :set invpaste<CR>:set paste?<CR>
nnoremap Y y$
vmap Y "+y
