# START HERE (instructions for the AI agent)

You are the agent doing this whole project. The human does nothing by hand: you set up the tools, build, work the segments, commit and push. Read this file, then `SEGMENT_AGENT.md` (rules, queue and history) and `docs/HANDOFF.md`.

## Hard rules

- Never change a ROM byte. Every commit must build to MATCH (sha1 `10dcd21be9c5542e82b0b94473bf5ff569b36cf5`).
- Never commit the ROM or anything in `Extracted/` or `output/` (all gitignored).
- Never force-push, never rewrite pushed history, never push a commit that does not MATCH. Push to main; no PRs.
- Small commits: one segment (or one file group) per commit.

## 1. Setup (fresh clone)

- Put your ROM at `lst/nhl94snes.sfc`. `./build.sh` tells you the exact path, SHA-1 and size if it is missing or wrong.
- Linux / macOS: `sh tools/setup.sh` builds asar 1.91 into `tools/bin/asar` (gitignored). Windows: `powershell -ExecutionPolicy Bypass -File tools\setup.ps1`.
- Python 3 is needed for the prebuild check, the extractor and the quick-pass tool.
- Reference repos (read-only; clone them beside this repo, so `../<Name>` from here):
  https://github.com/abdulahmad/NHLPA93SNES, https://github.com/abdulahmad/NHL94Genesis, https://github.com/abdulahmad/NHLPA93Genesis,
  https://github.com/abdulahmad/NHL92Genesis, https://github.com/Mhopkinsinc/NHL94SNESVault.

## 2. Build and confirm MATCH

`./build.sh` (Windows: `build.ps1`). The prebuild check cuts the ROM into `Extracted/segments/` on the first run. The last line must be `MATCH`. On a fresh clone, if it is not MATCH, stop and report the output.
`sh tools/verify_all.sh` is the clean check: it deletes the old output, extracts again, builds, and checks every segment.

## 3. Work loop

Run `PROMPT.md` once per segment, in ROM-map order. After each segment: MATCH, commit, push, update `docs/HANDOFF.md`. Stop after one bank (8 segments) and report to the user.

## 4. When stuck

- A name or change that cannot be made without changing bytes: leave it and list it with the reason in `docs/HANDOFF.md`.
- 5 failed builds in a row: `git checkout -- <file>` back to the last MATCH state and note what was tried.
