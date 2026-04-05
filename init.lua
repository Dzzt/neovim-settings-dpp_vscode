
--  Begin init.vim for Visual Studio Code
--
local fn = vim.fn
local opt = vim.opt
local api = vim.api

--  --------------------------------------------------
--  Basic settings

--using different Shada file for vscode neovim
opt.shadafile = 'NONE'

<<<<<<< HEAD
local vscnvim_dir =fn.expand('~/.config/nvim_vscod')
=======
local vscnvim_dir =fn.expand('~/.config/nvim_vscode')
local dpp_config_dir = vscnvim_dir .. [[/dpp]]
>>>>>>> 60062ced5a8b68ea91603a3b85aaa7dc04fb6a21

opt.runtimepath:append(vscnvim_dir)
opt.runtimepath:append(vscnvim_dir .. '/lua')
opt.runtimepath:append(dpp_config_dir)


-- Load configs
local configs = {
    "vsc_options_base_before",
    "vsc_plugins",
    "vsc_options_base_after",
    "vsc_options_editting",
    "vsc_keymaps",
}

for _,config in ipairs(configs) do
    require(config)
end

--manage IME
api.nvim_create_autocmd({'InsertLeave','FocusGained'},{
    pattern = {"*"},
    command = "silent! !"..fn.expand("~/bin/zenhan.exe").." 0",
})

