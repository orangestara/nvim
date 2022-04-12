M = {
    path = {}
}

function M.path.join(...)
    local path_string = ""
    for _, path in ipairs({...}) do
        path_string = path_string .. path .. "/"
    end
    return path_string:sub(1, #path_string - 1)
end

function M.path.exists(path)
    local file = io.open(path, "r")
    if file then
        io.close(file)
        return true
    end
    return false
end

return M
