-- 键位映射

local opt = {noremap = true, silent = true}
local gmap = vim.api.nvim_set_keymap
local bmap = vim.api.nvim_buf_set_keymap

-- 设置 leader 键位空格
gmap("", "<Space>", "<Nop>", opt)
vim.g.mapleader = " "

-- Modes
--  normal_mode = "n"
--  insert_mode = "i"
--  visual_mode = "v"
--  visual_block_mode = "x"
--  term_mode = "t"
--  command_mode = "c"

mapping = {
    -- basic
    {"n", "<Esc>", ":nohlsearch<cr>"},
    {"n", "<C-u>", "10k"},
    {"n", "<C-d>", "10j"},
    {"n", "H", "^"},
    {"n", "L", "$"},
    {"n", "<M-k>", "<cmd>res +1<cr>"},
    {"n", "<M-j>", "<cmd>res -1<cr>"},
    {"n", "<M-h>", "<cmd>vertical res -1<cr>"},
    {"n", "<M-l>", "<cmd>vertical res +1<cr>"},
    {"i", "jj", "<Esc>"},
    {"i", "<M-k>", "<Up>"},
    {"i", "<M-j>", "<Down>"},
    {"i", "<M-h>", "<Left>"},
    {"i", "<M-l>", "<Right>"},
    {"v", "H", "^"},
    {"v", "L", "$"}
}


for _, keymap in ipairs(mapping) do
    gmap(keymap[1], keymap[2], keymap[3], opt)
end
