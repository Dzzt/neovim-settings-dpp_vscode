-- configuration for hadronized/hop.nvim

local keymap = vim.keymap


local hop = require('hop')
hop.setup({})

local directions = require('hop.hint').HintDirection

keymap.set('n', '<Leader>f', function()
  hop.hint_char1({ direction = directions.AFTER_CURSOR })
end, {noremap = true})

-- hint-offset = -1 で t
keymap.set('n', '<Leader>t', function()
  hop.hint_char1({ direction = directions.AFTER_CURSOR, hint_offset = -1 })
end, {noremap = true})

keymap.set('n', '<Leader><Leader>f', function()
  hop.hint_char2({ direction = directions.AFTER_CURSOR })
end, {noremap = true})

keymap.set('n', '<Leader><Leader>t', function()
  hop.hint_char2({ direction = directions.AFTER_CURSOR, hint_offset = -1 })
end, {noremap = true})

