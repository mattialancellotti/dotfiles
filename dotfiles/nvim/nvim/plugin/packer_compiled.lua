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
local package_path_str = "/home/mattia/.cache/nvim/packer_hererocks/2.0.5/share/lua/5.1/?.lua;/home/mattia/.cache/nvim/packer_hererocks/2.0.5/share/lua/5.1/?/init.lua;/home/mattia/.cache/nvim/packer_hererocks/2.0.5/lib/luarocks/rocks-5.1/?.lua;/home/mattia/.cache/nvim/packer_hererocks/2.0.5/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/mattia/.cache/nvim/packer_hererocks/2.0.5/lib/lua/5.1/?.so"
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
  Turtles = {
    loaded = true,
    path = "/home/mattia/.local/share/nvim/site/pack/packer/start/Turtles",
    url = "https://github.com/kadekillary/Turtles"
  },
  badwolf = {
    loaded = true,
    path = "/home/mattia/.local/share/nvim/site/pack/packer/start/badwolf",
    url = "https://github.com/sjl/badwolf"
  },
  cosmic_latte = {
    loaded = true,
    path = "/home/mattia/.local/share/nvim/site/pack/packer/start/cosmic_latte",
    url = "https://github.com/haystackandroid/cosmic_latte"
  },
  darcula = {
    loaded = true,
    path = "/home/mattia/.local/share/nvim/site/pack/packer/start/darcula",
    url = "https://github.com/doums/darcula"
  },
  everforest = {
    loaded = true,
    path = "/home/mattia/.local/share/nvim/site/pack/packer/start/everforest",
    url = "https://github.com/sainnhe/everforest"
  },
  ["iceberg.vim"] = {
    loaded = true,
    path = "/home/mattia/.local/share/nvim/site/pack/packer/start/iceberg.vim",
    url = "https://github.com/cocopon/iceberg.vim"
  },
  ["lightline.vim"] = {
    loaded = true,
    path = "/home/mattia/.local/share/nvim/site/pack/packer/start/lightline.vim",
    url = "https://github.com/itchyny/lightline.vim"
  },
  melange = {
    loaded = true,
    path = "/home/mattia/.local/share/nvim/site/pack/packer/start/melange",
    url = "https://github.com/savq/melange"
  },
  ["nord-vim"] = {
    loaded = true,
    path = "/home/mattia/.local/share/nvim/site/pack/packer/start/nord-vim",
    url = "https://github.com/arcticicestudio/nord-vim"
  },
  ["nvim-tree.lua"] = {
    loaded = true,
    path = "/home/mattia/.local/share/nvim/site/pack/packer/start/nvim-tree.lua",
    url = "https://github.com/kyazdani42/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    config = { "\27LJ\1\2Ñ\4\0\0\4\0\25\0!4\0\0\0%\1\1\0>\0\2\0027\0\2\0>\0\1\0023\1\a\0003\2\4\0003\3\5\0:\3\6\2:\2\b\0013\2\t\0:\2\n\1:\1\3\0003\1\14\0003\2\f\0003\3\r\0:\3\6\2:\2\b\0013\2\15\0:\2\n\1:\1\v\0004\1\0\0%\2\16\0>\1\2\0027\1\17\0013\2\19\0003\3\18\0:\3\20\0023\3\21\0:\3\22\0023\3\23\0:\3\24\2@\1\2\0\vindent\1\0\1\venable\1\14highlight\1\0\2&additional_vim_regex_highlighting\1\venable\2\21ensure_installed\1\0\0\1\15\0\0\6c\bcpp\tjava\15dockerfile\blua\ago\vracket\nlatex\vpython\bvim\tbash\fcomment\tmake\15commonlisp\nsetup\28nvim-treesitter.configs\1\2\0\0\vracket\1\0\1\rfiletype\vracket\1\2\0\0\17src/parser.c\1\0\1\burl\30~/code/tree-sitter-racket\vracket\fused_by\1\2\0\0\tmake\17install_info\1\0\1\rfiletype\tmake\nfiles\1\2\0\0\17src/parser.c\1\0\1\burl\28~/code/tree-sitter-make\tmake\23get_parser_configs\28nvim-treesitter.parsers\frequire\0" },
    loaded = true,
    path = "/home/mattia/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/home/mattia/.local/share/nvim/site/pack/packer/start/nvim-web-devicons",
    url = "https://github.com/kyazdani42/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/home/mattia/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/mattia/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["popup.nvim"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/mattia/.local/share/nvim/site/pack/packer/opt/popup.nvim",
    url = "https://github.com/nvim-lua/popup.nvim"
  },
  ["siena.vim"] = {
    loaded = true,
    path = "/home/mattia/.local/share/nvim/site/pack/packer/start/siena.vim",
    url = "https://github.com/brettbar/siena.vim"
  },
  ["simple-session-manager"] = {
    loaded = true,
    path = "/home/mattia/.local/share/nvim/site/pack/packer/start/simple-session-manager",
    url = "https://github.com/mattialancellotti/simple-session-manager"
  },
  ["telescope.nvim"] = {
    loaded = true,
    path = "/home/mattia/.local/share/nvim/site/pack/packer/start/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  ["vim-fugitive"] = {
    loaded = true,
    path = "/home/mattia/.local/share/nvim/site/pack/packer/start/vim-fugitive",
    url = "https://github.com/tpope/vim-fugitive"
  },
  ["vim-racket"] = {
    loaded = true,
    path = "/home/mattia/.local/share/nvim/site/pack/packer/start/vim-racket",
    url = "https://github.com/wlangstroth/vim-racket"
  }
}

