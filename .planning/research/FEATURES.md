# Research — Features & operator surface

**Phase:** 1  
**Updated:** 2026-04-30

## Upstream capabilities (dedicated server)

From Facepunch dedicated-server documentation:

- Load **game** package (+ optional map) via `+game`.
- **Hostname**, **game port**, **query port** via `+hostname`, `+port`, `+net_query_port`.
- Optional **Steam game server token** via `+net_game_server_token` (optional today; release posture may change).
- Load **local project** via path to `.sbproj` (hotload behavior for connected clients).

## Egg variables (Phase 2 target — not locked here)

Align with HyberHost-style UX **names** where helpful (`SERVER_NAME`, ports, project/ident), but wire to **native Linux + SteamCMD** behavior per RESEARCH.

## Panel features

- PTDL_v2 / PLCN_v3 compatibility per chosen Pelican version.
- SteamCMD install under `/mnt/server`; runtime under `/home/container`.
