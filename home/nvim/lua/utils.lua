function TryRequire(package_name)
	local status_ok, package = pcall(require, package_name)
	local file_path = debug.getinfo(2, "S").source
	local calling_line = debug.getinfo(2, "l").currentline

	if not status_ok then
		print('Failed to require: "' .. package_name .. '" ' .. file_path .. ":" .. calling_line .. ".")
		return nil
	end

	return package
end

function Cmd(command_body)
	return "<cmd>" .. command_body .. "<cr>"
end
