-- 键位映射

local opts = {noremap=true, silent=true}
local keymap = vim.keymap.set

-- Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "

-- Modes:
-- normal_mode = "n"
-- insert_mode = "i"
-- visual_mode = "v"
-- visual_block_mode = "x"
-- term_mode = "t"
-- command_mode = "c"

-- key shotcuts:
-- <C-h> = "Ctrl + h"
-- <M-h> = "Option/Alt + h"

-- Normal --
-- Better window navigation
keymap({"n"}, "<C-h>", "<C-w>h", opts)
keymap({"n"}, "<C-j>", "<C-w>j", opts)
keymap({"n"}, "<C-k>", "<C-w>k", opts)
keymap({"n"}, "<C-l>", "<C-w>l", opts)

-- go to 10k or 10j
keymap({"n"}, "<C-u>", "10k", opts)
keymap({"n"}, "<C-d>", "10j", opts)

-- Resize window
keymap({"n"}, "<M-w>", ":resize -2<CR>", opts)
keymap({"n"}, "<M-s>", ":resize +2<CR>", opts)
keymap({"n"}, "<M-a>", ":vertical resize -2<CR>", opts)
keymap({"n"}, "<M-d>", ":vertical resize +2<CR>", opts)

-- go to line head and tail
keymap({"n", "v"}, "H", "^", opts)
keymap({"n", "v"}, "L", "$", opts)

-- no highlight
keymap({"n"}, "<Esc>", ":nohlsearch<CR>", opts)

-- quick back insert mode
keymap({"i"}, "jj", "<Esc>", opts)

-- save buffer
keymap({"n"}, "<leader>w", ":w<CR>", opts)
-- exit cur window
keymap({"n"}, "<leader>q", ":q<CR>", opts)

-- move text up and down
keymap({"i", "n"}, "<M-j>", "<Esc>:m .+1<CR>==gi", opts)
keymap({"i", "n"}, "<M-k>", "<Esc>:m .-2<CR>==gi", opts)

-- Plugins --
-- nvim-tree
keymap({"n"}, "<leader>1", ":NvimTreeToggle<CR>", opts)
keymap({"n"}, "<leader>f", ":NvimTreeFindFile<CR>", opts)

global = {
    nvim_tree = {
        {{"n"}, "<leader>1", "<cmd>NvimTreeToggle<cr>", "noremap|silent"},
        {{"n"}, "<leader>fc", "<cmd>NvimTreeFindFile<cr>", "noremap|silent"}
    },
    nvim_hlslens = {
        {{"n"}, "n", [[<Cmd>execute('normal! ' . v:count1 . 'n')<CR><Cmd>lua require('hlslens').start()<CR>]], "noremap|silent"},
        {{"n"}, "N", [[<Cmd>execute('normal! ' . v:count1 . 'N')<CR><Cmd>lua require('hlslens').start()<CR>]], "noremap|silent"},
        {{"n"}, "*", [[*<cmd>lua require('hlslens').start()<CR>]], "noremap|silent"},
        {{"n"}, "#", [[#<cmd>lua require('hlslens').start()<cr>]], "noremap|silent"},
        {{"n"}, "g*", [[g*<cmd>lua require('hlslens').start()<cr>]], "noremap|silent"},
        {{"n"}, "g#", [[g#<cmd>lua require('hlslens').start()<cr>]], "noremap|silent"}
    }
}


