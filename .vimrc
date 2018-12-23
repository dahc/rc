" Vundle plugin setup
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" General-purpose functional plugins
Plugin 'tpope/vim-fugitive'             " git integration
Plugin 'scrooloose/nerdtree'            " nice file browser
Plugin 'Xuyuanp/nerdtree-git-plugin'    " git flags in file browser
Plugin 'majutsushi/tagbar'              " ctags exploration?

" Language-specific stuff (syntax, linting, etc.)
Plugin 'JuliaEditorSupport/julia-vim'
Plugin 'fatih/vim-go'

" Pretty stuff
Plugin 'NLKNguyen/papercolor-theme'     " eye-pleasing colors
Plugin 'vim-airline/vim-airline'        " fancy statusline & tabline
Plugin 'vim-airline/vim-airline-themes' " themes for the above
Plugin 'edkolev/tmuxline.vim'           " fancy statusline for tmux

call vundle#end()

" common editing defaults
filetype plugin indent on
set hidden expandtab tabstop=4 shiftwidth=4

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
nnoremap <Leader>v :vsplit<CR>
nnoremap <Leader>s :split<CR>
nnoremap <Leader>n :NERDTreeFocus<CR>
nnoremap <Leader>N :NERDTreeFind<CR>zz
nnoremap <Leader>t :TagbarOpen fj<CR>

" pretty colors
syntax on
set t_Co=256 background=dark
colorscheme PaperColor

" fancy statusline
let g:airline_theme = 'angr'
let g:airline_section_b = '%{FugitiveStatusline()}'
let g:airline_section_z = '%l/%L:%v [%P]'
"let g:airline#extensions#tabline#enabled = 1
let g:tmuxline_powerline_separators = 0
let g:tmuxline_preset = {
      \'a'    : '#S',
      \'b'    : '#W',
      \'c'    : '#H',
      \'win'  : '#I #W',
      \'cwin' : '#I #W',
      \'x'    : '%A',
      \'y'    : "%Y-%m-%d %H:%M %Z (#(date -u +'%%H:%%M %%Z'))",
      \'z'    : '#H'}

" tagbar tag explorer settings, note gotags dependency
let g:tagbar_width = 70
let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
    \ }

" nerdtree settings
let g:NERDTreeWinSize = 40
