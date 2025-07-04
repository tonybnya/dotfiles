-- markdown-preview.nvim
return {
	"iamcco/markdown-preview.nvim",
	ft = { "markdown" },
	build = "cd app && npm install",
	init = function()
		vim.g.mkdp_filetypes = { "markdown" }
		vim.g.mkdp_auto_start = 0
		vim.g.mkdp_auto_close = 1
		vim.g.mkdp_theme = "dark"

		vim.g.mkdp_browserfunc = "OpenMarkdownPreview"
		vim.cmd([[
      function! OpenMarkdownPreview(url)
        silent execute '!open '.a:url
      endfunction
    ]])
	end,
}
