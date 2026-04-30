# Phase 1: Research & stack confirmation - Discussion Log

> **Audit trail only.** Do not use as input to planning, research, or execution agents.  
> Decisions are captured in `01-CONTEXT.md`.

**Date:** 2026-04-30  
**Phase:** 1 — Research & stack confirmation  
**Areas discussed:** Reference eggs, Research artifacts, SteamCMD auth  
**Areas not selected for discussion:** Yolk strictness (remains researcher recommendation per PROJECT.md)

---

## Gray area selection

| Option | Description | Selected |
|--------|-------------|----------|
| Reference eggs | How benchmarks are chosen | ✓ |
| Research artifacts | Output file layout | ✓ |
| Yolk strictness | Binding Phase 2 to a yolk | Not discussed |
| SteamCMD auth | Anonymous vs explicit auth research | ✓ |

**User's choice:** Discuss reference eggs, artifacts, and steam auth; skip yolk binding discussion.

---

## Reference eggs

| Option | Description | Selected |
|--------|-------------|----------|
| User names specific folders | User lists games-steamcmd folders | |
| Researcher picks only | No fixed anchor | |
| Hybrid anchor | User names one anchor; researcher picks second | ✓ |

**Anchor follow-up:**

| Option | Selected |
|--------|----------|
| rust | |
| brickadia | |
| gmod | ✓ |
| satisfactory | |
| Other | |

**User's choice:** Hybrid with anchor **`gmod`**. Second egg: researcher-selected with justification.

**Notes:** Contrasts/complexity should be explicit in research.

---

## Research artifacts

| Option | Selected |
|--------|----------|
| Full `.planning/research/` (STACK, FEATURES, ARCHITECTURE, PITFALLS, SUMMARY) | ✓ |
| Lean single file under phase folder | |
| Minimal — PROJECT.md only | |

---

## SteamCMD authentication

| Option | Selected |
|--------|----------|
| Anonymous first; document login/GSLT only if required | ✓ |
| Always explicit auth subsection | |
| Bind v1 to anonymous-only unless proven otherwise | |

---

## Claude's Discretion

- Yolk recommendation wording and fallback ordering in research outputs.

## Deferred Ideas

- None beyond roadmap/out-of-scope items already in PROJECT.md.
