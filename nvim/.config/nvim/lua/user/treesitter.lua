local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_okm then  
  return
end

configs.setup {
  ensure_installed = "maintained",
  sync_install = false,
  ignore_install = { "" },
  highlight = {
    enable = true,
    disable = { "" },
    additional_vim_regex_highlighting = true,
  },
  indent = { enable = truem, disable = { "yaml" } },
  autopairs = {
    enable = true,
  },
  context_commentstring = {
    enable = true,
    enable_atocmd = false,
  }
}
