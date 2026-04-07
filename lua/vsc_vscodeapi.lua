--using vscode api

local vscode = require("vscode")

vim.notify = vscode.notify

-- Format current document
vscode.action("editor.action.formatDocument")

do                                      -- Comment the three lines below the cursor
	local curr_line = vim.fn.line(".") - 1 -- 0-indexed
	vscode.action("editor.action.commentLine", {
		range = { curr_line + 1, curr_line + 3 },
	})
end

do                                      -- Comment the previous line
	local curr_line = vim.fn.line(".") - 1 -- 0-indexed
	local prev_line = curr_line - 1
	if prev_line >= 0 then
		vscode.action("editor.action.commentLine", {
			range = { prev_line, prev_line },
		})
	end
end

do -- Find in files for word under cursor
	vscode.action("workbench.action.findInFiles", {
		args = { query = vim.fn.expand("<cword>") },
	})
end
