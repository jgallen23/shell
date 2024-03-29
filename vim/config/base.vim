set t_Co=256
"let base16colorspace=256
"colorscheme base16-materia
"colo seoul256

"let g:seoul256_background = 256
set background=light

"set shell=/usr/bin/fish
set ignorecase
set smartcase
set hidden
set textwidth=0 "disable auto wrapping
set clipboard=unnamed "mac clipboard sync
set nobackup
set noswapfile
let mapleader=","
let maplocalleader="<"
set ruler
set wrap!
set guioptions-=T
set guioptions-=r
set guioptions-=L

set smartindent
set cmdheight=1
set laststatus=2
"set statusline=[%l,%c\ %P%M]\ [%{getcwd()}%*\]%{fugitive#statusline()}\ %f\ %r%h%w
set guifont=Source\ Code\ Pro:h14
set nohlsearch
nnoremap <leader>hl :set hlsearch!<CR>
set incsearch
set cursorline
set relativenumber
"set mouse=a
set list listchars=tab:>\ ,trail:·
"center screen
"set so=999

set tabstop=2
set shiftwidth=2
set expandtab

"map <leader>v :e ~/.vimrc<CR><C-W>_
map <leader>b :Explore<CR>
map <leader>e :RunCode<CR>


"indent
vmap <Tab> >gv
vmap <S-Tab> <gv
vmap <right> >gv
vmap <left> <gv

"start end of line
noremap H ^
noremap L g_

au! BufRead,BufNewFile *.handlebars setfiletype html
au BufNewFile,BufRead *.ejs set filetype=html
au BufNewFile,BufRead *.njk set filetype=jinja
au BufRead,BufNewFile *.vue set filetype=javascript

au BufRead,BufNewFile Dockerfile* setfiletype dockerfile
au BufRead,BufNewFile DockerfileProd setfiletype dockerfile

au FileType css setlocal foldmethod=indent
au BufRead * normal zR

"change cwd
command! CWD :cd %:p:h

function! s:notes()
  cd ~/Dropbox/Notes
endfunction
command! Notes call s:notes()

"fix backspace
if !has('gui_running')
  set backspace=indent,eol,start
endif

"paste
nmap <leader>p :set paste!<BAR>:set paste?<CR>

"buffer delete
map <leader>q :bd<CR>

"map W to save
command! W w
command! Wqa wqa

let g:netrw_home=$HOME

map <leader>o :set cursorcolumn!<CR>

set previewheight=25

command! SyntaxMe echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
      \ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
      \ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"

nnoremap ; :

autocmd FileType gitcommit setlocal spell

nnoremap <leader>n :e %:h/

iab <expr> dts strftime("%Y.%m.%d")

command! Spell :setlocal spell!<BAR>:setlocal spell?
command! Del :call delete(expand('%'))

