-- Install packer
local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'
local is_bootstrap = false
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  is_bootstrap = true
  vim.fn.execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
  vim.cmd [[packadd packer.nvim]]
end

require('packer').startup(function(use)
  -- Package manager
  use 'wbthomason/packer.nvim'

  use { -- LSP Configuration & Plugins
    'neovim/nvim-lspconfig',
    requires = {
      -- Automatically install LSPs to stdpath for neovim
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',

      -- Useful status updates for LSP
      'j-hui/fidget.nvim',
    },
  }

  use { -- Autocompletion
    'hrsh7th/nvim-cmp',
    requires = { 'hrsh7th/cmp-nvim-lsp', 'L3MON4D3/LuaSnip', 'saadparwaiz1/cmp_luasnip' },
  }

  use { -- Highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter',
    run = function()
      pcall(require('nvim-treesitter.install').update { with_sync = true })
    end,
  }

  use { -- Additional text objects via treesitter
    'nvim-treesitter/nvim-treesitter-textobjects',
    after = 'nvim-treesitter',
  }

  -- Syntax Plugins
  -- neomutt
  use 'neomutt/neomutt.vim'
  use 'mboughaba/i3config.vim'

  -- Git related plugins
  use 'tpope/vim-fugitive'
  use 'tpope/vim-rhubarb'
  use 'lewis6991/gitsigns.nvim'
  use 'kdheepak/lazygit.nvim'

  -- General 

  -- ansible
  use 'mfussenegger/nvim-ansible'

  -- calendar
  use 'renerocksai/calendar-vim'

  -- chezmoi
  use 'alker0/chezmoi.vim'

  -- Fuzzy Finder (files, lsp, etc)
  use { 'nvim-telescope/telescope.nvim', branch = '0.1.x', requires = { 'nvim-lua/plenary.nvim', 'nvim-lua/popup.nvim' } }

  use 'nvim-telescope/telescope-media-files.nvim'
  -- Fuzzy Finder Algorithm which requires local dependencies to be built. Only load if `make` is available
  use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make', cond = vim.fn.executable 'make' == 1 }

  -- telescope project
  use 'cljoly/telescope-repo.nvim'
  use 'airblade/vim-rooter'

  -- Fietype NVIM
  use "nathom/filetype.nvim"

  -- LuaLine
  use {
    'nvim-lualine/lualine.nvim', -- Fancier statusline
    requires = { 'kyazdani42/nvim-web-devicons', opt = true},
  }
  use 'arkav/lualine-lsp-progress'

  use 'lukas-reineke/indent-blankline.nvim' -- Add indentation guides even on blank lines
  use 'numToStr/Comment.nvim' -- "gc" to comment visual regions/lines
  use 'tpope/vim-sleuth' -- Detect tabstop and shiftwidth automatically

  -- Night Fox
  use "EdenEast/nightfox.nvim" 
  -- Obsidian
  use 'epwalsh/obsidian.nvim'

  -- ORG-Mode
  use {'nvim-orgmode/orgmode', config = function()
    require('orgmode').setup{}
    end
  }
  -- Jinja
  use { 'git@gitlab.com:HiPhish/jinja.vim.git' }

  -- Markdown Preview
  use({ "iamcco/markdown-preview.nvim", run = "cd app && npm install", setup = function() vim.g.mkdp_filetypes = { "markdown" } end, ft = { "markdown" }, })
  use 'preservim/vim-markdown'
  use 'godlygeek/tabular'

  -- RANGER 
  use { 'francoiscabrol/ranger.vim' }
  use { 'rbgrouleff/bclose.vim' }

  -- Surround
  use 'tpope/vim-surround'
  
  -- Telekasten
  use 'renerocksai/telekasten.nvim'

  -- TODO txt
  use 'freitass/todo.txt-vim'

  -- VIM WIKI
  use { 'vimwiki/vimwiki' }

  -- WAKATIME
  use 'wakatime/vim-wakatime'

  -- Add custom plugins to packer from /nvim/lua/custom/plugins.lua
  local has_plugins, plugins = pcall(require, 'custom.plugins')
  if has_plugins then
    plugins(use)
  end

  if is_bootstrap then
    require('packer').sync()
  end
end)

-- When we are bootstrapping a configuration, it doesn't
-- make sense to execute the rest of the init.lua.
--
-- You'll need to restart nvim, and then it will work.
if is_bootstrap then
  print '=================================='
  print '    Plugins are being installed'
  print '    Wait until Packer completes,'
  print '       then restart nvim'
  print '=================================='
  return
end

-- Automatically source and re-compile packer whenever you save this init.lua
local packer_group = vim.api.nvim_create_augroup('Packer', { clear = true })
vim.api.nvim_create_autocmd('BufWritePost', {
  command = 'source <afile> | PackerCompile',
  group = packer_group,
  pattern = vim.fn.expand '$MYVIMRC',
})

vim.keymap.set('n', '<leader>u', ':PackerSync<cr>', {desc = 'Packer Sync'})
-- vim: ts=2 sts=2 sw=2 et
