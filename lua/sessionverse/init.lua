print("Loaded SessionVerse 🚀")
local neogit = require("neogit")
local cli = require("neogit.lib.git.cli")
local parser = require("neogit.buffers.commit_view.parsing")

local M = {}

M.openDirtyFiles = function()
	local git_info = parser.parse_commit_overview(cli.show.stat.oneline.call_sync())
	for _, file in pairs(git_info.files) do
		vim.api.nvim_command("tabe " .. file.path)
	end
end

M.openDirtyFiles()

return M
