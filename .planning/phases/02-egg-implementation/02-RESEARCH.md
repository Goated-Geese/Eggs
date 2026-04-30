# Phase 2 — Implementation research (egg authoring)

**Status:** Complete  
**Date:** 2026-04-30

## Purpose

Bridge **02-CONTEXT.md** decisions to concrete Pelican PTDL_v2 / Wings behavior. Stack facts are **not** re-derived here — see `.planning/phases/01-research-stack/01-RESEARCH.md` and `.planning/research/SUMMARY.md`.

## Pelican mechanics (authoritative)

- Install scripts run with **`/mnt/server`** as the install root; runtime uses **`/home/container`** (same tree mapped). Source: https://pelican.dev/docs/eggs/creating-a-custom-egg/
- Startup uses **`{{VAR}}`** placeholders; install scripts use **`${VAR}`**.
- **Stop** may be console command (`quit`), `^C`, or **`^SIGTERM`** per Pelican docs.
- **Start Configuration** `done` is a substring that must appear in console output before Wings marks **RUNNING**.

## s&box layout (from Phase 1)

- SteamCMD install command: `+login anonymous +app_update 1892930 validate +quit` (optional beta flags).
- Default relative install path for dedicated files: `steamcmd/steamapps/common/sbox dedicated server` (contains **`sbox-server.exe`** on Linux).
- Linux startup example (Facepunch): `#!/bin/bash` then `./sbox-server.exe +game facepunch.sandbox facepunch.flatgrass +hostname "My Dedicated Server"` — working directory must be the directory containing **`sbox-server.exe`**.

## Provisional `done` line (D-03)

No official single “ready” string is published. **Practical placeholder:** match a stable substring likely to appear once the process is live — e.g. **`sbox`** or **`Dedicated`** — avoid copying GMod/Valheim eggs. **Must** refine using captured stdout in Phase 3 (`TESTING.md`).

## Validation Architecture

| Dimension | Approach |
|-----------|----------|
| **Schema** | Egg JSON parses as JSON; `meta.version` reflects PTDL_v2 export. |
| **Install** | Script exits `0`; SteamCMD returns success; `sbox-server.exe` exists under expected path after install (manual or CI smoke). |
| **Runtime** | Startup invocation matches Facepunch argument semantics for default game/map. |
| **Done/stop** | Documented mental test + Phase 3 log capture; stop tries `quit` then SIGTERM behavior per Pelican. |

## RESEARCH COMPLETE
