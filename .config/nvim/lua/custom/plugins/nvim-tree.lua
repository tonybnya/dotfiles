return {
  'nvim-tree/nvim-tree.lua',
  version = '*',
  lazy = false,
  dependencies = {
    'nvim-tree/nvim-web-devicons',
  },
  config = function()
    -- Disable netrw at the very start of your init.lua
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1

    -- Set termguicolors to enable highlight groups
    vim.opt.termguicolors = true

    require('nvim-tree').setup {
      view = {
        width = 35,
        relativenumber = true,
      },
      -- Change folder arrow icons
      renderer = {
        indent_markers = {
          enable = true,
        },
        icons = {
          glyphs = {
            folder = {
              arrow_closed = '', -- arrow when folder is closed
              arrow_open = '', -- arrow when folder is open
            },
          },
        },
      },
      -- Disable window_picker for explorer to work well with window splits
      actions = {
        open_file = {
          window_picker = {
            enable = false,
          },
        },
      },
      filters = {
        custom = { '.DS_Store' },
      },
      git = {
        ignore = false,
      },
    }

    -- Set keymaps
    vim.keymap.set('n', '<leader>ee', '<cmd>NvimTreeToggle<cr>', { desc = 'Toggle file explorer' })
    vim.keymap.set('n', '<leader>ef', '<cmd>NvimTreeFindFileToggle<cr>', { desc = 'Toggle file explorer on current file' })
    vim.keymap.set('n', '<leader>ec', '<cmd>NvimTreeCollapse<cr>', { desc = 'Collapse file explorer' })
    vim.keymap.set('n', '<leader>er', '<cmd>NvimTreeRefresh<cr>', { desc = 'Refresh file explorer' })
  end,
}
