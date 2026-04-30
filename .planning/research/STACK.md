# Research — Stack (s&box Pelican egg)

**Phase:** 1  
**Updated:** 2026-04-30

## Runtime

- **Game server:** s&box Linux dedicated server (Steam App ID **1892930**).
- **Framework:** .NET (official Facepunch Linux doc requires [.NET runtime](https://dotnet.microsoft.com/en-us/download)).
- **Binary entry:** `./sbox-server.exe` in shipped layout (Facepunch example).

## Container images

| Role | Recommendation | Notes |
|------|----------------|--------|
| **Game runtime** | `ghcr.io/pelican-eggs/yolks:dotnet_10` | Confirm .NET major matches binary in Phase 2. |
| **Install (SteamCMD)** | `ghcr.io/parkervcp/installers:debian` (or Pelican steamcmd installer) | Same family as `games-steamcmd` eggs. |

## Install tool

- **SteamCMD** — see RESEARCH `01-RESEARCH.md` §1 for exact stanza.

## Out of scope (v1)

- Wine / Windows .NET hosting.
