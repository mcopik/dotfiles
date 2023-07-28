-- every spec file under the "plugins" directory will be loaded automatically by lazy.nvim
--
-- In your plugin files, you can:
-- * add extra plugins
-- * disable/enabled LazyVim plugins
-- * override the configuration of LazyVim plugins
return {
  {
    "kkoomen/vim-doge",
    build = ":call doge#install()",
    config = function()
      vim.g.doge_doc_standard_cpp = "doxygen_cpp_comment_slash_banner"
    end,
  },
}
