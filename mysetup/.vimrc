if !has('nvim')
    source $VIMRUNTIME/vimrc_example.vim
    set ttymouse=xterm2
endif

set nocp
set encoding=utf-8

call plug#begin('~/.vim/plugged')

" gutentags
Plug 'ludovicchabant/vim-gutentags', v:version >= 800 ? {} : { 'on' : [] }
Plug 'skywind3000/gutentags_plus', v:version >= 800 ? {} : { 'on' : [] }

" LeaderF
if v:version >= 800
    Plug 'Yggdroot/LeaderF'
    let g:Lf_ShortcutF = '<C-P>'
    let g:Lf_StlSeparator = { 'left': '', 'right': '', 'font': '' }
    let g:Lf_RootMarkers = ['.project', '.root', '.svn', '.git']
    let g:Lf_WorkingDirectoryMode = 'Ac'
    let g:Lf_WindowHeight = 0.30
    let g:Lf_CacheDirectory = expand('~/.vim/cache')
    let g:Lf_ShowRelativePath = 0
    let g:Lf_HideHelp = 1
    let g:Lf_StlColorscheme = 'powerline'
    let g:Lf_PreviewResult = {'Function':0, 'BufTag':0}
    " search functions in the current file
    noremap <F9> :LeaderfFunction!<CR>
    " search MRU
    noremap <F10> :LeaderfMru<CR>
endif

" fugitive
Plug 'tpope/vim-fugitive'

" python-mode
Plug 'python-mode/python-mode', { 'branch': 'develop' }

" cpp syntax enhanced
Plug 'octol/vim-cpp-enhanced-highlight'

" netrw enhancement
Plug '~/.vim/pack/tpope/start/vim-vinegar'

" airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" All of your Plugins must be added before the following line
call plug#end()            " required

" better highlight for Folded and FoldColumn
highlight Folded term=standout ctermfg=0 ctermbg=3 
highlight FoldColumn term=standout ctermfg=0 ctermbg=7

" powerline
"set rtp+=/home/zzhan68/miniconda2/lib/python2.7/site-packages/powerline/bindings/vim/
"set laststatus=2
"set t_Co=256

" markdown syntax
autocmd BufNewFile,BufRead *.md  set filetype=markdown

set scrolloff=0
set bs=2		" allow backspacing over everything in insert mode
set ai			" always set autoindenting on
set si
set cin
set nobackup		" not to keep a backup file
set noundofile
set viminfo='20,\"50	" read/write a .viminfo file, don't store more
			" than 50 lines of registers
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the timea
"set lines=50 columns=150
set ts=8
set sw=4
set sts=4
set tw=80
set colorcolumn=85
hi ColorColumn term=reverse ctermbg=23 guibg=LightRed
"set listchars=tab:>."
"set list"
set et
set nu
set cul
"set paste
set incsearch
set hlsearch
set splitright
set tags=./.tags;,.tags

" colorscheme molokai
set guifont=Courier:h12:cANSI

if &diff
    colorscheme mydiffscheme
endif

" no cul in quickfix
autocmd BufReadPost quickfix set nocul

" tab navigation like firefox 
:nmap <leader>H :tabprevious<cr>
:nmap <leader>L :tabnext<cr>
:map <leader>H :tabprevious<cr>
:map <leader>L :tabnext<cr>
:imap <leader>H <ESC>:tabprevious<cr>i
:imap <leader>L <ESC>:tabnext<cr>i

" buffer navigation 
nmap <C-j> :bp!<CR>
nmap <C-k> :bn!<CR>

" Project plugin settings
:let g:proj_flags="imstvcg"

" Netrw
:let g:netrw_altv=1

" cscope or gutentags-cscope
if executable('gtags-cscope') && executable('gtags')
        set csprg=/usr/local/bin/gtags-cscope
        set statusline+=%{gutentags#statusline()}
        let g:gutentags_project_root = ['.root', '.svn', '.git', '.hg', '.project']
        let g:gutentags_ctags_tagfile = '.tags'
        let g:gutentags_modules = ['ctags', 'gtags_cscope']
        let g:gutentags_cache_dir = expand('~/.cache/tags')
        let g:gutentags_plus_switch = 1
        let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
        let g:gutentags_ctags_extra_args += ['--c++-kinds=+px']
        let g:gutentags_ctags_extra_args += ['--c-kinds=+px']
        let g:gutentags_ctags_extra_args += ['--output-format=e-ctags']
        let g:gutentags_auto_add_gtags_cscope = 0
else
        set csprg=/usr/bin/cscope
        set csto=0
        set cst
	noremap <silent> <leader>cs :cs find s <C-R><C-W><cr>
	noremap <silent> <leader>cg :cs find g <C-R><C-W><cr>
	noremap <silent> <leader>cc :cs find c <C-R><C-W><cr>
	noremap <silent> <leader>ct :cs find t <C-R><C-W><cr>
	noremap <silent> <leader>ce :cs find e <C-R><C-W><cr>
	noremap <silent> <leader>cf :cs find f <C-R>=expand("<cfile>")<cr><cr>
	noremap <silent> <leader>ci :cs find i <C-R>=expand("<cfile>")<cr><cr>
	noremap <silent> <leader>cd :cs find d <C-R><C-W><cr>
	noremap <silent> <leader>ca :cs find a <C-R><C-W><cr>
	noremap <silent> <leader>ck :cs kill<cr>
endif

" airline
set t_Co=256
set laststatus=2
let g:airline_powerline_fonts=1
let g:airline_skip_empty_sections=1
let g:airline_theme='light'

" pymode
let g:pymode = 1
let g:pymode_trim_whitespaces = 1
let g:pymode_options = 1
let g:pymode_indent = 1
let g:pymode_motion = 1
let g:pymode_doc = 1
let g:pymode_doc_bind = 'K'
let g:pymode_rope = 1
let g:pymode_rope_completion = 1
let g:pymode_rope_complete_on_dot = 0

" fugitive
autocmd BufReadPost fugitive://* set bufhidden=delete
set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P

" Fix highlight search
hi Search term=reverse cterm=reverse ctermbg=none
hi Visual term=reverse ctermbg=23
