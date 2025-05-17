" ----------------------------------------------------------------------------
"     VIM config
"     Sergey Silaev <hello@8am.dev>
" ----------------------------------------------------------------------------
"
" Requirements: ripgrep, fzf, ctags

" call plug#begin()
" Plug 'rust-lang/rust.vim'
" Plug 'tpope/vim-commentary'
" Plug 'tpope/vim-fugitive'
" Plug 'tpope/vim-surround'
" Plug 'preservim/tagbar'
" Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
" Plug 'junegunn/fzf.vim'
" Plug 'airblade/vim-gitgutter'
" Plug 'cespare/vim-toml'
" Plug 'nathanaelkane/vim-indent-guides'
" Plug 'easymotion/vim-easymotion'
" Plug 'jreybert/vimagit'
" call plug#end()

set nocompatible
set term=xterm-256color
set termguicolors
set cscopeverbose
set cscopetag
set tabstop=2
set shiftwidth=2
set expandtab
set autoindent
set smartindent
set cindent
set backspace=indent,eol,start
set nobackup
set noundofile
set scrolloff=10
set nonumber
set path+=** " search down into subfolders (for tab-complete)
set wildmenu " display all matching files for tab-complete
"set incsearch
set hlsearch
set nowrap
set autochdir
filetype on
filetype plugin indent on

" highlighting color and extra whitespaces at the end
syntax on
highlight ExtraWhitespace ctermbg=red guibg=red
au BufNew,BufEnter,BufWinEnter,WinEnter,BufNew * match ExtraWhitespace /\s\+$/

" colorscheme
set background=dark

colorscheme synthe

" Show unprintable chars
set list
set listchars=tab:⁞\ ,eol:¬

" Better Netrw
let g:netrw_banner = 0
let g:netrw_browse_split = 0
let g:netrw_altv = 1
let g:netrw_liststyle = 3
let g:netrw_winsize = 25

" Exception for C, Go and yaml
au! BufNewFile,BufReadPost *.{c,h} set ft=c
au! BufNewFile,BufReadPost *.{go} set ft=go
au! BufNewFile,BufReadPost *.{yaml,yml} set ft=yaml
au FileType c setlocal noexpandtab
au FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
au FileType sh setlocal ts=2 sts=2 sw=2 expandtab
au FileType markdown setlocal ts=4 sts=4 sw=4 expandtab

set tags=./.tags;/

" reloads vim
noremap <silent> <Leader>v :so $MYVIMRC<CR>

" auto-indent
noremap <silent> <leader>f gg=G<CR>

" X copy-paste
set clipboard+=unnamedplus

" navigate 4x faster when holding down Ctrl
nmap <c-j> 4j
nmap <c-k> 4k
nmap <c-h> 4h
nmap <c-l> 4l
nmap <c-Down> 4<Down>
nmap <c-Up> 4<Up>
nmap <c-Left> b
nmap <c-Right> e

" for Visual mode: x[nore]map
xnoremap <c-j> 4j
xnoremap <c-k> 4k
xnoremap <c-h> 4h
xnoremap <c-l> 4l
xnoremap <c-Down> 4<Down>
xnoremap <c-Up> 4<Up>
xnoremap <c-Left> b
xnoremap <c-Right> e

" enable mode keys in ru layout
set langmap=ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz

" find and replace
nmap S :%s//g<Left><Left>

" on/off relativenumber
nmap <F3> :set number!<CR>

" trailing whitespace
function! RemoveTrailingSpaces()
    let save_cursor = getpos(".")
    %s/\s\+$//e
    call setpos('.', save_cursor)
endfunction

command! RemoveTrailingSpaces call RemoveTrailingSpaces()
nnoremap <F2> :RemoveTrailingSpaces<CR>

" Explore
nnoremap <leader>e :Ex<CR>
nnoremap <leader>s :Vexplore<CR>
nnoremap <leader>S :Hexplore<CR>
nnoremap <leader>T :Texplore<CR>

" Resize
nnoremap <M-Up> :resize -4<CR>
nnoremap <M-Down> :resize +4<CR>
nnoremap <M-Right> :vertical resize +4<CR>
nnoremap <M-Left> :vertical resize -4<CR>

" py
nmap <Leader>x :!python %<cr>

" Move
vnoremap J :m '>+1<CR>gv=gv

" noh
nmap <Leader><space> :noh<cr>

" Tagbar
nmap <F8> :TagbarToggle<CR>

" Fzf
nnoremap <C-f> :Rg<CR>
nnoremap <C-p> :Files<CR>
