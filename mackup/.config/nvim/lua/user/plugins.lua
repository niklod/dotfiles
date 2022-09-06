local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

-- Install your plugins here
return packer.startup(function(use)
    use 'ray-x/go.nvim'
    use 'ray-x/guihua.lua'
    use 'wbthomason/packer.nvim'
    use "nvim-lua/popup.nvim"
    use 'rebelot/kanagawa.nvim'
    use 'kyazdani42/nvim-web-devicons'
    use 'kyazdani42/nvim-tree.lua'
    use 'nvim-lua/plenary.nvim'
    use 'tpope/vim-repeat'
    use 'tpope/vim-commentary'
    use 'windwp/nvim-autopairs'
    use 'dkarter/bullets.vim'
    use 'github/copilot.vim'
    use 'ggandor/leap.nvim'

    use 'nvim-telescope/telescope.nvim'
    use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
    use {'nvim-telescope/telescope-file-browser.nvim' }
    use 'nvim-telescope/telescope-dap.nvim'
    use {'gbrlsnchs/telescope-lsp-handlers.nvim' }
    -- use {'akinsho/bufferline.nvim', tag = "v2.*", requires = 'kyazdani42/nvim-web-devicons'}

    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
    use 'nvim-treesitter/nvim-treesitter-textobjects'
    use { 'lewis6991/gitsigns.nvim', requires = { 'nvim-lua/plenary.nvim' }, }
    use { 'nvim-lualine/lualine.nvim', requires = { 'kyazdani42/nvim-web-devicons', opt = true } }
    use { 'tpope/vim-surround' }

    -- Markdown
    -- use({ "iamcco/markdown-preview.nvim", run = function() vim.fn["mkdp#util#install"]() end })

    -- Movements
    use { 'phaazon/hop.nvim', branch = 'v1' }

    -- Debug
    use 'sebdah/vim-delve'
    use 'mfussenegger/nvim-dap'
    use 'theHamsta/nvim-dap-virtual-text'
    use { "rcarriga/nvim-dap-ui", requires = {"mfussenegger/nvim-dap"}, }

    -- LSP
    use 'neovim/nvim-lspconfig'
    use "williamboman/nvim-lsp-installer"
    use 'folke/lsp-colors.nvim'

    -- Completion
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-cmdline'
    use 'hrsh7th/nvim-cmp'
    use 'saadparwaiz1/cmp_luasnip'
    use "b0o/schemastore.nvim"
    -- use {
    --   "zbirenbaum/copilot.lua",
    --   event = {"VimEnter"},
    --   config = function()
    --     vim.defer_fn(function()
    --       require("copilot").setup()
    --     end, 100)
    --   end,
    -- }
    -- use {
    --   "zbirenbaum/copilot-cmp",
    --   module = "copilot_cmp",
    -- }

    -- Snippets
    use 'L3MON4D3/LuaSnip'
    use 'rafamadriz/friendly-snippets'

    use 'christoomey/vim-tmux-navigator'

    use 'kyazdani42/nvim-web-devicons'
    use {
      "folke/trouble.nvim",
      requires = "kyazdani42/nvim-web-devicons",
    }


  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
