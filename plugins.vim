" -----------------------------------------------------------------------------
" SpaceVim Plugins
" -----------------------------------------------------------------------------

" Custom Plugins
" -----------------------------------------------------------------------------

let g:spacevim_disabled_plugins=[
    \ ['es.next.syntax.vim'],
    \ ]

let g:spacevim_custom_plugins = [
    \ ['tomtom/tcomment_vim'],
    \ ['irrationalistic/vim-tasks', { 'on_ft' : ['tasks']}],
    \ ['elixir-lang/vim-elixir',    { 'on_ft' : ['elixir', 'eelixir']}],
    \ ['slashmili/alchemist.vim',   { 'on_ft' : ['elixir', 'eelixir']}],
    \ ['isRuslan/vim-es6',          { 'on_ft' : ['javascript']}],
    \ ]

" Plugin options
" -----------------------------------------------------------------------------

" Strip Whitespace
let g:strip_whitespace_on_save = 1
let g:better_whitespace_enabled = 0

" NeoMake x Linters
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
