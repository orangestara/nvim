-- https://github.com/folke/which-key.nvim

local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
    vim.notify("which-key module not found!")
end

which_key.setup(
    {
        plugins = {
            spelling = {
                -- Whether to take over the default zu003d behavior
                enabled = true,
                suggestions = 20
            }
        }
    }
)
