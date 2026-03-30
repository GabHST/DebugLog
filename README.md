# DebugLog

> **[PT-BR]** Logger interno silencioso de erros e eventos para WoW Vanilla 1.12.1
> **[EN]** Silent internal error and event logger for WoW Vanilla 1.12.1

![WoW 1.12.1](https://img.shields.io/badge/WoW-1.12.1_Vanilla-yellow)
![Silent](https://img.shields.io/badge/mode-silent-gray)

---

## PT-BR

DebugLog captura todos os erros Lua, eventos de quest, mudancas de target e atividade de addons nas SavedVariables para debug pos-sessao. Completamente invisivel pro jogador.

### Funcionalidades
- Captura **todos os erros Lua** via error handler customizado
- Loga **eventos de quest**: aceitar, completar, entregar, greeting, gossip
- Loga **mudancas de target**
- Hookeia **seta do pfQuest** (SetTarget)
- Funcao global `DebugLog(category, msg)` pra qualquer addon usar
- **100% silencioso** — sem mensagens no chat

### Instalacao
1. Copie a pasta `DebugLog` em `WoW/Interface/AddOns/`
2. Jogue normalmente
3. Leia os logs em `WTF/Account/<nome>/SavedVariables/DebugLog.lua`

---

## EN

DebugLog captures all Lua errors, quest events, target changes, and addon activity into SavedVariables for post-session debugging. Completely invisible to the player.

### Features
- Captures **all Lua errors** via custom error handler
- Logs **quest events**: accept, complete, turn-in, greeting, gossip
- Logs **target changes** with unit names
- Hooks **pfQuest arrow** SetTarget
- Global `DebugLog(category, msg)` function for any addon
- **100% silent** — no chat messages, no UI

### Installation
1. Copy `DebugLog` folder into `WoW/Interface/AddOns/`
2. Play normally
3. Read logs at `WTF/Account/<name>/SavedVariables/DebugLog.lua`

---

## License / Licenca

MIT
