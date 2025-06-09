return {
	"williamboman/mason.nvim",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
	},
	config = function()
		-- import mason
		local mason = require("mason")

		-- import mason-lspconfig
		local mason_lspconfig = require("mason-lspconfig")

		local mason_tool_installer = require("mason-tool-installer")

		-- enable mason and configure icons
		mason.setup({
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		})

		mason_lspconfig.setup({
			-- list of servers for mason to install
			ensure_installed = {
				-- Web & Frontend
				"ts_ls", -- ✅ TypeScript/JavaScript
				"html",
				"cssls",
				"tailwindcss",
				"eslint",
				"stylelint_lsp",
				"svelte",
				"emmet_ls",
				"graphql",
				"astro",
				"unocss",
				"jsonls",
				"mdx_analyzer",

				-- Backend & API
				"prismals",
				"lua_ls",
				"pyright",
				"ruff",
				"sourcery",
				"pylazor",
				"pyrefly",

				-- Infra & DevOps
				"dockerls",
				"docker_compose_language_server",
				"ansiblels",
				"tflint",
				"terraformls",
				"gh_actions_ls",
				"bashls",

				-- Docs & Writing
				"grammarly",
				"markdown_oxide",

				-- Formatting & Linting Support
				"taplo",

				-- General Enhancers
				"basedpyright",
				"dprint",
			},
		})

		mason_tool_installer.setup({
			ensure_installed = {
				"prettier", -- prettier formatter
				"stylua", -- lua formatter
				"isort", -- python formatter
				"black", -- python formatter
				"pylint", -- python linter
				"eslint_d", -- js linter
			},
		})
	end,
}
