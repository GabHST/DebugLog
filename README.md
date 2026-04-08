<p align="center">
  <h1 align="center">DebugLog</h1>
  <p align="center">
    <strong>Silent internal error and event logger for WoW Vanilla 1.12.1</strong>
  </p>
  <p align="center">
    <a href="https://github.com/GabHST/DebugLog/releases/tag/v1.3.0"><img src="https://img.shields.io/badge/version-1.3.0-brightgreen" alt="Version"></a>
    <img src="https://img.shields.io/badge/WoW-1.12.1_Vanilla-yellow" alt="WoW">
    <img src="https://img.shields.io/badge/mode-100%25_silent-gray" alt="Silent">
    <img src="https://img.shields.io/github/downloads/GabHST/DebugLog/total?color=purple&label=downloads" alt="Downloads">
    <a href="https://github.com/GabHST/DebugLog/stargazers"><img src="https://img.shields.io/github/stars/GabHST/DebugLog?style=flat&color=orange" alt="Stars"></a>
  </p>
</p>

---

<p align="center">
  <a href="https://github.com/GabHST/DebugLog/releases/download/v1.3.0/DebugLog.zip">
    <img src="https://img.shields.io/badge/%E2%AC%87%20Download-DebugLog_v1.3.0-2ea44f?style=for-the-badge" alt="Download">
  </a>
</p>

---

## What is this?

DebugLog silently captures all Lua errors, quest events, target changes, and addon activity into SavedVariables. **Zero UI** — completely invisible to the player. Read logs after your session.

---

## Features

| Feature | Description |
|---------|-------------|
| **Lua errors** | Captures all errors via custom error handler |
| **Quest events** | Accept, complete, turn-in, greeting, gossip |
| **Target changes** | Logs unit names on target switch |
| **pfQuest arrow** | Hooks SetTarget for navigation tracking |
| **Addon loads** | Logs when key addons initialize |
| **Level ups + deaths** | Tracks progression events |
| **Global API** | `DebugLog(category, msg)` for any addon |
| **100% silent** | No chat messages, no UI elements, ever |

---

## Installation

1. Download `DebugLog.zip` from the [Releases](https://github.com/GabHST/DebugLog/releases) page (or use the button above).
2. Extract the **DebugLog** folder into your `WoW/Interface/AddOns/` directory.
3. Play normally. Read logs at: `WTF/Account/<name>/SavedVariables/DebugLog.lua`

Your final folder structure should look like this:

```
Interface/AddOns/DebugLog/
├── DebugLog.lua
└── DebugLog.toc
```

> **Do NOT use the green "Code" button or download "Source code (zip)" from GitHub.** These create a nested folder (e.g. `DebugLog-main/DebugLog/...`) that WoW won't recognize. Always download from the **Releases** page.

---

## Usage from other addons

```lua
DebugLog("VG", "Step advanced to 5")
DebugLog("ERROR", "Something broke")
DebugLog("ARROW", "Pointing to quest X")
```

### Categories

| Category | Storage key | Purpose |
|----------|------------|---------|
| `ERROR` | `errors` | Lua errors |
| `ARROW` | `arrow` | pfQuest arrow changes |
| `VG` | `vg` | VanillaGuide events |
| *anything else* | `events` | General events |

Max 150 entries per category (auto-trims oldest).

---

## PT-BR

DebugLog captura silenciosamente todos os erros Lua, eventos de quest e atividade de addons nas SavedVariables. 100% invisivel pro jogador. Leia os logs em `WTF/Account/<nome>/SavedVariables/DebugLog.lua`.

---

## License

MIT

---

## Auto-Update

This addon supports **silent auto-update** via `LaunchSoloCraft.ps1`. Every time you launch WoW through the launcher:

1. It checks the latest release on GitHub
2. Compares with your installed version
3. Downloads and installs automatically if outdated
4. Shows a notification in WoW chat when loaded

No manual download needed after first install!

