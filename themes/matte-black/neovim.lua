return {
	{
		"tahayvr/matteblack.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			vim.cmd.colorscheme("matteblack")
			vim.api.nvim_set_hl(0, "Normal", { bg = "NONE" })
			vim.api.nvim_set_hl(0, "NormalNC", { bg = "NONE" })
			vim.api.nvim_set_hl(0, "NormalFloat", { bg = "NONE" })
			vim.api.nvim_set_hl(0, "SignColumn", { bg = "NONE" })
			vim.api.nvim_set_hl(0, "EndOfBuffer", { bg = "NONE" })
		end,
	},
	{
		"LazyVim/LazyVim",
		opts = {
			colorscheme = "matteblack",
		},
	},
}