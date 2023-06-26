" *********************************
" VimPlug
" *********************************
call plug#begin('~/.config/nvim/bundle')

let mapleader = ','
" *************************
" General Enhancements
" *************************
" Copies text to system clipboard as well as buffer
set mouse=c

set clipboard+=unnamedplus
" Lets you use the mouse to click around
if has('mouse')
    set mouse+=a
endif

" GitHub Copilot
Plug 'github/copilot.vim'

" GitHub linking https://github.com/ruifm/gitlinker.nvim
"
" Usage: <leader>gy for normal and visual mode.
Plug 'nvim-lua/plenary.nvim'
Plug 'ruifm/gitlinker.nvim'

" Protobuf syntax highlighting https://github.com/wfxr/protobuf.vim
Plug '~/develop/protobuf.vim'

" Super fast minimap written in Rust https://github.com/wfxr/minimap.vim
" Plug 'wfxr/minimap.vim'
" let g:minimap_width = 10
" let g:minimap_auto_start = 1
" let g:minimap_auto_start_win_enter = 1

" Flutter dev
Plug 'dart-lang/dart-vim-plugin'

" Jump to ay definition and references https://github.com/pechorin/any-jump.vim
Plug 'pechorin/any-jump.vim'

Plug 'djoshea/vim-autoread'

" Fancy start screen. Lets you open empty buffers, multiple files, etc
Plug 'mhinz/vim-startify'

" editorconfig support https://github.com/sgur/vim-editorconfig
Plug 'sgur/vim-editorconfig'

" Automatically add 'end' to blocks https://github.com/tpope/vim-endwise
Plug 'tpope/vim-endwise'

" UNIX shell commands (:Rename, :Delete, :Move, :Mkdir) for Vim https://github.com/tpope/vim-eunuch
Plug 'tpope/vim-eunuch'

" Helpful Vim mappings https://github.com/tpope/vim-unimpaired
Plug 'tpope/vim-unimpaired'

" Code folding https://github.com/kevinhwang91/nvim-ufo
Plug 'kevinhwang91/promise-async'
Plug 'kevinhwang91/nvim-ufo'

set foldcolumn=1
set foldlevel=99
set foldlevelstart=-1
set foldenable
set foldmethod=indent

command! -nargs=1 CreateFile :e %:h/<args>

" Don't change to directory when selecting a file
let g:startify_files_number = 5
let g:startify_change_to_dir = 0
let g:startify_custom_header = [ ]
let g:startify_relative_path = 1
let g:startify_use_env = 1

" Custom startup list, only show MRU from current directory/project
let g:startify_lists = [
\  { 'type': 'dir',       'header': [ 'Files '. getcwd() ] },
\  { 'type': 'sessions',  'header': [ 'Sessions' ]       },
\  { 'type': 'bookmarks', 'header': [ 'Bookmarks' ]      },
\  { 'type': 'commands',  'header': [ 'Commands' ]       },
\ ]
" \  { 'type': function('helpers#startify#listcommits'), 'header': [ 'Recent Commits' ] },
"
let g:startify_commands = [
\   { 'uc': [ 'Clean Plugins', ':PlugClean' ] },
\   { 'up': [ 'Update Plugins', ':PlugUpdate' ] },
\   { 'ug': [ 'Upgrade Plugin Manager', ':PlugUpgrade' ] },
\ ]

let g:startify_bookmarks = [
  \ { 'c': '~/dotfiles/config/nvim/init.vim' },
  \ { 'g': '~/.gitconfig' },
  \ { 'z': '~/.zshrc' },
  \ { 'a': '~/.alias' },
  \ { 'd': '~/dotfiles' },
  \ { 'j': '~/.gthnk/journal.txt' }
\ ]
""\ { 'd': '~/dotfiles' },
""\ { 'h': '/Volumes/config' },

" :MarkdownPreview[Stop] https://github.com/iamcco/markdown-preview.nvim
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  } 

augroup Markdown
  autocmd!
  autocmd FileType markdown set wrap
augroup END

" set to 1, the vim will refresh markdown when save the buffer or
" leave from insert mode, default 0 is auto refresh markdown as you edit or
" move the cursor
" default: 0
let g:mkdp_refresh_slow = 1

" Helps with writing Markdown (auto-formatting) https://github.com/reedes/vim-pencil
"Plug 'reedes/vim-pencil'

