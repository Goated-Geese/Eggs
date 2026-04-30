# Research synthesis — Phase 1

**Updated:** 2026-04-30  
**Read next:** `01-RESEARCH.md` (authoritative detail), `01-CONTEXT.md` (decisions D-01–D-05).

## Decisions (inform Phase 2)

| Topic | Conclusion |
|--------|------------|
| **App ID** | **1892930** — Facepunch + SteamDB. |
| **SteamCMD** | `+login anonymous +app_update 1892930 validate +quit`; optional `-beta staging`. |
| **Runtime** | **.NET** on Linux; entry `sbox-server.exe` in install tree. |
| **Yolk** | Prefer **`ghcr.io/pelican-eggs/yolks:dotnet_10`**; verify version match in Phase 2; fallbacks in `01-RESEARCH.md` §3. |
| **Benchmark eggs** | **gmod** (anchor) + **valheim_vanilla** (contrast) — see `01-RESEARCH.md` §4. |

## Deliverables status

| Artifact | Path |
|----------|------|
| Full research | `.planning/phases/01-research-stack/01-RESEARCH.md` |
| Bundle | `.planning/research/{STACK,FEATURES,ARCHITECTURE,PITFALLS,SUMMARY}.md` |

## Next phase

Phase 2 implements importable egg JSON, install script, startup/stop/done, variables — depends on Phase 1 outputs + live log capture for done detection.
