" No annoying swap files"
set noswapfile

" Persistent Undo, Vim remembers everything even after the file is closed.
set undofile
set undolevels=500
set undoreload=500

" Use the OS clipboard by default
set clipboard+=unnamedplus

" Show search results as you type
set incsearch

" Highlight search matches
set hlsearch

" Chmod +x current file {{{

function! Chmox()
	execute "!chmod +x " . expand('%:p')
endfunction
command! Chmox call Chmox()

" Returns you to your position on file reopen and closes all folds.
" On fold open your cursor is on the line you were at on the fold.
augroup line_return
	au!
	autocmd BufReadPost * :call LineReturn()
augroup END

function! LineReturn()
	if line("'\"") > 0 && line("'\"") <= line("$")
		execute 'normal! g`"zvzzzm'
	endif
endfunction
" Easier split navigation
nnoremap <Leader>h <C-W><C-H>
nnoremap <Leader>j <C-W><C-J>
nnoremap <Leader>k <C-W><C-K>
nnoremap <Leader>l <C-W><C-L>

" Map ; to :
noremap ; :

" Improve Neovim startup time by disabling python and host check
let g:python_host_skip_check= 1
let g:loaded_python_provider = 1
let g:loaded_python3_provider = 1

" Auto change dir to file directory
set autochdir

set esckeys
set noeol
set showcmd
set autoread
set hidden
set noerrorbells
set number
syn on
" Enhance command-line completion
set wildmenu
set wildmode=longest,full
set wildignore+=*/.hg/*,*/.git/*,*/.svn/*
set wildignore+=*.gif,*.png,*.jp*
set wildignore+=*/tmp/*,*.so,*.swp,*.zip
set wildignore+=*/.sass-cache/*,*.map

" Better Buffer Navigation {{{
" Maps <Tab> to cycle though buffers but only if they're modifiable.
" If they're unmodifiable it maps <Tab> to cycle through splits.

function! BetterBufferNav(bcmd)
	if &modifiable == 1 || &ft == 'help'
		execute a:bcmd
	else
		wincmd w
	endif
endfunction
" Maps Tab and Shift Tab to cycle through buffers
nmap <silent> <Tab> :call BetterBufferNav("bn") <Cr>
nmap <silent> <S-Tab> :call BetterBufferNav("bp") <Cr>

" Better auto complete
set complete=.,w,b,u,t,i
set completeopt=longest,menu,preview

set nrformats-=octal
set notimeout
set nottimeout

" Improve Neovim startup time by disabling python and host check
let g:python_host_skip_check= 1
let g:loaded_python_provider = 1
let g:loaded_python3_provider = 1

" Make Neovim more python [PEP8] friendly
" Pressing <tab> results in four spaces
" (useful for indenting code)

setlocal tabstop=4
setlocal softtabstop=4
setlocal shiftwidth=4
setlocal textwidth=80
setlocal smarttab
setlocal expandtab

" Colorscheme
colorscheme miromiro
