-- set leader key to space
vim.g.mapleader = " "

local keymap = vim.keymap -- for conciseness

---------------------
-- General Keymaps -------------------

-- Copying
keymap.set("n", "<leader>y", "ggVGy", { desc = "Copy entire file" })
keymap.set("v", "<leader>y", '"+y', { desc = "Copy selection to clipboard" })
keymap.set("n", "<leader>Y", '"+y$', { desc = "Copy to end of line to clipboard" })

-- Save & quit
keymap.set("n", "<leader>w", ":w<CR>", { desc = "Save file" })
keymap.set("n", "<leader>q", ":q<CR>", { desc = "Quit" })
keymap.set("n", "<leader>wq", ":wq<CR>", { desc = "Save and quit" })
keymap.set("n", "<leader>Q", ":q!<CR>", { desc = "Force quit without saving" })

-- Movement
keymap.set({ "n", "v" }, "H", "^", { desc = "Start of line" })
keymap.set({ "n", "v" }, "L", "$", { desc = "End of line" })
keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })

-- Toggle relative numbers
keymap.set("n", "<leader>rn", function()
  vim.wo.relativenumber = not vim.wo.relativenumber
end, { desc = "Toggle relative line numbers" })

-- Misc
keymap.set("n", "Q", "<nop>", { desc = "Disable Ex mode" })
keymap.set("n", "<leader><leader>", ":so<CR>", { desc = "Source current file" })

-- neovim + tmux
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tzer<CR>")

-- use jk to exit insert mode
keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })

-- clear search highlights
keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

-- delete single character without copying into register
-- keymap.set("n", "x", '"_x')

-- increment/decrement number
keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment number" }) -- increment
keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement number" }) -- decrement

-- make the current file executable
-- keymap.set("n", "<leader>x", ":!chmod +x %<CR>", { desc = "make the current file executable" })
-- this version suppresses the shell output (silent) unless there's an error
keymap.set("n", "<leader>x", function()
  vim.cmd("silent !chmod +x %")
end, { desc = "Make the current file executable" })

-- window management
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" }) -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" }) -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" }) -- make split windows equal width & height
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" }) -- close current split window

keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" }) -- open new tab
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" }) -- close current tab
keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" }) --  go to next tab
keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" }) --  go to previous tab
keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" }) --  move current buffer to new tab
