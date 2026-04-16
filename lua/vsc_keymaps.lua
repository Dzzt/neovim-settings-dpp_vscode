local keymap = vim.keymap

--  ---------------------------------------------------------
--  Keymaps (keymaps for plugins are set in plugin configs.)

-- Clear highlights
keymap.set('n', '<C-L>', ':nohl<CR><C-L>')

-- Go normal mode with ESC
keymap.set('t', '<ESC>', [[<C-\><C-n>]])
--

keymap.set("x", "S", "Nop")
keymap.set("x", "s", "Nop")
