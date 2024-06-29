return {
	"echasnovski/mini.indentscope",
	version = false, -- wait till new 0.7.0 release to put it back on semver
	event = { "BufReadPre", "BufNewFile" },
	opts = {
		draw = {
			-- delay (in ms) between event and start of drawing scope indicator
			delay = 100,
		},
		mappings = {
			-- textobjects
			object_scope = "ii",
			object_scope_with_border = "ai",

			-- motions (jump to respective border line; if not present - body line)
			goto_top = "[i",
			goto_bottom = "]i",
		},
		-- options which control scope computation
		options = {
			border = "both",
			indent_at_cursor = true,
			try_as_border = false,
		},

		-- Which character to use for drawing scope indicator
		symbol = "│",
	},
}
