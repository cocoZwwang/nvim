local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- up down move k line
keymap("n", "<C-j>", "4j", opts)
keymap("n", "<C-k>", "4k", opts)
-- Better window navigation
keymap("n", "<A-h>", "<C-w>h", opts)
keymap("n", "<A-j>", "<C-w>j", opts)
keymap("n", "<A-k>", "<C-w>k", opts)
keymap("n", "<A-l>", "<C-w>l", opts)
keymap("n", "sc", "<C-w>c", opts)
keymap("n", "so", "<C-w>o", opts)

--keymap("n", "<leader>e", ":Lex 30<cr>", opts)
keymap("n", "<leader>v", "<C-v>", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Move text up and down
--keymap("n", "<A-j>", "<Esc>:m .+1<CR>==gi", opts)
--keymap("n", "<A-k>", "<Esc>:m .-2<CR>==gi", opts)

-- Insert --
-- Press jk fast to enter
keymap("i", "jj", "<ESC>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)
keymap("v", "q", "<ESC>", opts)

-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)
keymap("v", "p", '"_dP', opts)

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- Terminal --
-- Better terminal navigation
keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)


keymap("n", "<leader>e", ":NvimTreeToggle<CR>", opts)
-- BufferLine
keymap("n", "<leader>t", ":BufferLinePick<CR>", opts)
keymap("n", "<leader>tc", ":BufferLinePickClose<CR>", opts)
keymap("n", "<leader>tl", ":BufferLineCloseLeft<CR>", opts)
keymap("n", "<leader>tr", ":BufferLineCloseRight<CR>", opts)
keymap("n", "<C-h>", ":BufferLineCyclePrev<CR>", opts)
keymap("n", "<C-l>", ":BufferLineCycleNext<CR>", opts)

-- telescope
keymap('n', '<leader>ff', ":Telescope find_files<CR>", opts)
keymap('n', '<leader>fg', ":Telescope live_grep<CR>", opts)
keymap('n', '<leader>fb', ":Telescope buffers<CR>", opts)
keymap('n', '<leader>fh', ":Telescope help_tags<CR>", opts)

-- lsp
keymap('n', '<leader>fr', ":Format<CR>", opts)





local pluginKeys = {}

pluginKeys.nvimTreeKeys = function(tree_cb)
  return {
      -- open file
      { key = { "l", "<CR>" }, cb = tree_cb "edit" },
      -- open file with spliting scree
      { key = "v",             cb = tree_cb "vsplit" },
      { key = "h",             cb = tree_cb "close_node" }
  }
end

pluginKeys.telescopeKeys = function()
  return {
      i = {
          -- 上下移动
          ["<C-j>"] = "move_selection_next",
          ["<C-k>"] = "move_selection_previous",
          --["<Down>"] = "move_selection_next",
          --["<Up>"] = "move_selection_previous",
          -- 历史记录
          ["<C-n>"] = "cycle_history_next",
          ["<C-p>"] = "cycle_history_prev",
          -- 关闭窗口
          ["<C-c>"] = "close",
          -- 预览窗口上下滚动
          ["<C-u>"] = "preview_scrolling_up",
          ["<C-d>"] = "preview_scrolling_down",
          -- 选择
          ["<CR>"] = "select_default",
          ["<C-x>"] = "select_horizontal",
          ["<C-v>"] = "select_vertical",
          ["<C-t>"] = "select_tab",
      },
      n = {
          --["<Down>"] = "move_selection_next",
          --["<Up>"] = "move_selection_previous",
          -- 历史记录
          ["<C-n>"] = "cycle_history_next",
          ["<C-p>"] = "cycle_history_prev",
          -- 关闭窗口
          ["<C-c>"] = "close",
          -- 预览窗口上下滚动
          ["<C-u>"] = "preview_scrolling_up",
          ["<C-d>"] = "preview_scrolling_down",
          -- 选择
          ["<CR>"] = "select_default",
          ["<C-x>"] = "select_horizontal",
          ["<C-v>"] = "select_vertical",
          ["<C-t>"] = "select_tab",
          -- 跳转
          --["gg"] = "move_to_top",
          --["G"] = "move_to_buttom",
          --
          ["?"] = "which_key",
      },
  }
end
return pluginKeys
