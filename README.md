# DebugLog

**Silent internal error and event logger for WoW Vanilla 1.12.1**

Captures all Lua errors, quest events, target changes, and addon activity into SavedVariables for post-session debugging. Completely invisible to the player — zero UI output.

![WoW 1.12.1](https://img.shields.io/badge/WoW-1.12.1_Vanilla-yellow)
![Silent](https://img.shields.io/badge/mode-silent-gray)
![Auto-Update](https://img.shields.io/badge/auto--update-via%20launcher-green)

## Features

- Captures **all Lua errors** via custom error handler
- Logs **quest events**: accept, complete, turn-in, quest greeting, gossip
- Logs **target changes** with unit names
- Hooks **pfQuest arrow** SetTarget for navigation tracking
- Logs **addon loads**, **level ups**, **deaths**
- Global `DebugLog(category, msg)` function for any addon
- Categorized storage: `errors`, `events`, `arrow`, `vg`
- Max 150 entries per category (auto-trims)
- **100% silent** — no chat messages, no UI elements

## Installation

1. Copy `DebugLog` folder into `WoW/Interface/AddOns/`
2. Play normally
3. Read logs at `WTF/Account/<name>/SavedVariables/DebugLog.lua`

## Usage from other addons

```lua
DebugLog("VG", "Step advanced to 5")
DebugLog("ERROR", "Something broke")
DebugLog("ARROW", "Pointing to quest X")
```

## Auto-Update

Compatible with SoloCraft Launcher — auto-updates from GitHub Releases on every game launch.

## License

MIT
