local admin = {}
admin.functions = {}
admin.commands = {}

local function makecmd(cmdname, f) if cmdname and f then admin.commands[cmdname]={runner=f} end end

makecmd("kill", function(sender, arguments)

end)

function admin:listen_ADMIN()
	_G.__admin = {incoming_requests = {}, ready = true}
	env = _G.__admin

	print('admin: environment ready')
end

function admin:listen_CLIENT()
	coro = coroutine.create(function()
		env = nil

		repeat wait() until _G.__admin.ready
		print("HIII")

		env = _G.__admin
	end)
	
	print('client: starting coro')
	
	coroutine.resume(coro)
end

return admin
