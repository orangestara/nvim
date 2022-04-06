-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

  local time
  local profile_info
  local should_profile = false
  if should_profile then
    local hrtime = vim.loop.hrtime
    profile_info = {}
    time = function(chunk, start)
      if start then
        profile_info[chunk] = hrtime()
      else
        profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
      end
    end
  else
    time = function(chunk, start) end
  end
  
local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end

  _G._packer = _G._packer or {}
  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/Users/daiyinlong3/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/Users/daiyinlong3/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/Users/daiyinlong3/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/Users/daiyinlong3/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/Users/daiyinlong3/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["copilot.vim"] = {
    config = { "require('conf/copilot')" },
    loaded = true,
    path = "/Users/daiyinlong3/.local/share/nvim/site/pack/packer/start/copilot.vim",
    url = "https://github.com/github/copilot.vim"
  },
  fd = {
    load_after = {},
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/daiyinlong3/.local/share/nvim/site/pack/packer/opt/fd",
    url = "https://github.com/sharkdp/fd"
  },
  ["filetype.nvim"] = {
    loaded = true,
    path = "/Users/daiyinlong3/.local/share/nvim/site/pack/packer/start/filetype.nvim",
    url = "https://github.com/nathom/filetype.nvim"
  },
  ["impatient.nvim"] = {
    after = { "ripgrep", "persisted.nvim", "vim-illuminate", "nvim-ts-rainbow", "lsp_signature.nvim", "fd", "nvim-web-devicons", "nvim-scrollbar", "vimcdoc", "plenary.nvim" },
    loaded = true,
    only_config = true
  },
  ["lsp_signature.nvim"] = {
    config = { "require('conf/lsp_signature')" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/Users/daiyinlong3/.local/share/nvim/site/pack/packer/opt/lsp_signature.nvim",
    url = "https://github.com/ray-x/lsp_signature.nvim"
  },
  ["nvim-scrollbar"] = {
    config = { "require('conf/nvim-scrollbar')" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/Users/daiyinlong3/.local/share/nvim/site/pack/packer/opt/nvim-scrollbar",
    url = "https://github.com/petertriho/nvim-scrollbar"
  },
  ["nvim-tree.lua"] = {
    commands = { "NvimTreeToggle", "NvimTreeFindFile" },
    config = { "require('conf/nvim-tree')" },
    load_after = {},
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/daiyinlong3/.local/share/nvim/site/pack/packer/opt/nvim-tree.lua",
    url = "https://github.com/kyazdani42/nvim-tree.lua"
  },
  ["nvim-ts-rainbow"] = {
    load_after = {},
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/daiyinlong3/.local/share/nvim/site/pack/packer/opt/nvim-ts-rainbow",
    url = "https://github.com/p00f/nvim-ts-rainbow"
  },
  ["nvim-web-devicons"] = {
    after = { "nvim-tree.lua" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/Users/daiyinlong3/.local/share/nvim/site/pack/packer/opt/nvim-web-devicons",
    url = "https://github.com/kyazdani42/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/Users/daiyinlong3/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["persisted.nvim"] = {
    config = { "require('conf/persisted')" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/Users/daiyinlong3/.local/share/nvim/site/pack/packer/opt/persisted.nvim",
    url = "https://github.com/olimorris/persisted.nvim"
  },
  ["plenary.nvim"] = {
    load_after = {},
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/daiyinlong3/.local/share/nvim/site/pack/packer/opt/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ripgrep = {
    load_after = {},
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/daiyinlong3/.local/share/nvim/site/pack/packer/opt/ripgrep",
    url = "https://github.com/BurntSushi/ripgrep"
  },
  ["vim-illuminate"] = {
    config = { "require('conf/vim-illuminate')" },
    load_after = {},
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/daiyinlong3/.local/share/nvim/site/pack/packer/opt/vim-illuminate",
    url = "https://github.com/RRethy/vim-illuminate"
  },
  vimcdoc = {
    load_after = {},
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/daiyinlong3/.local/share/nvim/site/pack/packer/opt/vimcdoc",
    url = "https://github.com/yianwillis/vimcdoc"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: copilot.vim
time([[Config for copilot.vim]], true)
require('conf/copilot')
time([[Config for copilot.vim]], false)
-- Config for: impatient.nvim
time([[Config for impatient.nvim]], true)
require('conf/impatient')
time([[Config for impatient.nvim]], false)
-- Load plugins in order defined by `after`
time([[Sequenced loading]], true)
vim.cmd [[ packadd nvim-web-devicons ]]
vim.cmd [[ packadd lsp_signature.nvim ]]

-- Config for: lsp_signature.nvim
require('conf/lsp_signature')

vim.cmd [[ packadd nvim-scrollbar ]]

-- Config for: nvim-scrollbar
require('conf/nvim-scrollbar')

vim.cmd [[ packadd persisted.nvim ]]

-- Config for: persisted.nvim
require('conf/persisted')

time([[Sequenced loading]], false)

-- Command lazy-loads
time([[Defining lazy-load commands]], true)
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file NvimTreeFindFile lua require("packer.load")({'nvim-tree.lua'}, { cmd = "NvimTreeFindFile", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file NvimTreeToggle lua require("packer.load")({'nvim-tree.lua'}, { cmd = "NvimTreeToggle", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
time([[Defining lazy-load commands]], false)

vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Event lazy-loads
time([[Defining lazy-load event autocommands]], true)
vim.cmd [[au BufRead * ++once lua require("packer.load")({'ripgrep', 'vim-illuminate', 'nvim-ts-rainbow', 'fd', 'vimcdoc', 'plenary.nvim'}, { event = "BufRead *" }, _G.packer_plugins)]]
vim.cmd [[au BufNewFile * ++once lua require("packer.load")({'ripgrep', 'vim-illuminate', 'nvim-ts-rainbow', 'fd', 'vimcdoc', 'plenary.nvim'}, { event = "BufNewFile *" }, _G.packer_plugins)]]
time([[Defining lazy-load event autocommands]], false)
vim.cmd("augroup END")
if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
