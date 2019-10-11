
call plug#begin()

  "Plugin  
Plug 'tpope/vim-surround'
Plug 'moll/vim-bbye'
Plug 'bling/vim-airline'
Plug 'neoclide/jsonc.vim'
Plug 'neoclide/coc.nvim', {'tag': '*', 'branch': 'release'}
Plug 'xolox/vim-lua-ftplugin'
Plug 'majutsushi/tagbar'
Plug 'tbastos/vim-lua'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'SirVer/ultisnips'
Plug 'xolox/vim-misc'
Plug 'easymotion/vim-easymotion'
Plug 'dunstontc/projectile.nvim'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'terryma/vim-smooth-scroll'
Plug 'lervag/vimtex'
Plug 'neomake/neomake'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'dylanaraps/wal.vim'
"Plug 'conornewton/vim-latex-preview'
Plug 'gentoo/gentoo-syntax'
"Plug 'lambdalisue/vim-pyenv'
Plug 'airblade/vim-gitgutter'

call plug#end()



"set Things up 
    set showmatch           " Show matching brackets.
    set relativenumber		"set relative number.
	set number              " Show the line numbers on the left side.
    set formatoptions+=o    " Continue comment marker in new lines.
 "   set expandtab           " Insert spaces when TAB is pressed.
    set tabstop=4           " Render TABs using this many spaces.
    set shiftwidth=4        " Indentation amount for < and > commands.
    set nojoinspaces        " Prevents inserting two spaces after punctuation on a join (J)

" More natural splits
    set splitbelow          " Horizontal split below current.
    set splitright          " Vertical split to right of current.
    set nostartofline       " Do not jump to first character 
    set wildmenu                                                                " Show list instead of just completing
 	syntax enable
    filetype plugin indent on
	filetype plugin on
	set autoindent
    set nolazyredraw
	set nocursorline
	set synmaxcol=512
	set wildmode=full
	set autochdir

nnoremap <SPACE> <Nop>

"Map Leader key to ,
let mapleader= " "

"learning TABS WOOH
noremap <leader>& <space>
"set coc in statusline
set statusline^=%{coc#status()}
map <Leader> <Plug>(easymotion-prefix)

""theme 
"set termguicolors
set guioptions+=c
set guioptions-=t
set guioptions-=m
set guicursor=n-v-c-sm:block,i-ci-ve:ver25,r-cr-o:hor20
hi normal ctermbg=none guibg=none
colorscheme wal


"open 10 line terminal below
nnoremap <leader>o :below 10sp term://$SHELL<cr>i

"forcing fuc*ing hjkl
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

"Paste on line below the cursor
map ,p :pu<CR>
nmap ss :split<CR>
nmap sv :vsplit<CR>

" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1

" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'

"buffers management 
" To open a new empty buffer
" This replaces :tabnew which I used to bind to this mapping
nmap <leader>T :enew<cr>

" Move to the next buffer
nmap <leader>ll :bnext<CR>

" Move to the previous buffer
nmap <leader>hh :bprevious<CR>

" Close the current buffer and move to the previous one
" This replicates the idea of closing a tab
nmap <leader>bq :bp <BAR> bd #<CR>

"save and q
nnoremap <Leader>bk :Bdelete<CR>
nnoremap <Leader>s :w<CR>
nnoremap <Leader>d :q!<CR>


"ESC
imap ii <Esc>


" Switch split buffer easy
nnoremap <A-j> <C-W><C-J>
nnoremap <A-k> <C-W><C-K>
nnoremap <A-l> <C-W><C-L>
nnoremap <A-h> <C-W><C-H>

"Use Ctrl-Tab and Alt-Tab to switch tab
map    <C-Tab>  :tabnext<CR>
imap   <C-Tab>  <C-O>:tabnext<CR>
map    <M-Tab>  :tabprev<CR>
imap   <M-Tab>  <C-O>:tabprev<CR>

"lua syntax improvement
let g:lua_syntax_someoption = 1

"move line and blocks of line up and down coool"
nnoremap <C-j> :m .+1<CR>==
nnoremap <C-k> :m .-2<CR>==
inoremap <C-j> <Esc>:m .+1<CR>==gi
inoremap <C-k> <Esc>:m .-2<CR>==gi
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv

"take out the highlight from /search
nnoremap <esc> :noh<return><esc>


"easy motion 
" <Leader>f{char} to move to {char}
map  <Leader>f <Plug>(easymotion-bd-f)
nmap <Leader>f <Plug>(easymotion-overwin-f)

" s{char}{char} to move to {char}{char}
nmap s <Plug>(easymotion-overwin-f2)

" Move to line
map <Leader>L <Plug>(easymotion-bd-jk)
nmap <Leader>L <Plug>(easymotion-overwin-line)

" Move to word
map  <Leader>w <Plug>(easymotion-bd-w)
nmap <Leader>w <Plug>(easymotion-overwin-w)

"Goyo and Limelight for writing
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!

"Confy Scrolling hurray
noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 2, 2)<CR>
noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 2, 2)<CR>
noremap <silent> <c-b> :call smooth_scroll#up(&scroll+1, 0, 2)<CR>
noremap <silent> <c-f> :call smooth_scroll#down(&scroll+1, 0, 2)<CR>
"preview Tex PDF
let g:polyglot_disabled = ['latex']
let g:tex_flavor = 'latex'
"let g:vimtex_view_general_viewer = 'xpdf'
let g:vimtex_latexmk_continuous = 1
let g:vimtex_compiler_progname = 'nvr'

