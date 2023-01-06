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
      name = "+Buffer",
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
      name = "+Git",
      c = { "<cmd>Telescope git_bcommits<cr>", "B_Commits" },
      f = { "<cmd>Telescope git_files<cr>", "Files" },
      g = { "<cmd>LazyGit<cr>", "Lazy Git" },
      i = { "<cmd>Telescope gh.issues<cr>", "Github Issues"},
      p = { "<cmd>Telescope gh.pull_requests<cr>", "Github Pull Request"},
      s = { "<cmd>Neogit<cr>", "Status" },
      S = { "<cmd>Telescope git_status<cr>", "Status" },
      t = { "<cmd>Telescope gh.gist<cr>", "Github gist"},
    },

    h = {
      name = "+Help",
      h = { "<cmd>Telescope help_tags<cr>", 'Tags' },
      k = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
      o = { "<cmd>Telescope vim_options<cr>", "Vim_options" },
      r = { "<cmd>Telescope registers<cr>", "Registers" },
    },
    n = {
      name = "+Notes",
      t = {
        name = "+Telekasten",
        f  = { ":lua require('telekasten').find_notes()<CR>", "Find Note"},
        d  = { ":lua require('telekasten').find_daily_notes()<CR>", "Find Daily Note" },
        g  = { ":lua require('telekasten').search_notes()<CR>", "Search Notes" },
        z  = { ":lua require('telekasten').follow_link()<CR>", "Follow Link" },
        T  = { ":lua require('telekasten').goto_today()<CR>", "Goto Today" },
        W  = { ":lua require('telekasten').goto_thisweek()<CR>", "Goto This Week" },
        w  = { ":lua require('telekasten').find_weekly_notes()<CR>", "Find Weekly Note" },
        n  = { ":lua require('telekasten').new_note()<CR>", "New Note" },
        N  = { ":lua require('telekasten').new_templated_note()<CR>", "New Note w/Template" },
        y  = { ":lua require('telekasten').yank_notelink()<CR>", "Yank Note Link" },
        c  = { ":lua require('telekasten').show_calendar()<CR>", "Show Calendar" },
        C  = { ":CalendarT<CR>", "Calendar T" },
        i  = { ":lua require('telekasten').paste_img_and_link()<CR>", "Past Image & Link" },
        t  = { ":lua require('telekasten').toggle_todo()<CR>", "Toggle Todo" },
        b  = { ":lua require('telekasten').show_backlinks()<CR>", "Show Backlinks" },
        F  = { ":lua require('telekasten').find_friends()<CR>", "Find Friends" },
        I  = { ":lua require('telekasten').insert_img_link({ i=true })<CR>", "Insert Img Link" },
        p  = { ":lua require('telekasten').preview_img()<CR>", "Preview image" },
        m  = { ":lua require('telekasten').browse_media()<CR>", "Browse media" },
        a  = { ":lua require('telekasten').show_tags()<CR>", "Show Tags" },
        r  = { ":lua require('telekasten').rename_note()<CR>", "Raname Note" },
      },
    },

    o = {
      name = "+Open",
    },

    z = {
      name = "+Packer",
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
