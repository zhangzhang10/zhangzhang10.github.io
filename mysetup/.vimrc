if !has('nvim')
    source $VIMRUNTIME/vimrc_example.vim
    set ttymouse=xterm2
endif

set nocp

filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" molokai color scheme
" Plugin 'molokai'

" tagbar 
"Plugin 'taglist.vim'
Plugin 'majutsushi/tagbar'

" rtags
"Plugin 'lyuts/vim-rtags'

" python-mode
Plugin 'python-mode/python-mode'

" ctrlp
Plugin 'ctrlpvim/ctrlp.vim'

" cpp syntax enhanced
Plugin 'octol/vim-cpp-enhanced-highlight'

" netrw enhancement
Plugin 'tpope/vim-vinegar.git'

" airline
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" Syntastic (syntax checkers)
" Plugin 'vim-syntastic/syntastic'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" better highlight for Folded and FoldColumn
highlight Folded term=standout ctermfg=0 ctermbg=3 
highlight FoldColumn term=standout ctermfg=0 ctermbg=7 

" powerline
"set rtp+=/home/zzhan68/miniconda2/lib/python2.7/site-packages/powerline/bindings/vim/
"set laststatus=2
"set t_Co=256

" markdown syntax
autocmd BufNewFile,BufRead *.md  set filetype=markdown

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
hi ColorColumn term=reverse ctermbg=8 guibg=LightRed
"set listchars=tab:>."
"set list"
set et
set nu
set cul
"set paste
set incsearch
set hlsearch
set splitright

" colorscheme molokai
set guifont=Courier:h12:cANSI

if &diff
    colorscheme mydiffscheme
endif

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

" taglist.vim
filetype on
nnoremap <silent> <F9> :TagbarToggle<CR>
let g:tagbar_autofocus=1
"nnoremap <silent> <F9> :TlistToggle<CR>
"let Tlist_GainFocus_On_ToggleOpen=1
"let Tlist_Exit_OnlyWindow=1
"let Tlist_Show_One_File=1
"let Tlist_File_Fold_Auto_Close=1
"let Tlist_Process_File_Always=1
"let tlist_cpp_settings = 'c++;n:namespace;v:variable;d:macro;t:typedef;' .
"                             \ 'c:class;g:enum;s:struct;u:union;f:function;p:prototype'

" cscope
if has("cscope")
        set csprg=/usr/bin/cscope
        set cscopequickfix=s-,c-,d-,i-,t-,e-
        set csto=0
        set cst
        set nocsverb
        " add any database in current directory
        if filereadable("cscope.out")
            cs add cscope.out
        " else add database pointed to by environment
        elseif $CSCOPE_DB != ""
            cs add $CSCOPE_DB
        endif
        set csverb
endif

nmap <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR>	
nmap <C-\>g :cs find g <C-R>=expand("<cword>")<CR><CR>	
nmap <C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR>	
nmap <C-\>t :cs find t <C-R>=expand("<cword>")<CR><CR>	
nmap <C-\>e :cs find e <C-R>=expand("<cword>")<CR><CR>	
nmap <C-\>f :cs find f <C-R>=expand("<cfile>")<CR><CR>	
nmap <C-\>i :cs find i <C-R>=expand("<cfile>")<CR><CR>
nmap <C-\>d :cs find d <C-R>=expand("<cword>")<CR><CR>

nmap <C-@>s :scs find s <C-R>=expand("<cword>")<CR><CR>	
nmap <C-@>g :scs find g <C-R>=expand("<cword>")<CR><CR>	
nmap <C-@>c :scs find c <C-R>=expand("<cword>")<CR><CR>	
nmap <C-@>t :scs find t <C-R>=expand("<cword>")<CR><CR>	
nmap <C-@>e :scs find e <C-R>=expand("<cword>")<CR><CR>	
nmap <C-@>f :scs find f <C-R>=expand("<cfile>")<CR><CR>	
nmap <C-@>i :scs find i <C-R>=expand("<cfile>")<CR><CR>	
nmap <C-@>d :scs find d <C-R>=expand("<cword>")<CR><CR>

nmap <C-@><C-@>s :vert scs find s <C-R>=expand("<cword>")<CR><CR>
nmap <C-@><C-@>g :vert scs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-@><C-@>c :vert scs find c <C-R>=expand("<cword>")<CR><CR>
nmap <C-@><C-@>t :vert scs find t <C-R>=expand("<cword>")<CR><CR>
nmap <C-@><C-@>e :vert scs find e <C-R>=expand("<cword>")<CR><CR>
nmap <C-@><C-@>f :vert scs find f <C-R>=expand("<cfile>")<CR><CR>	
nmap <C-@><C-@>i :vert scs find i <C-R>=expand("<cfile>")<CR><CR>	
nmap <C-@><C-@>d :vert scs find d <C-R>=expand("<cword>")<CR><CR>

" Syntastic
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*
"let g:syntastic_always_populate_loc_list=1
"let g:syntastic_auto_loc_list=1
""let g:syntastic_check_on_open=1
""let g:syntastic_check_on_wq=0
"let g:syntastic_cpp_compiler_options="-std=c++11"

" airline
set t_Co=256
set laststatus=2
let g:airline_powerline_fonts=1
let g:airline_skip_empty_sections=1
let g:airline_theme='light'

" Fix highlight search
hi Search term=reverse cterm=reverse ctermbg=none
hi Visual term=reverse ctermbg=8
