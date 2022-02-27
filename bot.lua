
    local bot = {
        bMain = 0,
        bWhitelist = {},
    }

    local Client = game.Players.LocalPlayer

    function bot.init(settings)
        if settings.main and settings.whitelisted then
            bot.bWhitelist = settings.whitelisted
            bot.bMain = settings.main
        end

        local function IsBot(UID)
            bool = false

            if Client.UserId ~= bot.bMain then
                bool = true
            end

            return bool
        end

        local function sub()
            local mod = {}

            function mod.say(msg)
                if IsBot(Client.UserId) then
                    game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(tostring(msg), "All")
                end
            end

            function mod.shell(f)
                if IsBot(Client.UserId) then
                    task.spawn(function()
                        pcall(function()
                            f(Client, bot.bWhitelist, bot.bMain)
                        end)
                    end)
                end
            end

            function mod.modifyHumanoid(i, v)
                if IsBot(Client.UserId) then
                    pcall(function()
                        if Client.Character.Humanoid[i] then
                            Client.Character.Humanoid[i] = v
                        end
                    end)
                end
            end

            function mod.panic()
                Client:Kick('\nPanic Activated')
            end

            return mod
        end

        return sub()
    end

    return bot
