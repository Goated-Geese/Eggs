# Research — Architecture (deployment view)

**Phase:** 1  
**Updated:** 2026-04-30

## Flow

```text
Operator → Pelican/Wings → Allocation
                ↓
        Install script (SteamCMD @ /mnt/server)
                ↓
        app_update 1892930 validate (anonymous default)
                ↓
        Container runtime (.NET yolk) @ /home/container
                ↓
        sbox-server process (+game, ports, hostname, …)
```

## Comparison to reference eggs

| Egg | Install | Runtime class | Lesson for s&box |
|-----|---------|------------------|------------------|
| **gmod** | steamcmd in `/mnt/server` | Source (`games:source`) | SteamCMD layout; **not** Source runtime. |
| **valheim** | same installer pattern | `games:valheim` | **done** / **stop** are game-specific—derive from s&box logs. |

## Key boundary

- **Phase 1:** Research + written artifacts only.  
- **Phase 2:** Egg JSON, scripts, variables, start/stop/done strings from **live** behavior.
