# Phase 1: Research & stack confirmation - Context

**Gathered:** 2026-04-30  
**Status:** Ready for planning

<domain>
## Phase Boundary

Lock **Steam/App ID**, **native Linux** dedicated server layout, **CLI flags**, **ports**, and a **yolk/runtime recommendation** (with fallbacks in research). Deliverables are **citations**, **≥2 games-steamcmd reference comparisons** (one anchor named below + one researcher-chosen), and **explicit runtime guidance** for Phase 2. Does **not** ship egg JSON or install scripts — Phase 2 only.

</domain>

<decisions>
## Implementation Decisions

### Reference eggs (benchmarks)

- **D-01:** Use a **hybrid** benchmark strategy: the **anchor** comparison egg is **`gmod`** (folder `gmod` in [pelican-eggs/games-steamcmd](https://github.com/pelican-eggs/games-steamcmd)).  
- **D-02:** The **second** reference egg is **not fixed** in CONTEXT — the researcher must choose **one additional** egg that contrasts or reinforces patterns (e.g. different stop/done semantics, different yolk class, or simpler SteamCMD layout), and **justify the choice** in research output.

### Research artifact shape

- **D-03:** Produce the **full** `.planning/research/` bundle aligned with GSD research conventions: at minimum substantive **`STACK.md`**, **`FEATURES.md`**, **`ARCHITECTURE.md`**, **`PITFALLS.md`**, and synthesized **`SUMMARY.md`** (paths under `.planning/research/`). Phase 1 success criteria in ROADMAP still apply; narrow docs alone are **not** sufficient.

### SteamCMD authentication stance

- **D-04:** Research assumes **anonymous SteamCMD** as the **default** install/update path. Document login, Steam Guard, or token/GSLT requirements **only where** Facepunch, Steam, or reproducible community practice **requires** them for dedicated server artifacts. Do **not** lead with complex auth unless evidence demands it.

### Yolk / runtime (not discussed — discretion)

- **D-05:** No binding choice between `dotnet_10`, `steamcmd:*`, or other images in CONTEXT. Phase 1 **must** output a **clear recommendation + fallbacks**; Phase 2 implements from research unless `/gsd-plan-phase` revisits.

### Claude's Discretion

- Exact phrasing of benchmark comparison tables, depth of Facepunch changelog/version notes, and which pitfall gets mapped to which future phase — researcher/planner discretion within ROADMAP success criteria.

</decisions>

<specifics>
## Specific Ideas

- Anchor **`gmod`** chosen as the familiar SteamCMD + Source/ecosystem reference for install/script patterns (subject to researcher nuance in write-up).

</specifics>

<canonical_refs>
## Canonical References

**Downstream agents MUST read these before planning or implementing Phase 2.**

### Project planning (local)

- `.planning/PROJECT.md` — Native Linux scope, HyberHost as non-v1 prior art, constraints  
- `.planning/REQUIREMENTS.md` — EGG-01–EGG-05 traceability  
- `.planning/ROADMAP.md` — Phase 1 goals and success criteria  

### Pelican / upstream (external URLs — no local mirror in repo)

- https://pelican.dev/docs/eggs/creating-a-custom-egg/ — Egg JSON, install script, variables, parsers, start/stop/done  
- https://sbox.game/dev/doc/networking/dedicated-servers/ — Dedicated server behavior for Linux  
- https://github.com/pelican-eggs/yolks — Yolk index (`dotnet_10`, `steamcmd:*`, etc.)  
- https://github.com/pelican-eggs/yolks/tree/master/dotnet/10 — Dotnet 10 yolk candidate  
- https://github.com/pelican-eggs/games-steamcmd — Reference eggs; **`gmod`** is the locked anchor folder for comparison  

### Community prior art (external)

- https://github.com/HyberHost/gameforge-sbox-egg/blob/main/sandbox-pelican.json — Wine/custom-image approach; **not** v1 target but useful for variable UX ideas  

</canonical_refs>

<code_context>
## Existing Code Insights

### Reusable Assets

- None in-repo yet — egg JSON and scripts will appear in Phase 2.

### Established Patterns

- Planning artifacts under `.planning/` follow GSD layout; research will extend `.planning/research/` per **D-03**.

### Integration Points

- Phase 2 will consume `.planning/research/SUMMARY.md` and this CONTEXT to author importable PTDL JSON and scripts.

</code_context>

<deferred>
## Deferred Ideas

- Wine + Windows .NET hosting — remains out of scope per PROJECT.md (HyberHost-style).  
- Binding a specific yolk in CONTEXT — intentionally deferred to research output (**D-05**).

</deferred>

---

*Phase: 01-research-stack*  
*Context gathered: 2026-04-30*
