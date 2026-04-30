# Phase 1 — Technical research: Pelican s&box egg (native Linux)

**Status:** Complete  
**Date:** 2026-04-30

## 1. Steam / App ID and SteamCMD install stanza

### Authoritative source

Facepunch **Dedicated Servers** documentation:  
https://sbox.game/dev/doc/networking/dedicated-servers/

### Locked values

| Item | Value | Notes |
|------|--------|--------|
| **Steam App ID** (dedicated server tool) | **1892930** | Cited on official page; links to SteamDB `app/1892930`. |
| **Default install/update command** | `./steamcmd +login anonymous +app_update 1892930 validate +quit` | Run from the directory where SteamCMD was installed. |
| **Staging branch** | Add `-beta staging` to the `app_update` line if hosting on staging (may not be playable by all clients). |
| **Default install path (relative)** | `steamcmd/steamapps/common/sbox dedicated server` | After install; used when wiring Pelican `working_directory` / startup paths in Phase 2. |

### Authentication stance (per CONTEXT D-04)

- **Default:** `+login anonymous` as in the official example.  
- **Advanced:** `+net_game_server_token` is documented for a **stable Steam ID** for the dedicated server; Facepunch states it is *not required* and is mainly relevant once s&box is further along in release—track upstream for changes.  
- **GSLT / game server login token:** No extra token is required for the *install* step in current official docs; re-validate if Steam policy changes.

### SteamCMD background

- Valve SteamCMD reference (linked from Facepunch):  
  https://developer.valvesoftware.com/wiki/SteamCMD

---

## 2. Linux runtime, layout, and process model

### .NET requirement

Official doc **Linux** section: the server **runs on .NET**; install the **.NET runtime** from Microsoft:  
https://dotnet.microsoft.com/en-us/download

The example startup script invokes:

`./sbox-server.exe +game ...`

So the Linux package still uses the `sbox-server.exe` name (common for cross-platform .NET / shipping layout). Phase 2 must set `working_directory` to the directory containing that file (under the default install tree above).

### CLI parameters (non-exhaustive — track upstream table)

| Switch | Role |
|--------|------|
| `+game` | Game package ident; can include map package. |
| `+hostname` | Server title. |
| `+port` | Game port. |
| `+net_query_port` | Query / A2S info port. |
| `+net_game_server_token` | Optional stable Steam game server token (see Facepunch table). |
| Path to `.sbproj` | Load a local project; clients may hotload code (see official doc). |

### Ports

- **Game and query ports** are explicitly called out as `+port` and `+net_query_port` in the official parameter table. Exact defaults and whether both are required for minimal operation should be confirmed against the shipped binary and ConVar list in Phase 2 (allocation placeholders in egg).

---

## 3. Yolk / image recommendation (CONTEXT D-05)

### Primary recommendation

**`ghcr.io/pelican-eggs/yolks:dotnet_10`** as the **first-choice runtime image** for Phase 2 **provided** that:

1. The s&box Linux dedicated binary targets **.NET 10** (or is compatible with the runtime bundled in that yolk).  
2. Phase 2 verification runs `dotnet --info` (or Facepunch-published runtime notes) inside the container and matches expectations.

