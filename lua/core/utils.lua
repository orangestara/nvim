M = {
    packer = {},
    path = {}
}

-- packer autoinstall
function M.packer.auto_install_packer()
    local packer_install_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
    if vim.fn.empty(vim.fn.glob(packer_install_path)) > 0 then
        packer_bootstrap = vim.fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', packer_install_path})
    end
end

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
