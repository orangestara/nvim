-- https://github.com/nvim-treesitter/nvim-treesitter

local status_ok, treesitter = pcall(require, "nvim-treesitter.configs")
if not status_ok then
    return
end

--local mapping = require("core.keybinds")

treesitter.setup(
    {
        -- installed highlight support sources
        ensure_installed = "maintained",
        -- synchronous download highlighting support
        sync_install = false,
        -- highlight related
        highlight = {
            enable = true,
            disable = { "" },  -- list of language that will be disabled
            -- disable built-in regex highlighting
            additional_vim_regex_highlighting = false
        },
        -- incremental selection
        incremental_selection = {
            enable = true,
            keymaps = {
                init_selection = "<CR>",
                node_incremental = "<CR>",
                node_decremental = "<BS>",
                scope_incremental = "<TAB>"
            }
        },
        -- indent have bug in python
        indent = {
            enable = true,
            disable = {"yaml"}
        },
        -- nvim-ts-context-commentstring
        context_commentstring = {
            enable = true,
            enable_autocmd = false
        },
        -- nvim-ts-rainbow
        rainbow = {
            enable = true,
            extended_mode = true
        }
    }
)

-- vim.o.foldmethod = "expr"
-- vim.o.foldexpr = "nvim_treesitter#foldexpr()"
