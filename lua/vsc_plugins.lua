--vim.pack

local pack = vim.pack
local config_dir = "C:/Users/ryo_nagahama/.config/nvim_vscode/pluginconfig/?.lua"

pack.add({
	"https://github.com/folke/flash.nvim",
	"https://github.com/kylechui/nvim-surround",
})

package.path = package.path .. ";" .. config_dir

require("config_flash")
require("config_nvimsurround")
