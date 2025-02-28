local M = {}

function M.setup()
	local directions = require("my.parameters").directions
	local binder = require("binder")
	local keys = binder.keys
	local b = binder.b
	local modes = binder.modes
	binder.bind(keys({
		c = modes({
			n = b({
				"req",
				"flies.operations.act",
				"exec",
				{ around = "never" },
				false,
				'"_c',
			}),
			x = b({ '"_c' }),
		}),
		d = modes({
			n = b({
				"req",
				"flies.operations.act",
				"exec",
				{
					domain = "outer",
					around = "always",
				},
				false,
				'"_d',
			}),
			x = b({ '"_d' }),
		}),
		e = b({
			desc = "move up right inner",
			"req",
			"flies.actions.move",
			"move",
			"n",
			{
				domain = "outer",
				around = "never",
				move = "right",
			},
			modes = "nx",
		}),
		f = modes({
			n = b({
				"req",
				"flies.actions.move",
				"move",
				"n",
				{ axis = "forward", move = "left", domain = "outer" },
			}),
			o = b({
				"req",
				"flies.actions.move",
				"move",
				"o",
				{ axis = "forward", domain = "outer" },
			}),
			x = b({
				"req",
				"flies.actions.move",
				"move",
				"x",
				{ axis = "forward", domain = "outer" },
			}),
		}),
		h = require("config.binder.edit"),

		n = modes({
			nx = b({ "req", "flies.actions.move_again", "next" }),
		}),
		p = modes({
			nx = b({ "req", "flies.actions.move_again", "prev" }),
		}),
		s = modes({
			n = b({
				"req",
				"flies.actions.move",
				"move",
				"n",
				{ axis = "hint", domain = "outer" },
			}),
			x = b({
				"req",
				"flies.actions.move",
				"move",
				"x",
				{ axis = "hint", domain = "outer" },
			}),
		}),
		V = b({ "<c-v>", modes = "nxo" }),
		v = modes({
			x = b({ "V" }),
			n = b({
				"req",
				"flies.actions.select",
				"select",
				{
					domain = "outer",
					around = "always",
				},
			}),
		}),
		w = b({
			desc = "move up left outer",
			"req",
			"flies.actions.move",
			"move",
			"n",
			{
				domain = "outer",
				around = "never",
				move = "left",
			},
			modes = "nx",
		}),
		y = modes({
			n = b({
				function()
					require("flies.operations.act").exec({ domain = "outer", around = "never" }, nil, "y")
				end,
			}),
			x = b({ "y" }),
		}),
		[directions.right] = b({ "keys", "l", desc = "right", modes = "nxo" }),
		[directions.left] = b({ "keys", "h", desc = "left", modes = "nxo" }),
		[directions.up] = b({ "keys", "gk", desc = "up", modes = "nxo" }),
		[directions.down] = b({ "keys", "gj", desc = "down", modes = "nxo" }),
	}))
end

return M
