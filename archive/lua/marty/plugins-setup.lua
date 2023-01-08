-- uto install packer if not installed
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
    vim.cmd([[packadd packer.nvim]])
    return true
  end
  return false
end
local packer_bootstrap = ensure_packer() -- true if packer was just installed

-- autocommand that reloads neovim and installs/updates/removes plugins
-- when file is saved
vim.cmd([[ 
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost packer.lua source <afile> | PackerSync
  augroup end
]])

-- import packer safely
local status, packer = pcall(require, "packer")
if not status then
  return
end

return packer.startup(function(use)

  -- Package manager
  use("wbthomason/packer.nvim")

  use("goolord/alpha-nvim")
  -- LSP Configuration & Plugins
  use({
    'neovim/nvim-lspconfig',
    requires = {
      -- Automatically install LSPs to stdpath for neovim
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',

      -- Useful status updates for LSP
      'j-hui/fidget.nvim',
    },
  })

  -- Autocompletion
  use({
    'hrsh7th/nvim-cmp',
    requires = { 'hrsh7th/cmp-nvim-lsp', 'L3MON4D3/LuaSnip', 'saadparwaiz1/cmp_luasnip' },
  })
  use("hrsh7th/cmp-buffer") -- source for text in buffer
  use("hrsh7th/cmp-path") -- source for file system paths

  -- treesitter
  use( 'nvim-treesitter/nvim-treesitter' )

  use({
    'nvim-treesitter/nvim-treesitter-textobjects',
    after = 'nvim-treesitter',
  })

    -- auto closing
  use("windwp/nvim-autopairs") -- autoclose parens, brackets, quotes, etc...
  use({ "windwp/nvim-ts-autotag", after = "nvim-treesitter" }) -- autoclose tags

  -- ansible
  use('mfussenegger/nvim-ansible')

  -- barbar  Tab Bar
  use({'romgrk/barbar.nvim', 
    wants = 'nvim-web-devicons'})

  -- calendar
  use('renerocksai/calendar-vim')

  -- Comment
  use({'numToStr/Comment.nvim', config = function()  -- "gc" to comment visual regions/lines
    require('Comment').setup()
  end
  })

  -- Dracula
  use('Mofiqul/dracula.nvim')

  -- Git related plugins
  use('tpope/vim-fugitive')
  use('tpope/vim-rhubarb')
  use({'lewis6991/gitsigns.nvim'})
  use('kdheepak/lazygit.nvim')
  use({'pwntester/octo.nvim'})
  use({'TimUntersberger/neogit',
    requires = {
      'sindrets/diffview.nvim'
    }
  })

  -- Telescope
  use({'nvim-telescope/telescope.nvim',
    requires = {
      {'nvim-lua/plenary.nvim'},
      {'nvim-lua/popup.nvim'}
    }})
  use({'nvim-telescope/telescope-github.nvim'})
  use({'nvim-telescope/telescope-media-files.nvim'})
  use({'nvim-telescope/telescope-project.nvim'})
  use({'nvim-telescope/telescope-packer.nvim'})
  use({'nvim-telescope/telescope-symbols.nvim'})
  use({'nvim-telescope/telescope-fzf-native.nvim', run = 'make' })
  use({'cljoly/telescope-repo.nvim'})
  use({'airblade/vim-rooter'})
  use({'jvgrootveld/telescope-zoxide'})

  -- Fietype NVIM
  use("nathom/filetype.nvim")

  -- I3 config syntax
  use('mboughaba/i3config.vim')

  -- devicons
  use("kyazdani42/nvim-web-devicons")

  -- LuaLine
  use('nvim-lualine/lualine.nvim')

  use('arkav/lualine-lsp-progress')

  use( {'lukas-reineke/indent-blankline.nvim', config = function() -- Add indentation guides even on blank lines
    require('indent_blankline').setup {
      char = '┊',
      show_trailing_blankline_indent = false,
    }
  end
  })

  -- Numbers
  use('jeffkreeftmeijer/vim-numbertoggle' )

  -- neomutt
  use('neomutt/neomutt.vim')

  -- PROJECT 
  use({
    "ahmedkhalf/project.nvim",
    config = function()
      require("project_nvim").setup {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      }
    end
  })
 
  -- VIM tmux navigator
  use({ 'christoomey/vim-tmux-navigator' })

  -- Vim Maximizer
  use({ 'szw/vim-maximizer' })

  -- Jinja z
  use({ 'Glench/Vim-Jinja2-Syntax' })

  -- Markdown Preview
  use({ "iamcco/markdown-preview.nvim", run = "cd app && npm install", setup = function() vim.g.mkdp_filetypes = { "markdown" } end, ft = { "markdown" }, })
  use('preservim/vim-markdown')
  use('godlygeek/tabular')
  use({"ellisonleao/glow.nvim"})

  -- Obsidian
  use({
    'epwalsh/obsidian.nvim',
    config = function ()
      require("obsidian").setup({
        dir = "~/Nextcloud/Obsidian/",
        completion = {
          nvim_cmp = true, -- if using nvim-cmp, otherwise set to false
        }
      })
    end
  })

  -- RANGER 
  use({ 'francoiscabrol/ranger.vim' })
  use({ 'rbgrouleff/bclose.vim' })

  -- file explorer
  use("nvim-tree/nvim-tree.lua")

  -- Replace with Register
  use({ 'vim-scripts/ReplaceWithRegister' })

  -- Surround
  use('tpope/vim-surround')

  -- tpoop slueth
  use('tpope/vim-sleuth') -- Detect tabstop and shiftwidth automatically)

  -- WAKATIME
  use('wakatime/vim-wakatime')

  -- WhichKey
  use({ "folke/which-key.nvim" })

  -- You'll need to restart nvim, and then it will work.
  if packer_bootstrap then
    require("packer").sync()
  end
end)
-- vim: ts=2 sts=2 sw=2 et
