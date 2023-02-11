local configs = require("nvim-treesitter.configs")
configs.setup {
  ensure_installed = { "json", "html", "css", "vim", "lua", "javascript", "typescript", "tsx","java","c"},
  sync_install = false,
  ignore_install = { "" }, -- List of parsers to ignore installing
  highlight = {
    enable = true, -- false will disable the whole extension
    disable = { "" }, -- list of language that will be disabled
    additional_vim_regex_highlighting = true,
  },
  indent = { enable = true, disable = { "yaml" } },
  rainbow = {
    enable = true,
  },
  context_commentstring = {
    enable = true,
    enable_autocmd = false,
  },
--  incremental_selection = {
--    enable = true,
--    keymaps = {
--      init_selection = "<CR>",
--      node_incremental = "<CR>",
--      node_decremental = "<BS>",
--      scope_incremental = "<TAB>",
--    },
--  },
}
