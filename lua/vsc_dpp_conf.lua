--config for vscode neovim

local fn = vim.fn
local opt = vim.opt
local api = vim.api
-----------------------------------------------------------------------------------

-- dpp 動作設定の typescript
local vsc_dpp_config_ts = fn.expand("~/.config/nvim_vscode/dpp/vsc_dpp_config.ts")

-- dppのcache
local cache_base = fn.expand("~/.cache/dpp_vscode")

--github からのインストール先
local repo_dir = cache_base .. "/repos/github.com"

-- dpp.vim はruntimepath の最初に追加しなければならない
local dpp_src = repo_dir .. "/Shougo/dpp.vim"
opt.runtimepath:prepend(dpp_src)

-- dpp.vim を require
local dpp = require("dpp")

-- denops.vim はここでは runtimepath には追加しない
local denops_src = repo_dir .. "/vim-denops/denops.vim"

-- dpp コンポーネントのパスをruntimepathの最後に追加
local ext_lazy = repo_dir .. "/Shougo/dpp-ext-lazy"
local ext_toml = repo_dir .. "/Shougo/dpp-ext-toml"
local protocl_git = repo_dir .. "/Shougo/dpp-protocol-git"

opt.runtimepath:append(ext_lazy)
opt.runtimepath:append(ext_toml)
opt.runtimepath:append(protocl_git)


-- dpp.vim がロードされていたら
if dpp.load_state(cache_base) then
  -- denops.vim を runtimepath に追加
  opt.runtimepath:prepend(denops_src)

  --
  api.nvim_create_autocmd("User", {
    pattern = "DenopsReady",
    callback = function()
      vim.notify("vim load_state is failed.")
      dpp.make_state(cache_base, vsc_dpp_config_ts)
    end
  })
end

--api.nvim_create_autocmd("User", {
--	pattern = "Dpp:makeStatePost",
--	callback = function ()
--		vim.notify("dpp make_state() is done.")
--	end
--})
