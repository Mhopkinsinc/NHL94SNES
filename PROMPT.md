# Segment prompt

Paste this into a new agent session. One segment per prompt. Do not edit this prompt.

```text
Read START_HERE.md and SEGMENT_AGENT.md before you write any asm. SEGMENT_AGENT.md is the queue and the history. Take the first segment in the ROM map that is still incbin. That file is the only segment this session.

NHL '94 SNES is NHLPA 93 SNES plus the NHL 94 Genesis features. Names follow the lineage in the Current rules section of SEGMENT_AGENT.md: code that matches NHLPA93SNES takes its name, 94 features take the NHL94Genesis name, else 93G, else 92G, else a name from what the code does. NHL94SNESVault is a reference for SNES-only systems. The reference repos are public GitHub repos listed in START_HERE.md (read them on GitHub; no clone needed).

1. Run ./build.sh first. It must print MATCH before you change anything. If it does not, stop and report.
2. Run python3 tools/disasm65816.py lst/nhl94snes.sfc output/quickpass (add --continue, or --entry ADDR:M:X, for unreached code; see SEGMENT_AGENT.md) and copy your segment's text into src/<segment>.asm in place of its incbin.
3. Trace the code: follow M/X (rep/sep/php/plp), D and DB. Turn unresolved db into instructions where code is reached, and into labeled data, dw pointer tables, strings or incbin assets where it is data.
4. Name the segment: routines, local labels (92 style), RAM variables, constants, tables, following First-pass naming in SEGMENT_AGENT.md (obvious names from the code; otherwise auto labels for now). Follow the style rules (no history, provenance or origin-tag comments, no ROM addresses in comments, no derived counts; history goes in docs/name_map.csv).
5. Run ./build.sh after each batch of edits. It must print MATCH. Then sh tools/verify_segment.sh <segment>.
6. In SEGMENT_AGENT.md mark the row matched with the byte count, range and the main names; add a History line; set Current segment to the next row. Update docs/HANDOFF.md. Commit and push to main (outside contributors: push to your fork and open a PR, see START_HERE.md).

Stop after 5 failed builds in a row. Report the file, the first differing ROM offset, the built byte, the retail byte, and the line you wrote. Do not continue.
```
