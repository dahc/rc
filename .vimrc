" Plugins setup via Pathogen:
"   Functional stuff:
"     vim-fugitive (nice git integration, also used by airline for status)
"     nerdtree (a rather conventional looking sidebar filesystem explorer)
"     nerdtree-git-plugin (adds git status flags to nerdtree)
"     julia-vim (language-specific improvements for Julia)
"     vim-go (language-specific improvements for Go)
"   Pretty stuff:
"     awesome-vim-colorschemes (just for PaperColor lately)
"     vim-airline (lovely statusline and tabline, requires powerline fonts)
"     vim-airline-themes (usually 'papercolor' or 'angr')
"     tmuxline (theme-aware statusline config generator for tmux)
execute pathogen#infect()

" common editing defaults
filetype plugin indent on
set nocompatible hidden expandtab tabstop=4 shiftwidth=4

" filetype-specific overrides
augroup filetypes
    autocmd!
    autocmd FileType c,go setlocal noexpandtab shiftwidth=8 tabstop=8
    autocmd FileType css,html,tex,yaml setlocal shiftwidth=2 tabstop=2
augroup END

" enable nice recursive searches and enhanced tab completion
set path+=** wildmenu

" MAPPINGS: I try to keep it simple and use mappings mostly for workflows
" that are unique to my local workstation (like working with many open
" buffers/windows/tabs). It's really frustrating to develop muscle memory
" for things that don't work on the majority of machines (this is why I
" don't remap <ESC>, for example, however nice that might be).
let mapleader = ';'
nnoremap <Leader>r :source ~/.vimrc<CR>
nnoremap <Leader>w <C-w>
nnoremap <Leader>% :vsplit<CR>
nnoremap <Leader>" :split<CR>
nnoremap <Leader>n :NERDTreeFocus<CR>

" pretty colors
syntax on
set t_Co=256 background=dark
colorscheme PaperColor

" fancy statusline and tabline
let g:airline_powerline_fonts = 1
let g:airline_theme = 'angr'
let g:airline_section_z = '%l/%L:%v [%P]'
let g:airline#extensions#tabline#enabled = 1
" A note about tmuxline:
"     I find tmuxline's autoconfiguration a bit overzealous, so I just use
" it to generate a tmux config (via :TmuxlineSnapshot) and then uninstall
" tmuxline. That way I can tweak the resulting tmux config without having
" tmuxline stomp all over any changes. There's probably a better way, but
" I don't change themes very often, so it hasn't been an issue for me.
