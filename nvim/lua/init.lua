local should_profile = os.getenv 'NVIM_PROFILE'
if should_profile then
  require('profile').instrument_autocmds()
  if should_profile:lower():match '^start' then
    require('profile').start '*'
  else
    require('profile').instrument '*'
  end
end
local function toggle_profile()
  local prof = require 'profile'
  if prof.is_recording() then
    prof.stop()
    vim.ui.input({ prompt = 'Save profile to:', completion = 'file', default = 'profile.json' }, function(filename)
      if filename then
        prof.export(filename)
        vim.notify(string.format('Wrote %s', filename))
      end
    end)
  else
    vim.notify 'Profile started'
    prof.start '*'
  end
end
vim.keymap.set('', '<Leader>pr', toggle_profile)

vim.opt.clipboard = ''
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
-- vim.g.loaded_matchparen = 1 -- disable built-in MatchParen for macOSX
vim.g.matchparen_timeout = 2
vim.g.matchparen_insert_timeout = 2
vim.opt.termguicolors = true
vim.g.minimap_git_colors = 1
vim.wo.relativenumber = true
vim.opt.swapfile = false

-- local U = require 'utils.chars'
-- Map the key combination to the toggle function
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
require('lazy').setup {
  spec = {
    import = 'plugins',
  },
  ui = { border = { '🭽', '▔', '🭾', '▕', '🭿', '▁', '🭼', '▏' } },
}
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
-- vim.cmd.colorscheme 'kanagawa-dragon'
-- vim.cmd.colorscheme 'rose-pine-moon'
vim.cmd.colorscheme 'nordic'
-- vim.cmd.colorscheme 'catppuccin'
-- vim.cmd.colorscheme 'nightfox'
-- vim.cmd.colorscheme 'catppuccin'
-- vim.cmd.colorscheme 'ayu'
-- vim.cmd.colorscheme 'onenord'
-- vim.cmd 'hi IlluminatedWordRead guibg=#525252'

vim.api.nvim_set_hl(0, 'IlluminatedWordRead', { link = 'Visual' })

vim.opt.ignorecase = true -- Make searches case insensitive
vim.opt.smartcase = true  -- Make searches case sensitive if there's an uppercase letter in the search

-- Define the toggle function
local minifiles_toggle = function()
  if not MiniFiles.close() then
    MiniFiles.open(vim.api.nvim_buf_get_name(0))
    MiniFiles.reveal_cwd()
  end
end
vim.keymap.set('n', '<c-f>', minifiles_toggle)

function _G.snake_to_camel()
  local s = vim.fn.getline(".")
  local cursor = vim.fn.getcurpos()

  -- Replace snake_case with camelCase
  s = string.gsub(s, "_%a", function(c)
    return string.upper(string.sub(c, 2))
  end)

  -- Update the current line with the new string
  vim.fn.setline(".", s)
  vim.fn.setpos(".", cursor)
end

-- Key mapping to trigger the snake_to_camel function
vim.api.nvim_set_keymap("n", "<leader>nn", ":lua snake_to_camel()<CR>", { noremap = true, silent = true })
