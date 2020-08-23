" Disable compatible mode
set nocompatible

" Install PluginManager
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Plugins

call plug#begin('~/.vim/plugged')

Plug 'mhartington/oceanic-next'

call plug#end()

" Set theme

syntax enable

let g:oceanic_next_terminal_bold = 1
let g:oceanic_next_terminal_italic = 1

if(has("termguicolors"))
    set termguicolors
endif

colorscheme OceanicNext



" --- Configs ---

" Enable line numbers
:set number

" Replace tab spaces
set expandtab

" Set tab size to four spaces
set tabstop=4
set shiftwidth=4

" Auto indent next line when pressing Return
set autoindent


" --- Filetype specific configs
autocmd! BufWritePost *.tex call OnTexFileSaved()

" --- Keybindings ---

inoremap jj <esc>

" --- Functions
function OnTexFileSaved()
    :silent exec "!rm " . expand("%:r") . ".pdf"
    :silent exec "!pdflatex " . expand("%:t") . " && cmd.exe /c start " . expand("%:r") . ".pdf"
    :redraw!
endfunction
