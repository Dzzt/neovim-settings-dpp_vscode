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

-- 入力制限なしの汎用ジャンプコマンド
keymap.set('n', '<Leader><Leader>f', function()
	flash.jump({
		search = {
			mode = "search",
			max_length = nil, -- 文字数制限なし。何文字でも打てる
		},
		-- ラベルを表示するタイミングの設定
		label = {
			-- true にすると、1文字打った瞬間から画面全体にラベルが出る
			after = true,
			--min_pattern_length = 2,
		},
	})
end, { desc = "Flash Jump" })
