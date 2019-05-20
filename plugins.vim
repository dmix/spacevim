" ==============================================================================
" SpaceVim Plugins
" ==============================================================================

" Note: check here for new plugins 
" https://github.com/search?o=desc&q=language%3A%22Vim+script%22+stars%3A%3E25+pushed%3A%3E2017-01-01&s=stars&type=Repositories&utf8=%E2%9C%93
" -----------------------------------------------------------------------------
"
" Custom Plugins
" -----------------------------------------------------------------------------
"
" " If there is a particular plugin you don't like, you can define this
" " variable to disable them entirely:
" let g:spacevim_disabled_plugins=[
" \ ]
" \ ['farseer90718/vim-taskwarrior',        { }],
" \ 'neco-look',

" \ ['elixir-lang/vim-elixir',          { 'on_ft' : ['elixir', 'eelixir']}],
" \ ['kbrw/elixir.nvim',                { 'on_ft' : ['elixir', 'eelixir'],
"                                       \ 'do': 'yes \| ./install.sh' }],
let g:spacevim_custom_plugins = [
\ ['cocopon/iceberg.vim'],
\ ['tomtom/tcomment_vim'],
\ ['cespare/vim-toml',                { 'on_ft' : ['toml']}],
\ ['sjl/vitality.vim',                { }],
\ ['jceb/vim-orgmode',                { 'on_ft' : ['org']}],
\ ['dmix/vim-tasks',                  { 'on_ft' : ['tasks']}],
\ ['sebastianmarkow/deoplete-rust',   { 'on_ft' : ['rust']}],
\ ['zchee/deoplete-zsh',              { 'on_ft' : ['zsh']}],
\ ['uplus/deoplete-solargraph',       { 'on_ft' : ['ruby'] }],
\ ['carlitux/deoplete-ternjs',        { 'do': 'npm install -g tern' }],
\ ['SevereOverfl0w/deoplete-github',  { }],
\ ['fishbullet/deoplete-ruby',        { }],
\ ['Shougo/deoplete-rct',             { }],
\ ['pbogut/deoplete-elm',             { }],
\ ['fszymanski/deoplete-emoji',       { }],
\ ['billyvg/deoplete-import-js',      {}],
\ ['wellle/tmux-complete.vim',        {}],
\ ['autozimu/LanguageClient-neovim',  { 'branch': 'next', 'do': 'bash install.sh' }],
\ ['yaymukund/vim-rabl',              { 'on_ft' : ['rabl']}],
\ ['isRuslan/vim-es6',                { 'on_ft' : ['javascript']}],
\ ['christoomey/vim-tmux-navigator',  { }],
\ ['benmills/vimux',                  { }],
\ ['posva/vim-vue',                   { 'on_ft':  ['vue']}],
\ ['baabelfish/nvim-nim',             { 'on_ft':  ['nim']}],
\ ['ehamberg/vim-cute-python',        { 'on_ft' : ['python']}],
\ ['ehamberg/vim-cute-erlang',        { 'on_ft' : ['erlang']}],
\ ['enomsg/vim-haskellConcealPlus',   { 'on_ft' : ['haskell']}],
\ ['MnO2/vim-ocaml-conceal',          { 'on_ft' : ['ocaml']}],
\ ["d-gold/vim-cute-ruby",            { 'on_ft' : ['ruby']}],
\ ['thinca/vim-ref',                  { 'on_ft' : ['elixir', 'eelixir']}],
\ ['mattn/webapi-vim',                { 'on_ft' : ['elixir', 'eelixir']}],
\ ['lucidstack/hex.vim',              { 'on_ft' : ['elixir', 'eelixir']}],
\ ['dmix/phoenix.vim',                { 'on_ft' : ['elixir', 'eelixir']}],
\ ['sbdchd/neoformat',                { 'on_ft' : ['elixir', 'eelixir']}],
\ ['huiyiqun/elvish.vim',             { 'on_ft' : ['elvish']}],
\ ['slim-template/vim-slim',          { 'on_ft' : ['elixir', 'html', 'slim', 'eelixir']}],
\ ['Glench/Vim-Jinja2-Syntax',        { 'on_ft' : ['jinja.html']}],
\ ['posva/vim-vue',                   { 'on_ft' : ['vue']}],
\ ['digitaltoad/vim-pug',             { 'on_ft' : ['pug', 'jade']}],
\ ['vimwiki/vimwiki',        { }],
\ ['tbabej/taskwiki',        { }],
\ ['powerman/vim-plugin-AnsiEsc',        { }],
\ ['farseer90718/vim-taskwarrior',        { }],
\]
" \ ['jiangmiao/auto-pairs',            {}],
" \ ['isRuslan/vim-es6',                { 'on_ft' : ['javascript']}],
" \ ['kbrw/elixir.nvim',                { 'on_ft' : ['elixir', 'eelixir'],
" \ ['',        { }],