" augroup pencil
"   autocmd!
"   autocmd FileType markdown call pencil#init({'wrap': 'hard', 'autoformat': 1})
"   autocmd FileType text     call pencil#init({'wrap': 'hard', 'autoformat': 0})
" augroup END
" Markdown-related stuff https://github.com/plasticboy/vim-markdown --- Not sure
" about the use here
"Plug 'godlygeek/tabular'
"Plug 'plasticboy/vim-markdown'

" Allow for the TOC window to auto-fit when it's possible for it to 
" shrink. It never increases its default size (half screen), it only shrinks.
" let g:vim_markdown_toc_autofit = 1

" Focused editing :Goyo https://github.com/junegunn/goyo.vim
Plug 'junegunn/goyo.vim'

" directory tree
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

" SKELETONS https://vimtricks.com/p/automated-file-templates/
autocmd BufNewFile *.sh 0r ~/dotfiles/skeletons/bash.sh

let NERDTreeDirArrowExpandable = "\u00a0" " make arrows invisible
let NERDTreeDirArrowCollapsible = "\u00a0" " make arrows invisible
let NERDTreeNodeDelimiter = "\u263a" " smiley face

augroup nerdtree
  autocmd!
  autocmd FileType nerdtree setlocal nolist " turn off whitespace characters
  autocmd FileType nerdtree setlocal nocursorline " turn off line highlighting for performance
augroup END

let g:NERDTreeGitStatusIndicatorMapCustom = {
  \ "Modified"  : "✹",
  \ "Staged"    : "✚",
  \ "Untracked" : "✭",
  \ "Renamed"   : "➜",
  \ "Unmerged"  : "═",
  \ "Deleted"   : "✖",
  \ "Dirty"     : "✗",
  \ "Clean"     : "✔︎",
  \ 'Ignored'   : '☒',
  \ "Unknown"   : "?"
  \ }

let NERDTreeShowHidden=1

nnoremap <leader>d :NERDTreeToggle<CR>
nnoremap <leader>g :GitGutterToggle<CR>

map <leader>r :NERDTreeFind<cr>


" " autocomplete stuff
" if has('nvim')
"   Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" else
"   Plug 'Shougo/deoplete.nvim'
"   Plug 'roxma/nvim-yarp'
"   Plug 'roxma/vim-hug-neovim-rpc'
" endif

" let g:deoplete#enable_at_startup = 1

" multi-line commenting https://github.com/preservim/nerdcommenter
"Plug 'preservim/nerdcommenter'

" Comments using gcc / gcgc
Plug 'git://github.com/tpope/vim-commentary.git'

" multiple-cursors
Plug 'terryma/vim-multiple-cursors'
" surround/place end tags
Plug 'tpope/vim-surround'
" fuzzy finder
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'

set rtp+=~/.fzf

" Using floating windows of Neovim to start fzf
if has('nvim')
  let $FZF_DEFAULT_OPTS .= ' --border --margin=0,2'

  function! FloatingFZF()
    let width = float2nr(&columns * 0.9)
    let height = float2nr(&lines * 0.6)
    let opts = { 'relative': 'editor',
               \ 'row': (&lines - height) / 2,
               \ 'col': (&columns - width) / 2,
               \ 'width': width,
               \ 'height': height }

    let win = nvim_open_win(nvim_create_buf(v:false, v:true), v:true, opts)
    call setwinvar(win, '&winhighlight', 'NormalFloat:Normal')
  endfunction

  let g:fzf_layout = { 'window': 'call FloatingFZF()' }
endif

" bottom status line
Plug 'itchyny/lightline.vim'
let g:lightline = {
  \ 'colorscheme': 'base16_black_metal_bathory',
  \ 'active': {
  \   'left': [ [ 'mode', 'paste' ],
  \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ],
  \   'right': [ [ 'linter_checking', 'linter_errors', 'linter_warnings', 'linter_ok' ] ]
  \ },
  \ 'component_function': {
  \   'gitbranch': 'FugitiveHead'
  \ }
  \ }
\

let g:lightline.component_expand = {
  \  'linter_checking': 'lightline#ale#checking',
  \  'linter_warnings': 'lightline#ale#warnings',
  \  'linter_errors': 'lightline#ale#errors',
  \  'linter_ok': 'lightline#ale#ok',
  \ }

