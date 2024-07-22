require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "kj", "<ESC>")

vim.g.mapleader = " "

-- normal mode
map("i", "kj", "<Esc>")

-- save file with ctrl-s
map("n", "<C-s>", ":w<CR>", { noremap = true })
map("i", "<C-s>", "<C-o>:write<CR>a", { noremap = true })

-- for clearing highlight on search
map("n", "<leader>nh", ":nohl<CR>", { desc = "clear search highlights" })

-- J to move the current line down
map("n", "J", ":m .+1<CR>==", { desc = "move line down", noremap = true, silent = true })
-- K to move the current line up (use g? to show docs for something)
map("n", "K", ":m .-2<CR>==", { desc = "move line up", noremap = true, silent = true })

-- increment or decrement numbers
map("n", "<leader>+", "<C-a>", { desc = "increment number" })
map("n", "<leader>-", "<C-a>", { desc = "decrement number" })

-- spliting windows
map("n", "<leader>ss", ":vsplit<CR>", { desc = "split window vertically" })
map("n", "<leader>sh", ":split<CR>", { desc = "split window horizontally" })
map("n", "<leader>sv", "<C-w>=", { desc = "make windows equal size" })
map("n", "<leader>sl", "<cmd>close<CR>", { desc = "close current split" })

-- tab management
map("n", "<leader>tt", "<cmd>tabnew<CR>", { desc = "open new tab" })
map("n", "<leader>tl", "<cmd>tabclose<CR>", { desc = "close current tab" })
map("n", "L", "<cmd>tabn<CR>", { desc = "go to next tab" })
map("n", "H", "<cmd>tabp<CR>", { desc = "go to prev tab" })
map("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "open current buffer in new tab" })

-- telescope
map("n", "<leader><leader>", "<cmd>Telescope find_files<cr>", { desc = "fuzzy find files in cwd" })
map("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>", { desc = "fuzzy find recent files" })
map("n", "<leader>fs", "<cmd>Telescope live_grep<cr>", { desc = "find string in cwd" })
map("n", "<leader>fc", "<cmd>Telescope grep_string<cr>", { desc = "find string under cursor in cwd" })
map("n", "<leader>ft", "<cmd>TodoTelescope<cr>", { desc = "find todos" })
