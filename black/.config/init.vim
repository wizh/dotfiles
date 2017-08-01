" Directory for plugins 
call plug#begin('~/.local/share/nvim/plugged')

" Plugins 
Plug 'junegunn/vim-easy-align'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-fugitive'

" Initialize plugin system
call plug#end()

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

" Set theme
let g:airline_theme="papercolor"

" air-line
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_symbols.space = "\ua0"

let g:airline_skip_empty_sections = 1

let g:airline_left_sep=''
let g:airline_right_sep=''

" Configure statusline
let g:airline_section_z = airline#section#create(['%l/%L:', '%3v'])
set laststatus=2

" Colors 
set t_Co=256
