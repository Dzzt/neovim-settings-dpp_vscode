
local opt = vim.opt
local cmd = vim.cmd

-- options for basic behavior(load after dein)
---------------------------------------------------

-- Timeout Settings
    opt.timeoutlen = 500
    opt.ttimeoutlen= 1000

-- Redraw only when it's needed
    opt.lazyredraw = true

-- ---------------------------------------------------------
-- Encoding

    cmd("let $LANG='en'")
    vim.scriptencoding = 'utf-8'
    opt.encoding = 'utf-8'
    opt.fileencodings = {'utf-8','cp932','utf-16le','utf-16','euc-jp','ucs-bom','iso-2022-jp'}
    opt.fileformats = {'dos','unix','mac'}

