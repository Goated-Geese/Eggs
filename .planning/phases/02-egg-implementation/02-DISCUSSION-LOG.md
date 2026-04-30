# Phase 2: Egg implementation — Discussion Log

> **Audit trail only.** Do not use as input to planning, research, or execution agents.  
> Decisions are captured in `02-CONTEXT.md`.

**Date:** 2026-04-30  
**Phase:** 2 — Egg implementation  
**Areas discussed:** Repository layout; Docker images (install vs runtime); Startup done detection; Stop behavior; Variables & defaults; Branch/update knobs  

**User selection:** User replied **`all`** — all six gray areas were addressed in one pass with decisions locked to CONTEXT.

---

## Repository layout

| Option | Description | Selected |
|--------|-------------|----------|
| `sbox/` subdirectory | Egg JSON and related paths under `sbox/` at repo root | ✓ |
| Repo root only | Single JSON at repository root | |
| Multiple game folders | Split by variant | |

**User's choice:** **all** → interpreted as consent to proceed with recommended **sbox/** layout (D-01).

**Notes:** Matches ROADMAP example (`sbox/` or root); subdirectory chosen for clarity.

---

## Docker images (install vs runtime)

| Option | Description | Selected |
|--------|-------------|----------|
| Debian installer + dotnet_10 yolk | Match games-steamcmd + Phase 1 research | ✓ |
| Single combined image | One image for install and run | |

**User's choice:** **all** → **D-02** locks `parkervcp/installers:debian` for install and `pelican-eggs/yolks:dotnet_10` for runtime with fallback note.

---

## Startup “done” detection

| Option | Description | Selected |
|--------|-------------|----------|
| Provisional done + Phase 3 validation | Ship workable placeholder; document log capture to refine | ✓ |
| Wait for live log before any egg | Block Phase 2 | |

**User's choice:** **all** → **D-03** provisional done + mandatory Phase 3 written validation path per ROADMAP.

---

## Stop behavior

| Option | Description | Selected |
|--------|-------------|----------|
| `quit` first, then document SIGTERM | Source-egg style then fallback | ✓ |
| Only `^C` style | Valheim pattern | |

**User's choice:** **all** → **D-04**.

---

## Variables (names & defaults)

| Option | Description | Selected |
|--------|-------------|----------|
| HyberHost-friendly + Facepunch defaults | SERVER_NAME, ports, sandbox/flatgrass defaults, optional project/token | ✓ |
| Minimal variables only | Fewer fields | |

**User's choice:** **all** → **D-05**.

---

## Branch / update knobs

| Option | Description | Selected |
|--------|-------------|----------|
| BETA_BRANCH, optional passwords, validate in install | Mirrors Phase 1 SteamCMD | ✓ |
| No beta exposure | Stable only | |

**User's choice:** **all** → **D-06**.

---

## Claude's Discretion

- Exact **done** regex/string and egg JSON filename under `sbox/` — see CONTEXT **Claude's Discretion**.

## Deferred Ideas

- Captured in CONTEXT `<deferred>` (AUTO-01, Wine path, perfect done without live boot).
