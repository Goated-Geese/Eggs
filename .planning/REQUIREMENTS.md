# Requirements: Pelican s&box egg

**Defined:** 2026-04-30  
**Core Value:** Repeatable Pelican egg for native Linux s&box dedicated server via SteamCMD, aligned with games-steamcmd patterns.

## v1 Requirements

### Egg / Panel integration

- [x] **EGG-01**: Repo contains an importable Pelican egg definition (`PTDL_v2`-compatible JSON) with name, author, description, docker image reference(s), startup, config blocks, variables, install script — **`sbox/egg-sbox.json`**
- [x] **EGG-02**: Install script uses SteamCMD to fetch/update dedicated server files into `/mnt/server`, exits `0` on success, fails visibly on error (per Pelican expectations) — **`scripts.installation.script`** in `sbox/egg-sbox.json`
- [x] **EGG-03**: Startup command invokes the **native Linux** dedicated server with documented placeholders for allocation/port and egg variables — **`startup`** field in `sbox/egg-sbox.json`
- [x] **EGG-04**: Stop command and **done** startup detection configured so Wings marks RUNNING/STOPPED correctly — **`config.stop`**, **`config.startup`** in `sbox/egg-sbox.json`; refine **done** per **`sbox/TESTING.md`**
- [x] **EGG-05**: Variables cover game/package, server name, map, optional project path, extra args, player limits, update/branch options, and secrets (e.g. GSLT) with sane defaults and validation rules — **`variables`** in `sbox/egg-sbox.json` (incl. **MAX_PLAYERS**, **STEAM_GAME_SERVER_TOKEN**, branch/install flags)

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

| Requirement | Phase | Status | Primary evidence |
|-------------|-------|--------|------------------|
| EGG-01 | Phase 2 | Delivered | `sbox/egg-sbox.json` |
| EGG-02 | Phase 2 | Delivered | `sbox/egg-sbox.json` → `scripts.installation` |
| EGG-03 | Phase 2 | Delivered | `sbox/egg-sbox.json` → `startup` |
| EGG-04 | Phase 2 | Delivered | `sbox/egg-sbox.json` → `config`; operator refines **done** via `sbox/TESTING.md` |
| EGG-05 | Phase 2 | Delivered | `sbox/egg-sbox.json` → `variables` |
| DOC-01 | Phase 3 | Pending | — |
| DOC-02 | Phase 3 | Pending | — |
| VER-01 | Phase 3 | Pending | — |

**Coverage:**

- v1 requirements: 8 total  
- Mapped to phases: 8  
- Unmapped: 0 ✓  

---
*Requirements defined: 2026-04-30*  
*Last updated: 2026-04-30 after Phase 2 execute (egg + TESTING.md)*
