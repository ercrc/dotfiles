local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  spec = {
        {
            "f4z3r/gruvbox-material.nvim",
            config = function()
                vim.cmd.colorscheme("gruvbox-material")
            end,
        },
        {
            "nvim-treesitter/nvim-treesitter", build = ":TSUpdate",
            config = function () 
                local configs = require("nvim-treesitter.configs")

                configs.setup({
                    ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "javascript", "html", "css", "go", "gomod", "gosum", "bash" },
                    sync_install = false,
                    highlight = { enable = true },
                    indent = { enable = true },
                    incremental_selection = {
                        enable = true,
                        keymaps = {
                            init_selection = "gnn", 
                            node_incremental = "grn",
                            scope_incremental = "grc",
                            node_decremental = "grm",
                        },
                    },
                    textobjects = {
                        select = {
                            enable = true,

                            lookahead = true,

                            keymaps = {
                                ["af"] = "@function.outer",
                                ["if"] = "@function.inner",
                                ["ac"] = "@class.outer",
                                ["ic"] = { query = "@class.inner", desc = "Select inner part of a class region" },
                                ["as"] = { query = "@scope", query_group = "locals", desc = "Select language scope" },
                            },
                            selection_modes = {
                                ['@parameter.outer'] = 'v', -- charwise
                                ['@function.outer'] = 'v', -- linewise
                                ['@class.outer'] = '<c-v>', -- blockwise
                            },
                            include_surrounding_whitespace = true,
                        },
                    },
                })
            end,
        },
        {
            "nvim-treesitter/nvim-treesitter-textobjects", build = ":TSUpdate"
        },
        {
            'windwp/nvim-autopairs',
            event = "InsertEnter",
            config = true
            -- use opts = {} for passing setup options
            -- this is equalent to setup({}) function
        },
        {
            "neovim/nvim-lspconfig",
            config = function()
                local lspconfig = require("lspconfig")
                lspconfig.clangd.setup({})
                lspconfig.gopls.setup({})
            end,
        }
  },
  install = { colorscheme = { "gruvbox-material" } },
  checker = { enabled = true },
})

require('gruvbox-material').setup({
  italics = true,             -- enable italics in general
  contrast = "medium",        -- set contrast, can be any of "hard", "medium", "soft"
  comments = {
    italics = true,           -- enable italic comments
  },
  background = {
    transparent = true,      -- set the background to transparent
  },
  float = {
    force_background = false, -- force background on floats even when background.transparent is set
    background_color = nil,   -- set color for float backgrounds. If nil, uses the default color set
                              -- by the color scheme
  },
  signs = {
    highlight = true,         -- whether to highlight signs
  },
  customize = nil,            -- customize the theme in any way you desire, see below what this
                              -- configuration accepts
})
