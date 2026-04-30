# Phase 2: Egg implementation — Context

**Gathered:** 2026-04-30  
**Status:** Ready for planning

<domain>
## Phase Boundary

Deliver a **single importable Pelican egg** (PTDL_v2-compatible JSON): **install script** (SteamCMD → `/mnt/server`), **startup / stop / done**, **variables**, and **docker image references**, aligned with Phase 1 (App ID **1892930**, native Linux, dotnet yolk hypothesis). Includes **bundled script text** in the egg as required by Pelican.

**Out of scope for Phase 2:** README operator guide (Phase 3), formal VER-01 checklist execution (Phase 3), Wine/HyberHost runtime path.

**ROADMAP success criteria:** importable JSON under agreed repo path; install places files where runtime expects; startup matches Facepunch Linux dedicated behavior for a **default** game/map package; stop/done **rationalized** against Pelican semantics with **written test steps for Phase 3** (per ROADMAP — no requirement for production‑perfect done regex before Phase 3).

</domain>

<decisions>
## Implementation Decisions

### Repository layout

- **D-01:** Ship the egg as a **`sbox/`** directory at the repository root containing at minimum the **exportable egg JSON** (PTDL_v2) and any **paths referenced by the egg** (convention: `sbox/egg-sbox.json` or Pelican export filename — exact filename is planner/executor discretion provided imports work). Do **not** place the primary egg JSON loose at repo root unless tooling demands it — prefer **`sbox/`** as the single obvious import location.

### Docker images (install vs runtime)

- **D-02:** Use **two roles**, matching games-steamcmd separation:
  - **Installation script container:** `ghcr.io/parkervcp/installers:debian` (same family as `games-steamcmd` eggs).
  - **Runtime (game) container:** `ghcr.io/pelican-eggs/yolks:dotnet_10` as **primary**, per `.planning/phases/01-research-stack/01-RESEARCH.md` §3 and `.planning/research/SUMMARY.md`. Egg description must state that the **.NET major** must match the shipped Linux dedicated server and may require changing the tag after verification.
  - **Fallback:** If `dotnet_10` fails compatibility testing, switch to the nearest compatible **`ghcr.io/pelican-eggs/yolks:dotnet_*`** tag per Phase 1 fallbacks — capture the chosen tag in egg metadata after verification.

### Startup “done” detection

- **D-03:** **No authoritative “ready” line** is published in Facepunch docs alone. The egg must ship a **provisional** `config.startup` **done** rule so Wings can transition off **Starting** in the common case, but **must** treat exact matching as **validated during Phase 3** (operator captures one successful boot log). Phase 2 **must** include **written steps** (short subsection in a `TESTING.md` under `sbox/` or equivalent, or embedded in egg notes) describing how to **paste the first stable “server ready” line** and update the egg/panel config if the server stays on Starting. **Default placeholder** for first ship: prefer a **broad safe pattern** over silence — e.g. match a substring known to appear once the process is live (executor should grep sample logs or community references); if none, document **manual “mark running” workaround** is unacceptable — minimum is **documented iterative refinement** in Phase 3. **Locked intent:** done regex/string **must not** blindly copy GMod or Valheim eggs.

### Stop behavior

- **D-04:** Set **`config.stop`** to **`quit`** (console command) **if** the dedicated server accepts console input the way Source-style eggs do; if Phase 2 testing shows `quit` is ignored, fall back to **Wings default signal stop** and document. Order of attempt: **`quit`** → document **SIGTERM** / panel stop as normal Wings behavior.

### Variables (names, defaults, HyberHost alignment)

