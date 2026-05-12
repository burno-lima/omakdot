return {
	{
		"gthelding/monokai-pro.nvim",
		config = function()
			require("monokai-pro").setup({
				filter = "ristretto",
				transparent_background = true,
				override = function()
					return {
						NonText = { fg = "#948a8b" },
					}
				end,
			})
			vim.cmd([[colorscheme monokai-pro]])
		end,
	},
	{
		"LazyVim/LazyVim",
		opts = {
			colorscheme = "monokai-pro",
		},
	},
}
