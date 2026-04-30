# s&box egg — Phase 2 smoke testing

## Objective

Validate the Pelican egg (`egg-sbox.json`) after import into Wings/Pelican. Phase 3 expands this into full **VER-01** documentation and checklist.

## Install

1. Import **`sbox/egg-sbox.json`** per panel procedure.
2. Create a server and run the **install** process.
3. Expect **exit code 0**; on failure, read install logs and fix Steam login, disk, or network.
4. On the node, confirm **`sbox-server.exe`** exists under:
   **`/home/container/steamapps/common/sbox dedicated server/`** (or the same path under `/mnt/server` during install as appropriate for your node layout).

## First boot (D-03)

1. Start the server and watch the console.
2. If the server stays in **Starting** in the panel, copy the first line of output that clearly indicates the process is **ready** (or use a log line that only appears when the game loop is live).
3. Update the egg’s **Start configuration** / `config.startup` **done** field in the panel to match that substring (or adjust regex if your panel supports it). The shipped default looks for the substring **`sbox`** (per `02-CONTEXT.md` **D-03**); it may need refinement for your build.
4. Re-test until the panel shows **Running**.

## Stop (D-04)

1. Issue **Stop** from the panel.
2. Confirm the process ends cleanly. The egg uses **`quit`** as the console stop command where Wings sends stdin to the process; if `quit` is ignored, rely on Wings **SIGTERM** / panel stop behavior and note any upstream bug.

## Optional flags

- **`+net_game_server_token`**: If you must omit it entirely when unset, remove that segment from **Startup** in the panel or move token wiring into **Extra CLI Args** (`EXTRA_ARGS`).
- **`.sbproj`**: Use **`SBOX_PROJECT`** only when you have a valid project path per Facepunch docs.

## References

- Decisions **D-03** (done refinement) and **D-04** (stop) — `.planning/phases/02-egg-implementation/02-CONTEXT.md`
- Facepunch — https://sbox.game/dev/doc/networking/dedicated-servers/
