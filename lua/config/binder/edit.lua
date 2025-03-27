local binder = require("binder")
local keys = binder.keys
local b = binder.b
local modes = binder.modes

return keys({
	a = keys({
		desc = "dial",
		prev = modes({
			n = b({
				function()
					require("flies.ioperations.dial").descend:exec()
				end,
			}),
		}),
		next = modes({
			n = b({
				function()
					require("flies.ioperations.dial").ascend:exec()
				end,
			}),
		}),
	}),
	c = modes({
		n = b({
			"req",
			"flies.operations.act",
			"exec",
			{ around = "never" },
			false,
			"c",
		}),
		x = b({ "c" }),
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
			"d",
		}),
		x = b({ "d" }),
	}),
	e = b({
		desc = "swap",
		function()
			require("flies.operations.swap").exec("n")
		end,
	}),
	m = b({ "J", "join", modes = "nx" }),
	o = keys({
		prev = b({ "O" }),
		next = b({ "o" }),
	}),
	t = b({
		desc = "reindent",
		"=",
		modes = "nx",
	}),
	v = keys({
		desc = "paste",
		prev = b({
			"keys",
			"P",
			modes = "nx",
		}),
		next = b({
			"keys",
			"p",
			modes = "nx",
		}),
	}),
	w = b({
		desc = "open-close",
		function()
			require("flies.ioperations.toggle"):exec()
		end,
	}),
	x = b({
		desc = "explode",
		function()
			require("flies.operations.explode"):call()
		end,
		modes = "nx",
	}),
	y = b({
		desc = "wrap",
		function()
			require("flies.operations.wrap"):call()
		end,
		modes = "nx",
	}),
	z = b({
		desc = "substitute",
		function()
			require("flies.operations.substitute"):call()
		end,
	}),
	["<tab>"] = modes({
		nx = keys({
			prev = b({ "<<" }),
			next = b({ ">>" }),
		}),
	}),
	["<cr>"] = keys({
		prev = b({
			function()
				require("my.utils.blank_line").blank_line(false)
			end,
		}),
		next = b({
			function()
				require("my.utils.blank_line").blank_line(true)
			end,
		}),
	}),
})
