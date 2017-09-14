set hidden
set showcmd
 
set ignorecase
set smartcase
 
" Use visual bell instead of beeping when doing something wrong
set visualbell
 
" And reset the terminal code for the visual bell. If visualbell is set, and
" this line is also included, vim will neither flash nor beep. If visualbell
" is unset, this does nothing.
set t_vb=
 
" Enable use of the mouse for all modes
set mouse=a
 
" Set the command window height to 2 lines, to avoid many cases of having to
" "press <Enter> to continue"
set cmdheight=2
 
" Display line numbers on the left
set number
set relativenumber
 
" Indentation options
set shiftwidth=4
set softtabstop=4
set expandtab

map Y y$

" Map <C-L> (redraw screen) to also turn off search highlighting until the
" next search
nnoremap <C-L> :nohl<CR><C-L>

call plug#begin('~/.vim/plugged')
    Plug 'https://github.com/sickill/vim-monokai'
    Plug 'https://github.com/Quramy/tsuquyomi/'
    Plug 'https://github.com/jrozner/vim-antlr'
    Plug 'mattn/webapi-vim'
    Plug 'https://github.com/vim-syntastic/syntastic'
    Plug 'rust-lang/rust.vim'
    Plug 'https://github.com/artur-shaik/vim-javacomplete2', {'for': ['java']}
    Plug 'https://github.com/leafgarland/typescript-vim'
    Plug 'https://github.com/roxma/nvim-completion-manager', { 'do': ':UpdateRemotePlugins' }
    Plug 'https://github.com/autozimu/LanguageClient-neovim'
    Plug 'craigemery/vim-autotag'
call plug#end()

colorscheme monokai
set termguicolors

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 0
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_loc_list_height = 1

let g:syntastic_cpp_compiler = 'clang++'
let g:syntastic_cpp_compiler_options = ' -std=c++11 -stdlib=libc++'

"disable syntastic on a per buffer basis (some work files blow it up)
function! SyntasticDisableBuffer()
    let b:syntastic_skip_checks = 1
    SyntasticReset
    echo 'Syntastic disabled for this buffer'
endfunction

command! SyntasticDisableBuffer call SyntasticDisableBuffer()
command! SyntasticOff call SyntasticDisableBuffer()
