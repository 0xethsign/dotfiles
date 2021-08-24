syntax enable

set autochdir
set statusline&
set noerrorbells
set tabstop=4
set shiftwidth=4
set expandtab
set smartindent
set relativenumber
set nu
"set termguicolors
set encoding=UTF-8
set nowrap
set smartcase
set noswapfile
set nobackup
"set undodir=~./vim/undodir
set undodir=$HOME/.undodir
set undofile
set incsearch
set cursorline

set colorcolumn=80
highlight ColorColumn ctermbg=0 guibg=lightgrey

autocmd BufNewFile *.cpp 0r ~/.vim/templates/skeleton.cpp

autocmd FileType cpp nnoremap     <leader>rm    :!g++ -g --std=c++17 % -o %:r<CR>
"autocmd FileType cpp nnoremap     <leader>rm    :set makeprg=g++<CR>:make % -o %:r<CR>
autocmd FileType cpp nnoremap     <leader>rr    :!./%:r<CR>
autocmd FileType cpp nnoremap     <leader>rt    :!for f in %:r.*.test; do echo "TEST: $f"; ./%:r < $f; done<CR>
let mapleader=" "


call plug#begin('~/.vim/plugged')

Plug 'preservim/nerdtree'
Plug 'ryanoasis/vim-webdevicons'
Plug 'vim-airline/vim-airline'
Plug 'morhetz/gruvbox'
Plug 'jremmen/vim-ripgrep'
Plug 'tpope/vim-fugitive'
Plug 'vim-utils/vim-man'
Plug 'lyuts/vim-rtags'
Plug 'kien/ctrlp.vim'
Plug 'ycm-core/YouCompleteMe'
Plug 'rust-lang/rls'
Plug 'mbbill/undotree'
Plug 'rust-lang/rust.vim'
Plug 'sainnhe/sonokai'
Plug 'racer-rust/vim-racer'
Plug 'NLKNguyen/papercolor-theme'
Plug 'wakatime/vim-wakatime'
Plug 'wadackel/vim-dogrun'
Plug 'vim-syntastic/syntastic'
"Plug 'neovim/nvim-lspconfig'
"Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()


"let g:gruvbox_contrast_dark = 'hard'
"colorscheme PaperColor
"colorscheme dogrun
"colorscheme industry
colorscheme sonokai
set background=dark
"highlight Normal ctermfg=grey ctermbg=black

if executable('rg')
    let g:rg_derive_root='true'
endif



let g:syntastic_cpp_checkers = ['cpplint']
let g:syntastic_c_checkers = ['cpplint']
let g:syntastic_cpp_cpplint_exec = 'cpplint'
" The following two lines are optional. Configure it to your liking!
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0


set clipboard=unnamedplus

autocmd VimEnter * NERDTree

let g:Hexokinase_highlighters = [ 'virtual' ]

" ag is fast enough that CtrlP doesn't need to cache "
let g:ctrlp_use_cache = 0
let g:netrw_winsize = 25
let g:netrw_banner = 0
let g:netrw_browse_split = 2


inoremap {<CR> {<CR>}<Esc>ko
inoremap [<CR> [<CR>]<Esc>ko
inoremap (<CR> (<CR>)<Esc>ko
nnoremap <leader>ps :Rg<SPACE>
nnoremap <leader>ghw :h <C-R>=expand("<cword>")<CR><CR>
"nnoremap <leader>prw :CocSearch <C-R>=expand("<cword>")<CR><CR>
nnoremap <leader>bs /<C-R>=escape(expand("<cWORD>"), "/")<CR><CR>
nnoremap <leader>u :UndotreeShow<CR>
nnoremap <Leader><CR> :so ~/.config/nvim/init.vim<CR>
nnoremap <Leader>+ :vertical resize +5<CR>
nnoremap <Leader>- :vertical resize -5<CR>
nnoremap <Leader>rp :resize 100<CR>
nnoremap <Leader>ee oif err != nil {<CR>log.Fatalf("%+v\n", err)<CR>}<CR><esc>kkI<esc>
nnoremap <Leader>cpu a%" PRIu64 "<esc>
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
map <C-q> :bnext<CR>


nnoremap <leader>pv :NERDTreeFocus<CR>

let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'

let NERDTreeShowHidden=1

nnoremap <silent> <Leader>gd :YcmCompleter GoTo<CR>
"nnoremap <silent> <Leader>gd :call CocAction('jumpDefinition', 'drop')<CR>
nnoremap <silent> <Leader>gf :YcmCompleter FixIt<CR>

"nmap <silent> <Leader>gd <Plug>(coc-definition)
"nnoremap <silent> <Leader>gd :call CocAction('jumpDefinition', 'vsplit')<CR> 
"nnoremap <silent> <Leader>gf :YcmCompleter FixIt<CR>

"function! s:GoToDefinition()
"  if CocAction('jumpDefinition')
"    return v:true
"  endif
"
"  let ret = execute("silent! normal \<C-]>")
"  if ret =~ "Error" || ret =~ "错误"
"    call searchdecl(expand('<cword>'))
"  endif
"endfunction
"
"nnoremap <silent> <Leader>gd :call <SID>GoToDefinition()<CR>



inoremap (; (<CR>);<C-c>O
inoremap (, (<CR>),<C-c>O
inoremap {; {<CR>};<C-c>O
inoremap {, {<CR>},<C-c>O
inoremap [; [<CR>];<C-c>O
inoremap [, [<CR>],<C-c>O

let g:rustfmt_autosave = 1

set hidden
let g:racer_cmd = "/home/user/.cargo/bin/racer"
let g:racer_experimental_completer = 1
let g:racer_insert_paren = 1

"augroup Racer
"    autocmd!
"    autocmd FileType rust nmap <buffer> gs         <Plug>(rust-def-split)
"    autocmd FileType rust nmap <buffer> gx         <Plug>(rust-def-vertical)
"    autocmd FileType rust nmap <buffer> gt         <Plug>(rust-def-tab)
"    autocmd FileType rust nmap <buffer> <leader>gd <Plug>(rust-doc)
"    autocmd FileType rust nmap <buffer> <leader>gD <Plug>(rust-doc-tab)
"augroup END

let g:lightline = {
      \ 'component_function': {
      \   'filetype': 'MyFiletype',
      \   'fileformat': 'MyFileformat',
      \ }
      \ }

function! MyFiletype()
  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype . ' ' . WebDevIconsGetFileTypeSymbol() : 'no ft') : ''
endfunction

function! MyFileformat()
  return winwidth(0) > 70 ? (&fileformat . ' ' . WebDevIconsGetFileFormatSymbol()) : ''
endfunction
