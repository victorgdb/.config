let mapleader = ' '
nnoremap <D-p> :Telescope smart_open<CR>
nmap <Leader>ff :Telescope live_grep<CR>
nmap <c-f> :Neotree toggle<CR>
nmap <Leader>fj :%!jq '.'<CR>
nmap <Leader>zz :ZenMode<CR>
nmap gf :lua vim.diagnostic.open_float()<CR>
nnoremap <D-a> ggVG<CR>
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
" nnoremap <D-&> :BufferGoto 1<CR>
" nnoremap <D-é> :BufferGoto 2<CR>
" nnoremap <D-"> :BufferGoto 3<CR>
" nnoremap <D-'> :BufferGoto 4<CR>
" nnoremap <D-(> :BufferGoto 5<CR>
nnoremap <Leader>fr :Telescope resume<CR>
nnoremap <silent> <leader>gg :LazyGit<CR>
nnoremap QQ :qa!<CR>
nnoremap QS :wqa!<CR>
nnoremap <Leader>rr <cmd>Glance references<CR>
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
inoremap <C-^> ^

