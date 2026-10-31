local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " " -- Make sure to set `mapleader` before lazy so your mappings are correct

require("lazy").setup({
  "neovim/nvim-lspconfig",
  "neovim/nvim-lspconfig",
  "hrsh7th/cmp-nvim-lsp",
  "hrsh7th/cmp-buffer",
  "hrsh7th/cmp-path",
  "hrsh7th/cmp-cmdline",
  "hrsh7th/nvim-cmp",
  "L3MON4D3/LuaSnip",
  "williamboman/nvim-lsp-installer",
  "junegunn/fzf",
  "junegunn/fzf.vim",
  {
    'nvim-treesitter/nvim-treesitter',
    lazy = false,
    build = ':TSUpdate'
  },
  "nvim-telescope/telescope.nvim",
  "windwp/nvim-autopairs",
  "sbdchd/neoformat",
  { "lewis6991/gitsigns.nvim", dependencies = { "nvim-lua/plenary.nvim" } },
  "ajeetdsouza/zoxide",
  "jvgrootveld/telescope-zoxide",
  {
      'tribela/transparent.nvim',
      event = 'VimEnter',
      config = true,
  },
  "hashivim/vim-terraform",
  {
    "NeogitOrg/neogit",
    dependencies = {
      "nvim-lua/plenary.nvim",         -- required
      "sindrets/diffview.nvim",        -- optional - Diff integration

      -- Only one of these is needed, not both.
      "nvim-telescope/telescope.nvim", -- optional
      "ibhagwan/fzf-lua",              -- optional
    },
    config = true
  },
  {
      'nvim-lualine/lualine.nvim',
      dependencies = { 'nvim-tree/nvim-web-devicons' },
  },
  {
    "lewis6991/hover.nvim",
  },
  {
    "mcchrish/nnn.vim"
  },
  {
      'MeanderingProgrammer/render-markdown.nvim',
      dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.nvim' }, -- if you use the mini.nvim suite
      dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.icons' }, -- if you use standalone mini plugins
      dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
      ---@module 'render-markdown'
      ---@type render.md.UserConfig
      opts = {},
  },
  {
    "metalelf0/black-metal-theme-neovim",
    lazy = false,
    priority = 1000,
    config = function()
      require("black-metal").setup({
        -- optional configuration here, e.g.:
        trve = true, -- switch this to false if you want light variants
        theme = "thyrfing",
      })
      require("black-metal").load()
    end,
  },
  --{
  --  "kdheepak/monochrome.nvim",
  --  dependencies = "rktjmp/lush.nvim",
  --  lazy = false,
  --  priority = 1000,
  --  config = function()
  --    vim.cmd.colorscheme('monochrome')
  --  end
  --},
  {
    "hedyhli/outline.nvim",
    config = function()
      -- Example mapping to toggle outline
      vim.keymap.set("n", "<leader>o", "<cmd>Outline<CR>", {
        desc = "Toggle Outline" 
      })

      require("outline").setup {
        -- Your setup opts here (leave empty to use defaults)
      }
    end,
  },
  --{ 'aveplen/ruscmd.nvim' },
  {
    "alexmalder/yaml.nvim",
    ft = { "yaml" }, -- optional
    dependencies = {
      "folke/snacks.nvim", -- optional
      "nvim-telescope/telescope.nvim", -- optional
      "ibhagwan/fzf-lua" -- optional
    },
  },
  {
    "ray-x/go.nvim",
    dependencies = {  -- optional packages
      "ray-x/guihua.lua",
      "neovim/nvim-lspconfig",
      -- { "nvim-treesitter/nvim-treesitter", branch = 'main' } -- optional for master version
    },
    opts = function()

      require("go").setup(opts)
      local format_sync_grp = vim.api.nvim_create_augroup("GoFormat", {})
      vim.api.nvim_create_autocmd("BufWritePre", {
        pattern = "*.go",
        callback = function()
        require('go.format').goimports()
        end,
        group = format_sync_grp,
      })
      return {
        -- lsp_keymaps = false,
        -- other options
      }
    end,
    event = {"CmdlineEnter"},
    ft = {"go", 'gomod'},
    build = ':lua require("go.install").update_all_sync()' -- if you need to install/update all binaries
  }
})
