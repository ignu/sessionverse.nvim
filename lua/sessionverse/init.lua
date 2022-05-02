print("Loaded sessionverse")

local M = {}

-- let status = system('git status -s | grep "^ \?\(M\|A\)" | cut -d " " -f 3')
M.getDirtyFiles = function()
	return {
		"README.MD",
	}
end

M.openDirtyFiles = function()
	local files = M.getDirtyFiles()
	for i, file in pairs(files) do
		vim.api.nvim_command("tabe " .. file)
	end
end

return M
