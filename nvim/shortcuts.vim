let mapleader = ' '
nnoremap <D-p> :Telescope smart_open<CR>
nmap <Leader>ff :Telescope live_grep<CR>
nmap <c-f> :Neotree toggle<CR>
nmap <Leader>fj :%!jq '.'<CR>
nmap <Leader>zz :ZenMode<CR>
nmap gf :lua vim.diagnostic.open_float()<CR>
nnoremap <silent> <c-h> :wincmd h<CR>
nnoremap <silent> <c-l> :wincmd l<CR>
nnoremap <silent> <c-j> :wincmd j<CR>
nnoremap <silent> <c-k> :wincmd k<CR>
" nnoremap <D-r> :Navbuddy<CR>
nnoremap <D-r> :Telescope aerial<CR>
inoremap <D-s> <C-\><C-o>:w<CR>
nnoremap <D-s> :w<CR>
nnoremap <D-t> :tabnew<CR>
nmap gb :Gitsigns blame_line<CR>
nnoremap <Leader>fr :Telescope resume<CR>
nnoremap <silent> <leader>gg :LazyGit<CR>
nnoremap QQ :qa!<CR>
nnoremap ZA ZQ
nnoremap <Leader>rr <cmd>Glance references<CR>
nnoremap gd <cmd>vim.lsp.buf.definition<CR>
nnoremap gi <cmd>Glance implementation<CR>
nnoremap <Leader>jf :Telescope jsonfly<cr> 

nmap <Leader>r :lua vim.lsp.buf.rename()<CR>
nmap <Leader>e :lua vim.lsp.buf.format()<CR>
autocmd BufWritePre *.tsx,*.ts :EslintFixAll
nnoremap <leader>xx <cmd>TroubleToggle<cr>
nnoremap <leader>dd <cmd>DBUIToggle<cr>
autocmd FileType sql,mysql,plsql lua require('cmp').setup.buffer({ sources = {{ name = 'vim-dadbod-completion' }} })
" nmap <Leader>gf :DiffviewFileHistory %<CR>
nmap <Leader>c :noh<cr>
nmap <Leader>i :TSToolsAddMissingImports<CR>
nmap <Leader>p :Oil<CR>
nmap <c-t> :ToggleTermToggleAll<CR>
nnoremap <S-Left> :BufferMovePrevious<CR>
nnoremap <S-Right> :BufferMoveNext<CR>
nnoremap <D-s-t> :BufferRestore<CR>
imap <silent><expr> <Tab> luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<Tab>' 
" -1 for jumping backwards.
inoremap <silent> <S-Tab> <cmd>lua require'luasnip'.jump(-1)<Cr>

snoremap <silent> <Tab> <cmd>lua require('luasnip').jump(1)<Cr>
snoremap <silent> <S-Tab> <cmd>lua require('luasnip').jump(-1)<Cr>

" For changing choices in choiceNodes (not strictly necessary for a basic setup).
imap <silent><expr> <C-E> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-E>'
smap <silent><expr> <C-E> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-E>'
