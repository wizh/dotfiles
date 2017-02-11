" Specify a directory for plugins (for Neovim: ~/.local/share/nvim/plugged)
call plug#begin('~/.local/share/nvim/plugged')

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'junegunn/vim-easy-align'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/nerdtree'

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
"set colorcolumn=81

" Set Airline theme
let g:airline_theme="papercolor"
let g:airline_powerline_fonts = 1

" Configure statusline
let g:airline_section_z = airline#section#create(['%l/%L:', '%3v'])
let g:airline_skip_empty_sections = 1
