let mapleader = ' '
let maplocalleader = ","
nnoremap <D-p> :Telescope smart_open<CR>
ino <D-p> <ESC>:Telescope smart_open<CR>
nmap <Leader>ff :Telescope live_grep<CR>
nmap <c-f> :Neotree toggle<CR>
" nmap <c-f> :lua MiniFiles.open()<CR>
nmap <c-g> :LazyGit<CR>
nmap <Leader>zz :ZenMode<CR>
nmap gf :lua vim.diagnostic.open_float()<CR>
nnoremap <silent> <c-h> :wincmd h<CR>
nnoremap <silent> <c-l> :wincmd l<CR>
nnoremap <silent> <c-j> :wincmd j<CR>
nnoremap <silent> <c-k> :wincmd k<CR>
" nnoremap <D-r> :Navbuddy<CR>
nnoremap <D-r> :Telescope aerial<CR>
inoremap <D-s> <C-\><C-o>:w<CR><ESC>
nnoremap <D-s> :w<CR>
nmap <Leader>e :lua vim.lsp.buf.format({filter = function(client) return client.name ~= "tsserver" end})<CR>
nnoremap <C-t> :ToggleTermToggleAll<CR>
nno <C-b> :DBUIToggle<CR>
" nnoremap <silent><leader>h :lua require('harpeek').toggle()<CR>
nmap gb :Gitsigns blame_line<CR>
nnoremap <Leader>fr :Telescope resume<CR>
nnoremap <silent> <leader>gg :LazyGit<CR>
nnoremap QQ :qa!<CR>
function! s:conditionally_map_jj()
if &buftype == 'terminal'
    let l:term_cmd = getbufvar(bufnr('%'), 'term_title', '')
    if l:term_cmd !~ 'lazygit'
      tnoremap <buffer> jj <C-\><C-n>
      tnoremap <buffer> <Esc> <C-\><C-n>
    endif
  endif
endfunction

augroup TerminalMappings
  autocmd!
  autocmd TermOpen * call s:conditionally_map_jj()
augroup END ktnoremap <Esc> <C-\><C-n>
nnoremap ZA ZQ
nnoremap gd <cmd>vim.lsp.buf.definition<CR>
nnoremap gi <cmd>Glance implementation<CR>
nnoremap gr <CMD>Glance references<CR>
nnoremap <Leader>jf :%!jq '.'<CR>
nnoremap <Leader>js :%!jq -S .<CR>
nnoremap <Leader>db :DapToggleBreakpoint<CR>
nnoremap <Leader>dc :DapContinue<CR>
nnoremap <Leader>cp :CopilotChat<CR>
vnoremap <Leader>cp :CopilotChat<CR>

nmap <Leader>r :lua vim.lsp.buf.rename()<CR>
nnoremap <leader>xx <cmd>TroubleToggle<cr>
nnoremap <leader>dd <cmd>DBUIToggle<cr>
autocmd FileType sql,mysql,plsql lua require('cmp').setup.buffer({ sources = {{ name = 'vim-dadbod-completion' }} })
nmap <Leader>cc :noh<cr>
nmap <Leader>p :Oil<CR>
nnoremap <S-Left> :BufferMovePrevious<CR>
nnoremap <S-Right> :BufferMoveNext<CR>
nnoremap <D-s-t> :BufferRestore<CR>
imap <silent><expr> <Tab> luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<Tab>' 
" -1 for jumping backwards.
inoremap <silent> <S-Tab> <cmd>lua require'luasnip'.jump(-1)<CR>

snoremap <silent> <Tab> <cmd>lua require('luasnip').jump(1)<CR>
snoremap <silent> <S-Tab> <cmd>lua require('luasnip').jump(-1)<CR>

" For changing choices in choiceNodes (not strictly necessary for a basic setup).
imap <silent><expr> <C-E> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-E>'
smap <silent><expr> <C-E> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-E>'

" Noice
nnoremap <Leader>nh :Noice history<CR>
nnoremap <Leader>nl :Noice last<CR>
nnoremap <Leader>ne :Noice errors<CR>

" Jest
nmap <leader>jj :lua require("neotest").run.run()<CR>
"Neorg
nmap <leader>nj :Neorg journal today<CR>
nmap <leader>bo :%bd\|e#<cr>
