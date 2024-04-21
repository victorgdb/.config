-- status notifications on bottom right
return {
  'j-hui/fidget.nvim',
  config = function(_, opts)
    require('fidget').setup({
    integration = {
      ['nvim-tree'] = {
        enable = true, -- Integrate with nvim-tree/nvim-tree.lua (if installed)
      },
    },
    notification = {
	    window = {
		    winblend = 0
	    }
    }
    -- options
  })
  end,
}
