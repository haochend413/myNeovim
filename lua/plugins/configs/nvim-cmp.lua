return {
    {
		"L3MON4D3/LuaSnip",
		-- follow latest release.
		version = "v2.*", -- the latest released major (first number of latest release)
		dependencies = { "rafamadriz/friendly-snippets" },
	},

	{
		"hrsh7th/nvim-cmp",
		version = false, -- last release is way too old
		event = "InsertEnter",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"saadparwaiz1/cmp_luasnip",
			
		}, 
		opts = function()
			local cmp = require("cmp") 
			return {
				completion = {
					completeopt = "menu,menuone,noinsert",
				},
				snippet = {
					expand = function(args)
						require("luasnip").lsp_expand(args.body)
					end,
				},
				mapping = cmp.mapping.preset.insert({
					["<C-j>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
					["<S-j>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
					["<C-k>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
					["<S-k>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
					["<C-n>"] = cmp.mapping.scroll_docs(-4),
					["<C-p>"] = cmp.mapping.scroll_docs(4),
					["<C-Space>"] = cmp.mapping.complete(),
					["<C-e>"] = cmp.mapping.abort(),
					["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
					--["<S-f>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
					["<C-l>"] = cmp.mapping({
						i = function(fallback)
							if require("luasnip").choice_active() then
								require("luasnip.extras.select_choice")()
							else
								fallback()
							end
						end,
					}),
				}),
                
				sources = cmp.config.sources({
					{ name = "nvim_lsp" },
					{ name = "luasnip" },
					{ name = "buffer" },
					{ name = "path" },
					-- { name = "cmdline" },
					-- { name = "copilot" },
				}),
				formatting = {
					format = function(_, item)
						local icons = require("core").icons.kinds
						if icons[item.kind] then
							item.kind = icons[item.kind] .. item.kind
						end
						return item
					end,
				},
				experimental = {
					ghost_text = {
						hl_group = "LspCodeLens",
					},
				},
			}
		end,
	},
}
