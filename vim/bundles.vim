set shell=/bin/bash
set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#begin()

let g:polyglot_disabled = ['yaml', 'vue']
let g:jsx_ext_required = 1

Plugin 'gmarik/vundle'
Plugin 'itchyny/lightline.vim'

"colorschemes
Plugin 'chriskempson/base16-vim'
Plugin 'junegunn/seoul256.vim'
Plugin 'shinchu/lightline-seoul256.vim'

Plugin 'Glench/Vim-Jinja2-Syntax'
"Plugin 'SirVer/ultisnips'
Plugin 'ervandew/supertab'
"Plugin 'ap/vim-buftabline'
Plugin 'duff/vim-bufonly'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'eiginn/netrw'
Plugin 'felixjung/vim-base16-lightline'
"Plugin 'gorodinskiy/vim-coloresque'
Plugin 'Valloric/MatchTagAlways'
Plugin 'haya14busa/incsearch.vim'
Plugin 'haya14busa/incsearch-fuzzy.vim'
Plugin 'itspriddle/vim-marked'
Plugin 'jgallen23/Color-Scheme-Test'
Plugin 'jgallen23/openurl.vim'
Plugin 'jgallen23/runcode.vim'
Plugin 'mtscout6/syntastic-local-eslint.vim'
Plugin 'pzich/phtmlSwitch-vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/syntastic'
Plugin 'sheerun/vim-polyglot'
Plugin 'stephenway/postcss.vim'
Plugin 'tpope/vim-fugitive'
"Plugin 'vim-scripts/Decho'
Plugin 'will133/vim-dirdiff'
"Plugin 'jgallen23/vim-bufsurf'
"Plugin 'othree/yajs.vim'
"Plugin 'easymotion/vim-easymotion'
"Plugin 'haya14busa/incsearch-easymotion.vim'
Plugin 'benmills/vimux'
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'
Plugin 'stephpy/vim-yaml'
Plugin 'digitalrounin/vim-yaml-folds'
Plugin 'airblade/vim-gitgutter'
Plugin 'danro/rename.vim'
"Plugin 'mklabs/split-term.vim'

call vundle#end()
filetype plugin indent on     " required!
