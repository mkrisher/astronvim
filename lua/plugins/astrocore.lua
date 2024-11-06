-- AstroCore provides a central place to modify mappings, vim options, autocommands, and more!
-- Configuration documentation can be found with `:h astrocore`
-- NOTE: We highly recommend setting up the Lua Language Server (`:LspInstall lua_ls`)
--       as this provides autocomplete and documentation while editing

---@type LazySpec
return {
  "AstroNvim/astrocore",
  ---@type AstroCoreOpts
  opts = {
    -- Configure core features of AstroNvim
    features = {
      large_buf = { size = 1024 * 256, lines = 10000 }, -- set global limits for large files for disabling features like treesitter
      autopairs = true, -- enable autopairs at start
      cmp = true, -- enable completion at start
      diagnostics_mode = 3, -- diagnostic mode on start (0 = off, 1 = no signs/virtual text, 2 = no virtual text, 3 = on)
      highlighturl = true, -- highlight URLs at start
      notifications = true, -- enable notifications at start
    },
    -- Diagnostics configuration (for vim.diagnostics.config({...})) when diagnostics are on
    diagnostics = {
      virtual_text = true,
      underline = true,
    },
    -- vim options can be configured here
    options = {
      opt = { -- vim.opt.<key>
        relativenumber = false, -- sets vim.opt.relativenumber
        number = true, -- sets vim.opt.number
        spell = false, -- sets vim.opt.spell
        signcolumn = "auto", -- sets vim.opt.signcolumn to yes
        wrap = false, -- sets vim.opt.wrap
      },
      g = { -- vim.g.<key>
        -- configure global vim variables (vim.g)
        -- NOTE: `mapleader` and `maplocalleader` must be set in the AstroNvim opts or before `lazy.setup`
        -- This can be found in the `lua/lazy_setup.lua` file
        autoformat_enabled = true,
        cmp_enabled = true,
        autopairs_enabled = true,
        diagnostics_mode = 2,
        icons_enabled = true,
        ui_notifications_enabled = true,
      },
    },
    -- Mappings can be configured through AstroCore as well.
    -- NOTE: keycodes follow the casing in the vimdocs. For example, `<Leader>` must be capitalized
    mappings = {
      -- first key is the mode
      n = {
        -- second key is the lefthand side of the map

        -- navigate buffer tabs
        ["]b"] = { function() require("astrocore.buffer").nav(vim.v.count1) end, desc = "Next buffer" },
        ["[b"] = { function() require("astrocore.buffer").nav(-vim.v.count1) end, desc = "Previous buffer" },

        -- mappings seen under group name "Buffer"
        ["<Leader>bd"] = {
          function()
            require("astroui.status.heirline").buffer_picker(
              function(bufnr) require("astrocore.buffer").close(bufnr) end
            )
          end,
          desc = "Close buffer from tabline",
        },

        -- tables with just a `desc` key will be registered with which-key if it's installed
        -- this is useful for naming menus
        -- ["<Leader>b"] = { desc = "Buffers" },

        -- setting a mapping to false will disable it
        -- ["<C-S>"] = false,
        -- second key is the lefthand side of the map
        -- mappings seen under group name "Buffer"
        ["<leader>bn"] = { "<cmd>tabnew<cr>", desc = "New tab" },
        ["<leader>bD"] = {
          function()
            require("astronvim.utils.status").heirline.buffer_picker(
              function(bufnr) require("astronvim.utils.buffer").close(bufnr) end
            )
          end,
          desc = "Pick to close",
        },
        -- tables with the `name` key will be registered with which-key if it's installed
        -- this is useful for naming menus
        ["<leader>b"] = { name = "Buffers" },
        -- quick save
        -- ["<C-s>"] = { ":w!<cr>", desc = "Save File" },  -- change description but the same command

        -- splits
        ["\\"] = false,
        ["-"] = { "<cmd>split<cr>", desc = "Horizontal Split" },
        ["<leader>s"] = { "<cmd>split<cr>", desc = "Horizontal Split" },
        ["<leader>v"] = { "<cmd>vsplit<cr>", desc = "Vertical Split" },

        -- moving lines
        ["<leader>j"] = { "<cmd>m+<cr>==", desc = "move line down" },
        ["<leader>k"] = { "<cmd>m-2<cr>==", desc = "move line up" },

        -- clear search highlights
        ["<leader> "] = { "<cmd>noh<cr>", desc = "remove search highlights" },

        -- use Twilight plugin
        ["<leader>tw"] = { "<cmd>Twilight<cr>", desc = "toggles twilight plugin" },

        -- use ZenMode plugin
        ["<leader>z"] = { "<cmd>ZenMode<cr>", desc = "toggles zenmode plugin" },
      },
      t = {
        -- setting a mapping to false will disable it
        ["\\"] = false,
      },
      v = {
        -- moving lines
        ["<leader>j"] = { "<cmd>m'>+<cr>gv=gv", desc = "move line down" },
        ["<leader>k"] = { "<ESC>m-2<cr>gv=gv", desc = "move line up" },

        -- indents
        ["<"] = { "<cmd><<cr>gv", desc = "indent left" },
        [">"] = { "<cmd>><cr>gv", desc = "indent right" },
      },
      i = {
        -- moving lines
        ["<leader>j"] = { "<ESC>m+<cr>==gi", desc = "move line down" },
        ["<leader>k"] = { "<ESC>m-2<cr>==gi", desc = "move line up" },
      },
    },
  },
}
