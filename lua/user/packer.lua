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

  -- LSP Configuration & Plugins
  use { 
    'neovim/nvim-lspconfig',
    requires = {
      -- Automatically install LSPs to stdpath for neovim
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',

      -- Useful status updates for LSP
      'j-hui/fidget.nvim',
    },
  }

  -- Autocompletion
  use {
    'hrsh7th/nvim-cmp',
    requires = { 'hrsh7th/cmp-nvim-lsp', 'L3MON4D3/LuaSnip', 'saadparwaiz1/cmp_luasnip' },
  }

  -- treesitter
  use {
    'nvim-treesitter/nvim-treesitter',
    run = function()
      pcall(require('nvim-treesitter.install').update { with_sync = true })
    end,
  }

  use {
    'nvim-treesitter/nvim-treesitter-textobjects',
    after = 'nvim-treesitter',
  }

  -- ansible
  use 'mfussenegger/nvim-ansible'

  -- barbar  Tab Bar
  use {'romgrk/barbar.nvim', wants = 'nvim-web-devicons'}

  -- calendar
  use 'renerocksai/calendar-vim'

  -- Comment
  use {'numToStr/Comment.nvim', config = function()  -- "gc" to comment visual regions/lines
    require('Comment').setup()
    end
  }

  -- Dracula
  use 'Mofiqul/dracula.nvim'

  -- Git related plugins
  use 'tpope/vim-fugitive'
  use 'tpope/vim-rhubarb'
  use {'lewis6991/gitsigns.nvim'}
  use 'kdheepak/lazygit.nvim'
  use {'pwntester/octo.nvim'}
  use {'TimUntersberger/neogit',
    requires = {
      'sindrets/diffview.nvim'
    }
  }

  -- Telescope
  use {'nvim-telescope/telescope.nvim',
    requires = {
      {'nvim-lua/plenary.nvim'},
      {'nvim-lua/popup.nvim'}
    }}
  use {'nvim-telescope/telescope-github.nvim'}
  use {'nvim-telescope/telescope-media-files.nvim'}
  use {'nvim-telescope/telescope-project.nvim'}
  use {'nvim-telescope/telescope-packer.nvim'}
  use {'nvim-telescope/telescope-symbols.nvim'}
  use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
  use {'cljoly/telescope-repo.nvim'}
  use {'airblade/vim-rooter'}
  use {'jvgrootveld/telescope-zoxide'}

  -- Fietype NVIM
  use "nathom/filetype.nvim"

  -- I3 config syntax
  use 'mboughaba/i3config.vim'

  -- LuaLine
  use {
    'nvim-lualine/lualine.nvim', -- Fancier statusline
    requires = { 'kyazdani42/nvim-web-devicons', opt = true},
  }
  use 'arkav/lualine-lsp-progress'

  use {'lukas-reineke/indent-blankline.nvim', config = function() -- Add indentation guides even on blank lines
    require('indent_blankline').setup {
       char = '┊',
       show_trailing_blankline_indent = false,
    }
    end
  }

  -- neomutt
  use 'neomutt/neomutt.vim'

  -- Obsidian
  use 'epwalsh/obsidian.nvim'

  -- ORG-Mode
  use {'nvim-orgmode/orgmode', config = function()
    require('orgmode').setup{}
    end
  }

  -- Jinja z
  use { 'git@gitlab.com:HiPhish/jinja.vim.git' }

  -- Markdown Preview
  use({ "iamcco/markdown-preview.nvim", run = "cd app && npm install", setup = function() vim.g.mkdp_filetypes = { "markdown" } end, ft = { "markdown" }, })
  use 'preservim/vim-markdown'
  use 'godlygeek/tabular'
  use {"ellisonleao/glow.nvim"}

  -- RANGER 
  use { 'francoiscabrol/ranger.vim' }
  use { 'rbgrouleff/bclose.vim' }

  -- Surround
  use 'tpope/vim-surround'

  -- tpoop slueth
  use 'tpope/vim-sleuth' -- Detect tabstop and shiftwidth automatically

  -- TODO txt
  use 'freitass/todo.txt-vim'

  -- VIM WIKI
  use { 'vimwiki/vimwiki' }

  -- WAKATIME
  use 'wakatime/vim-wakatime'

  -- WhichKey
  use {
     "folke/which-key.nvim",
     config = function()
       require("user.whichkey").setup()
     end,
  }

  -- TeleKasten
  use 'renerocksai/telekasten.nvim'

  -- Add custom plugins to packer from /nvim/lua/custom/plugins.lua
  local has_plugins, plugins = pcall(require, 'custom.plugins')
  if has_plugins then
    plugins(use)
  end

  if is_bootstrap then
    require('packer').sync()
  end
end)

-- You'll need to restart nvim, and then it will work.
if is_bootstrap then
  print '=================================='
  print '    Plugins are being installed'
  print '    Wait until Packer completes,'
  print '       then restart nvim'
  print '=================================='
  return
end
-- vim: ts=2 sts=2 sw=2 et