"coc
" if hidden is not set, TextEdit might fail.
set hidden

" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Better display for messages
set cmdheight=2

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.

"Coc configlet 
let g:coc_snippet_next = '<TAB>'
let g:coc_snippet_prev = '<S-TAB>'
let g:coc_status_error_sign = '•'
let g:coc_status_warning_sign = '•'
let g:coc_global_extensions =['coc-html','coc-css','coc-snippets','coc-prettier','coc-eslint','coc-emmet','coc-tsserver','coc-pairs','coc-json','coc-imselect','coc-highlight','coc-git','coc-emoji','coc-lists','coc-stylelint','coc-yaml','coc-template','coc-tabnine','coc-marketplace','coc-gitignore','coc-yank']

augroup MyAutoCmd
  autocmd!
  " Setup formatexpr specified jiletype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

"Use tab for trigger completion with characters ahead and navigate
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
"inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction


" Coc Keymap
 " Using CocList
        " Show all diagnostics
 nnoremap <silent> <leader>cd  :<C-u>CocList diagnostics<cr>
 " Manage extensions
 nnoremap <silent> <leader>ce  :<C-u>CocList extensions<cr>
 " Show commands
 nnoremap <silent> <leader>cc  :<C-u>CocList commands<cr>
 " Find symbol of current document
 nnoremap <silent> <leader>co  :<C-u>CocList outline<cr>
 " Search workspace symbols
 nnoremap <silent> <leader>cs  :<C-u>CocList -I symbols<cr>
 " Do default action for next item.
 nnoremap <silent> <leader>cj  :<C-u>CocNext<CR>
 " Do default action for previous item.
 nnoremap <silent> <leader>ck  :<C-u>CocPrev<CR>
 " Resume latest coc list
 nnoremap <silent> <leader>cr  :<C-u>CocListResume<CR>
 " Use `[c` and `]c` for navigate diagnostics
 nmap <silent> ]c <Plug>(coc-diagnostic-prev)
 nmap <silent> [c <Plug>(coc-diagnostic-next)
 " Remap for rename current word
 nmap <leader>cn <Plug>(coc-rename)
 " Remap for format selected region
 vmap <leader>cf  <Plug>(coc-format-selected)
 nmap <leader>cf  <Plug>(coc-format-selected)
 " Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
 xmap <leader>ca  <Plug>(coc-codeaction-selected)
 nmap <leader>ca  <Plug>(coc-codeaction-selected)
 " Remap for do codeAction of current line
 nmap <leader>ac  <Plug>(coc-codeaction)
 " Fix autofix problem of current line
 nmap <leader>qf  <Plug>(coc-fix-current)
 " Remap keys for gotos
 nmap <silent> gd <Plug>(coc-definition)
 nmap <silent> gy <Plug>(coc-type-definition)
 nmap <silent> gi <Plug>(coc-implementation)
 nmap <silent> gr <Plug>(coc-references)
 " Use K for show documentation in preview window
 nnoremap <silent> K :call <sid>show_documentation()<cr>
 " use <c-space> for trigger completion.
 inoremap <silent><expr> <c-space> coc#refresh()
 nmap [g <Plug>(coc-git-prevchunk)
 nmap ]g <Plug>(coc-git-nextchunk)
 " show chunk diff at current position
 nmap gs <Plug>(coc-git-chunkinfo)
 " show commit contains current position
 nmap gm <Plug>(coc-git-commit)
 nnoremap <silent> <leader>cg  :<C-u>CocList --normal gstatus<CR>
 " float window scroll
 nnoremap <expr><C-f> coc#util#has_float() ? coc#util#float_scroll(1) : "\<C-f>"
 nnoremap <expr><C-b> coc#util#has_float() ? coc#util#float_scroll(0) : "\<C-b>"
 " multiple cursors session
 nmap <silent> <C-c> <Plug>(coc-cursors-position)
 nmap <silent> <C-m> <Plug>(coc-cursors-word)
 xmap <silent> <C-m> <Plug>(coc-cursors-range)
 nnoremap <silent> <leader>cm ::CocSearch -w 
 " use normal command like `<leader>xi(`
 nmap <leader>x  <Plug>(coc-cursors-operator)

 function! s:show_documentation()
     if (index(['vim','help'], &filetype) >= 0)
         execute 'h '.expand('<cword>')
     else
         call CocAction('doHover')
     endif
 endfunction


"fzf 
"autocmd! FileType fzf
"autocmd  FileType fzf set laststatus=0 noshowmode noruler
  "\| autocmd BufLeave <buffer> set laststatus=0 showmode ruler
  "

let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

" Customize fzf colors to match your color scheme
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', '#5f5f87'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

"FZF keybind
nnoremap <silent> <leader>fb :Buffers<CR>
nnoremap <silent> <leader>fc :Colors<CR>
nnoremap <silent> <leader>ff :Files<CR>
nnoremap <silent> <leader>fr :Rg<CR>
nnoremap <silent> <leader>fw :Rg <C-R><C-W>CR><>

nnoremap <silent> <leader>f :FZF ~ <CR>




"test python-mode
"let g:pymode_python = 'python3'
nnoremap <buffer> <F9> :exec '!python' shellescape(@%, 1)<cr>
"pyenv
