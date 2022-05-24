"Shortcuts
"Easy Motion <leader><leader>w (word) e(end) etc
"ysiw" surround word with "
"cs'" change single quotes for double (works for brackets etc)

"change tabs to space
":set et|retab
"change spaces to tab
":set noet|retab

"---Config
set nocompatible            " get rid of Vi compatibility mode. SET 1st
let mapleader=","           " set leader to comma
set autoread                " reread file if changed outside
set modelines=0             " prevent modeline security exploits
set number                  " show line numbers
""set relativenumber
set laststatus=2            " last window always has a statusline
set showmatch               " shows match parenthesis/bracket
set wildmenu                " visual autocomplete for command menu
set pastetoggle=<F10>
filetype indent on          " activates indenting for files
filetype plugin indent on   " filetype detection[ON] plugin[ON] indent[ON]
syntax enable               " enable syntax highlighting (previously syntax on).
set splitright
"" Spellcheck markdown files
"autocmd BufRead,BufNewFile *.md setlocal spell spelllang=en_gb
""set spell spelllang=en_gb
nnoremap <leader>f 1z=      " spell check fix word
"" Autoset *.toml files to type 'conf' - useful for correct leader-C
autocmd BufNewFile,BufRead *.toml set filetype=conf
"" Return to last edit position when opening files (You want this!)
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
"" When returning to focus, go back to Normal mode
autocmd FocusLost * call feedkeys("\<esc>")
""The following disable keys to force correct keys usage
noremap <F1> :vertical bo help <cr>:vertical resize 90 <cr>
noremap <F2> :vertical bo terminal<cr>
noremap <F3> :vsplit ~/.dotfiles/vimrc<cr>:vertical resize 90 <cr>
noremap <F4> <esc>:w <cr>:source $MYVIMRC<cr>
noremap <F5> :bnext<cr>
noremap <F6> :bprevious<cr>
noremap <F7> gg=G<C-o><C-o>
"---Other
map <leader>ss :setlocal spell!<cr>
nnoremap <F11> :set list!<cr>
nnoremap <esc><esc> :noh<Return>
"remove highlight and clear search field
"noremap <esc><esc> :ssReturn> :let @/=""<Return>
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
nnoremap <expr> k v:count == 0 ? 'gk' : 'k'
nnoremap <expr> j v:count == 0 ? 'gj' : 'j'
"The following ensures that in Insert Mode, Esc or kj does not go back one char 
"inoremap <silent> <Esc> <Esc>`^
""Quick change from Insert
inoremap kj <Esc>l
inoremap jj <nop>
"---"Abbreviations
iabbrev adn and
iabbrev teh the