" -----------------------------------------------------------------------------
" Plugin options
" -----------------------------------------------------------------------------

let g:deoplete_import_js#bin = 'importjs'

" Task Bindings
" -----------------------------------------------------------------------------

let g:TasksMarkerBase = '☐'
let g:TasksMarkerDone = '✔'
let g:TasksMarkerCancelled = '✘'
let g:TasksAttributeMarker = '@'

" Vim Tmux Navigator
" -----------------------------------------------------------------------------

let g:tmux_navigator_no_mappings = 1
nnoremap <silent> <C-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <C-j> :TmuxNavigateDown<cr>
nnoremap <silent> <C-k> :TmuxNavigateUp<cr>
nnoremap <silent> <C-l> :TmuxNavigateRight<cr>


" Vimux
" -----------------------------------------------------------------------------

" Prompt for a command to run
map <Leader>vp :VimuxPromptCommand<CR> 

" Run last command executed by VimuxRunCommand
map <Leader>vl :VimuxRunLastCommand<CR>

function! VimuxSlime()
	call VimuxOpenRunner()
	call VimuxSendText(@v)
	call VimuxSendKeys("Enter")
	echom "Vimux GO"
endfunction

" If text is selected, save it in the v buffer and send that buffer it to tmux
vnoremap <Leader>vv "vy :call VimuxSlime()<CR>

" Select current paragraph and send it to tmux
" noremap <Leader>vs vip<Leader>vs<CR>
nnoremap <Leader>vv v$"vy :call VimuxSlime()<CR>

" NERDTree
" ------------------------------------------------------------------------------

let NERDTreeShowHidden = 1
let NERDTreeWinPos = "left"
let NERDTreeIgnore = ['\~$', '\.map', '.git$', 'node_modules$', '_build$']

" Open NERDTree when opening directory
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif

function! g:NERDTreeSettings() 
  map <C-n> :NERDTreeToggle<CR>
endfunction

call Delayed("call NERDTreeSettings()")

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

" Startify
" 
" -----------------------------------------------------------------------------

function! g:StartifyOptions() 
    let g:startify_enable_special         = 0
    let g:startify_files_number           = 8
    let g:startify_relative_path          = 1
    let g:startify_change_to_dir          = 1
    let g:startify_update_oldfiles        = 1
    let g:startify_session_autoload       = 1
    let g:startify_session_persistence    = 1

    let g:startify_skiplist = [
            \ 'COMMIT_EDITMSG',
            \ 'bundle/.*/doc',
            \ '/data/repo/neovim/runtime/doc',
            \ '/Users/mhi/local/vim/share/vim/vim74/doc',
            \ ]

    let g:startify_bookmarks = [
            \ { 'c': '~/.vim/vimrc' },
            \ '~/golfing',
            \ ]

    let g:startify_custom_header =
            \ startify#fortune#cowsay('═','║','╔','╗','╝','╚')

    let g:startify_custom_footer =
           \ ['', "   Vim is charityware. Please read ':help uganda'.", '']
endfunction

call Delayed("call StartifyOptions()")


" Denite
" ------------------------------------------------------------------------------
function! g:DeniteSettings() 
    call denite#custom#alias('source', 'file_rec/git', 'file_rec')
    call denite#custom#var('file_rec/git', 'command',
		\ ['git', 'ls-files', '-co', '--exclude-standard'])

    call denite#custom#var('file_rec', 'command',
        \ ['rg', '-l', '--follow', '-i', ''])

    call denite#custom#var('grep', 'command', ['pt'])
    call denite#custom#var('grep', 'default_opts',
        \ ['--nogroup', '--smart-case', '--nocolor'])
    call denite#custom#var('grep', 'recursive_opts', [])
    call denite#custom#var('grep', 'pattern_opt', [])
    call denite#custom#var('grep', 'separator', ['--'])
    call denite#custom#var('grep', 'final_opts', [])

    "call deoplete#custom#source('alchemist', 'rank', 9999)
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
let g:neomake_vim_enabled_makers        = ['vint']
let g:neomake_erlang_enabled_makers     = ['flycheck']
let g:neomake_elixir_enabled_makers     = ['credo']
let g:neomake_css_enabled_makers        = ['stylelint']
let g:neomake_markdown_enabled_makers   = ['proselint']
let g:neomake_haml_enabled_makers       = ['haml-lint']
let g:neomake_javascript_enabled_makers = ['eslint']
let g:neomake_vue_enabled_makers        = ['eslint']
let g:neomake_ruby_enabled_makers       = ['rubocop']
let g:neomake_haskell_enabled_makers    = ['hlint']
let g:neomake_html_enabled_makers       = ['tidy']
let g:neomake_json_enabled_makers       = ['jsonlint']
let g:neomake_go_enabled_makers         = ['gofmt']
let g:neomake_python_enabled_makers     = ['flake8']
let g:neomake_scss_enabled_makers       = ['sasslint']
let g:neomake_sh_enabled_makers         = ['shellcheck']
let g:neomake_text_enabled_makers       = ['proselint']
let g:neomake_typescript_enabled_makers = ['tslint']
let g:neomake_yaml_enabled_makers       = ['yamllint']
let g:neomake_zsh_enabled_makers        = ['zsh']

