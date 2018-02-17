" ==============================================================================
" SpaceVim Keybindings
" ==============================================================================

" Denite config
" -----------------------------------------------------------------------------

if has('python3')
    let g:ctrlp_map = ''
    nnoremap <silent> <C-p> :Denite file_rec/git<CR>
endif


" Config shortcut
" p----------------------------------------------------------------------------

nnoremap vrc <Esc> :e ~/.SpaceVim.d/init.vim <CR>
nnoremap vrp <Esc> :e ~/.SpaceVim.d/plugins.vim <CR>
nnoremap vrk <Esc> :e ~/.SpaceVim.d/keybindings.vim <CR>
nnoremap vru <Esc> :e ~/.SpaceVim.d/uikit.vim <CR>
nnoremap zrc <Esc> :e ~/zsh/src/init.zsh <CR>
nnoremap arc <Esc> :e ~/zsh/plugins/zsh-aliases <CR>
nnoremap zconf <Esc> :e ~/zsh/src/config.zsh <CR>

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
map  <F1> <Esc>
imap <F1> <Esc>

" Writing/exiting shortcuts
inoremap qq  <Esc>
nnoremap qqq <Esc> :quit!  <CR>
nnoremap QQ  <Esc> :quit!  <CR>
nnoremap WW  <Esc> :write! <CR>
nnoremap WQ  <Esc> :wq!    <CR>

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
imap <c-v> <esc>"+pa

" TODO: Rename/Refactor
" -----------------------------------------------------------------------------
" - Find and replace:
"   - Categories -> Comments
"   - categories -> comments
"   - Category -> Comment
"   - category -> comment
"
" - Interface:
"    call g:RenameModel("Comments", "Comment", "comments", "comment", "Categories", "Category", "categories", "category")

