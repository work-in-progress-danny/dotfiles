local status_lua_copilot_ok, copilot = pcall(require, "zbirenbaum/copilot.lua")

if not status_lua_copilot_ok then
	return
end

print("status_lua_copilot_ok", status_lua_copilot_ok)

-- This is a copilot wrapper that is written in Lua because the native vim one is not nice.
-- The lua version isn't officially supported.

copilot.setup({
	ft_disable = { "markdown", "TelescopePrompt", ".git/COMMIT_EDITMSG" },
	cmp = {
		enabled = true,
		method = "getCompletionsCycling",
	},
})
