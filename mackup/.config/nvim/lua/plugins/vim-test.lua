return {
	"vim-test/vim-test",
	keys = {
		{ "<Leader>tr", "<cmd>TestNearest -strategy=vimux -v<cr>", desc = "Run nearest test", remap = true },
		{ "<Leader>tl", "<cmd>TestLast -strategy=vimux -v<cr>", desc = "Run last test", remap = true },
	},
}
