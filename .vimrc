" First: curl -fLo ~/.vim/autoload/plug.vim --create-dirs     https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
" You also need node to make autocompletion work
set number
set autowrite
:syntax on
filetype plugin indent on
set encoding=utf-8
" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Having longer updatetime (default is 4000 ms = 4s) leads to noticeable
" delays and poor user experience
set updatetime=150

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved
set signcolumn=yes

call plug#begin()
  Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
  Plug 'preservim/nerdtree'
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
  else
  inoremap <silent><expr> <c-@> coc#refresh()
endif


" Go syntax highlighting
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_operators = 1
let g:go_fmt_command = "goimports"
let g:go_auto_type_info = 1
let NERDTreeQuitOnOpen=0
nnoremap <C-l> gt
nnoremap <C-L> gT

inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#prev(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#next(1) : "\<C-h>"

map <C-n> :cnext<CR>
map <C-m> :cprevious<CR>
map <leader>n :set nonumber<CR>
map <leader>N :set number<CR>
map <leader>P :NERDTree<CR>
map <leader>T :tabnew<CR>
nnoremap <leader>a :cclose<CR>

au FileType go nmap <Leader>ds <Plug>(go-def-split)
au FileType go nmap <Leader>dv <Plug>(go-def-vertical)
au FileType go nmap <Leader>dt <Plug>(go-def-tab)
au filetype go inoremap <buffer> . .<C-x><C-o>
au VimEnter * NERDTree
set mouse=a

nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction
