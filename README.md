# 9INESKULLS ANTI RECOIL V1 | For Logitech G Hub

## INSTALLATION GUIDE | STEP #1

```sh
Go onto Logitech G Hub and click on the three lines on the top left of the screen and click on "Games and Applications"
```

![Screenshot 2024-12-08 204910](https://github.com/user-attachments/assets/29f9e66f-fe88-495f-9c9a-2798dd80fb3a)

## STEP #2

```sh
Click on the game you'd like to use the anti recoil script on, then click on the "scripting" cog next to "details"
```

![Screenshot 2024-12-08 204438](https://github.com/user-attachments/assets/dc45bc27-d6ab-49ca-abc4-6506a25d42e6)

## STEP #3

```sh
Paste the script into the new script
```

![Screenshot 2024-12-08 204720](https://github.com/user-attachments/assets/4adf8efc-f7d8-4b6e-94ee-40c3754822b0)

## ALTERNATIVE IMPORT

```sh
You can click on the "import" section and import the lua file urself as shown bellow
```

![Screenshot 2024-12-08 204737](https://github.com/user-attachments/assets/8d21b9a8-6848-4c8a-9a2b-3a434131f4cc)

## CONFIG SETTINGS

```sh
local config = {
    enableRecoilControl = true,  -- // Whether recoil control is enabled or not
    requireToggleKey = true,     -- // Do we need a key press to toggle recoil control on/off?
    toggleKey = "CapsLock",      -- // The key used to toggle recoil control (CapsLock or ScrollLock)
    recoilMode = "LOW"           -- // Recoil control strength: LOW, MEDIUM, HIGH, ULTRA!

}
```

## RECOIL SETTINGS

```sh
local recoilSettings = {
    LOW = { vertical = 3, horizontal = 0 },
    MEDIUM = { vertical = 7, horizontal = 0 },
    HIGH = { vertical = 12, horizontal = 0 },
    ULTRA = { vertical = 20, horizontal = 0 }
}
```

## FUNCTION MODE

```sh
local function getRecoilStrength(mode)
    return recoilSettings[mode] or recoilSettings["LOW"]
end
```

## FUNCTION ENABLE CHECK

```sh
local function isRecoilControlEnabled()
    return config.enableRecoilControl
end
```

## FUNCTION KEY CHECK 

```sh
local function isToggleKeyActive()
    return not config.requireToggleKey or IsKeyLockOn(config.toggleKey) or IsKeyLockOn("ScrollLock")
end
```

## FUNCTION BUTTON MANAGE CHECK

```sh
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
```

## MAIN EVENT HANDLER

```sh
function OnEvent(event, arg)
    if isRecoilControlEnabled() and isToggleKeyActive() then
        handleRecoilControl()
    end
end
```
