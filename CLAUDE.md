# Eggs — agent context

This repo hosts **Pelican Panel eggs** and uses **GSD** planning under `.planning/`.

- **Project definition:** `.planning/PROJECT.md`  
- **Requirements / roadmap:** `.planning/REQUIREMENTS.md`, `.planning/ROADMAP.md`  
- **Workflow prefs:** `.planning/config.json`  

**Active initiative:** Pelican egg for **s&box** (native Linux dedicated server, SteamCMD; see PROJECT.md for scope and HyberHost contrast).

When planning or implementing, follow Pelican docs (egg JSON, install script `/mnt/server`, runtime `/home/container`, variables) and verify runtime/yolk against official s&box dedicated-server documentation — do not assume `dotnet_10` until confirmed in research.

## Attribution (Goated Geese / GG-AU)

- Pelican egg **`author`** field: **`hello@gg-au.com`**. Docker image labels: **Goated Geese (GG-AU)** and repo **https://github.com/Goated-Geese/Eggs**.
- **Git commits:** Do not add `Co-authored-by: Cursor` (or similar) trailers when committing for this org. In **Cursor**, disable **Agents → Attribution → Commit attribution** (see [Cursor Git docs](https://cursor.com/docs/integrations/git)). Or commit from the terminal with plain `git commit -m "..."`. CLI: set `commitAttribution` / `prAttribution` to `false` in Cursor CLI config if you use it.
