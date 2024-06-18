vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.g.loaded_matchparen = 1 -- disable built-in MatchParen for macOSX
-- vim.g.matchparen_timeout = 2
-- vim.g.matchparen_insert_timeout = 2

vim.opt.termguicolors = true
vim.g.minimap_git_colors = 1
vim.wo.relativenumber = true
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)
require('lazy').setup 'plugins'
vim.g.db_adapter_bigquery_region = 'kaya'
-- vim.cmd.colorscheme 'kanagawa-dragon'
vim.cmd.colorscheme 'rose-pine-moon'
-- vim.cmd.colorscheme 'ayu'
-- vim.cmd.colorscheme 'onenord'
-- vim.cmd 'hi IlluminatedWordRead guibg=#525252'
vim.api.nvim_set_hl(0, 'IlluminatedWordRead', { link = 'Visual' })
local _border = 'single'
vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(vim.lsp.handlers.hover, {
  border = _border,
})
vim.diagnostic.config {
  float = { border = 'rounded' },
}
vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(vim.lsp.handlers.signature_help, {
  border = _border,
})
vim.opt.ignorecase = true -- Make searches case insensitive
vim.opt.smartcase = true -- Make searches case sensitive if there's an uppercase letter in the search
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    -- Buffer local mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local opts = { buffer = ev.buf }
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
    vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
    vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
    vim.keymap.set('n', '<space>wl', function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, opts)
    vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
    vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
    vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
    vim.keymap.set('n', '<space>f', function()
      vim.lsp.buf.format { async = true }
    end, opts)
  end,
})
function Grapple_files()
  local contents = {}
  local tags = require('grapple').tags()
  local selected_index = require('grapple').name_or_index()
  local current_file_path = vim.fn.fnamemodify(vim.fn.expand '%:p', ':.')

  local function is_real_buffer(buffer)
    if buffer == -1 then
      return false
    end
    local buftype = vim.api.nvim_buf_get_option(buffer, 'buftype')
    local filetype = vim.api.nvim_buf_get_option(buffer, 'filetype')
    return buftype == '' and filetype ~= 'TelescopePrompt'
  end

  local current_in_list = false

  for index, tag in ipairs(tags) do
    local grapple_file_path = tag.path
    local buffer_number = vim.fn.bufnr(grapple_file_path)

    local file_name = grapple_file_path == '' and '(empty)' or vim.fn.fnamemodify(grapple_file_path, ':t')

    -- Add padding around the text
    local padded_file_name = string.format(' %s ', file_name)
    local padded_index = string.format(' %s. ', index)

    if current_file_path == grapple_file_path or index == selected_index then
      current_in_list = true
      table.insert(contents, string.format('%%#GrappleSelected#%s%s', padded_index, padded_file_name))
    else
      table.insert(contents, string.format('%%#GrappleInactive#%s%s', padded_index, padded_file_name))
    end

    ::continue::
  end

  -- If the current buffer is not in the Grapple list and is a real buffer, add it at the end with a special highlight
  local current_buffer_number = vim.fn.bufnr(current_file_path)
  if not current_in_list and is_real_buffer(current_buffer_number) then
    local current_file_name = vim.fn.fnamemodify(current_file_path, ':t')
    local padded_file_name = string.format(' %s ', current_file_name)
    table.insert(contents, string.format('%%#GrappleCurrentBuffer# %s ', padded_file_name))
  end

  table.insert(contents, '%#GrappleInactive#')
  return table.concat(contents, ' ')
end

-- Set up autocommand to update the tabline with grapple tags
vim.opt.showtabline = 2
vim.api.nvim_create_autocmd({ 'BufEnter', 'BufAdd', 'User' }, {
  callback = function(ev)
    vim.o.tabline = Grapple_files()
  end,
})

-- Define the highlight groups
vim.cmd [[
  highlight GrappleSelected guifg=#e0def4 guibg=#393552 gui=underline guisp=#f6c177
  highlight GrappleInactive guifg=#908caa guibg=#2a273f
  highlight GrappleCurrentBuffer guifg=#e0def4 guibg=#2a273f gui=underline guisp=#9ccfd8
]]
