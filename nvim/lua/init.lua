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

-- vim.cmd.colorscheme 'kanagawa-dragon'
-- vim.cmd.colorscheme 'rose-pine-moon'
-- vim.cmd.colorscheme 'nordic'
vim.cmd.colorscheme 'catppuccin'
-- vim.cmd.colorscheme 'nightfox'
-- vim.cmd.colorscheme 'catppuccin'
-- vim.cmd.colorscheme 'ayu'
-- vim.cmd.colorscheme 'onenord'
-- vim.cmd 'hi IlluminatedWordRead guibg=#525252'

vim.api.nvim_set_hl(0, 'IlluminatedWordRead', { link = 'Visual' })

vim.opt.ignorecase = true -- Make searches case insensitive
vim.opt.smartcase = true -- Make searches case sensitive if there's an uppercase letter in the search

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

    if buffer_number == -1 or not vim.fn.filereadable(grapple_file_path) then
      goto continue
    end

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

vim.cmd [[
   highlight Search ctermfg=NONE ctermbg=NONE guifg=NONE guibg=NONE
   highlight link Search LspReferenceText
  highlight GrappleSelected guifg=#e0def4 guibg=#393552 gui=underline guisp=#f6c177
  highlight GrappleInactive guifg=#908caa guibg=#2a273f
  highlight GrappleCurrentBuffer guifg=#e0def4 guibg=#2a273f gui=underline guisp=#9ccfd8
]]

local palette = require 'nordic.colors'
-- Define the highlight groups
--   highlight NeoTreeCursorLine guibg=%s
-- highlight NeoTreeGitUntracked guifg=%s
-- highlight NeoTreeFileName guibg=%s
-- highlight NeoTreeNormal guibg=%s
-- highlight NeoTreeNormalNC guibg=%s

-- vim.cmd(string.format(
--   [[
--   highlight Search ctermfg=NONE ctermbg=NONE guifg=NONE guibg=NONE
--   highlight link Search LspReferenceText
--   highlight GrappleInactive guifg=#908caa guibg=#2a273f
--   highlight GrappleCurrentBuffer guifg=#e0def4 guibg=#2a273f gui=underline guisp=#9ccfd8
-- ]],
--   palette.gray2,
--   palette.orange.base,
--   palette.black1,
--   palette.black1,
--   palette.black1
-- ))
