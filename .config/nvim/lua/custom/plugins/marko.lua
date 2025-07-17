return {
	"developedbyed/marko.nvim",
	config = function()
		-- require("marko").setup({
		-- 	width = 100,
		-- 	height = 100,
		-- 	border = "rounded",
		-- 	title = " Marks ",
		-- })
    require('marko').setup({
    -- Popup window dimensions
    width = 100,
    height = 100,
    
    -- Border style: 'rounded', 'single', 'double', 'solid', 'shadow'
    border = "rounded",
    
    -- Popup title
    title = " Marko ",
    
    -- Default keymap to open popup (set to false to disable)
    default_keymap = '"',
    
    -- Key mappings within popup
    keymaps = {
      delete = "d",
      goto = "<CR>",
      close = "<Esc>",
    },
    
    -- Show marks from all buffers or just current buffer
    show_all_buffers = false,
    
    -- Exclude certain marks from display
    exclude_marks = { "'", "`", "^", ".", "[", "]", "<", ">" },
    
    -- Virtual text configuration
    virtual_text = {
      enabled = true,        -- Enable virtual text marks
      icon = "●",           -- Icon to display
      hl_group = "Comment", -- Highlight group
      position = "eol",     -- Position: "eol" or "overlay"
    },
  })
	end,
}