- **D-05:** Prefer **operator-friendly names** consistent with common Pelican + prior art where they do not conflict with Facepunch semantics:
  - **Server title:** map to `+hostname` (e.g. env `SERVER_NAME`).
  - **Ports:** allocation port → `+port`; separate **query** → `+net_query_port` (variable names e.g. `SERVER_PORT`, `QUERY_PORT` — exact spelling up to executor within Pelican rules).
  - **Default game/map idents:** seed defaults from Facepunch doc examples: **`facepunch.sandbox`** and **`facepunch.flatgrass`** as **defaults** (operator-editable).
  - **Optional project:** variable for **`.sbproj` path** when used (`SBOX_PROJECT` or equivalent).
  - **Steam game server token (optional):** variable for `+net_game_server_token` when operators want a stable Steam ID (Facepunch documents optional).
  - **Extra CLI:** `EXTRA_ARGS` or single consolidated field for rare toggles.
  - **App ID:** default **1892930**; may be **hidden** or read-only variable if panel discourages edits.
  - **Secrets / validation:** follow EGG-05 — sensible defaults, validation rules where Pelican supports them.

### Branch and update knobs

- **D-06:** Mirror Phase 1 SteamCMD capabilities in install script and variables:
  - Optional **`BETA_BRANCH`** (empty = default branch; **`staging`** documented as upstream staging).
  - Optional **beta password** variable if required by branch.
  - Install uses **`validate`** on `app_update` per Facepunch example; expose **`INSTALL_FLAGS`** only if needed for future-proofing (default empty).

### Claude's Discretion

- Exact JSON export filename under `sbox/`, ordering/sort fields on variables, and precise regex for **done** placeholder — provided **D-03**’s intent (provisional + Phase 3 validation path) is satisfied.
- Minor wording of egg **description** / **author** fields.

</decisions>

<specifics>
## Specific Ideas

- Default **`+game` / map** pair from Facepunch Linux example: `facepunch.sandbox` + `facepunch.flatgrass`.
- HyberHost egg is **non-target** for runtime but useful for **variable UX** ideas (`SERVER_NAME`, `MAP`, `SBOX_PROJECT`-style naming).

</specifics>

<canonical_refs>
## Canonical References

**Downstream agents MUST read these before planning or implementing.**

### Planning & research (repo)

- `.planning/PROJECT.md` — Scope, constraints, HyberHost as contrast only  
- `.planning/REQUIREMENTS.md` — EGG-01–EGG-05  
- `.planning/ROADMAP.md` — Phase 2 goal and success criteria  
- `.planning/phases/01-research-stack/01-RESEARCH.md` — App ID, SteamCMD line, yolk rationale, egg benchmarks  
- `.planning/phases/01-research-stack/01-CONTEXT.md` — Phase 1 decisions D-01–D-05  
- `.planning/research/SUMMARY.md` — Stack synthesis  

### Upstream (URLs)

- https://pelican.dev/docs/eggs/creating-a-custom-egg/ — Egg schema, install/runtime paths  
- https://sbox.game/dev/doc/networking/dedicated-servers/ — Linux startup, CLI switches, `.sbproj`  
- https://github.com/pelican-eggs/yolks — Runtime images  
- https://github.com/pelican-eggs/games-steamcmd — Install script patterns (gmod / valheim references from Phase 1)  

</canonical_refs>

<code_context>
## Existing Code Insights

### Reusable Assets

- **None** in-repo yet — Phase 2 introduces the first egg JSON and scripts.

### Established Patterns

- Phase 1 locked **games-steamcmd**-style SteamCMD install under `/mnt/server` and **dotnet** runtime hypothesis.

### Integration Points

- Wings/Pelican will consume exported JSON; variables map to **Facepunch CLI** and **SteamCMD** lines from research.

</code_context>

<deferred>
## Deferred Ideas

- **Automated update-on-boot policies** — AUTO-01 / v2.  
- **Wine-based Windows binary egg** — out of scope per PROJECT.md.  
- **Perfect done detection without a live boot** — not realistic; handled via Phase 3 verification steps.

</deferred>

---

*Phase: 02-egg-implementation*  
*Context gathered: 2026-04-30 (discuss-phase: user selected **all** gray areas)*
