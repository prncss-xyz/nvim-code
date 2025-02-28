return {
	{
		"prncss-xyz/binder.nvim",
		config = function()
			local binder = require("binder")
			binder.setup({
				dual_key = require("binder.utils").prepend("p"),
				bind_keymap = function(args)
					vim.keymap.set(args.modes, args.lhs, args.cb, {
						desc = args.desc,
						expr = args.expr,
						silent = args.silent,
						remap = args.remap,
					})
				end,
			})
			require("config.binder").setup()
		end,
	},
}
