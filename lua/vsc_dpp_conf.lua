--config for vscode neovim

local fn = vim.fn
local opt = vim.opt
-----------------------------------------------------------------------------------

-- dpp 動作設定の typescript
local cache_base = fn.expand("~/.cache/dpp_vscode")

-- dppのcache
local dpp_src = cache_base .. "/repos/github.com/Shougo/dpp.vim"
local denops_src =cache_base .. "/repos/github.com/vim-denops/denops.vim"

opt.runtimepath:prepend(dpp_src)

local dpp = require("dpp")

if dpp.load_state(cache_base) then
  opt.runtimepath:prepend(denops_src)
end
