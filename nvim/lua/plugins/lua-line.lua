return {
    'nvim-lualine/lualine.nvim',
    config = function(_, opts) 
	require'lualine'.setup() 
    end,
    dependencies = { 'nvim-tree/nvim-web-devicons' }
}
