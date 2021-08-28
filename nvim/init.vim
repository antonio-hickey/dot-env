call plug#begin('~/.local/share/nvim/plugged')

Plug 'cocopon/iceberg.vim'
Plug 'machakann/vim-highlightedyank'
Plug 'terryma/vim-multiple-cursors'
Plug 'neomake/neomake'
Plug 'scrooloose/nerdtree'
Plug 'davidhalter/jedi-vim'
Plug 'sbdchd/neoformat'
Plug 'davidhalter/jedi-vim'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'zchee/deoplete-jedi'
Plug 'jiangmiao/auto-pairs'
Plug 'itchyny/lightline.vim'
Plug 'scrooloose/nerdcommenter'

call plug#end()

set clipboard=unnamedplus
:set hlsearch
:set title
:set mouse=a
:set relativenumber

" Color theme
colorscheme iceberg
set background=dark " use dark mode
" set background=light " uncomment to use light mode

" Lightline theme
let g:lightline = {
      \ 'colorscheme': 'iceberg',
      \ }


"set highlight duration time to 1000 ms, i.e., 1 second
let g:highlightedyank_highlight_duration = 1000
hi HighlightedyankRegion cterm=reverse gui=reverse

" Python linter
let g:neomake_python_enabled_makers = ['pylint']

" disable autocompletion, because we use deoplete for completion
let g:jedi#completions_enabled = 0

" open the go-to function in split, not another buffer
let g:jedi#use_splits_not_buffers = "right"

" Enable alignment
let g:neoformat_basic_format_align = 1

" Enable tab to space conversion
let g:neoformat_basic_format_retab = 1

" Enable trimmming of trailing whitespace
let g:neoformat_basic_format_trim = 1
let g:deoplete#enable_at_startup = 1
