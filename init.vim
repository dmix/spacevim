" -----------------------------------------------------------------------------
" SpaceVim Config
" -----------------------------------------------------------------------------

" Dependencies
" -----------------------------------------------------------------------------

" pip install vim-vint
" sudo npm install -g eslint
" gem install rubocop
" sudo apt install tidy
" npm install -g jsonlint
" npm install -g sass-lint
" sudo yarn global add tslint typescript
" sudo pip install yamllint
" sudo apt-get install shellcheck or cabal install ShellCheck
" pip install flake8
" sudo npm install -g stylelint
" pip install proselint
" npm install -g diff-so-fancy

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

" Plugin config
" -----------------------------------------------------------------------------

"let g:deoplete#auto_complete_delay = 150

let g:neomake_vim_enabled_makers = ['vint']
let g:neomake_erlang_enabled_makers = ['flycheck']
let g:neomake_elixir_enabled_makers = ['dogma']
let g:neomake_javascript_enabled_makers = ['eslint']
let g:neomake_ruby_enabled_makers = ['rubocop']
let g:neomake_go_enabled_makers = ['gofmt']
let g:neomake_haskell_enabled_makers = ['hlint']
let g:neomake_html_enabled_makers = ['tidy']
let g:neomake_json_enabled_makers = ['jsonlint']
let g:neomake_html_enabled_makers = ['tidy']
let g:neomake_scss_enabled_makers = ['sass_lint']
let g:neomake_typescript_enabled_makers = ['tslint']
let g:neomake_yaml_enabled_makers = ['yamllint']
let g:neomake_zsh_enabled_makers = ['zsh']
let g:neomake_sh_enabled_makers = ['shellcheck']
let g:neomake_python_enabled_makers = ['flake8']
let g:neomake_css_enabled_makers = ['stylelint']
let g:neomake_markdown_enabled_makers = ['proselint']
let g:neomake_text_enabled_makers = ['proselint']

" SpaceVim vars
" -----------------------------------------------------------------------------

let g:spacevim_filemanager = 'nerdtree'
let g:spacevim_enable_vimfiler_welcome = 1
let g:spacevim_enable_debug = 1
let g:spacevim_enable_tabline_filetype_icon = 1
let g:spacevim_enable_os_fileformat_icon = 1
let g:spacevim_buffer_index_type = 1
let g:spacevim_enable_debug = 1
let g:spacevim_realtime_leader_guide = 1
let g:spacevim_colorscheme = 'hybrid_reverse'
let g:spacevim_disabled_plugins=[
    \ ['es.next.syntax.vim'],
    \ ]

let g:spacevim_custom_plugins = [
    \ ['ntpeters/vim-better-whitespace'],
    \ ['tomtom/tcomment_vim'],
    \ ['irrationalistic/vim-tasks', { 'on_ft' : ['tasks']}],
    \ ['elixir-lang/vim-elixir', { 'on_ft' : ['elixir', 'eelixir']}],
    \ ['slashmili/alchemist.vim', { 'on_ft' : ['elixir', 'eelixir']}],
    \ ['isRuslan/vim-es6', { 'on_ft' : ['javascript']}],
    \ ]

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

    " Strip whitespace
    autocmd BufEnter * EnableStripWhitespaceOnSave

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
