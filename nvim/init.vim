execute 'source ' . stdpath('config') . '/shortcuts.vim'
lua require("init")
set number
set clipboard=unnamed
set cmdheight=0
" highlight Normal guibg=none
" highlight NormalNC guibg=none
" highlight FloatBorder guibg=none
" highlight TelescopeBorder guibg=none
" highlight NormalFloat guibg=none
" highlight Identifier guifg=#3e8fb0
" highlight typescriptIdentifierName guifg=#3e8fb0
autocmd VimEnter * :silent !kitty @ set-spacing padding=0
autocmd VimLeave * :silent !kitty @ set-spacing padding=default

syntax enable
augroup markdown
  au FileType markdown setlocal foldlevel=99
  au FileType markdown setlocal conceallevel=2
augroup END
