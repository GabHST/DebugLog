-- DebugLog: Silent internal logger (no user-facing messages)
-- All output goes to: WTF/Account/GABHST/SavedVariables/DebugLog.lua

local DEBUGLOG_VERSION = GetAddOnMetadata("DebugLog", "Version") or "?"

DebugLogDB = DebugLogDB or {}
DebugLogDB.errors = DebugLogDB.errors or {}
DebugLogDB.events = DebugLogDB.events or {}
DebugLogDB.arrow = DebugLogDB.arrow or {}
DebugLogDB.vg = DebugLogDB.vg or {}
DebugLogDB.session_start = date("%Y-%m-%d %H:%M:%S")
DebugLogDB.session_count = (DebugLogDB.session_count or 0) + 1

local MAX = 150

local function trim(tbl)
  while table.getn(tbl) > MAX do table.remove(tbl, 1) end
end

local function ts() return date("%H:%M:%S") end

-- Global debug function any addon can call
function DebugLog(category, msg)
  if not DebugLogDB then DebugLogDB = {} end
  local cat = category or "MISC"
  local key = "events"
  if cat == "ERROR" then key = "errors"
  elseif cat == "ARROW" then key = "arrow"
  elseif cat == "VG" then key = "vg"
  end
  if not DebugLogDB[key] then DebugLogDB[key] = {} end
  table.insert(DebugLogDB[key], ts() .. " [" .. cat .. "] " .. (msg or "nil"))
  trim(DebugLogDB[key])
end

-- Capture all Lua errors
local origHandler = geterrorhandler()
seterrorhandler(function(msg)
  DebugLog("ERROR", msg or "unknown")
  if origHandler then origHandler(msg) end
end)

-- Log key events
local evLogger = CreateFrame("Frame")
evLogger:RegisterEvent("PLAYER_ENTERING_WORLD")
evLogger:RegisterEvent("ADDON_LOADED")
evLogger:RegisterEvent("QUEST_ACCEPTED")
evLogger:RegisterEvent("QUEST_COMPLETE")
evLogger:RegisterEvent("QUEST_FINISHED")
evLogger:RegisterEvent("QUEST_LOG_UPDATE")
evLogger:RegisterEvent("PLAYER_LEVEL_UP")
evLogger:RegisterEvent("PLAYER_DEAD")
evLogger:RegisterEvent("PLAYER_TARGET_CHANGED")
evLogger.questLogCount = 0
evLogger:SetScript("OnEvent", function()
  if event == "PLAYER_ENTERING_WORLD" then
    DebugLog("SESSION", "Entered world. Addons loaded. Level: " .. (UnitLevel("player") or "?"))
  elseif event == "ADDON_LOADED" then
    -- only log our addons
    local addon = arg1 or ""
    if addon == "VanillaGuide" or addon == "pfQuest" or addon == "QuestPlates" or addon == "AutoRogue" then
      DebugLog("LOAD", addon .. " loaded")
    end
  elseif event == "QUEST_ACCEPTED" then
    DebugLog("QUEST", "Accepted quest (index: " .. (arg1 or "?") .. ")")
  elseif event == "QUEST_COMPLETE" then
    DebugLog("QUEST", "Quest complete dialog")
  elseif event == "QUEST_FINISHED" then
    DebugLog("QUEST", "Quest interaction finished")
  elseif event == "QUEST_LOG_UPDATE" then
    local numEntries = GetNumQuestLogEntries() or 0
    if numEntries ~= this.questLogCount then
      DebugLog("QUEST", "Quest log changed: " .. numEntries .. " entries")
      this.questLogCount = numEntries
    end
  elseif event == "PLAYER_LEVEL_UP" then
    DebugLog("LEVEL", "Dinged level " .. (arg1 or "?"))
  elseif event == "PLAYER_DEAD" then
    DebugLog("DEATH", "Player died")
  elseif event == "PLAYER_TARGET_CHANGED" then
    local name = UnitName("target")
    if name then
      DebugLog("TARGET", "Target: " .. name)
    end
  end
end)

-- Hook pfQuest arrow SetTarget if available
local arrowHook = CreateFrame("Frame")
arrowHook:RegisterEvent("PLAYER_ENTERING_WORLD")
arrowHook:SetScript("OnEvent", function()
  arrowHook:UnregisterEvent("PLAYER_ENTERING_WORLD")
  if pfQuest and pfQuest.route and pfQuest.route.SetTarget then
    local origSetTarget = pfQuest.route.SetTarget
    pfQuest.route.SetTarget = function(node, default)
      if node then
        DebugLog("ARROW", "SetTarget: " .. (node.title or "nil") .. " spawn=" .. (node.spawn or "nil"))
      else
        DebugLog("ARROW", "SetTarget: RESET (nil)")
      end
      return origSetTarget(node, default)
    end
  end
end)
