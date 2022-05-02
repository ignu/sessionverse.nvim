local M = {}

function M.logger.debug(...)
	if M.conf.log_level == "debug" then
		print("debug", ...)
	end
end

function M.setup(config)
	M.conf = M.normalize(config)
end

function M.normalize(config, existing)
	local conf = existing or {}
	if M.is_empty_table(config) then
		return conf
	end

	for k, v in pairs(config) do
		conf[k] = v
	end

	return conf
end

local function has_value(tab, val)
	for _, value in ipairs(tab) do
		if value == val then
			return true
		end
	end

	return false
end

function M.logger.info(...)
	local valid_values = { "info", "debug" }
	if has_value(valid_values, M.conf.log_level) then
		print("info", ...)
	end
end

function M.get_file_name(url)
	return url:match("^.+/(.+)$")
end

function M.get_file_extension(url)
	return url:match("^.+(%..+)$")
end

function M.logger.error(...)
	error(...)
end

return M
