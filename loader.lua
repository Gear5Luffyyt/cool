-- =========================
-- Shindo Hub FINAL Loader
-- Tier-based (Free / Premium)
-- With Backups
-- =========================

-- Load Rayfield
local Rayfield = loadstring(game:HttpGet("https://sirius.menu/rayfield"))()

Rayfield:CreateWindow({
    Name = "Shindo's Hub",
    Icon = 0,
    LoadingTitle = "Shindo's Hub",
    LoadingSubtitle = "by Shindo957",
    Theme = "DarkBlue",
    ToggleUIKeybind = "K",
    ConfigurationSaving = {
        Enabled = false
    }
})

-- Services
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

-- =========================
-- TIERS (from your gist)
-- =========================
local PremiumUsers = {
    ["1659222851"] = true,
    ["11495339"] = true
}

local isPremium = PremiumUsers[tostring(LocalPlayer.UserId)] or false

-- =========================
-- SCRIPT URLS
-- =========================

-- MAIN (NEW)
local MAIN_FREE = "https://api.junkie-development.de/api/v1/luascripts/public/e5ac451a81b14e32837cce02ac6fa39bf1e2a0d279973d854fa3dc676b6c9e05/download"
local MAIN_PREMIUM = "https://api.junkie-development.de/api/v1/luascripts/public/21dd968c8e45787aedbfb07e71a57452be1425668d0a3bb0e409d2dac33c2711/download"

-- BACKUPS (OLD)
local BACKUP_FREE = "https://pastebin.com/raw/rUTTzMa8"
local BACKUP_PREMIUM = "https://pastebin.com/raw/U9cgU11K"

-- =========================
-- LOADER FUNCTION
-- =========================
local function loadScript(primaryUrl, backupUrl, tierName)
    Rayfield:Notify({
        Title = "Shindo Hub",
        Content = "Loading "..tierName.." version...",
        Duration = 3
    })

    local success, err = pcall(function()
        loadstring(game:HttpGet(primaryUrl, true))()
    end)

    if not success then
        warn("[Shindo Hub] Primary failed, loading backup:", err)

        Rayfield:Notify({
            Title = "Shindo Hub",
            Content = "Primary failed. Loading backup...",
            Duration = 4
        })

        pcall(function()
            loadstring(game:HttpGet(backupUrl, true))()
        end)
    end
end

-- =========================
-- EXECUTION
-- =========================
if isPremium then
    loadScript(MAIN_PREMIUM, BACKUP_PREMIUM, "PREMIUM")
else
    loadScript(MAIN_FREE, BACKUP_FREE, "FREE")
end
