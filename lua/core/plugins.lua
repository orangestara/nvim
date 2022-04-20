local utils = require("utils.api")
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
        autocmd BufWritePost plugins.lua source <afile> | PackerCompile
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
    use {"wbthomason/packer.nvim"}
    use {"lewis6991/impatient.nvim", config=[[require("conf.impatient")]]}
    use {"nathom/filetype.nvim"}
    use {"nvim-lua/plenary.nvim", after={"impatient.nvim"}, event = {"BufRead", "BufNewFile"}}
    use {"kyazdani42/nvim-web-devicons", after={"impatient.nvim"}}
    use {"kyazdani42/nvim-tree.lua", config=[[require("conf.nvim-tree")]], after={"nvim-web-devicons"}}
    use {"kevinhwang91/nvim-hlslens", config=[[require("conf.nvim-hlslens")]], after={"impatient.nvim"}}
    use {"windwp/nvim-autopairs", config=[[require("conf.nvim-autopairs")]], event={"InsertEnter"}, after={"impatient.nvim"}}

    -- functions
    use {"ethanholz/nvim-lastplace", config=[[require("conf.nvim-lastplace")]], event={"BufRead", "BufNewFile"}, after={"impatient.nvim"}}
    -- themes
    use {"catppuccin/nvim", as="catppuccin", config=[[require("conf.catppuccin")]]}
    use {"lukas-reineke/indent-blankline.nvim", config=[[require("conf.indent-blankline")]], after={"impatient.nvim"}}
    use {"SmiteshP/nvim-gps", after={"nvim-treesitter"}}
    use {"p00f/nvim-ts-rainbow", after={"impatient.nvim"}, event = {"BufRead", "BufNewFile"}}
    use {"lewis6991/gitsigns.nvim", config=[[require("conf.gitsigns")]], after={"nvim-treesitter", "plenary.nvim"}}
    use {"nvim-lualine/lualine.nvim", config=[[require("conf.lualine")]], after={"nvim-web-devicons", "nvim-gps", "gitsigns.nvim"}}
    use {"nvim-treesitter/nvim-treesitter", config=[[require("conf.nvim-treesitter")]], after={"impatient.nvim"}, run=":TSUpdate", event={"BufRead", "BufNewFile"}}
    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if packer_bootstrap then
        require("packer").sync()
    end
end)
