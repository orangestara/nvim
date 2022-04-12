local utils = require("utils")
local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
    packer_bootstrap = fn.system({
        "git",
        "clone",
        "--depth",
        "1",
        "https://github.com/wbthomason/packer.nvim",
        install_path
    })
    print "Installing packer close and repoen Neovim"
    vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
    augroup packer_user_config
        autocmd!
        autocmd BufWritePost plugins.lua source <afile> | PackerSync
    augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
    return
end

-- Have packer use a popup window
packer.init({
    display = {
        open_fn = function()
            return require("packer.util").float { border = "rounded" }
        end,
    },
})

-- Install your plugins here
return packer.startup(function(use)
    use {
        "wbthomason/packer.nvim",
        disable = false
    }
    use {
        "lewis6991/impatient.nvim",
        disable = false,
        config = function()
            require("conf.impatient")
        end
    }
    use {
        "nathom/filetype.nvim",
        disable = false
    }
    use {
        "kyazdani42/nvim-web-devicons",
        disable = false,
        after = {"impatient.nvim"}
    }
    use {
        "kyazdani42/nvim-tree.lua",
        disable = false,
        config = function()
            require("conf.nvim-tree")
        end,
        after = {"nvim-web-devicons"}
    }

end)

-- ========== plugins =============
--local packer_install_plugins = {
--    -----------
--    -- basic --
--    -----------
--    -- Have packer manage itself
--    ["wbthomason/packer.nvim"] = {
--        load_file = false,
--        disable = false
--    },
--    ["lewis6991/impatient.nvim"] = {
--        load_file = true,
--        disable = false
--    },
--    ["nathom/filetype.nvim"] = {
--        load_file = false,
--        disable = false
--    },
--    ["github/copilot.vim"] = {
--        load_file = true,
--        disable = false
--    },
--    ["kyazdani42/nvim-web-devicons"] = {
--        load_file = false,
--        disable = false,
--        after = {"impatient.nvim"}
--    },
--    --["onsails/lspkind-nvim"] = {
--    --    load_file = true,
--    --    disable = false,
--    --    after = {"impatient.nvim"}
--    --},
--    --["rcarriga/nvim-notify"] = {
--    --    load_file = true,
--    --    disable = false,
--    --    after = {"impatient.nvim"}
--    --},
--    ["ray-x/lsp_signature.nvim"] = {
--        load_file = true,
--        disable = false,
--        after = {"impatient.nvim"}
--    },
--    ["yianwillis/vimcdoc"] = {
--        load_file = false,
--        disable = false,
--        after = {"impatient.nvim"},
--        event = {"BufRead", "BufNewFile"}
--    },
--    ["olimorris/persisted.nvim"] = {
--        load_file = true,
--        disable = false,
--        after = {"impatient.nvim"}
--    },
--    ["nvim-lua/plenary.nvim"] = {
--        load_file = false,
--        disable = false,
--        after = {"impatient.nvim"},
--        event = {"BufRead", "BufNewFile"}
--    },
--    ["BurntSushi/ripgrep"] = {
--        load_file = false,
--        disable = false,
--        after = {"impatient.nvim"},
--        event = {"BufRead", "BufNewFile"}
--    },
--    ["sharkdp/fd"] = {
--        load_file = false,
--        disable = false,
--        after = {"impatient.nvim"},
--        event = {"BufRead", "BufNewFile"}
--    },
--
--    ------------
--    -- themes --
--    ------------
--    ["petertriho/nvim-scrollbar"] = {
--        load_file = true,
--        disable = false,
--        after = {"impatient.nvim"}
--    },
--    ["catppuccin/nvim"] = {
--        as = "catppuccin",
--        load_file = true,
--        disable = false,
--        after = {"nvim-scrollbar"}
--    },
--    --["Mofiqul/vscode.nvim"] = {
--    --    load_file = true,
--    --    disable = false,
--    --    after = {"nvim-scrollbar"}
--    --},
--    ["RRethy/vim-illuminate"] = {
--        load_file = true,
--        disable = false,
--        after = {"impatient.nvim"},
--        event = {"BufRead", "BufNewFile"}
--    },
--    ["p00f/nvim-ts-rainbow"] = {
--        load_file = false,
--        disable = false,
--        after = {"impatient.nvim"},
--        event = {"BufRead", "BufNewFile"}
--    },
--    --["nvim-treesitter/nvim-treesitter"] = {
--    --    load_file = true,
--    --    disable = false,
--    --    after = {"impatient.nvim"},
--    --    event = {"BufRead", "BufNewFile"}
--    --},
--    --["SmiteshP/nvim-gps"] = {
--    --    load_file = false,
--    --    disable = false,
--    --    after = {"nvim-treesitter"}
--    --},
--    --["lewis6991/gitsigns.nvim"] = {
--    --    load_file = true,
--    --    disable = false,
--    --    after = {"nvim-treesitter", "plenary.nvim"}
--    --},
--    --["nvim-lualine/lualine.nvim"] = {
--    --    load_file = true,
--    --    disable = false,
--    --    after = {"nvim-web-devicons", "nvim-gps", "gitsigns.nvim"}
--    --},
--    ["kyazdani42/nvim-tree.lua"] = {
--        load_file = true,
--        disable = false,
--        cmd = {"NvimTreeToggle", "NvimTreeFindFile"},
--        after = {"nvim-web-devicons"}
--    }
--}
--
--
--packer.startup({
--    function(use)
--        for name, opts in pairs(packer_install_plugins) do
--            local plugin = vim.tbl_extend("force", {name}, opts)
--            if opts.load_file then
--                local file_name = ""
--                if opts.as then
--                    file_name = opts.as
--                else
--                    file_name = string.match(name, "/([%w-_]+).?")
--                end
--                local require_path = utils.path.join("conf", file_name)
--                local config_path = utils.path.join(vim.fn.stdpath("config"), "lua", require_path .. ".lua")
--                if utils.path.exists(config_path) then
--                    plugin.config = "require('" .. require_path .. "')"
--                else
--                    vim.notify(
--                        "Missing config file for " .. name .. ": " .. config_path,
--                        "error",
--                        {title = "packer"}
--                    )
--                end
--            end
--            use(plugin)
--        end
--        if packer_bootstrap then
--            require("packer").sync()
--        end
--    end
--})
--
---- 实时生效配置，自动执行:PackerCompile
----local packer_user_config = vim.api.nvim_create_augroup("packer_user_config", {clear = true})
----
----vim.api.nvim_create_autocmd(
----    {"BufWritePost"},
----    {
----        pattern = {"plugins.lua"},
----        command = "source <afile> | PackerCompile",
----        group = packer_user_config
----    }
----)
--return packer
