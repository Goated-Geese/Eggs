---
phase: 1
slug: research-stack
status: draft
nyquist_compliant: true
wave_0_complete: true
created: 2026-04-30
---

# Phase 1 — Validation Strategy

> Doc-only phase: validation is **manual** and **source-based** (no unit test framework).

## Test Infrastructure

| Property | Value |
|----------|--------|
| **Framework** | none — documentation |
| **Config file** | n/a |
| **Quick run command** | `Select-String -Path .planning/phases/01-research-stack/01-RESEARCH.md -Pattern "1892930"` (or `rg "1892930"`) |
| **Full suite command** | Human: ROADMAP Phase 1 success criteria checklist |
| **Estimated runtime** | ~5 minutes |

## Sampling Rate

- **After each doc edit:** Grep for App ID `1892930` and `https://sbox.game/dev/doc/networking/dedicated-servers/` still present in `01-RESEARCH.md`.
- **Before Phase 2:** Re-open Facepunch dedicated-servers page once for drift.

## Per-Task Verification Map

| Task ID | Plan | Wave | Requirement | Threat Ref | Secure Behavior | Test Type | Automated Command | Status |
|---------|------|------|-------------|------------|-----------------|-----------|-------------------|--------|
| 1-01-01 | 01 | 1 | Informs EGG-* | T-doc-01 | No secrets in repo docs | grep | `rg "password|token|key" .planning/research .planning/phases/01-research-stack` → review hits | ⬜ |

## Manual-Only Verifications

| Behavior | Requirement | Why Manual | Test Instructions |
|----------|-------------|------------|-------------------|
| SteamCMD stanza correctness | ROADMAP §1 | Compare to live Facepunch page | Open official URL; compare `app_update 1892930` |
| Egg comparison sufficiency | ROADMAP §1 | Judgment | Confirm §4 names gmod + valheim with borrowed notes |

## Wave 0 Requirements

- Existing infrastructure: **N/A** — no code repository tests for Phase 1.
