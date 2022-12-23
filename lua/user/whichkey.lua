local M = {}

function M.setup()
  local whichkey = require "which-key"

  local conf = {
    plugins = {
      spelling = {
        enabled = true
      },
    },
    window = {
      border = "single", -- none, single, double, shadow
      position = "bottom", -- bottom, top
    },
  }

  local opts = {
    mode = "n", -- Normal mode
    prefix = "<leader>",
    buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
    silent = true, -- use `silent` when creating keymaps
    noremap = true, -- use `noremap` when creating keymaps
    nowait = false, -- use `nowait` when creating keymaps
  }

  local mappings = {
    ["q"] = { "<cmd>q!<CR>", "Quit" },

    b = {
      name = "Buffer",
      b = { "<cmd>Telescope Buffers<cr>", "Find Existing Buffers" },
      c = { "<Cmd>bd!<Cr>", "Close current buffer" },
      D = { "<Cmd>%bd|e#|bd#<Cr>", "Delete all buffers" },
    },

    f = {
      name = "+File",
      f = { "<cmd>Telescope find_files<cr>", "Find File" },
      s = { "<cmd>up<cr>", "File Save" },
      z = { "<cmd>Telescope zoxide list<cr>", "Zoxide" },
      r = {
        name = "+Ranger",
        r  = { "<cmd>Ranger<cr>", "Ranger" },
        f  = { "<cmd>RangerCurrentFile<CR>", "Current File" },
        d  = { "<cmd>RangerCurrentDirectory<CR>", "Current Directory" },
        t  = { "<cmd>RangerCurrentFileNewTab<CR>", "Current File New Tab" },
      }
    },

    g = {
      name = "Git",
      c = { "<cmd>Telescope git_bcommits<cr>", "B_Commits" },
      f = { "<cmd>Telescope git_files<cr>", "Files" },
      g = { "<cmd>LazyGit<cr>", "Lazy Git" },
      i = { "<cmd>Telescope gh.issues<cr>", "Github Issues"},
      p = { "<cmd>Telescope gh.pull_requests<cr>", "Github Pull Request"},
      s = { "<cmd>Neogit<cr>", "Status" },
      S = { "<cmd>Telescope git_status<cr>", "Status" },
      t = { "<cmd>Telescope gh.gist<cr>", "Github gist"},
    },

    n = {
      name = "Notes",
    },
    
    o = {
      name = "Open",
    },

    z = {
      name = "Packer",
      c = { "<cmd>PackerCompile<cr>", "Compile" },
      i = { "<cmd>PackerInstall<cr>", "Install" },
      s = { "<cmd>PackerSync<cr>", "Sync" },
      S = { "<cmd>PackerStatus<cr>", "Status" },
      u = { "<cmd>PackerUpdate<cr>", "Update" },
    },

  }

  whichkey.setup(conf)
  whichkey.register(mappings, opts)
end

return M
