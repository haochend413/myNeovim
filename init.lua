require('core.options')
require("core.keymaps")
require("plugins")

vim.api.nvim_create_autocmd("User", {
	pattern = "VeryLazy",
	callback = function()
		require("core.autocmds")
		
	end,
})

