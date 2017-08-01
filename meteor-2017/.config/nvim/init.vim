" Directory for plugins
call plug#begin('~/.local/share/nvim/plugged')

" Plugins
Plug 'junegunn/vim-easy-align'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-fugitive'
Plug 'exitface/synthwave.vim'

" Initialize plugin system
call plug#end()

" NERDTree
" Show hidden files
let NERDTreeShowHidden=1

" <Crtl-l> redraws screen and removes any search highlighting
nnoremap <silent> <C-l> :nohl<CR><C-l>

" Show syntax highlighting
syntax enable

" Set tab as 4 spaces
set tabstop=4
set shiftwidth=4
set expandtab

" Show relative linenumbers
set relativenumber

" Highlight column 81
match Error /\%81v.\+/

" Trim whitespace on save
fun! TrimWhitespace()
    let l:save = winsaveview()
    %s/\s\+$//e
    call winrestview(l:save)
endfun

autocmd BufWritePre * :call TrimWhitespace()

" air-line
let g:airline_theme="minimalist"
let g:airline_skip_empty_sections = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers=1
let g:airline_section_z = airline#section#create(['%l/%L:', '%3v'])

" air-line powerline config
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_symbols.space = "\ua0"

let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''