let g:lightline.component_type = {
  \ 'linter_checking': 'left',
  \ 'linter_warnings': 'warning',
  \  'linter_errors': 'error',
  \  'linter_ok': 'left',
  \ }

" indentation 
Plug 'Yggdroot/indentLine'
" Colors hex values
Plug 'norcalli/nvim-colorizer.lua'
" Json highlighting
Plug 'elzr/vim-json' , { 'for': 'json' }
" Alignment
Plug 'austintaylor/vim-indentobject'
Plug 'junegunn/vim-easy-align'
" Start menu
Plug 'mhinz/vim-startify'
" snapWindows
Plug 'https://github.com/wesQ3/vim-windowswap'
" closes { and others automatically
Plug 'Raimondi/delimitMate'

" Prettier
" Plug 'prettier/vim-prettier', {
"	\ 'do': 'yarn install',
"	\ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html']}
" SAVE ON FORMAT
"autocmd BufWritePre * call LanguageClient#textDocument_formatting_sync()

" Git
Plug 'tpope/vim-git'
" Git wrapper https://github.com/tpope/vim-fugitive
Plug 'tpope/vim-fugitive'
" Shows a git diff in the 'gutter' https://github.com/airblade/vim-gitgutter 
Plug 'airblade/vim-gitgutter'
" Loads decorates and sorts git branches into an interactive buffer https://github.com/sodapopcan/vim-twiggy 
" Plug 'sodapopcan/vim-twiggy'

" *************************
" Language Server Related
" *************************
autocmd BufRead *.js set filetype=javascript
autocmd BufRead *.es6 set filetype=javascript
autocmd BufRead *.jsx set filetype=javascript 
autocmd BufRead *.tsx set filetype=typescript 
autocmd BufRead *.ts set filetype=typescript
autocmd BufRead,BufNewFile *.re set filetype=reason
autocmd BufRead,BufNewFile *.rei set filetype=reason
autocmd BufRead,BufNewFile *.fdoc set filetype=yaml
autocmd BufRead,BufNewFile *.md set filetype=markdown
autocmd BufRead,BufNewFile *.md set spell
autocmd BufRead,BufNewFile *.ml set filetype=ocaml
autocmd BufRead,BufNewFile *.mli set filetype=ocaml
autocmd BufRead,BufNewFile *.hoon set filetype=hoon
autocmd BufRead,BufNewFile *.java set filetype=java

" *************************
" LanguageClient
" *************************
Plug 'neoclide/coc.nvim' , {'branch': 'release'}

" Install/uninstall the following with :CocInstall/:CocUninstall
" coc-json
" coc-css
" coc-tailwindcss
" coc-yaml
" coc-flutter
" coc-protobuf
" coc-java
" View all extensions with :CocList extensions

" Async linting ALE
Plug 'dense-analysis/ale'

command! ALEToggleFixer execute "let g:ale_fix_on_save = get(g:, 'ale_fix_on_save', 0) ? 0 : 1"


set hidden

set cmdheight=2


" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
" nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Copy a buffer's relative file path into clipboard.
nmap <silent> cp :let @+ = expand("%")<CR>

" Use K to show documentation in preview window.
nnoremap <silent> <cr> :call <SID>show_documentation()<CR>

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
"xmap <leader>f  <Plug>(coc-format-selected)
"nmap <leader>f  <Plug>(coc-format-selected)
nnoremap <silent> gn :ALENext<CR>

" Hoon syntax highlighting and keybindings -- https://github.com/urbit/hoon.vim
Plug 'urbit/hoon.vim'

let g:ale_ocaml_ocamlformat_options = "--enable-outside-detected-project"

let g:ale_completion_enabled = 0
let g:ale_fix_on_save = 1
let g:ale_linters = {
  \ 'javascript': ['eslint'],
  \ 'typescript': ['tsserver'],
  \ 'reason': ['ocaml-lsp'],
  \ 'ocaml': ['ocaml-lsp'],
  \ 'python': ['flake8'],
  \}
let g:ale_linters_ignore = {
  \ 'typescript': ['tslint'],
  \}