" let g:syntastic_javascript_checkers = ['eslint']
" let g:syntastic_javascript_eslint_exec = 'eslint_d'

" gem install haml_lint
" gem install rubocop
" npm install -g sass-lint
" npm install -g stylelint         
" npm install -g proselint
" npm install -g jsonlint
" brew install yamllint
" brew install tidy-html5

" Neoformat
" -----------------------------------------------------------------------------

let g:neoformat_elixir_exfmt = {
  \ 'exe': 'mix',
  \ 'args': ['exfmt', '--stdin'],
  \ 'stdin': 1
  \ }

let g:neoformat_enabled_elixir = ['exfmt']

" Bookmarks
" -----------------------------------------------------------------------------

" let g:bookmark_save_per_working_dir = 0
" let g:bookmark_auto_save = 1
" let g:bookmark_auto_save_file = $HOME .'/.SpaceVim.d/.vim-bookmarks'
"
" function! g:AutoloadBookmarks() 
"     " Hack to autoload lazy vim-bookmarks plugin
"     silent normal mn
"     " Fix SpaceVims broken auto-loading/saving bookmarks
"     call BookmarkLoad(g:bookmark_auto_save_file, 0, 1)
"     autocmd BufLeave,VimLeave * call BookmarkSave(g:bookmark_auto_save_file, 1)
" endfunction
"
" call Delayed("call AutoloadBookmarks()")


" Slim 
" -----------------------------------------------------------------------------

autocmd BufNewFile,BufRead *.slim setlocal filetype=slim

" Tern
" -----------------------------------------------------------------------------
function! g:DeopleteSettings()
    " Set bin if you have many instalations
    let g:deoplete#sources#ternjs#tern_bin = '/usr/local/bin/tern'
    let g:deoplete#sources#ternjs#timeout = 1

    " Whether to include the types of the completions in the result data. Default: 0
    let g:deoplete#sources#ternjs#types = 1

    " Whether to include the distance (in scopes for variables, in prototypes for 
    " properties) between the completions and the origin position in the result 
    " data. Default: 0
    let g:deoplete#sources#ternjs#depths = 0

    " Whether to include documentation strings (if found) in the result data.
    " Default: 0
    let g:deoplete#sources#ternjs#docs = 0

    " When on, only completions that match the current word at the given point will
    " be returned. Turn this off to get all results, so that you can filter on the 
    " client side. Default: 1
    let g:deoplete#sources#ternjs#filter = 1

    " Whether to use a case-insensitive compare between the current word and 
    " potential completions. Default 0
    let g:deoplete#sources#ternjs#case_insensitive = 1

    " When completing a property and no completions are found, Tern will use some 
    " heuristics to try and return some properties anyway. Set this to 0 to 
    " turn that off. Default: 1
    let g:deoplete#sources#ternjs#guess = 0

    " Determines whether the result set will be sorted. Default: 1
    let g:deoplete#sources#ternjs#sort = 1

    " When disabled, only the text before the given position is considered part of 
    " the word. When enabled (the default), the whole variable name that the cursor
    " is on will be included. Default: 1
    let g:deoplete#sources#ternjs#expand_word_forward = 1

    " Whether to ignore the properties of Object.prototype unless they have been 
    " spelled out by at least two characters. Default: 1
    let g:deoplete#sources#ternjs#omit_object_prototype = 0

    " Whether to include JavaScript keywords when completing something that is not 
    " a property. Default: 0
    let g:deoplete#sources#ternjs#include_keywords = 1

    " If completions should be returned when inside a literal. Default: 1
    let g:deoplete#sources#ternjs#in_literal = 1


    "Add extra filetypes
    let g:deoplete#sources#ternjs#filetypes = [
                    \ 'js',
                    \ 'jsx',
                    \ 'javascript.jsx',
                    \ 'vue',
                    \ ]

    " Pass a dictionary to set multiple options
    call deoplete#custom#option({
    \ 'auto_complete_delay': 100,
    \ 'smart_case': v:true,
    \ })

    let g:deoplete_import_js#bin = 'importjs'
endfunction

" Delayed call due to race condition
call Delayed("call DeopleteSettings()")
