return {
	"nvim-tree/nvim-tree.lua",
	dependencies = "nvim-tree/nvim-web-devicons",
	config = function()
		local nvimtree = require("nvim-tree")

		-- recommended settings from nvim-tree docs
		vim.g.loaded_netrw = 1
		vim.g.loaded_netrwPlugin = 1

		nvimtree.setup({
			view = {
				width = 35,
				number = false,
				-- relativenumber = true,
			},
			-- change folder arrow icons
			renderer = {
				indent_markers = {
					enable = true,
					icons = {
						corner = "│",
						edge = "│",
						item = "│",
						bottom = "│",
						none = "│",
					},
				},
				icons = {
					glyphs = {
						folder = {
							arrow_closed = "→", -- arrow when folder is closed
							arrow_open = "↓", -- arrow when folder is open
						},
					},
				},
			},
			-- disable window_picker for
			-- explorer to work well with
			-- window splits
			actions = {
				open_file = {
					window_picker = {
						enable = false,
					},
				},
			},
			filters = {
				custom = { ".DS_Store" },
			},
			git = {
				ignore = false,
			},
		})

		-- set keymaps
		local keymap = vim.keymap -- for conciseness

		-- keymap.set("n", "<leader>e", "<cmd>NvimTreeToggle<CR>", { desc = "toggle file explorer" })
		keymap.set(
			"n",
			"<leader>e",
			"<cmd>NvimTreeFindFileToggle<CR>",
			{ desc = "toggle file explorer on current file" }
		)
		-- keymap.set("n", "<leader>ec", "<cmd>NvimTreeCollapse<CR>", { desc = "collapse file explorer" })
		-- keymap.set("n", "<leader>er", "<cmd>NvimTreeRefresh<CR>", { desc = "refresh file explorer" })
	end,
}
