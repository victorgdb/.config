let mapleader = ' '
let maplocalleader = ","
nnoremap <D-p> :Telescope smart_open<CR>
ino <D-p> <ESC>:Telescope smart_open<CR>
nmap <Leader>ff :Telescope live_grep<CR>
" nmap <c-f> :lua minifiles_toggle<CR>
nmap <c-g> :LazyGit<CR>
nmap <Leader>zz :ZenMode<CR>
nmap gf :lua vim.diagnostic.open_float()<CR>
nmap <Leader>yy :%y<CR>
nmap <Leader>vv ggVG
" nnoremap <silent> <c-h> :wincmd h<CR>
" nnoremap <silent> <c-l> :wincmd l<CR>
" nnoremap <silent> <c-j> :wincmd j<CR>
" nnoremap <silent> <c-k> :wincmd k<CR>
" nnoremap <D-r> :Navbuddy<CR>
"

nmap <BS> :b #<CR>
vnoremap x "_d
nnoremap <D-r> :Telescope aerial<CR>
nnoremap <M-r> :Telescope aerial<CR>
inoremap <D-s> <C-\><C-o>:w<CR><ESC>
nnoremap <D-s> :w<CR>

" Shit symbols
inoremap <C-j> {}<Esc>i
inoremap <C-k> []<Esc>i

nmap <C-e> <C-u>
nno <C-b> :DBUIToggle<CR>
" nnoremap <silent><leader>h :lua require('harpeek').toggle()<CR>
nmap gb :Gitsigns blame_line<CR>
nnoremap <Leader>fr :Telescope resume<CR>
nnoremap <silent> <leader>gg :LazyGit<CR>

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
nnoremap dv :DiffviewFileHistory %<CR>
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

" Noice
nnoremap <Leader>nh :Noice history<CR>
nnoremap <Leader>nl :Noice last<CR>
nnoremap <Leader>ne :Noice errors<CR>
nmap U <cmd>lua vim.lsp.buf.code_action({ context = { only = { "source.addMissingImports" } }, apply = true, silent = true })<CR>
nmap R %


nmap <Leader>tt :TT<CR>
nmap <Leader>tr :TR<CR>

" Obsidian
nmap <Leader>ot :ObsidianToday<CR>
nmap <Leader>od :ObsidianDailies<CR>
nmap <Leader>os :ObsidianSearch<CR>
nmap <Leader>on :ObsidianNew<CR>
nmap <Leader>ow :ObsidianWorkspace<CR>

" navigation
nmap <Leader>nc :cd ~/Documents/Dev/carbonfact<CR>
nmap <Leader>np :cd ~/Documents/Dev/carbonfact/platform<CR>
nmap <Leader>nn :cd ~/Documents/Dev/carbonfact/niklas<CR>

" Jest
nmap <leader>jj :lua require("neotest").run.run()<CR>
"Neorg
nmap <leader>nj :Neorg journal today<CR>
nmap <leader>bo :%bd\|e#<cr>

nmap QQ <cmd>qa!<CR>

" Grapple
nmap <D-s-p> :Telescope grapple tags<cr>
