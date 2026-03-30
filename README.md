# DebugLog

**Silent Lua error and event logger for WoW Vanilla 1.12.1**

DebugLog silently captures all Lua errors, quest events, target changes, and addon activity into SavedVariables for post-session analysis. Zero UI — completely invisible to the player.

![WoW 1.12.1](https://img.shields.io/badge/WoW-1.12.1_Vanilla-yellow)

## Features

- Captures **all Lua errors** via custom error handler
- Logs **quest events**: accept, complete, finish, log changes
- Logs **target changes** with unit names
- Logs **addon loads** (VanillaGuide, pfQuest, QuestPlates, AutoRogue)
- Hooks **pfQuest arrow SetTarget** to track arrow changes
- Logs **level ups** and **deaths**
- Global `DebugLog(category, msg)` function any addon can call
- Max 150 entries per category (auto-trims old entries)
- Separate categories: `errors`, `events`, `arrow`, `vg`

## Installation

1. Copy `DebugLog` folder into `WoW/Interface/AddOns/`
2. Play normally
3. After session, read `WTF/Account/<name>/SavedVariables/DebugLog.lua`

## Usage from other addons

```lua
DebugLog("VG", "Step advanced to 5")
DebugLog("ERROR", "Something went wrong")
DebugLog("ARROW", "Pointing to quest X")
```

## License

MIT
