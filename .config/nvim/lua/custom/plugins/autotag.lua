return {
	"windwp/nvim-ts-autotag",
	dependencies = { "nvim-treesitter/nvim-treesitter" },
	config = function()
		require("nvim-ts-autotag").setup({
			-- New format configuration
			autotag = {
				enable = true,
				enable_rename = true,
				enable_close = true,
				enable_close_on_slash = true,
				filetypes = {
					"astro",
					"html",
					"javascript",
					"javascriptreact",
					"jsx",
					"markdown",
					"php",
					"svelte",
					"tsx",
					"typescript",
					"typescriptreact",
					"vue",
					"xml",
				},
			},
		})
	end,
	event = "InsertEnter",
}
