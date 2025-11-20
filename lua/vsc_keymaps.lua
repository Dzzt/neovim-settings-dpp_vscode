
local keymap = vim.keymap

--  ---------------------------------------------------------
--  Keymaps (keymaps for plugins are set in plugin configs.)

-- Clear highlights
keymap.set('n','<C-L>',':nohl<CR><C-L>')

-- Go normal mode with ESC
keymap.set('t','<ESC>',[[<C-\><C-n>]])

-- undo/REDO via vscode
keymap.set("n","u","<Cmd>call VSCodeNotify('undo')<CR>")
keymap.set("n","<C-r>","<Cmd>call VSCodeNotify('redo')<CR>")

