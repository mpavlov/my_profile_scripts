set nocompatible

""""""""""
" Colors "
""""""""""
set showmatch  " show matching brackets when text indicator is over them

syntax on  " turn on syntax highligthing
colorscheme my_colorscheme

set hls  " highlight search
highlight search ctermbg=brown ctermfg=black

set list  " show whitespace
set listchars=tab:>.,trail:.,extends:#,nbsp:.  " highlight problematic whitespace

autocmd BufNewFile,BufRead Vagrantfile set filetype=ruby  " vagrantfile is ruby
autocmd BufNewFile,BufRead *.json set ft=json

""""""""""
" Indent "
""""""""""
" switch on filetype detection and load indent file (indent.vim) for specific file types
filetype indent on
filetype on
set autoindent  " copy indent from the row above
set smartindent  " smart indent

" Use 4 spaces instead of tab during format
set expandtab
set shiftwidth=4
set softtabstop=4
set smarttab

"""""""""""""""""
" Misc settings "
"""""""""""""""""
set linebreak
set nowrap
set paste
set ruler
set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%)


""""""""""""""
" Automation "
""""""""""""""
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g'\"" | endif
endif

""""""""""""""""
" Key bindings "
""""""""""""""""
map <Tab> <C-W>w
map <S-Tab> <C-W>W

map - Mkzz
map = Mjzz

:command WQ wq
:command Wq wq
:command W w
:command Q q

map <F7> :setlocal spell! spelllang=en_us<CR>
