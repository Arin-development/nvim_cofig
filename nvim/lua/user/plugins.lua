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
  git = {
    clone_timeout = 300, -- Timeout, in seconds, for git clones
  },
}

-- Install your plugins here
return packer.startup(function(use)
  -- My plugins here
  use { "wbthomason/packer.nvim", commit = "6afb67460283f0e990d35d229fd38fdc04063e0a" } -- Have packer manage itself
  use { "nvim-lua/plenary.nvim", commit = "4b7e52044bbb84242158d977a50c4cbcd85070c7" } -- Useful lua functions used by lots of plugins
  use { "windwp/nvim-autopairs", commit = "4fc96c8f3df89b6d23e5092d31c866c53a346347" } -- Autopairs, integrates with both cmp and treesitter
  use { "nvim-tree/nvim-web-devicons", commit = "9061e2d355ecaa2b588b71a35e7a11358a7e51e1" }
  use { "nvim-tree/nvim-tree.lua", commit = "4e24505e2b30c4a8c35a3dfb4f564f14f6d9bfd4" }
  use { "akinsho/bufferline.nvim", commit = "0073e32fbf391df5d83c1f4531bb0a41c85e0bec" }
  use { "moll/vim-bbye", commit = "25ef93ac5a87526111f43e5110675032dbcacf56" }
  use { "nvim-lualine/lualine.nvim", commit = "edca2b03c724f22bdc310eee1587b1523f31ec7c" }
  use { "akinsho/toggleterm.nvim", commit = "2a787c426ef00cb3488c11b14f5dcf892bbd0bda" }
  use { "ahmedkhalf/project.nvim", commit = "628de7e433dd503e782831fe150bb750e56e55d6" }
  use { "lewis6991/impatient.nvim", commit = "b842e16ecc1a700f62adb9802f8355b99b52a5a6" }
  use { "lukas-reineke/indent-blankline.nvim", commit = "db7cbcb40cc00fc5d6074d7569fb37197705e7f6" }
  use { "goolord/alpha-nvim", commit = "0bb6fc0646bcd1cdb4639737a1cee8d6e08bcc31" }
  use { 'iamcco/markdown-preview.nvim', commit = "02cc3874738bc0f86e4b91f09b8a0ac88aef8e96" }
  use { 'fatih/vim-go', commit = "22b2273cfe562ac1c1af976ce77f18a3b1776f3c" }
  use { 'norcalli/nvim-colorizer.lua', commit = "36c610a9717cc9ec426a07c8e6bf3b3abcb139d6" }
  use { 'folke/todo-comments.nvim', commit = "bca0e00644c22a3eecedce703c0db080dd6bdc55" }


  -- Colorschemes
  use { "folke/tokyonight.nvim", commit = "9fba0cdd05382a427dafaa2b8ebb4aba99126bc0" }
  use { "lunarvim/darkplus.nvim", commit = "f20cba5d690bc34398a3a8372ee7bbbc7b6609fa" }

  -- cmp plugins
  use { "hrsh7th/nvim-cmp", commit = "e94d3489311f941788756953df23ca84f83eec95" } -- The completion plugin
  use { "hrsh7th/cmp-buffer", commit = "3022dbc9166796b644a841a02de8dd1cc1d311fa" } -- buffer completions
  use { "hrsh7th/cmp-path", commit = "91ff86cd9c29299a64f968ebb45846c485725f23" } -- path completions
  use { "saadparwaiz1/cmp_luasnip", commit = "a9de941bcbda508d0a45d28ae366bb3f08db2e36" } -- snippet completions
  use { "hrsh7th/cmp-nvim-lsp", commit = "3cf38d9c957e95c397b66f91967758b31be4abe6" }
  use { "hrsh7th/cmp-nvim-lua", commit = "d276254e7198ab7d00f117e88e223b4bd8c02d21" }
  use { "ray-x/lsp_signature.nvim", commit = "e65a63858771db3f086c8d904ff5f80705fd962b" }

  -- snippets
  use { "L3MON4D3/LuaSnip", commit = "663d54482b11bca1ce94f56993b9f6ab485a13dc" } --snippet engine
  use { "rafamadriz/friendly-snippets", commit = "fd16b4d9dc58119eeee57e9915864c4480d591fd" } -- a bunch of snippets to use

  -- LSP
  use { "neovim/nvim-lspconfig", commit = "2dd9e060f21eecd403736bef07ec83b73341d955" } -- enable LSP
  use { "williamboman/mason.nvim", commit = "c2002d7a6b5a72ba02388548cfaf420b864fbc12" }
  use { "williamboman/mason-lspconfig.nvim", commit = "0051870dd728f4988110a1b2d47f4a4510213e31" }
  use { "jose-elias-alvarez/null-ls.nvim", commit = "643c67a296711ff40f1a4d1bec232fa20b179b90" } -- for formatters and linters
  use { "RRethy/vim-illuminate", commit = "0603e75fc4ecde1ee5a1b2fc8106ed6704f34d14" }

  -- Telescope
  use { "nvim-telescope/telescope.nvim", commit = "f174a0367b4fc7cb17710d867e25ea792311c418" }

  -- Treesitter
  use {
    "nvim-treesitter/nvim-treesitter", commit = "8f927a4d50716e534c5845e835625962adf878e1"
  }

  -- Git
  use { "lewis6991/gitsigns.nvim", commit = "56e01cb0ea52635854e97bd2dd2587c8ebfab978" }

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
