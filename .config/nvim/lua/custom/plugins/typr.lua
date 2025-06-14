return {
	"nvzone/typr",
	cmd = "Typr", -- Load plugin only when Typr command is used
	keys = {
		{ "<leader>ty", "<cmd>Typr<cr>", desc = "Open Typr typing test" },
		{ "<leader>ts", "<cmd>TyprStats<cr>", desc = "Show Typr statistics" },
	},
	config = function()
		require("typr").setup({
			-- Optional: Add any custom configuration here
			-- The plugin works with default settings out of the box
		})
	end,
}
