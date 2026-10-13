# START HERE (instructions for the AI agent)

You are the agent doing this whole project. The human does nothing by hand: you set up the tools, build, work the segments, commit and push. Read this file, then `SEGMENT_AGENT.md` (rules, queue and history) and `docs/HANDOFF.md`.

## Hard rules

- Never change a ROM byte. Every commit must build to MATCH (sha1 `10dcd21be9c5542e82b0b94473bf5ff569b36cf5`).
- Never commit the ROM or anything in `output/` (gitignored).
- Never force-push, never rewrite pushed history, never push a commit that does not MATCH. Maintainers push to main; outside contributors work on a fork and open a PR (section 0).
- Small commits: one segment (or one file group) per commit.

## 0. Contributor workflow (outside contributors)

1. Fork https://github.com/abdulahmad/NHL94SNES on GitHub.
2. Clone your fork: `git clone https://github.com/<you>/NHL94SNES` (add upstream: `git remote add upstream https://github.com/abdulahmad/NHL94SNES`).
3. Work as below; every commit must build to MATCH. Push to your fork (`git push origin <branch>`), one segment per commit.
4. Open a PR against `abdulahmad/NHL94SNES` main. Before a new session, `git pull upstream main` so you take the next free segment.
Where these docs say "push to main", contributors push to their fork and open a PR instead.

## 1. Setup (fresh clone)

- Put your ROM at `lst/nhl94snes.sfc`. `./build.sh` tells you the exact path, SHA-1 and size if it is missing or wrong.
- Linux / macOS: `sh tools/setup.sh` builds asar 1.91 into `tools/bin/asar` (gitignored). Windows: `powershell -ExecutionPolicy Bypass -File tools\setup.ps1`.
- Python 3 is needed for the prebuild check, the asset extractor and the quick-pass tool.
- Reference repos: read them on GitHub, no clone needed. Browse `https://github.com/<owner>/<repo>/blob/main/<path>`, raw text at
  `https://raw.githubusercontent.com/<owner>/<repo>/main/<path>`, or GitHub code search:
  https://github.com/abdulahmad/NHLPA93SNES, https://github.com/abdulahmad/NHL94Genesis, https://github.com/abdulahmad/NHLPA93Genesis,
  https://github.com/abdulahmad/NHL92Genesis, https://github.com/Mhopkinsinc/NHL94SNESVault.
  A local clone (anywhere) is optional, e.g. for fast grep; never commit into them from here.

## 2. Build and confirm MATCH

`./build.sh` (Windows: `build.ps1`). The prebuild check makes sure the ROM is there to compare with. The last line must be `MATCH`. On a fresh clone, if it is not MATCH, stop and report the output.
`sh tools/verify_all.sh` is the clean check: it deletes the old output, builds, and checks every segment.

## 3. Work loop

Run `PROMPT.md` once per segment, in ROM-map order. After each segment: MATCH, commit, push, update `docs/HANDOFF.md`. Stop after one bank (8 segments) and report to the user.

## 4. When stuck

- A name or change that cannot be made without changing bytes: leave it and list it with the reason in `docs/HANDOFF.md`.
- 5 failed builds in a row: `git checkout -- <file>` back to the last MATCH state and note what was tried.
