vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

return {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    -- disable netrw at the very start of your init.lua

    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
        require("nvim-tree").setup({
            -- sort = {
            --   sorter = "case_sensitive",
            -- },
            -- view = {
            --   width = 30,
            -- },
            -- renderer = {
            --   group_empty = true,
            -- },
            -- filters = {
            --   dotfiles = true,
            -- },
        })
    end,
  }