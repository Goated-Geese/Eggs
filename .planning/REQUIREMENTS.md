# Requirements: Pelican s&box egg

**Defined:** 2026-04-30  
**Core Value:** Repeatable Pelican egg for native Linux s&box dedicated server via SteamCMD, aligned with games-steamcmd patterns.

## v1 Requirements

### Egg / Panel integration

- [ ] **EGG-01**: Repo contains an importable Pelican egg definition (`PTDL_v2`-compatible JSON) with name, author, description, docker image reference(s), startup, config blocks, variables, install script
- [ ] **EGG-02**: Install script uses SteamCMD to fetch/update dedicated server files into `/mnt/server`, exits `0` on success, fails visibly on error (per Pelican expectations)
- [ ] **EGG-03**: Startup command invokes the **native Linux** dedicated server with documented placeholders for allocation/port and egg variables
- [ ] **EGG-04**: Stop command and **done** startup detection configured so Wings marks RUNNING/STOPPED correctly
- [ ] **EGG-05**: Variables cover game/package, server name, map, optional project path, extra args, player limits, update/branch options, and secrets (e.g. GSLT) with sane defaults and validation rules

### Documentation

- [ ] **DOC-01**: README documents import steps, required Wings/Pelican version assumptions, variable reference, and troubleshooting
- [ ] **DOC-02**: README contrasts this egg with HyberHost-style Wine-based approaches and states native Linux scope

### Verification

- [ ] **VER-01**: Manual or scripted smoke checklist documented (install flow, first boot, stop/start)

## v2 Requirements

### Future

- **AUTO-01**: Optional automation hooks (e.g. update-on-boot policies) beyond v1 parity with reference eggs  
- **BRANCH-01**: Extended beta-branch / staging workflows if demand exists  

## Out of Scope

| Feature | Reason |
|---------|--------|
| Wine/Windows binary hosting | Explicitly excluded for v1 (native Linux path) |
| Custom game panel outside Pelican | Egg-only scope |
| Guaranteed arm64 | Unless upstream + yolks support verified |

## Traceability

| Requirement | Phase | Status |
|-------------|-------|--------|
| EGG-01 | Phase 2 | Pending |
| EGG-02 | Phase 2 | Pending |
| EGG-03 | Phase 2 | Pending |
| EGG-04 | Phase 2 | Pending |
| EGG-05 | Phase 2 | Pending |
| DOC-01 | Phase 3 | Pending |
| DOC-02 | Phase 3 | Pending |
| VER-01 | Phase 3 | Pending |

**Coverage:**

- v1 requirements: 8 total  
- Mapped to phases: 8  
- Unmapped: 0 ✓  

---
*Requirements defined: 2026-04-30*  
*Last updated: 2026-04-30 after roadmap creation*
