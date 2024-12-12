return {
  {
    "lervag/vimtex",
    config = function()
      vim.g.vimtex_view_method = "sioyek"
      vim.g.vimtex_compiler_latexmk = {
        options = {
          "-shell-escape",
          "-verbose",
          "-file-line-error",
          "-synctex=1",
          "-interaction=nonstopmode",
        },
      }
      vim.g.vimtex_quickfix_mode = 2
      vim.g.vimtex_quickfix_autoclose_after_keystrokes = 1
      vim.g.vimtex_quickfix_open_on_warning = 0
      vim.g.vimtex_complete_enabled = 1
    end,
  },
}
