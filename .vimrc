" We want the latest Vim settings/options (Default in nvim)
" set nocompatible

set rtp+=/opt/homebrew/opt/fzf

"----------------Plugins----------------"
call plug#begin('~/.vim/plugged')

Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-fugitive'
Plug 'sainnhe/everforest'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
" Plug 'tpope/vim-dispatch'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'vim-test/vim-test'
Plug 'mattn/emmet-vim'
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'tpope/vim-unimpaired'

" Completion
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp-signature-help'

" For vsnip users.
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'

call plug#end()

"--------------------------------------"

filetype plugin indent on

" Store swap files in ~/.vim/tmp directory
set directory^=$HOME/.vim/tmp//

" Show relative numbers in gutter
set relativenumber

" Show line numbers in gutter
set number

" Use new regular expression engine
set re=0

" Sets how many lines of history VIM has to remember (Default in nvim)
" set history=500

" Make backspace behave like every other editor (Default in nvim)
" set backspace=indent,eol,start

" The default leader key is \, but a comma is better
let mapleader = ','

" Turn off bell sound
set noerrorbells visualbell t_vb=

" Automatically write the file when switching buffers
set autowriteall

" Set our desired autocompletion matching
set complete=.,w,b,u

set completeopt=menu,menuone,noselect

" Set how quickly Vim updates
" set updatetime=100

" Don't redraw while executing macros (good performance config)
" set lazyredraw

"----------------Visuals----------------"

syntax enable

" Use 256 colors for terminal vim
" set t_CO=256
set linespace=16

" Tab settings
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set smartindent

if (has("termguicolors"))
  set termguicolors
endif

set signcolumn=yes

