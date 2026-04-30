# Research — Pitfalls

**Phase:** 1  
**Updated:** 2026-04-30

1. **dotnet_10 without verification** — Image tag is a **hypothesis** until Phase 2 confirms the runtime major required by the shipped Linux binary (`dotnet --info` / Facepunch release notes).

2. **Copy-paste done/stop from other eggs** — GMod’s `gameserver Steam ID` and Valheim’s `DungeonDB Start` are **wrong** for s&box. Capture real console signatures during Phase 2 testing.

3. **Staging branch** — `-beta staging` may split client compatibility; document clearly if operators opt in.

4. **Path with spaces** — Default install path includes `sbox dedicated server`; quote paths in shell startup.

5. **Steam policy drift** — Anonymous install is official today; recheck if dedicated tool moves or adds auth for **downloads**.

6. **PLCN vs PTDL** — Reference eggs mix meta versions; match **your** panel’s import schema when exporting the egg in Phase 2.
