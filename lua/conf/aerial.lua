-- https://github.com/stevearc/.nvim

local status_ok, aerial = pcall(require, "aerial")
if not status_ok then
    vim.notify("aerial module not found")
    return
end

aerial.setup(
    {
        min_width = 30,
        -- backends = {"lsp", "treesitter", "markdown"}
        backends = {"treesitter", "markdown"},
        -- show all icons
        filter_kind = false,
        -- auto use lspkind-nvim or nvim-web-devicons
        nerd_font = "auto",
        -- Show box drawing characters for the tree hierarchy
        show_guides = true,
        -- Customize the characters used when show_guides = true
        guides = {
            -- When the child item has a sibling below it
            mid_item = "├─",
            -- When the child item is the last in the list
            last_item = "└─",
            -- When there are nested child guides to the right
            nested_top = "│ ",
            -- Raw indentation
            whitespace = "  "
        },
        update_events = "TextChanged,InsertLeave",
        on_attach = function(bufnr)
            --mapping.register("buffer", "aerial", bufnr)
        end
    }
)