let g:ale_fixers = {
  \ 'html': ['prettier'],
  \ 'javascript': ['prettier'],
  \ 'ocaml': ['ocamlformat'],
  \ 'json': ['prettier'],
  \ 'markdown': ['prettier'],
  \ 'typescript': ['prettier', 'eslint'],
  \ 'css': ['prettier'],
  \ 'cpp': ['astyle'],
  \ 'c': ['astyle'],
  \ 'python': ['autopep8'],
  \}

" \ 'ruby': ['rubocop', "'standardrb']
" OCaml/Reason specific stuff

let g:ale_set_balloons = 1

" be explicit about whats running
let g:ale_linters_explicit = 1

" keep side gutter open https://github.com/dense-analysis/ale#5ii-how-can-i-keep-the-sign-gutter-open
let g:ale_sign_column_always = 1

" enable fix/lint on save (prettier,refmt) https://www.rockyourcode.com/reason-ml-development-with-vim/
let g:ale_sign_error                  = '✘'
let g:ale_sign_warning                = '⚠'
highlight ALEErrorSign ctermbg        =NONE ctermfg=red
highlight ALEWarningSign ctermbg      =NONE ctermfg=yellow
let g:ale_lint_on_save                = 1

"Move between linting errors
nmap ]r <plug>(ale_next_wrap)
nmap [r <plug>(ale_previous_wrap)

highlight ALEWarning ctermbg=DarkMagenta

" ***************************
" Themes
" ***************************
Plug 'chriskempson/base16-vim'
Plug 'mike-hearn/base16-vim-lightline'

" **************************
" Language-Related
" **************************

" ReasonML https://github.com/reasonml-editor/vim-reason-plus
Plug 'reasonml-editor/vim-reason-plus'

" Typescript
" https://github.com/leafgarland/typescript-vim
Plug 'leafgarland/typescript-vim', { 'for': ['typescript'] }
Plug 'HerringtonDarkholme/yats.vim'
Plug 'Quramy/tsuquyomi', { 'do': 'npm -g install typescript' }
  
" neovim or not vim8
Plug 'Shougo/vimproc.vim', { 'do': 'make' }
" Plug 'ianks/vim-tsx'

let g:typescript_indent_disable = 1

" Javascript
Plug 'https://github.com/othree/javascript-libraries-syntax.vim', { 'for': [ 'javascript', 'js', 'jsx' ]}
Plug 'thinca/vim-textobj-function-javascript',    { 'for': [ 'javascript', 'js', 'jsx' ]}
Plug '1995eaton/vim-better-javascript-completion', { 'for': [ 'javascript', 'js', 'jsx' ]}
Plug 'chemzqm/vim-jsx-improve', { 'for': [ 'javascript', 'js', 'jsx' ]}
Plug 'gavocanov/vim-js-indent', { 'for': [ 'javascript', 'js', 'jsx' ]}


" graphql
Plug 'jparise/vim-graphql'

" devicons https://github.com/ryanoasis/vim-devicons
" always load as last one!
" Plug 'ryanoasis/vim-devicons'
call plug#end()

lua require('ufo').setup()
lua require('gitlinker-config')

" https://github.com/nicknisi/dotfiles/blob/master/config/nvim/init.vim
" Colorscheme and final setup {{{
    " This call must happen after the plug#end() call to ensure
    " that the colorschemes have been loaded
    if filereadable(expand("~/.vimrc_background"))
        let base16colorspace=256
        source ~/.vimrc_background
    else
        let g:onedark_termcolors=256
        let g:onedark_terminal_italics=1
        colorscheme base16-horizon-dark
    endif
    " make the highlighting of tabs and other non-text less annoying
    highlight SpecialKey ctermfg=19 guifg=#333333
    highlight NonText ctermfg=19 guifg=#333333

    " make comments and HTML attributes italic
    highlight Comment cterm=italic term=italic gui=italic
    highlight htmlArg cterm=italic term=italic gui=italic
    highlight xmlAttrib cterm=italic term=italic gui=italic
    " highlight Type cterm=italic term=italic gui=italic
    highlight Normal ctermbg=none
" }}}
"
" automatically rebalance windows on vim resize
autocmd VimResized * :wincmd =

" basics
set number
set relativenumber
set nohlsearch

filetype plugin indent on
syntax on 
syntax enable

set conceallevel=1 "show quotes on json files

"set autoindent
set autoread " reload files when changed on disk, i.e. via `git checkout`
set textwidth=80

set backspace=indent,eol,start " make backspace behave in a sane manner
set clipboard=unnamed

set directory-=.    " don't store swapfiles in the current directory
set expandtab       " expand tabs to spaces
set encoding=utf-8

set ignorecase  " case-insensitive search
set smartcase   " case-sensitive search if any caps
set hlsearch    " highlight search results
set incsearch   " search as you type
set nolazyredraw "don't redraw while executing macros

set magic " magic for regex"

" error bells
set noerrorbells
set visualbell
set t_vb=
set tm=500

set laststatus=2                                             " always show statusline
set list                                                     " show trailing whitespace
set listchars=space:·,tab:▸\ ,trail:▫,extends:>,precedes:<,nbsp:+,eol:¬
set number                                                   " show line numbers
set ruler                                                    " show where you are
set scrolloff=3                                              " show context above/below cursorline
set shiftwidth=2                                             " normal mode indentation commands use 2 spaces
set showcmd
set softtabstop=2                                            " insert mode tab and backspace use 2 spaces
set smarttab " tab respects 'tabstop', 'shiftwidth', and 'softtabstop'
set tabstop=4                                                " actual tabs occupy 8 characters
set lazyredraw
set synmaxcol=200
set updatetime=250
set nowb
set nobackup
set noswapfile
set nowrap
set linebreak
"set undofile " Enable persistent undo so that history persists across vim sessions
"set undodir = ~/./undo

" automatically rebalance windows on vim resize
autocmd VimResized * :wincmd =
"
"" enable 24 bit color support if supported
if (has("termguicolors"))
 set termguicolors
endif

if &term =~ '256color'
  " disable background color erase
  set t_ut=
endif

" Override vim's italic codes
" https://www.reddit.com/r/vim/comments/24g8r8/italics_in_terminal_vim_and_tmux/
set t_ZH=^[[3m
set t_ZR=^[[23m

set t_Co=256 " Explicitly tell vim that the terminal supports 256 colors
set guifont=Iosevka:h16

noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
"nnoremap <leader>a :Ag<space>

nmap <silent> <leader>b :Buffers<cr>

" fuzzy finder
if isdirectory(".git")
    " if in a git project, use :GFiles
    nmap <silent> <leader>t :GitFiles --cached --others --exclude-standard<cr>
else
    " otherwise, use :FZF
    nmap <silent> <leader>t :FZF<cr>
  endif

" disable preview buffer for Reason autocomplete
" set completeopt-=preview

"Use ripgrep
let g:ackprg = 'rg --vimgrep --no-heading'
let g:grepprg='rg --vimgrep'

let g:rg_find_command = 'rg --files --follow  -g "!{.config,etc,node_modules,.git,target,.reast,.d,.cm}/*"'
" command! -bang -nargs=* Find call fzf#vim#grep(
"  \ 'rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --glob "!.git/*" --color always '
"  \ .shellescape(<q-args>), 1, <bang>0)
command! -bang -nargs=* Rg call fzf#vim#files('.', {'source': g:rg_find_command}, 0)

command! -bang -nargs=* Find call fzf#vim#grep(
  \ 'rg --column --line-number --no-heading --follow --ignore-case --color=always '.<q-args>, 1,
  \ <bang>0 ? fzf#vim#with_preview('up:60%') : fzf#vim#with_preview('right:50%:hidden', '?'), <bang>0)

" Always enable preview window on the right with 60% width
let g:fzf_files_options = '--preview "bat --theme="OneHalfDark" --style=numbers,changes --color always {3..-1} | head -200" --expect=ctrl-v,ctrl-x'

 " command! -bang -nargs=? -complete=dir Files
 "   \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)

 " command! -bang -nargs=? -complete=dir GitFiles
 "   \ call fzf#vim#gitfiles(<q-args>, fzf#vim#with_preview(), <bang>0)

command! LS call fzf#run(fzf#wrap({'source': 'ls'}))
let g:airline_theme='one'
" Terminal mode remaps
tnoremap <Esc> <C-\><C-n>

" start autoComplete at startup
let g:python3_host_prog = "/usr/local/bin/python3"
" start nerdtree on startup
" autocmd vimenter * NERDTree
" close vim sesh if nerdtree is last window open
" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

set viminfo='100,n$HOME/.vim/files/info/viminfo
