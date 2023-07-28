return {

  -- https://github.com/dpetka2001/dotfiles/blob/main/dot_config/nvim/lua/plugins/extras/lang/python.lua
  -- Setup adapters as nvim-dap dependencies
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "mfussenegger/nvim-dap-python",
      -- stylua: ignore
      keys = {
        { "<leader>DPt", function() require('dap-python').test_method() end, desc = "Debug Method" },
        { "<leader>DPc", function() require('dap-python').test_class() end, desc = "Debug Class" },
      },
      config = function()
        local path = require("mason-registry").get_package("debugpy"):get_install_path()
        require("dap-python").setup(path .. "/venv/bin/python")
      end,
    },
  },

  -- Add `python` debugger to mason DAP to auto-install
  -- Not absolutely necessary to declare adapter in `ensure_installed`, since `mason-nvim-dap`
  -- has `automatic-install = true` in LazyVim by default and it automatically installs adapters
  -- that are are set up (via dap) but not yet installed. Might as well skip the lines below as
  -- a whole.

  -- Add which-key namespace for Python debugging
  {
    "folke/which-key.nvim",
    optional = true,
    opts = {
      defaults = {
        ["<leader>DP"] = { name = "+Python" },
      },
    },
  },
}