**Rationale:** Official Linux instructions center on **.NET**; Pelican’s **dotnet** yolk family is the closest maintained match to “generic .NET runtime in container” among indexed yolks (see https://github.com/pelican-eggs/yolks — `dotnet/10`).

### Fallbacks (if dotnet_10 mismatches shipped runtime)

1. **Another `pelican-eggs/yolks` dotnet tag** aligned with the actual major runtime (e.g. `dotnet_9`) once version is confirmed from binary or release notes.  
2. **SteamCMD-oriented installer + explicit runtime:** Use the same **installer** pattern as `games-steamcmd` eggs (`ghcr.io/parkervcp/installers:debian` or Pelican’s steamcmd installer image) for `app_update`, then **switch** runtime image to the dotnet yolk that matches the server’s needs—mirroring how Source and Valheim eggs separate **install** vs **run** images.

### Non-recommendation for v1 primary runtime

- **Wine + Windows .NET** stacks (e.g. HyberHost-style): explicitly **out of scope** for v1 per `PROJECT.md`; keep as documentation contrast only.

---

## 4. Reference egg comparison

(≥2 games-steamcmd eggs required by ROADMAP—see subsections below.)

### 4.1 Anchor: **Garry’s Mod** (`gmod/`) — per CONTEXT D-01

**Source:**  
https://github.com/pelican-eggs/games-steamcmd/tree/main/gmod  
Example export: `egg-pterodactyl-garry-s-mod--reworked.json` (PTDL_v2).

| Aspect | GMod pattern | Borrow for s&box |
|--------|----------------|-------------------|
| **Install** | Bundled SteamCMD under `/mnt/server/steamcmd`, `+force_install_dir /mnt/server`, `+app_update`, `validate`, `anonymous` default | Same SteamCMD layout; swap `SRCDS_APPID` for **1892930**; no 32/64 SDK copy unless s&box needs similar steamclient layout (verify in Phase 2). |
| **Runtime image** | `ghcr.io/parkervcp/games:source` | s&box is **not** Source—use **dotnet** yolk instead. |
| **Startup** | `srcds_run` with `+ip 0.0.0.0`, port, map | s&box uses `sbox-server` + `+game` / `+hostname` / ports per Facepunch. |
| **config.startup “done”** | JSON string: e.g. match on console text (`gameserver Steam ID`) | s&box needs a **new** done string from real logs in Phase 2—do not copy gmod’s string. |
| **Stop** | `quit` | May differ for s&box; confirm signal/quit behavior when egg is tested. |
| **Variables** | Map, GSLT, players | Map to s&box idents, hostname, ports, project/sbproj, optional token. |

### 4.2 Second egg: **Valheim** (`valheim/valheim_vanilla/`) — researcher choice (contrast)

**Justification:** Valheim is a **non-Source** dedicated server with a **different** runtime image class (`ghcr.io/parkervcp/games:valheim`), **different** `done` detection (`DungeonDB Start`), and **Ctrl+C** style **stop**—illustrating that **done** and **stop** are game-specific and must be derived from s&box logs, not copied from GMod.

**Source:**  
https://github.com/pelican-eggs/games-steamcmd/tree/main/valheim/valheim_vanilla  
`egg-valheim.json` (PLCN_v3 / Pelican export with `update_url`).

| Aspect | Valheim pattern | Contrast with s&box |
|--------|------------------|---------------------|
| **Meta** | `PLCN_v3`, `update_url` for auto-import | Phase 2 should target Pelican **PTDL_v2**/`PLCN_v3` conventions per panel version—follow repo convention when authoring JSON. |
| **Startup** | `./valheim_server.x86_64` with many toggles | s&box uses **dotnet** + `sbox-server.exe` invocation pattern from Facepunch doc. |
| **done** | `DungeonDB Start` | s&box will need its own substring—**must be captured from live logs**. |
| **stop** | `^C` | Likely different for s&box—confirm in Phase 2. |
| **docker_images** | Game-specific `parkervcp/games:valheim` | Parallel: s&box → **dotnet** yolk (not Valheim image). |

---

## 5. Pelican egg mechanics (install vs runtime)

Cross-cutting reminders from Pelican egg authoring doc (canonical ref in CONTEXT):

- Install script runs against **`/mnt/server`**; runtime uses **`/home/container`** and Wings-injected environment.  
- Variables, parsers, and startup/stop/done blocks must match Pelican’s egg schema for the target panel version.

---

## 6. Outputs for downstream phases

- **Phase 2** should read:  
  - `.planning/research/SUMMARY.md`  
  - This `01-RESEARCH.md`  
  - `01-CONTEXT.md` (decisions D-01–D-05)  
- **Traceability:** Phase 1 **informs** EGG-01–EGG-05; implementation and REQ checks land in Phases 2–3 per `REQUIREMENTS.md`.

---

## Validation Architecture (Nyquist / execution feedback)

This phase is **documentation-only**; no automated test framework applies. Validation dimensions for execute-phase and operator sign-off:

| Dimension | How to verify |
|-----------|----------------|
| **Source accuracy** | Every numeric ID and CLI example in this doc appears in Facepunch or linked primary sources. |
| **Coverage** | ROADMAP success criteria: SteamCMD stanza, ≥2 egg comparisons, yolk recommendation with fallbacks—all present. |
| **Staleness** | Re-check Facepunch dedicated-server page and SteamDB app `1892930` before Phase 2 ship if weeks elapse. |

---

## Citations (short)

1. Facepunch — Dedicated Servers: https://sbox.game/dev/doc/networking/dedicated-servers/  
2. SteamDB — s&box server app: https://steamdb.info/app/1892930/  
3. Pelican — eggs: https://pelican.dev/docs/eggs/creating-a-custom-egg/  
4. Pelican yolks: https://github.com/pelican-eggs/yolks  
5. games-steamcmd — gmod & valheim paths as above.

## RESEARCH COMPLETE
