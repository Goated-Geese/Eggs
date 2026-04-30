# Roadmap: Pelican s&box egg

**Project:** Pelican egg for native Linux s&box dedicated server (SteamCMD)  
**Convention:** Phases deliver sequential value; requirements map 1:1 to phases below.

---

## Phase 1 — Research & stack confirmation

**Goal:** Lock Steam/App IDs, native Linux dedicated server layout, CLI flags, ports, and correct runtime yolk (confirm or reject `ghcr.io/pelican-eggs/yolks:dotnet_10` vs `steamcmd`-family or other official images).

**Maps to requirements:** Informs all **EGG-**\* implementation decisions.

**Success criteria:**

1. Documented SteamCMD install stanza (app ID, branches, anonymous/login notes) with citations to official or verified sources  
2. Written comparison of **≥2** reference eggs from `games-steamcmd` (similar complexity) with notes borrowed for install/startup  
3. Explicit **yolk/runtime recommendation** with rationale and fallback options  

**Depends on:** —  

---

## Phase 2 — Egg implementation

**Goal:** Produce working egg JSON (and any bundled scripts), install script, startup/stop/done, variables aligned with Phase 1.

**Maps to requirements:** EGG-01 — EGG-05  

**Success criteria:**

1. Single importable egg JSON committed under repo path TBD (e.g. `sbox/` or root per repo convention)  
2. Install script completes on clean allocation and places files where runtime expects them  
3. Startup matches Facepunch Linux dedicated behavior for a default game/package  
4. Stop/done tested mentally against Pelican semantics (document test steps for Phase 3)  

**Depends on:** Phase 1  

---

## Phase 3 — Documentation & verification

**Goal:** README, operator troubleshooting, HyberHost contrast, verification checklist.

**Maps to requirements:** DOC-01, DOC-02, VER-01  

**Success criteria:**

1. README satisfies **DOC-01** and **DOC-02**  
2. Checklist covers install → first run → restart ( **VER-01** )  
3. Traceability table in REQUIREMENTS.md matches delivered files  

**Depends on:** Phase 2  

---

## Summary

| Phase | Focus | REQ IDs / notes |
|-------|--------|------------------|
| 1 | Research & runtime | Informs EGG-\* |
| 2 | Egg JSON + scripts | EGG-01 — EGG-05 |
| 3 | Docs + verify | DOC-01, DOC-02, VER-01 |
