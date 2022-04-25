-- https://github.com/Pocco81/AutoSave.nvim

local status_ok, autosave = pcall(require, "autosave")
if not status_ok then
    vim.notify("autosave module not found!")
    return
end

autosave.setup(
    {
        enabled = true,
        -- auto save events
        events = {"InsertLeave", "TextChanged"},
        -- information displayed when autosave
        execution_message = "",
        conditions = {
            exists = true,
            filename_is_not = {},
            -- file types that don't automatically save
            filetype_is_not = {"sql", "mysql"},
            modifiable = true
        },
        write_all_buffers = true,
        on_off_commands = false,
        clean_command_line_interval = 0,
        debounce_delay = 135
    }
)
