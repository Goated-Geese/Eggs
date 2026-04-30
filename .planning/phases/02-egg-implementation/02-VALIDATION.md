---
phase: 2
slug: egg-implementation
status: draft
nyquist_compliant: true
created: 2026-04-30
---

# Phase 2 — Validation Strategy

Manual-first (egg JSON + bash install); no unit test framework in repo.

## Test Infrastructure

| Property | Value |
|----------|--------|
| **JSON lint** | `Get-Content sbox/egg-sbox.json | ConvertFrom-Json` (PowerShell) or `python -m json.tool sbox/egg-sbox.json` |
| **Quick check** | Grep for `1892930`, `dotnet_10`, `installers:debian` in egg JSON |
| **Install** | Full install only on real Wings allocation (Phase 3 / operator) |

## Per-Plan Verification Map

| Task | Plan | Requirement | Automated | Status |
|------|------|-------------|-----------|--------|
| Egg file exists | 02-01 | EGG-01 | `Test-Path sbox/egg-sbox.json` | ⬜ |
| SteamCMD in install | 02-01 | EGG-02 | `Select-String steamcmd` + `1892930` on egg JSON | ⬜ |
| Native startup | 02-01 | EGG-03 | `sbox-server.exe` + `+game` in startup string | ⬜ |
| Stop/done present | 02-01 | EGG-04 | `config.stop`, startup done JSON | ⬜ |
| Variables set | 02-01 | EGG-05 | Count env_variable entries ≥ 5 | ⬜ |

## Manual-Only

| Behavior | Why manual |
|----------|------------|
| Done regex matches live log | Requires running server |
| dotnet_10 binary compatibility | Requires container boot |
