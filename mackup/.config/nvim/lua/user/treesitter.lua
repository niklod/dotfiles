local present, config = pcall(require, "nvim-treesitter.configs")

if not present then
   return
end

config.setup {
	ensure_installed = {
	      "lua",
	      "vim",
	      "go",
	 },
	highlight = {
		enable = true,
		use_languagetree = true,
	}
}
