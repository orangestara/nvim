M = {}

M.path = {}
-- 文件路径拼接
function M.path.join(...)
    local path_string = ""
    for _, path in ipairs({...}) do
        path_string = path_string .. path .. "/"
    end
    return string.sub(path_string, 1, #path_string-1)
end
-- 文件存在判断
function M.path.is_exists(path)
    local file = io.open(path, "r")
    if file then
        io.close(file)
        return true
    end
    return false
end

return M