" let &t_ZH="\e[3m"
" let &t_ZR="\e[23m"
" let &t_ut=''

set background=dark
let g:everforest_enable_italic = 1
let g:everforest_background = 'soft'
let g:everforest_sign_column_background = 'none'
let g:everforest_better_performance = 1
colorscheme everforest

"----------------Search----------------"
" Highlight search (Default in nvim)
" set hlsearch

" Incremental search (Default in nvim)
" set incsearch

" Search down into subfolders
" Provides tab-completion for all file-related tasks
set path+=**

" Display all matching files when tab complete (Default in nvim)
" set wildmenu

" Ignore files when using :find
set wildignore+=*/.idea/*
set wildignore+=*/.DS_STORE
set wildignore+=*/vendor/*
set wildignore+=*/node_modules/*
set wildignore+=*/coverage/*
set wildignore+=*/build/*
set wildignore+=*/dist/*
set wildignore+=*/lib/*

"----------------Split Management----------------"
set splitbelow
set splitright

nmap <C-H> <C-W><C-H>
nmap <C-J> <C-W><C-J>
nmap <C-K> <C-W><C-K>
nmap <C-L> <C-W><C-L>

"----------------Plugins----------------"

" Plug
nmap <leader>pi :PlugInstall<cr>
nmap <leader>pc :PlugClean<cr>

" CtrlP
" let g:ctrlp_match_window = 'top,order:ttb,min:1,max:30,results:30'
" let g:ctrlp_working_path_mode = 'ra'
" let g:ctrlp_user_command = {
" \ 'types': {
" \ 1: ['.git', 'cd %s && git ls-files --exclude-standard --others --cached'],
" \ },
" \ 'fallback': 'find %s -type f'
" \}

" nmap <c-p> :CtrlP<cr>
" nmap <c-r> :CtrlPBufTag<cr>
" nmap <c-e> :CtrlPMRUFiles<cr>
" nmap <leader>cc :CtrlPClearCache<cr>

" LSP
nmap <leader>gd :lua vim.lsp.buf.definition()<cr>
nmap <leader>K :lua vim.lsp.buf.hover()<cr>
nmap <leader>dp :lua vim.diagnostic.goto_prev()<cr>
nmap <leader>dn :lua vim.diagnostic.goto_next()<cr>
nmap <leader>do :lua vim.diagnostic.open_float()<cr>
nmap <leader>rn :lua vim.lsp.buf.rename()<cr>
nmap <leader>ca :lua vim.lsp.buf.code_action()<cr>

" Vim-Test
let g:test#strategy = 'neovim'
let g:test#neovim#start_normal = 1
nmap <leader>tn :TestNearest<cr>
nmap <leader>tl :TestLast<cr>
nmap <leader>tf :TestFile<cr>
nmap <leader>ts :TestSuite<cr>

"----------------Mappings----------------"
" nmap = mapping for normal mode

" Fast saving
nmap <leader>w :w!<cr>

" Fast quiting
nmap <leader>q :q<cr>

" Close all buffers
nmap <leader>Q :bufdo bd<cr>

" Copy from cursor to end of line (Default in nvim)
" nmap Y y$

" Keep cursor in the center when going to the next result
nnoremap n nzzzv
nnoremap N Nzzzv

" Move entire lines up or down
vnoremap J :m '>+1<cr>gv=gv
vnoremap K :m '<-2<cr>gv=gv
nnoremap <leader>k :m .-2<cr>==
nnoremap <leader>j :m .+1<cr>==

" Edit vimrc file in a new tab
nmap <leader>ev :tabedit ~/.vimrc<cr>
nmap <leader>ei :tabedit ~/.config/nvim/init.vim<cr>

" Turn off highlight search
nmap <leader><space> :nohlsearch<cr>

" Console log word under cursor
nnoremap <leader>L "ayiwoconsole.log('<C-R>a', <C-R>a)<esc>

" Location List
" nmap <leader>lo :lopen<cr>
" nmap <leader>lc :lclose<cr>
" nmap <leader>ln :lnext<cr>
" nmap <leader>lp :lprev<cr>

" Search and replace word under cursor
nnoremap <leader>s :%s/<C-r><C-w>/

" Find word under cursor
nnoremap <leader>f :Git grep <c-r><c-w><cr>

" Fugitive
" Git Status
nmap <leader>gs :Git<CR>
nmap <leader>gpl :Git pull<CR>
nmap <leader>gps :Git push<CR>
nmap <leader>gg :Git grep<space>

" FZF
nmap <C-p> :GitFiles<cr>
nmap <leader>b :Buffers<cr>
nmap <leader>m :Maps<cr>

" Abbreviations
inoreabbrev cosnt const

inoreabbrev cls console.log('foo')<esc>?foo<cr>:nohlsearch<cr>cw
inoreabbrev clo console.log({ foo })<esc>?foo<cr>:nohlsearch<cr>cw
inoreabbrev desc describe('foo', () => {<cr><cr>})<esc>?foo<cr>:nohlsearch<cr>cw
inoreabbrev iaa it('should foo', async () => {<cr>})<esc>?foo<cr>:nohlsearch<cr>cw
inoreabbrev aaf async () => {<cr>}<esc>O
inoreabbrev arr () => {<cr>}<esc>O
inoreabbrev imp import foo from ''<esc>?foo<cr>:nohlsearch<cr>cw
inoreabbrev imd import { foo } from ''<esc>?foo<cr>:nohlsearch<cr>cw
inoreabbrev saf static async foo() {<cr>}<esc>?foo<cr>:nohlsearch<cr>cw
inoreabbrev pubf public function foo()<cr>{}<esc>?foo<cr>:nohlsearch<cr>cw
inoreabbrev testf /** @test */<cr>public function foo()<cr>{<cr>}<esc>?foo<cr>:nohlsearch<cr>cw

" inoremap ( ()<esc>i
inoremap [ []<esc>i
inoremap { {}<esc>i

"----------------Auto-Commands----------------"
" Automatically source vimrc file after saving
augroup autosourcing
	autocmd!
	autocmd BufWritePost .vimrc source %
augroup END

augroup syntaxhighlighting
  autocmd!
  autocmd BufReadPost .eslintrc set syntax=json
augroup END

augroup linting
  autocmd!
  autocmd BufWritePre javascript <cmd>EslintFixAll<CR>
augroup END

" Automatically remove trailing space from each file type
autocmd BufWritePre *.ts :%s/\s\+$//e
autocmd BufWritePre *.tsx :%s/\s\+$//e
autocmd BufWritePre *.js :%s/\s\+$//e
autocmd BufWritePre *.php :%s/\s\+$//e
autocmd BufWritePre *.vue :%s/\s\+$//e
