-- configuration for folke/flash.nvim

local flash = require("flash")

vim.api.nvim_set_hl(0, "FlashLabel", { fg = "#ff007c", bg = "none", bold = true })

-- 基本設定：余計な自動起動をすべてオフにする
flash.setup({
	modes = {
		search = { enabled = false }, -- / 検索時に勝手にラベルが出ないようにする
		char = { enabled = false }, -- f, t キーを乗っ取らないようにする
	},
	highlight = {
		matches = false,           -- 一致する文字のハイライトをオフにする
		groups = {
			flash_label = "FlashLabel", -- ラベルのハイライトグループ
			flash_current = "FlashCurrent", -- 現在の位置のハイライトグループ
		},
	},
})

-- キーマッピングの再現
local keymap = vim.keymap

-- <Leader>f : 1文字入力してジャンプ (hop.hint_char1)
keymap.set("n", "<Leader>f", function()
	flash.jump({
		search = { mode = "search", max_length = 1 },
		label = { after = false, before = true },
	})
end, { desc = "Flash 1-char jump" })

-- <Leader>t : 1文字入力してその手前にジャンプ (hop.hint_char1 + offset -1)
keymap.set("n", "<Leader>t", function()
	flash.jump({
		search = { mode = "search", max_length = 1 },
		offset = -1, -- これで対象文字の1つ前に着地します
		label = { after = false, before = true },
	})
end, { desc = "Flash 1-char jump (before)" })

-- <Leader><Leader>f : 2文字入力してジャンプ (hop.hint_char2)
keymap.set("n", "<Leader><Leader>f", function()
	flash.jump({
		search = { mode = "search", max_length = 2 },
	})
end, { desc = "Flash 2-char jump" })

-- <Leader><Leader>t : 2文字入力してその手前にジャンプ (hop.hint_char2 + offset -1)
keymap.set("n", "<Leader><Leader>t", function()
	flash.jump({
		search = { mode = "search", max_length = 2 },
		offset = -1,
	})
end, { desc = "Flash 2-char jump (before)" })