"---"Text Change and Movement
"Toggle Uppercase/Lowercase
inoremap <c-u> <Esc>gUiw`]a
"Move line Up/Down
nnoremap = kddpk
nnoremap - ddp

"---"Folds
nnoremap <space> za
"Term sends Ctrl-Space as Null represented by C-@ in vim
noremap <C-@> zM
set foldenable             "Allow nested folding
set foldlevelstart=1        "Most folds open (up to 99 for all)
set foldnestmax=10 
set foldmethod=indent
set foldcolumn=1

""allow indent plus manual fold method
"augroup vimrc
    "au BufReadPre * setlocal foldmethod=indent
    "au BufWinEnter * if &fdm == 'indent' | setlocal foldmethod=manual | endif
"augroup ENDI

    "---"Search
    set hlsearch
    set incsearch               " But do highlight as you type your search.
    set ignorecase              " Make searches case-insensitive.

    "---"Movement
    "" Split screen easier navigation. Instead of Ctrl-W direction
    noremap <C-h> <C-w>h
    noremap <C-j> <C-w>j
    noremap <C-k> <C-w>k
    noremap <C-l> <C-w>l

    "---Tabstops and Wrapping
    set wrap                  " don't wrap text
    set autoindent              " auto-indt
    set tabstop=4               " tab spacing
    set softtabstop=4           " unify
    set shiftwidth=4            " indent/outdent by 4 columns
    set shiftround              " always indent/outdent to the nearest tabstop
    set expandtab               " use spaces instead of tabs
    set smarttab                " use tabs at the start of a line, spaces elsewhere
    set listchars=tab:>~,nbsp:_,trail:.

    "---Buffers
    map <leader>ba :bufdo bd<cr>
    map <leader>l :bnext<cr>
    map <leader>h :bprevious<cr>

    "---Tabs
    " Go to tab by number
    noremap <leader>1 1gt
    noremap <leader>2 2gt
    noremap <leader>3 3gt
    noremap <leader>4 4gt
    noremap <leader>5 5gt
    noremap <leader>6 6gt
    noremap <leader>7 7gt
    noremap <leader>8 8gt
    noremap <leader>9 9gt
    noremap <leader>0 :tablast<cr>
    noremap <leader>tn :tabnew<cr>
    noremap <leader>to :tabonly<cr>
    noremap <leader>tc :tabclose<cr>
    noremap <leader>tm :tabmove 
    noremap <leader>t<leader> :tabnext 

    nnoremap <C-Left> :tabprevious<CR>
    nnoremap <C-Right> :tabnext<CR>
    nnoremap <silent> <A-Left> :execute 'silent! tabmove ' . (tabpagenr()-2)<CR>
    nnoremap <silent> <A-Right> :execute 'silent! tabmove ' . (tabpagenr()+1)<CR

    "---"NERDTree
    nnoremap <F12> :NERDTreeToggle %<Return>
    let g:NERDTreeWinPos = "left"

    "---Ale
    let g:ale_enabled = 0
    let g:airline#extensions#ale#enabled = 1
    let g:ale_open_list = 1
    let g:ale_lint_on_text_changed = 1
    let g:ale_set_signs = 1
    let g:ale_scss_sasslint_use_global = 1
    let g:ale_scss_stylelint_use_global = 1

    "---Syntastic

    "let g:airline#extensions#syntastic#enabled = 1
    "let g:syntastic_html_checkers = ['eslint','validator', 'w3']
    "set statusline+=%#warningmsg#
    "set statusline+=%{SyntasticStatuslineFlag()}
    "set statusline+=%*

    "let g:syntastic_always_populate_loc_list = 1
    "let g:syntastic_auto_loc_list = 1
    "let g:syntastic_check_on_open = 1
    "let g:syntastic_check_on_wq = 0

    "---"MultiCursors
    "set cursorline              " highlight current line - LAGGY
    let g:multi_cursor_use_default_mapping=0
    let g:multi_cursor_start_word_key      = '<C-n>'
    let g:multi_cursor_select_all_word_key = '<A-n>'
    let g:multi_cursor_start_key           = 'g<C-n>'
    let g:multi_cursor_select_all_key      = 'g<A-n>'
    let g:multi_cursor_next_key            = '<C-n>'
    let g:multi_cursor_prev_key            = '<C-p>'
    let g:multi_cursor_skip_key            = '<C-x>'
    let g:multi_cursor_quit_key            = '<Esc>'

    "---"Snippets

    " Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
    let g:UltiSnipsExpandTrigger="<tab>"
    let g:UltiSnipsJumpForwardTrigger="<c-b>"
    let g:UltiSnipsJumpBackwardTrigger="<c-z>"

    " If you want :UltiSnipsEdit to split your window.
    let g:UltiSnipsEditSplit="vertical"

    "---"Colors
    set t_Co=256                " enable 256-color mode.*/
    if (has("termguicolors"))
        set termguicolors
    endif
    set background=dark          "used by come colorscheme (eg peaksea.vim)
    ""colorscheme papercolor
    colorscheme dracula
    hi Normal guibg=NONE ctermbg=NONE       "set background to transparent

