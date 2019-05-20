" -----------------------------------------------------------------------------
" SpaceVim Config
" -----------------------------------------------------------------------------

" Python
let g:python2_host_prog = '/usr/local/bin/python2.7'
let g:python3_host_prog = '/usr/local/bin/python3.7'
let g:_spacevim_autocomplete_delay = 50     

" Core options
" -----------------------------------------------------------------------------
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_javascript_eslint_exec = 'eslint_d'
let g:spacevim_autocomplete_method = 'deoplete'
let g:spacevim_windows_smartclose = ''
let g:spacevim_enable_googlesuggest = 0
let g:spacevim_enable_vimfiler_welcome = 0
let g:spacevim_enable_debug = 0
let g:spacevim_enable_tabline_filetype_icon = 1
let g:spacevim_enable_os_fileformat_icon = 1
let g:spacevim_buffer_index_type = 1
let g:spacevim_realtime_leader_guide = 1
let g:spacevim_colorscheme = 'iceberg'
let g:spacevim_filemanager = 'nerdtree'
let g:indentLine_enabled = 1
let g:spacevim_enable_neomake = 1
let g:delimitMate_expand_cr = 0
let g:ruby_host_prog = 'rvm system do neovim-ruby-host'

" Disable swap warning
set shortmess+=A

" Layers
" -----------------------------------------------------------------------------

call SpaceVim#layers#disable('sudo')
call SpaceVim#layers#load('autocomplete')
" call SpaceVim#layers#load('autocomplete', {
"         \ 'auto-completion-return-key-behavior' : 'smart',
"         \ 'auto-completion-tab-key-behavior' : 'smart',
"         \ 'auto-completion-complete-with-key-sequence' : 'nil',
"         \ 'auto-completion-complete-with-key-sequence-delay' : 0.1,
"         \ })
call SpaceVim#layers#load('incsearch')
call SpaceVim#layers#load('shell')
call SpaceVim#layers#load('colorscheme')
" call SpaceVim#layers#load('checkers')
call SpaceVim#layers#load('lsp')
call SpaceVim#layers#load('denite')
call SpaceVim#layers#load('lang#c')
" call SpaceVim#layers#load('lang#clojure')
" call SpaceVim#layers#load('lang#crystal')
" call SpaceVim#layers#load('lang#dart')
call SpaceVim#layers#load('lang#elixir')
call SpaceVim#layers#load('lang#go')
call SpaceVim#layers#load('lang#haskell')
call SpaceVim#layers#load('lang#html')
" call SpaceVim#layers#load('lang#java')
call SpaceVim#layers#load('lang#javascript')
call SpaceVim#layers#load('lang#json')
" call SpaceVim#layers#load('lang#julia')
call SpaceVim#layers#load('lang#kotlin')
" call SpaceVim#layers#load('lang#lisp')
call SpaceVim#layers#load('lang#lua')
call SpaceVim#layers#load('lang#markdown')
call SpaceVim#layers#load('lang#ocaml')
" call SpaceVim#layers#load('lang#perl')
" call SpaceVim#layers#load('lang#php')
call SpaceVim#layers#load('lang#vue')

" call SpaceVim#layers#load('tools#screensaver')

" Functions
" ------------------------------------------

function! g:Delayed(cmd)
    let timer = timer_start(500, {-> execute(a:cmd, "")})
endfunction

function! g:CustomFormatting()
    augroup customFormatting
        " Custom formatting
        autocmd FileType make,erlang set noexpandtab
        autocmd FileType go autocmd BufWritePre <buffer> GoFmt
        autocmd FileType go, eelixir set tabstop=4 shiftwidth=4 noexpandtab
        autocmd FileType javascript,vue,html set tabstop=4 shiftwidth=4 expandtab
        autocmd FileType eruby set shiftwidth=2 expandtab
        autocmd FileType sass,scss,css set shiftwidth=2 expandtab
        echo "CustomFormatting set"
    augroup END
endfunction

" Source files
" ------------------------------------------

runtime! plugins.vim
runtime! keybindings.vim
runtime! uikit.vim

" Autocmds
" -----------------------------------------------------------------------------
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

" augroup startifyOptions
"     autocmd VimEnter *
"                 \   if !argc()
"                 \ |   Startify
"                 \ |   wincmd w
"                 \ | endif
" augroup END


augroup fixFiletypes
    " Aliasing file types
    autocmd BufNewFile,BufRead *.todo set syntax=markdown
    autocmd BufNewFile,BufRead *.alias set syntax=zsh
    autocmd BufNewFile,BufRead *.html.eex set syntax=elixir
    autocmd BufNewFile,BufRead *.html.eex set syntax=eelixir
    autocmd BufNewFile,BufRead *.md set wrap
    autocmd BufNewFile,BufRead *.md set spell
augroup END

" Whitespace Removal
" ---------------------------------------------------------------------
function! PreciseTrimWhiteSpace()
  " We need to save the view because the substitute command might
  " or might not move the cursor, depending on whether it finds
  " any whitespace.
  let saved_view = winsaveview()

  " Remove white space. Ignore "not found" errors. Don't change jumplist.
  keepjumps '[,']s/\s\+$//e

  " Move cursor back if necessary.
  call winrestview(saved_view)
endfunction

augroup PreciseTrimWhiteSpace
  autocmd!
  autocmd InsertLeave * call PreciseTrimWhiteSpace()
augroup end


" Strip line endings for certain filetypes
autocmd FileType c,cpp,java,php,ruby,json,yaml,toml,javascript,html,css,scss,elixir,markdown,jinja,jinja.html autocmd BufWritePre <buffer> %s/\s\+$//e
autocmd FileType vue autocmd BufWritePre <buffer> :Neomake
autocmd FileType javascript,go,eelixir,make,erlang,html,eruby,vue,scss,sass,css call g:CustomFormatting()
autocmd FileType elixir call deoplete#custom#source('alchemist', 'rank', 500)

