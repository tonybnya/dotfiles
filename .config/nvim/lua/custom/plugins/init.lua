-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
	{
		"rebelot/kanagawa.nvim",
		lazy = false, -- or true if you load it later manually
		priority = 1000, -- ensure it loads before setting the colorscheme
		config = function()
			-- vim.cmd("colorscheme kanagawa")
			vim.cmd.colorscheme("kanagawa")
		end,
	},
}
