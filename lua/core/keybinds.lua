-- 键位映射

-- 设置 leader 键位空格
vim.keymap.set("", "<Space>", "<Nop>", {noremap=true, silent=true})
vim.g.mapleader = " "

local mapping = {}

mapping.register = function(range, group_name, bufnr)
    local group_keymap = mapping[range][group_name]
    for _, key_map in ipairs(group_keymap) do
        local options = {}
        if bufnr then
            options.buffer = bufnr
        end
        for _, key_opts in ipairs(vim.split(key_map[4], "|", true)) do
            options[key_opts] = true
        end
        vim.keymap.set(key_map[1], key_map[2], key_map[3], options)
    end
end

-- Modes
--  normal_mode = "n"
--  insert_mode = "i"
--  visual_mode = "v"
--  visual_block_mode = "x"
--  term_mode = "t"
--  command_mode = "c"

mapping.global = {
    basic = {
        {{"n"}, "<Esc>", ":nohlsearch<cr>", "noremap|silent"},
        {{"n"}, "<C-u>", "10k", "noremap|silent"},
        {{"n"}, "<C-d>", "10j", "noremap|silent"},
        {{"n"}, "<M-k>", "<cmd>res +1<cr>", "noremap|silent"},
        {{"n"}, "<M-j>", "<cmd>res -1<cr>", "noremap|silent"},
        {{"n"}, "<M-h>", "<cmd>vertical res -1<cr>", "noremap|silent"},
        {{"n"}, "<M-l>", "<cmd>vertical res +1<cr>", "noremap|silent"},
        {{"i"}, "jj", "<Esc>", "noremap|silent"},
        {{"i", "c", "t"}, "<M-k>", "<up>", "noremap"},
        {{"i", "c", "t"}, "<M-j>", "<down>", "noremap"},
        {{"i", "c", "t"}, "<M-h>", "<left>", "noremap"},
        {{"i", "c", "t"}, "<M-l>", "<right>", "noremap"},
        {
            {"n", "x"},
            "j",
            function()
                return vim.v.count > 0 and "j" or "gj"
            end,
            "noremap|silent|expr"
        },
        {
            {"n", "x"},
            "k",
            function()
                return vim.v.count > 0 and "k" or "gk"
            end,
            "noremap|silent|expr"
        },
        {
            {"n", "x"},
            "H",
            function()
                return vim.v.count > 0 and "^" or "g^"
            end,
            "noremap|silent|expr"
        },
        {
            {"n", "x"},
            "L",
            function()
                return vim.v.count > 0 and "$" or "g$"
            end,
            "noremap|silent|expr"
        }
    }
}

mapping.plugin = {
    lsp_signature = {
        toggle_key = "<C-j>"
    }
}
for group_name, _ in pairs(mapping.global) do
    mapping.register("global", group_name, nil)
end
return mapping
