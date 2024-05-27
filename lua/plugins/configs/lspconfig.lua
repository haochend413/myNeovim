return {
    --mason
    {
        "williamboman/mason.nvim",
        --here can add details for icons
    },
    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = { "rust_analyzer" },
            })
        end,
    },

    
    -- nvim-lspconfig
    {
        "neovim/nvim-lspconfig",
        event = "InsertEnter",
        config = function()
            local lspconfig = require("lspconfig")

            -- Define the on_attach function
            local function on_attach(client, bufnr)
                -- Your custom on_attach logic here
                -- For example:
                local opts = { noremap=true, silent=true }
                vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
                vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
            end

            -- Example configuration for a specific language server
            -- Replace 'pyright' with the language server of your choice
            lspconfig.pyright.setup{
                on_attach = on_attach,
            }

            -- Add more language servers here
            -- lspconfig.tsserver.setup{ on_attach = on_attach }
            -- lspconfig.sumneko_lua.setup{ on_attach = on_attach }
        end,
    },
}
