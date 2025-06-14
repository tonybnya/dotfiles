return {
	"voldikss/vim-floaterm",
	config = function()
		-- Basic floaterm configuration
		vim.g.floaterm_shell = vim.o.shell
		vim.g.floaterm_title = "floaterm: $1/$2"
		vim.g.floaterm_wintype = "float"
		vim.g.floaterm_width = 0.8
		vim.g.floaterm_height = 0.8
		vim.g.floaterm_position = "center"
		vim.g.floaterm_borderchars = "─│─│┌┐┘└"
		vim.g.floaterm_rootmarkers = { ".project", ".git", ".hg", ".svn", ".root" }
		vim.g.floaterm_giteditor = true
		vim.g.floaterm_opener = "split"
		vim.g.floaterm_autoclose = 1
		vim.g.floaterm_autohide = 1
		vim.g.floaterm_autoinsert = true
		vim.g.floaterm_titleposition = "left"

		-- Custom highlighting (optional)
		vim.api.nvim_set_hl(0, "Floaterm", { bg = "#1e1e1e" })
		vim.api.nvim_set_hl(0, "FloatermBorder", { fg = "#61afef", bg = "#1e1e1e" })
		vim.api.nvim_set_hl(0, "FloatermNC", { fg = "#5c6370" })

		-- Key mappings
		-- vim.keymap.set('n', '<F7>', ':FloatermNew<CR>', { desc = 'New floaterm' })
		-- vim.keymap.set('t', '<F7>', '<C-\\><C-n>:FloatermNew<CR>', { desc = 'New floaterm' })
		--
		-- vim.keymap.set('n', '<F8>', ':FloatermPrev<CR>', { desc = 'Previous floaterm' })
		-- vim.keymap.set('t', '<F8>', '<C-\\><C-n>:FloatermPrev<CR>', { desc = 'Previous floaterm' })
		--
		-- vim.keymap.set('n', '<F9>', ':FloatermNext<CR>', { desc = 'Next floaterm' })
		-- vim.keymap.set('t', '<F9>', '<C-\\><C-n>:FloatermNext<CR>', { desc = 'Next floaterm' })
		--
		-- vim.keymap.set('n', '<F12>', ':FloatermToggle<CR>', { desc = 'Toggle floaterm' })
		-- vim.keymap.set('t', '<F12>', '<C-\\><C-n>:FloatermToggle<CR>', { desc = 'Toggle floaterm' })

		-- Alternative key mappings using leader key
		vim.keymap.set("n", "<leader>ft", ":FloatermNew<CR>", { desc = "New floaterm" })
		vim.keymap.set("n", "<leader>tt", ":FloatermToggle<CR>", { desc = "Toggle floaterm" })
		vim.keymap.set("n", "<leader>tn", ":FloatermNext<CR>", { desc = "Next floaterm" })
		vim.keymap.set("n", "<leader>tp", ":FloatermPrev<CR>", { desc = "Previous floaterm" })
		vim.keymap.set("n", "<leader>tk", ":FloatermKill<CR>", { desc = "Kill floaterm" })

		-- Terminal mode mappings
		vim.keymap.set("t", "<C-h>", "<C-\\><C-n><C-w>h", { desc = "Terminal left" })
		vim.keymap.set("t", "<C-j>", "<C-\\><C-n><C-w>j", { desc = "Terminal down" })
		vim.keymap.set("t", "<C-k>", "<C-\\><C-n><C-w>k", { desc = "Terminal up" })
		vim.keymap.set("t", "<C-l>", "<C-\\><C-n><C-w>l", { desc = "Terminal right" })
		vim.keymap.set("t", "<Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

		-- Custom commands for external tools (optional)
		vim.api.nvim_create_user_command("FZF", "FloatermNew fzf", {})
		vim.api.nvim_create_user_command("Ranger", "FloatermNew ranger", {})
		vim.api.nvim_create_user_command("Lazygit", "FloatermNew lazygit", {})
		vim.api.nvim_create_user_command("Htop", "FloatermNew htop", {})
		vim.api.nvim_create_user_command("Python", "FloatermNew python", {})
		vim.api.nvim_create_user_command("Node", "FloatermNew node", {})

		-- Custom ripgrep command
		vim.api.nvim_create_user_command("Rg", "FloatermNew --width=0.8 --height=0.8 rg", {})
		vim.keymap.set("n", "<leader>rg", ":Rg<CR>", { desc = "Ripgrep search" })
	end,
}
