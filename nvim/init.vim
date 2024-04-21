execute 'source ' . stdpath('config') . '/shortcuts.vim'
lua require("init")
set number
set clipboard=unnamed
set cmdheight=0
highlight Normal guibg=none
highlight NormalNC guibg=none
highlight FloatBorder guibg=none
highlight TelescopeBorder guibg=none
highlight NormalFloat guibg=none 
syntax enable

autocmd VimEnter * !kitty @ set-spacing padding=0
autocmd VimLeave * !kitty @ set-spacing padding=default
