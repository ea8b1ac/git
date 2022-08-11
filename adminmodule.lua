local admin = {}
admin.functions = {}
admin.commands = {}

local function makecmd(cmdname, f) if cmdname and f then admin.commands[cmdname]={runner=f} end end

makecmd("kill", function(sender, arguments)

end)

function admin:listen_ADMIN()
	env = nil; if not _G.__admin["ready"] then _G.__admin = {incoming_requests = {}, ready = true}; env = _G.__admin else env = _G.__admin end

	env.k = "hello!"
end

function admin:listen_CLIENT()
	env = nil; if not _G.__admin["ready"] then _G.__admin = {incoming_requests = {}, ready = true}; env = _G.__admin else env = _G.__admin end

	while wait() do
		if env["k"] then
			print(env.k)
		end
	end
end

return admin
