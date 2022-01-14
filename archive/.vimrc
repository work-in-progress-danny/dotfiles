" TODO
"   - autocomplete commands/find a new plugin
"   - syntax highlighting for each language i use
"   - key maps:
"       - 'z<Enter>' redraws screen setting cursor to 1,1
"       - 'zz' redraws screen with cursor in the middle
"       - '<S>l' jumps cursor to bottom if the screen, some combination with
"       zz should make for a 'scroll page quick' function
"       - save and quit?
"   - better undo board
"      - beta testing at the moment, haven't used it properly yet
"   - multiline selection and commenting in/out
"   - parenths completions and quotes
"   - linting:
"       - Python
"       - Ruby
"       - Go
"       - JS
"           - TS - typescript language engine
"           - JSX

call plug#begin('~/.vim/plugged')
" Languages
Plug 'vim-ruby/vim-ruby'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'mattn/emmet-vim'
Plug 'othree/html5.vim'
Plug 'fatih/vim-go'
Plug 'rust-lang/rust.vim'

" Plugins
Plug 'dense-analysis/ale'
Plug 'mbbill/undotree'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'kamykn/spelunker.vim'
Plug 'yggdroot/indentline'
Plug 'luochen1990/rainbow'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'easymotion/vim-easymotion'
Plug 'haya14busa/incsearch.vim'
Plug 'haya14busa/incsearch-easymotion.vim'

" Colour Schemes
Plug 'gruvbox-community/gruvbox'
Plug 'nightsense/carbonized'
Plug 'gryf/wombat256grf'
Plug 'artanikin/vim-synthwave84'
Plug 'jnurmine/zenburn'
Plug 'nanotech/jellybeans.vim'
call plug#end()

"Key Maps
nnoremap <F4> :UndotreeToggle<CR>
nnoremap <F5> :UndotreeFocus<CR>
nnoremap <SPACE> <Nop>
let mapleader=" "
vnoremap <leader>y "+y
"vnoremap <leader>w :w
map <Leader> <Plug>(easymotion-prefix)


"Editor preferences
syntax on
set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set nu
set nowrap
set smartcase
set noswapfile
set nobackup
set hidden
set incsearch
set cursorline
set nospell
set spelllang=en
set spellfile=~/.vim/spell/en.utf-8.add
set undofile
set undodir=~/.vim/undo
set backspace=indent,eol,start
set showmatch
set matchtime=3
filetype plugin indent on
set colorcolumn=100
highlight ColorColumn ctermbg=0 guibg=lightgrey
colorscheme wombat256grf
let g:airline_theme='wombat'

"Plugin preferences
"   airline - please fix my filthy ass \/
let g:airline_symbols = {}
let g:airline_detect_spelllang = 0
let g:airline_exclude_preview = 0
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

"   ale
let g:ale_fix_on_save = 1
let g:ale_pattern_options = {
            \   '.*\.asm$': {'ale_enabled': 0},
\}
let g:ale_linters = {
            \ 'rust': ['analyzer', 'rustc'],
            \  'javascript': ['eslint'],
            \  'typescript': ['eslint'],
            \  'typescriptreact': ['eslint'],
            \  'yaml': ['yamllint'],
            \  'ruby': ['standardrb', 'rubocop'],
            \}
let g:ale_fixers = {
            \ '': ['remove_trailing_lines', 'trim_whitespace'],
            \ 'rust': ['rustfmt'],
            \  'javascript': ['prettier', 'eslint'],
            \  'typescript': ['prettier', 'eslint'],
            \  'typescriptreact': ['prettier', 'eslint'],
            \  'ruby': ['standardrb' ],
            \}

" coc
set updatetime=100

" undotree
let g:undotree_WindowLayout = 2
let g:undotree_DiffpanelHeight = 20

" spelunker
"let g:spelunker_target_min_char_len = 3
"let g:spelunker_check_type = 2

" rainbow parenths
let g:rainbow_active = 1
let g:rainbow_conf = {
            \ 'ctermfgs': ['magenta', 'lightblue', 'lightyellow', ],
            \ }

" incsearch - easymotion integration
function! s:incsearch_config(...) abort
  return incsearch#util#deepextend(deepcopy({
  \   'modules': [incsearch#config#easymotion#module({'overwin': 1})],
  \   'keymap': {
  \     "\<CR>": '<Over>(easymotion)'
  \   },
  \   'is_expr': 0
  \ }), get(a:, 1, {}))
endfunction

noremap <silent><expr> /  incsearch#go(<SID>incsearch_config())
noremap <silent><expr> ?  incsearch#go(<SID>incsearch_config({'command': '?'}))
noremap <silent><expr> g/ incsearch#go(<SID>incsearch_config({'is_stay': 1}))
