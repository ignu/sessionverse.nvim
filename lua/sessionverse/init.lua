local status = require("neogit.status")
local cli = require("neogit.lib.git.cli")
local parser = require("neogit.buffers.commit_view.parsing")

local M = {}

local split_limit = 4

local getTableSize = function(t)
	local count = 0
	for _ in pairs(t) do
		count = count + 1
	end
	return count
end

M.getDirtyFiles = function()
	local rv = {}
	rv.files = {}
	for i, f in ipairs(status.repo.unstaged.items) do
		rv.files[i] = { path = f.name }
	end

	rv.count = getTableSize(rv.files)
	return rv
end

M.getLastCommitFiles = function()
	local rv = {}
	rv.files = parser.parse_commit_overview(cli.show.stat.oneline.call_sync()).files
	rv.count = getTableSize(rv.files)
	return rv
end

M.getRelevantFiles = function()
	local files = M.getDirtyFiles()
	if files.count > 0 then
		return files
	end

	return M.getLastCommitFiles()
end

M.openDirtyFiles = function()
	local git_info = M.getDirtyFiles()

	local cmd
	if split_limit > git_info.count then
		cmd = "vs"
	end
	for _, file in pairs(git_info.files) do
		vim.api.nvim_command(cmd .. " " .. file.path)
	end
end

M.openDirtyFiles()

return M
