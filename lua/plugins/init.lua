-- Install lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	-- bootstrap lazy.nvim
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end 
vim.opt.rtp:prepend(lazypath)



-- Configure lazy.nvim
require("lazy").setup({
	-- spec = {
	-- 	-- import plugins from plugins folder. 
	-- 	{ import = "plugins" },
	-- },
	defaults = { lazy = true, version = false }, -- always use the latest git commit
	install = { colorscheme = { "tokyonight"} },
	checker = { enabled = true }, -- automatically check for plugin updates
	performance = {
		rtp = {
			-- disable some rtp plugins
			disabled_plugins = {
				"gzip",
				"netrwPlugin",
				"tarPlugin",
				"tohtml",
				"tutor",
				"zipPlugin",
			},
		},
	},


	

	require("plugins.configs.colorscheme"),
	require("plugins.configs.lspconfig"),
	require("plugins.configs.nvim-cmp"),
	require("plugins.configs.lualine"),
	require("plugins.configs.nvim-tree"),
    require("plugins.configs.nvim-tmux-navigator"),
    require("plugins.configs.nvim-treesitter"),
    require("plugins.configs.rainbow-delimiters"),
	require("plugins.configs.comment"),
	require("plugins.configs.autopair"),
})
