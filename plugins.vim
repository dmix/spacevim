" ==============================================================================
" SpaceVim Plugins
" ==============================================================================

" Note: check here for new plugins 
" https://github.com/search?o=desc&q=language%3A%22Vim+script%22+stars%3A%3E25+pushed%3A%3E2017-01-01&s=stars&type=Repositories&utf8=%E2%9C%93
" -----------------------------------------------------------------------------
"
" Custom Plugins
" -----------------------------------------------------------------------------

" If there is a particular plugin you don't like, you can define this
" variable to disable them entirely:
let g:spacevim_disabled_plugins=[
\ ['es.next.syntax.vim'],
\ ]

let g:spacevim_custom_plugins = [
\ ['tomtom/tcomment_vim'],
\ ['irrationalistic/vim-tasks',       { 'on_ft' : ['tasks']}],
\ ['elixir-lang/vim-elixir',          { 'on_ft' : ['elixir', 'eelixir']}],
\ ['slashmili/alchemist.vim',         { 'on_ft' : ['elixir', 'eelixir']}],
\ ['isRuslan/vim-es6',                { 'on_ft' : ['javascript']}],
\ ['sebastianmarkow/deoplete-rust',   { 'on_ft' : ['rust']}],
\ ['zchee/deoplete-zsh',              { 'on_ft' : ['zsh']}],
\ ['SevereOverfl0w/deoplete-github',  { }],
\ ['fishbullet/deoplete-ruby',  { }],
\ ['Shougo/deoplete-rct',  { }],
\ ['pbogut/deoplete-elm',  { }],
\ ['fszymanski/deoplete-emoji',  { }],
\ ['ryanoasis/vim-devicons',  { }],
\ ]

"
" -----------------------------------------------------------------------------
" Plugin options
" -----------------------------------------------------------------------------

" NERDTree
" ------------------------------------------------------------------------------

let NERDTreeShowHidden = 1
let NERDTreeWinPos = "left"
let NERDTreeIgnore = ['\~$', '\.js$', '\.css$', '\.map', '.git$', 'node_modules$', '_build$']

" Unite
" ------------------------------------------------------------------------------
let g:unite_source_grep_command = 'pt'

let g:unite_source_grep_default_opts = '--nogroup ---smart-case --nocolor -column --hidden '.
   \ '--ignore ".git" ' .
   \ '--ignore "node_modules" ' .
   \ '--ignore "_build" ' .
   \ '--ignore "deps" -g ""'

let g:unite_source_rec_async_command = 'pt --nocolor --nogroup --smart-case --column --hidden ' .
   \ '--ignore ".git" ' .
   \ '--ignore "node_modules" ' .
   \ '--ignore "_build" ' .
   \ '--ignore "deps" -g ""'

" Denite
" ------------------------------------------------------------------------------
function! g:DeniteSettings() 
    call denite#custom#alias('source', 'file_rec/git', 'file_rec')
    call denite#custom#var('file_rec/git', 'command',
		\ ['git', 'ls-files', '-co', '--exclude-standard'])

    call denite#custom#var('file_rec', 'command',
        \ ['pt', '--follow', '--nocolor', '--nogroup', '-g', ''])

    call denite#custom#var('grep', 'command', ['pt'])
    call denite#custom#var('grep', 'default_opts',
        \ ['--nogroup', '--smart-case', '--nocolor'])
    call denite#custom#var('grep', 'recursive_opts', [])
    call denite#custom#var('grep', 'pattern_opt', [])
    call denite#custom#var('grep', 'separator', ['--'])
    call denite#custom#var('grep', 'final_opts', [])

    " Deoplete 
    " call deoplete#util#set_pattern(
    "   \ g:deoplete#omni#input_patterns,
    "   \ 'gitcommit', [g:deoplete#keyword_patterns.gitcommit])
endfunction

" Delayed call due to race condition
call Delayed("call DeniteSettings()")


" Deoplete
" -----------------------------------------------------------------------------

" deoplete-github
" let g:deoplete#sources = {}
" let g:deoplete#sources.gitcommit=['github']
" let g:deoplete#keyword_patterns = {}
" let g:deoplete#keyword_patterns.gitcommit = '.+'

" Strip Whitespace
" ------------------------------------------------------------------------------

let g:strip_whitespace_on_save = 1
let g:better_whitespace_enabled = 0

" NeoMake x Linters
" ------------------------------------------------------------------------------
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

" Bookmarks
" -----------------------------------------------------------------------------

let g:bookmark_save_per_working_dir = 0
let g:bookmark_auto_save = 1
let g:bookmark_auto_save_file = $HOME .'/.SpaceVim.d/.vim-bookmarks'

function! g:AutoloadBookmarks() 
    " Hack to autoload lazy vim-bookmarks plugin
    silent normal mn
    " Fix SpaceVims broken auto-loading/saving bookmarks
    call BookmarkLoad(g:bookmark_auto_save_file, 0, 1)
    autocmd BufLeave,VimLeave * call BookmarkSave(g:bookmark_auto_save_file, 1)
endfunction

call Delayed("call AutoloadBookmarks()")

