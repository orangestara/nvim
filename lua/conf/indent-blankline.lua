-- https://github.com/lukas-reineke/indent-blankline.nvim
local status_ok, indent_blankline = pcall(require, "indent_blankline")
if not status_ok then
    return
end

-- disable indent in file type
vim.g.indent_blankline_filetype_exclude = {
    "NvimTree",
    "aerial",
    "undotree",
    "spectre_panel",
    "dbui",
    "toggleterm",
    "packer",
    "help"
}

indent_blankline.setup(
    {
        show_current_context = true,
        show_current_context_start = true,
        show_end_of_line = true
    }
)
