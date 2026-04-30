# Pelican egg: s&box (S&box) dedicated server

## What This Is

A **Pelican Panel egg** (and supporting repo content) to run an **s&box dedicated game server** on **Linux** hosts, using **SteamCMD** for installation/updates in line with [pelican-eggs/games-steamcmd](https://github.com/pelican-eggs/games-steamcmd) patterns. The egg defines install script, startup, stop/done handling, and user-facing variables compatible with [Pelican’s egg system](https://pelican.dev/docs/eggs/creating-a-custom-egg/). Runtime targets the **native Linux dedicated server** as described in [s&box dedicated server networking](https://sbox.game/dev/doc/networking/dedicated-servers/) — not a Wine-wrapped Windows binary.

## Core Value

Operators can create a server from this egg and get a **repeatable, documented SteamCMD → Linux dedicated server** flow that behaves correctly under Wings/Pelican (start/stop, logs, allocations).

## Requirements

### Validated

(None yet — ship to validate)

### Active

- [ ] Egg installs server files via SteamCMD using patterns consistent with `games-steamcmd` eggs
- [ ] Runtime image/yolk matches **native Linux** s&box dedicated server needs (validate against Facepunch docs and shipped binary — not assumed `dotnet_10` until verified)
- [ ] Startup and **done** detection allow Wings to mark the server RUNNING reliably
- [ ] Safe stop behavior per Pelican docs (`stop` / signals as appropriate)
- [ ] User-controlled variables for game identity, name, map/project, common CLI toggles, Steam/GSLT-related fields as applicable
- [ ] Exportable Pelican JSON (`PTDL_v2`) with metadata (name, author, description, docker images, scripts)
- [ ] README in repo explaining import, variables, and differences vs community eggs (e.g. HyberHost)

### Out of Scope

- **Wine + Windows .NET** hosting path (HyberHost-style) — documented as alternative prior art only, not shipped in v1
- Panel/Wings core changes — egg-only deliverables
- ARM guarantees — follow upstream/yolk support; call out if amd64-only

## Context

**References**

| Topic | Link |
|--------|------|
| Pelican custom egg | https://pelican.dev/docs/eggs/creating-a-custom-egg/ |
| s&box dedicated (Linux) | https://sbox.game/dev/doc/networking/dedicated-servers/ |
| Pelican yolks index | https://github.com/pelican-eggs/yolks |
| dotnet 10 yolk (candidate — confirm against actual server) | https://github.com/pelican-eggs/yolks/tree/master/dotnet/10 → `ghcr.io/pelican-eggs/yolks:dotnet_10` |
| SteamCMD egg patterns | https://github.com/pelican-eggs/games-steamcmd |
| Community prior art | https://github.com/HyberHost/gameforge-sbox-egg/blob/main/sandbox-pelican.json |

**Prior art note:** HyberHost uses a **custom image** and Wine + Windows .NET; variables such as `GAME`, `SERVER_NAME`, `MAP`, `SBOX_PROJECT`, SteamCMD update toggles are useful references for UX even though our **runtime stack differs**.

## Constraints

- **Upstream truth**: Command-line flags, ports, and native Linux layout come from Facepunch/s&box docs — egg must track changes.
- **Pelican compatibility**: Parsers, placeholders, and install paths (`/mnt/server` install vs `/home/container` runtime) per Pelican documentation.
- **Steam**: SteamCMD app ID, branches, and login/anonymous rules must match current Facepunch/Steam expectations.

## Key Decisions

| Decision | Rationale | Outcome |
|----------|-----------|---------|
| Primary runtime path | User chose native Linux dedicated + SteamCMD patterns | — Pending |
| Yolk selection | `dotnet_10` was a hypothesis; confirm against actual Linux dedicated binary/runtime requirements | — Pending |

## Evolution

This document evolves at phase transitions and milestone boundaries.

**After each phase transition** (via `/gsd-transition`):

1. Requirements invalidated? → Move to Out of Scope with reason  
2. Requirements validated? → Move to Validated with phase reference  
3. New requirements emerged? → Add to Active  
4. Decisions to log? → Add to Key Decisions  
5. "What This Is" still accurate? → Update if drifted  

**After each milestone** (via `/gsd-complete-milestone`):

1. Full review of all sections  
2. Core Value check — still the right priority?  
3. Audit Out of Scope — reasons still valid?  
4. Update Context with current state  

---
*Last updated: 2026-04-30 after initialization (native Linux + SteamCMD direction confirmed)*
