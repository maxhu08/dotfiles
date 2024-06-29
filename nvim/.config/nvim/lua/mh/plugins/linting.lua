return {
	"mfussenegger/nvim-lint",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local lint = require("lint")

		local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

		lint.linters_by_ft = {
			typescript = { "biomejs", "eslint_d", "eslint" },
			javascript = { "biomejs", "eslint_d", "eslint" },
			typescriptreact = { "biomejs", "eslint_d", "eslint" },
			javascriptreact = { "biomejs", "eslint_d", "eslint" },
		}

		local eslint = lint.linters.eslint_d

		eslint.args = {
			"--no-warn-ignored", -- <-- this is the key argument
			"--format",
			"json",
			"--stdin",
			"--stdin-filename",
			function()
				return vim.api.nvim_buf_get_name(0)
			end,
		}

		vim.api.nvim_create_autocmd({ "BufWritePost" }, {
			group = lint_augroup,
			callback = function()
				lint.try_lint()
			end,
		})

		vim.keymap.set("n", "<leader>ll", function()
			lint.try_lint()
		end, { desc = "trigger linting for current file" })
	end,
}
