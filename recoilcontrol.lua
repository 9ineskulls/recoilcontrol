-------------------------------------------
-- SCRIPT BY 9ineskulls , ANTI RECOIL V1 --
--      I'M NOT RESPONSIBLE FOR BANS     --
--        USE THIS AT UR OWN RISK        --
-------------------------------------------

--// OUTPUT MESSAGE :3 \\--
OutputLogMessage("9ineskulls loves you\n")

--// CONFIG \\--
local config = {
    enableRecoilControl = true,  -- // Whether recoil control is enabled or not
    requireToggleKey = true,     -- // Do we need a key press to toggle recoil control on/off?
    toggleKey = "CapsLock",      -- // The key used to toggle recoil control (CapsLock or ScrollLock)
    recoilMode = "MEDIUM"           -- // Recoil control strength: LOW, MEDIUM, HIGH, ULTRA
}

--// RECOIL SETTINGS \\--
local recoilSettings = {
    LOW = { vertical = 3, horizontal = 0 },
    MEDIUM = { vertical = 7, horizontal = 0 },
    HIGH = { vertical = 12, horizontal = 0 },
    ULTRA = { vertical = 21, horizontal = 0 }
}

--// FUNCTION MODE \\--
local function getRecoilStrength(mode)
    return recoilSettings[mode] or recoilSettings["LOW"]
end

--// FUNCTION ENABLE CHECK \\--
local function isRecoilControlEnabled()
    return config.enableRecoilControl
end

--// FUNCTION KEY CHECK \\--
local function isToggleKeyActive()
    return not config.requireToggleKey or IsKeyLockOn(config.toggleKey) or IsKeyLockOn("ScrollLock")
end

--// FUNCTION BUTTON MANAGE CHECK \\--
local function handleRecoilControl()
    local recoil = getRecoilStrength(config.recoilMode)
    if IsMouseButtonPressed(3) then
        while IsMouseButtonPressed(3) do
            if IsMouseButtonPressed(1) then
                while IsMouseButtonPressed(1) do
                    MoveMouseRelative(recoil.horizontal, recoil.vertical)
                    Sleep(7)
                end
            end
        end
    end
end

--// MAIN EVENT HANDLER \\--
function OnEvent(event, arg)
    if isRecoilControlEnabled() and isToggleKeyActive() then
        handleRecoilControl()
    end
end