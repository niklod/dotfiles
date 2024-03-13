-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

local function augroup(name)
	return vim.api.nvim_create_augroup("lazyvim_" .. name, { clear = true })
end

vim.api.nvim_create_autocmd("VimEnter", {
	group = augroup("telescope_startup"),
	callback = function()
		if vim.fn.argv(0) == "" then
			require("telescope.builtin").find_files()
		end
	end,
})

vim.api.nvim_create_autocmd("BufWritePost", {
	pattern = { "*tmux.conf" },
	command = "execute 'silent !tmux source <afile> --silent'",
})

vim.api.nvim_create_autocmd("BufWritePost", {
	pattern = { "config.fish" },
	command = "execute 'silent !source <afile> --silent'",
})

vim.api.nvim_create_autocmd("BufWritePost", {
	pattern = { ".yabairc" },
	command = "!yabai --restart-service",
})

vim.api.nvim_create_autocmd("BufWritePost", {
	pattern = { ".skhdrc" },
	command = "!brew services restart skhd",
})

vim.api.nvim_create_autocmd({ "BufNewFile", "BufFilePre", "BufRead" }, {
	pattern = { "*.mdx", "*.md" },
	callback = function()
		vim.cmd([[set filetype=markdown wrap linebreak nolist nospell]])
	end,
})
