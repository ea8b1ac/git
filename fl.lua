_G.flingbot = {
	Message = {
		enabled = false,
		src = ""
	},

	Whitelisted = {},
	flingbotEnabled = true
}

if not (_G.flingbot.Whitelisted and _G.flingbot.Message) then
	return
end

local function Initialize()
	local Client = game.Players.LocalPlayer

	if Client.Character:FindFirstChild("HumanoidRootPart") and Client.Character:FindFirstChild("Humanoid") and Client.Character.Humanoid.Health > 0 then
		local function Fling()
			task.spawn(function()
				pcall(function()
					local cmdlp = game.Players.LocalPlayer

					function sFLY(vfly)
						FLYING = false
						speedofthefly = 1
						peedofthevfly = 1
						while not cmdlp or not cmdlp.Character or not cmdlp.Character:FindFirstChild('HumanoidRootPart') or not cmdlp.Character:FindFirstChild('Humanoid') or not cmdm do
							wait()
						end 
						local T = cmdlp.Character.HumanoidRootPart
						local CONTROL = {F = 0, B = 0, L = 0, R = 0, Q = 0, E = 0}
						local lCONTROL = {F = 0, B = 0, L = 0, R = 0, Q = 0, E = 0}
						local SPEED = 0
						local function FLY()
							FLYING = true
							local BG = Instance.new('BodyGyro', T)
							local BV = Instance.new('BodyVelocity', T)
							BG.P = 9e4
							BG.maxTorque = Vector3.new(9e9, 9e9, 9e9)
							BG.cframe = T.CFrame
							BV.velocity = Vector3.new(0, 0, 0)
							BV.maxForce = Vector3.new(9e9, 9e9, 9e9)
							spawn(function()
								while FLYING do
									if not vfly then
										cmdlp.Character:FindFirstChild("Humanoid").PlatformStand = true
									end
									if CONTROL.L + CONTROL.R ~= 0 or CONTROL.F + CONTROL.B ~= 0 or CONTROL.Q + CONTROL.E ~= 0 then
										SPEED = 50
									elseif not (CONTROL.L + CONTROL.R ~= 0 or CONTROL.F + CONTROL.B ~= 0 or CONTROL.Q + CONTROL.E ~= 0) and SPEED ~= 0 then
										SPEED = 0
									end
									if (CONTROL.L + CONTROL.R) ~= 0 or (CONTROL.F + CONTROL.B) ~= 0 or (CONTROL.Q + CONTROL.E) ~= 0 then
										BV.velocity = ((workspace.CurrentCamera.CoordinateFrame.lookVector * (CONTROL.F + CONTROL.B)) + ((workspace.CurrentCamera.CoordinateFrame * CFrame.new(CONTROL.L + CONTROL.R, (CONTROL.F + CONTROL.B + CONTROL.Q + CONTROL.E) * 0.2, 0).p) - workspace.CurrentCamera.CoordinateFrame.p)) * SPEED
										lCONTROL = {F = CONTROL.F, B = CONTROL.B, L = CONTROL.L, R = CONTROL.R}
									elseif (CONTROL.L + CONTROL.R) == 0 and (CONTROL.F + CONTROL.B) == 0 and (CONTROL.Q + CONTROL.E) == 0 and SPEED ~= 0 then
										BV.velocity = ((workspace.CurrentCamera.CoordinateFrame.lookVector * (lCONTROL.F + lCONTROL.B)) + ((workspace.CurrentCamera.CoordinateFrame * CFrame.new(lCONTROL.L + lCONTROL.R, (lCONTROL.F + lCONTROL.B + CONTROL.Q + CONTROL.E) * 0.2, 0).p) - workspace.CurrentCamera.CoordinateFrame.p)) * SPEED
									else
										BV.velocity = Vector3.new(0, 0, 0)
									end
									BG.cframe = workspace.CurrentCamera.CoordinateFrame
									wait()
								end
								CONTROL = {F = 0, B = 0, L = 0, R = 0, Q = 0, E = 0}
								lCONTROL = {F = 0, B = 0, L = 0, R = 0, Q = 0, E = 0}
								SPEED = 0
								BG:destroy()
								BV:destroy()
								cmdlp.Character.Humanoid.PlatformStand = false
							end)
						end
						cmdm.KeyDown:connect(function(KEY)
							if KEY:lower() == 'w' then
								if vfly then
									CONTROL.F = speedofthevfly
								else
									CONTROL.F = speedofthefly
								end
							elseif KEY:lower() == 's' then
								if vfly then
									CONTROL.B = - speedofthevfly
								else
									CONTROL.B = - speedofthefly
								end
							elseif KEY:lower() == 'a' then
								if vfly then
									CONTROL.L = - speedofthevfly
								else
									CONTROL.L = - speedofthefly
								end
							elseif KEY:lower() == 'd' then
								if vfly then
									CONTROL.R = speedofthevfly
								else
									CONTROL.R = speedofthefly
								end
							elseif KEY:lower() == 'y' then
								if vfly then
									CONTROL.Q = speedofthevfly*2
								else
									CONTROL.Q = speedofthefly*2
								end
							elseif KEY:lower() == 't' then
								if vfly then
									CONTROL.E = -speedofthevfly*2
								else
									CONTROL.E = -speedofthefly*2
								end
							end
						end)
						cmdm.KeyUp:connect(function(KEY)
							if KEY:lower() == 'w' then
								CONTROL.F = 0
							elseif KEY:lower() == 's' then
								CONTROL.B = 0
							elseif KEY:lower() == 'a' then
								CONTROL.L = 0
							elseif KEY:lower() == 'd' then
								CONTROL.R = 0
							elseif KEY:lower() == 'y' then
								CONTROL.Q = 0
							elseif KEY:lower() == 't' then
								CONTROL.E = 0
							end
						end)
						FLY()
					end

					local ch = cmdlp.Character
					local prt=Instance.new("Model", cmdlp.Character)

					local z1 = Instance.new("Part")
					z1.Name="Torso"
					z1.CanCollide = false
					z1.Anchored = true

					local z2 = Instance.new("Part", prt)
					z2.Name="Head"
					z2.Anchored = true
					z2.CanCollide = false

					local z3 =Instance.new("Humanoid", prt)
					z3.Name="Humanoid"
					z1.Position = Vector3.new(0,9999,0)

					cmdlp.Character=prt
					wait(3)

					cmdlp.Character=ch
					wait(3)

					local plr = cmdlp
					cmdm = plr:GetMouse()

					local Hum = Instance.new("Humanoid")
					z2:Clone()

					Hum.Parent = cmdlp.Character
					local root =  cmdlp.Character.HumanoidRootPart

					for i,v in pairs(plr.Character:GetChildren()) do
						if v ~= root and  v.Name ~= "Humanoid" then
							v:Destroy()
						end
					end

					root.Transparency = 0
					root.Material = "ForceField"
					root.Color = Color3.new(1, 1, 1)

					game:GetService('RunService').Stepped:connect(function()
						cmdlp.Character.HumanoidRootPart.CanCollide = false
					end)

					game:GetService('RunService').RenderStepped:connect(function()
						cmdlp.Character.HumanoidRootPart.CanCollide = false
					end)

					sFLY()

					workspace.CurrentCamera.CameraSubject = root
					PF = 99999
					PF = PF*10

					local bambam = Instance.new("BodyThrust")
					bambam.Parent = cmdlp.Character.HumanoidRootPart
					bambam.Force = Vector3.new(PF,0,PF)
					bambam.Location = cmdlp.Character.HumanoidRootPart.Position
				end)
			end)
		end

		Fling()

		task.wait(1)

		if not table.find(_G.flingbot.Whitelisted, Client.Name) then
			pcall(function() task.spawn(Fling) end)
			task.wait(8)

			local function getEligiblePlayers()
				local Valid = {}

				for index, player in pairs(game.Players:GetPlayers()) do
					if not table.find(player.Name, _G.flingbot.Whitelisted) then
						if player.Character:FindFirstChild("HumanoidRootPart") and player.Character:FindFirstChild("Humanoid") and player.Character.Humanoid.Health > 0 then
							if player and player ~= nil then
								table.insert(player, Valid)
							end
						end
					end
				end

				return Valid
			end

			while task.wait(0.05) do
				pcall(function()
					local Players = getEligiblePlayers()

					local function rand(tbl)
						local num = math.random(1,#Players)
						local item = Players[num]

						return item, num
					end

					for i = 1, #Players, 1 do 
						local Player, Index = rand(Players)

						table.remove(Players, Index)

						game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = Player.Character.HumanoidRootPart.CFrame
						task.wait(0.035)
					end
				end)
			end
		end
	end
end

Initialize()