time([[Defining packer_plugins]], false)
local module_lazy_loads = {
  ["^popup%.nvim"] = "popup.nvim"
}
local lazy_load_called = {['packer.load'] = true}
local function lazy_load_module(module_name)
  local to_load = {}
  if lazy_load_called[module_name] then return nil end
  lazy_load_called[module_name] = true
  for module_pat, plugin_name in pairs(module_lazy_loads) do
    if not _G.packer_plugins[plugin_name].loaded and string.match(module_name, module_pat) then
      to_load[#to_load + 1] = plugin_name
    end
  end

  if #to_load > 0 then
    require('packer.load')(to_load, {module = module_name}, _G.packer_plugins)
    local loaded_mod = package.loaded[module_name]
    if loaded_mod then
      return function(modname) return loaded_mod end
    end
  end
end

if not vim.g.packer_custom_loader_enabled then
  table.insert(package.loaders, 1, lazy_load_module)
  vim.g.packer_custom_loader_enabled = true
end

-- Config for: nvim-treesitter
time([[Config for nvim-treesitter]], true)
try_loadstring("\27LJ\1\2Ñ\4\0\0\4\0\25\0!4\0\0\0%\1\1\0>\0\2\0027\0\2\0>\0\1\0023\1\a\0003\2\4\0003\3\5\0:\3\6\2:\2\b\0013\2\t\0:\2\n\1:\1\3\0003\1\14\0003\2\f\0003\3\r\0:\3\6\2:\2\b\0013\2\15\0:\2\n\1:\1\v\0004\1\0\0%\2\16\0>\1\2\0027\1\17\0013\2\19\0003\3\18\0:\3\20\0023\3\21\0:\3\22\0023\3\23\0:\3\24\2@\1\2\0\vindent\1\0\1\venable\1\14highlight\1\0\2&additional_vim_regex_highlighting\1\venable\2\21ensure_installed\1\0\0\1\15\0\0\6c\bcpp\tjava\15dockerfile\blua\ago\vracket\nlatex\vpython\bvim\tbash\fcomment\tmake\15commonlisp\nsetup\28nvim-treesitter.configs\1\2\0\0\vracket\1\0\1\rfiletype\vracket\1\2\0\0\17src/parser.c\1\0\1\burl\30~/code/tree-sitter-racket\vracket\fused_by\1\2\0\0\tmake\17install_info\1\0\1\rfiletype\tmake\nfiles\1\2\0\0\17src/parser.c\1\0\1\burl\28~/code/tree-sitter-make\tmake\23get_parser_configs\28nvim-treesitter.parsers\frequire\0", "config", "nvim-treesitter")
time([[Config for nvim-treesitter]], false)
if should_profile then save_profiles() end

end)

if not no_errors then
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
