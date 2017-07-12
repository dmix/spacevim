" -----------------------------------------------------------------------------
" SpaceVim Config
" -----------------------------------------------------------------------------

" Core options
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

" Source files
" ------------------------------------------

runtime! plugins.vim
runtime! keybindings.vim
